"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.toAlkaneTransfer = toAlkaneTransfer;
exports.fromCallType = fromCallType;
exports.toAlkaneId = toAlkaneId;
exports.toContext = toContext;
exports.toEvent = toEvent;
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
function toAlkaneTransfer(v) {
    return {
        id: toAlkaneId(v.id),
        value: (0, bytes_1.fromUint128)(v.value)
    };
}
function fromCallType(v) {
    switch (v) {
        case 1:
            return 'call';
        case 2:
            return 'delegatecall';
        case 3:
            return 'staticcall';
        default:
            return 'unknowncall';
    }
}
function toAlkaneId(v) {
    return {
        block: (0, bytes_1.fromUint128)(v.block),
        tx: (0, bytes_1.fromUint128)(v.tx)
    };
}
function toContext(v) {
    return {
        myself: toAlkaneId(v.myself),
        caller: toAlkaneId(v.caller),
        incomingAlkanes: v.incoming_alkanes.map((v) => toAlkaneTransfer(v)),
        vout: v.vout
    };
}
function toEvent(v) {
    let k = null;
    switch (k = Object.keys(v)[0]) {
        case 'create_alkane':
            return {
                event: 'create',
                data: toAlkaneId(v[k].new_alkane)
            };
        case 'enter_context':
            return {
                event: 'invoke',
                data: {
                    type: fromCallType(v[k].call_type),
                    context: toContext(v[k].context.inner),
                    fuel: v[k].context.fuel
                }
            };
        case 'exit_context':
            return {
                event: 'return',
                data: {
                    status: v[k].status == 0 ? 'revert' : 'success',
                    response: v[k].response,
                    fuelUsed: v[k].fuel_used
                }
            };
    }
}
function encodeTraceRequest({ txid, vout }) {
    const input = {
        txid: Buffer.from((0, utils_1.stripHexPrefix)(txid), 'hex'),
        vout: vout
    };
    return ("0x" + Buffer.from(new protorune_1.protorune.Outpoint(input).serializeBinary()).toString("hex"));
}
function decodeTraceResponse(hex) {
    return alkanes_1.alkanes.AlkanesTrace.deserializeBinary(Buffer.from((0, utils_1.stripHexPrefix)(hex), 'hex')).toObject().events.map((v) => toEvent(v));
}
function encodeSimulateRequest({ alkanes, transaction, height, block, inputs, target, txindex, vout, pointer, refundPointer, }) {
    const input = {
        alkanes: alkanes.map((v) => (0, bytes_1.toProtobufAlkaneTransfer)(v)),
        transaction: Uint8Array.from(Buffer.from(transaction, "hex")),
        height: Number(height),
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