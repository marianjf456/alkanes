"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.encodeTraceRequest = encodeTraceRequest;
exports.decodeTraceResponse = decodeTraceResponse;
exports.encodeSimulateRequest = encodeSimulateRequest;
exports.decodeSimulateResponse = decodeSimulateResponse;
exports.outpointResponseToObject = outpointResponseToObject;
exports.decodeOutpointResponse = decodeOutpointResponse;
const bytes_1 = require("./bytes");
const alkanes_1 = require("./proto/alkanes");
const utils_1 = require("./utils");
const protorune_1 = require("./proto/protorune");
const { SimulateResponse, MessageContextParcel, AlkanesTrace } = alkanes_1.alkanes;
function encodeTraceRequest({ txid, vout }) {
    const input = {
        txid: Buffer.from((0, utils_1.stripHexPrefix)(txid), 'hex'),
        vout: vout
    };
    return ("0x" + Buffer.from(new protorune_1.protorune.Outpoint(input).serializeBinary()).toString("hex"));
}
function decodeTraceResponse(hex) {
    return alkanes_1.alkanes.AlkanesTrace.deserializeBinary(Buffer.from((0, utils_1.stripHexPrefix)(hex), 'hex'));
}
function encodeSimulateRequest({ alkanes, transaction, height, block, inputs, target, txindex, vout, pointer, refundPointer, }) {
    const input = {
        alkanes: alkanes.map((v) => (0, bytes_1.toProtobufAlkaneTransfer)(v)),
        transaction: Uint8Array.from(Buffer.from(transaction, "hex")),
        height: height,
        txindex,
        calldata: (0, bytes_1.encipher)([target.block, target.tx, ...inputs]),
        block: Uint8Array.from(Buffer.from(block, 'hex')),
        vout,
        pointer,
        refund_pointer: refundPointer,
    };
    return ("0x" + Buffer.from(new alkanes_1.alkanes.MessageContextParcel(input).serializeBinary()).toString("hex"));
}
class ExecutionStatus {
    constructor() { }
}
ExecutionStatus.SUCCESS = 0;
ExecutionStatus.REVERT = 1;
function decodeSimulateResponse(response) {
    const res = alkanes_1.alkanes.SimulateResponse.deserializeBinary(Buffer.from((0, utils_1.stripHexPrefix)(response), "hex"));
    if (res.error || !res.execution)
        return { status: ExecutionStatus.REVERT, gasUsed: 0, execution: { alkanes: [], storage: [], data: '0x', error: res.error } };
    return {
        status: ExecutionStatus.SUCCESS,
        gasUsed: res.gas_used,
        execution: {
            alkanes: res.execution.alkanes,
            storage: res.execution.storage,
            error: null,
            data: '0x' + Buffer.from(res.execution.data).toString('hex')
        }
    };
}
function outpointResponseToObject(v) {
    return v.map((item) => ({
        token: {
            id: { block: (0, bytes_1.fromUint128)(item.rune.runeId.height), tx: (0, bytes_1.fromUint128)(item.rune.runeId.txindex) },
            name: item.rune.name,
            symbol: item.rune.symbol
        },
        value: (0, bytes_1.fromUint128)(item.balance),
    }));
}
function decodeOutpointResponse(result) {
    return outpointResponseToObject(protorune_1.protorune.OutpointResponse.deserializeBinary(Buffer.from((result).substr(2), "hex")).balances.entries);
}
//# sourceMappingURL=invoke.js.map