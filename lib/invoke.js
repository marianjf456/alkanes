"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.encodeSimulateRequest = encodeSimulateRequest;
exports.decodeSimulateResponse = decodeSimulateResponse;
exports.outpointResponseToObject = outpointResponseToObject;
exports.decodeOutpointResponse = decodeOutpointResponse;
const bytes_1 = require("./bytes");
const alkanes_1 = require("./proto/alkanes");
const utils_1 = require("./utils");
const protobuf = __importStar(require("./proto/protorune"));
function encodeSimulateRequest({ alkanes, transaction, height, block, inputs, target, txindex, vout, pointer, refundPointer, }) {
    let input = alkanes_1.MessageContextParcel.create();
    input = {
        alkanes: alkanes.map((v) => (0, bytes_1.toProtobufAlkaneTransfer)(v)),
        transaction: Uint8Array.from(Buffer.from(transaction, "hex")),
        height: BigInt(height),
        txindex,
        calldata: (0, bytes_1.encipher)([target.block, target.tx, ...inputs]),
        block: Uint8Array.from(Buffer.from(block, 'hex')),
        vout,
        pointer,
        refundPointer,
    };
    return ("0x" + Buffer.from(alkanes_1.MessageContextParcel.toBinary(input)).toString("hex"));
}
class ExecutionStatus {
    constructor() { }
}
ExecutionStatus.SUCCESS = 0;
ExecutionStatus.REVERT = 1;
function decodeSimulateResponse(response) {
    const res = alkanes_1.SimulateResponse.fromBinary(Buffer.from((0, utils_1.stripHexPrefix)(response), "hex"));
    if (res.error)
        return { status: ExecutionStatus.REVERT, gasUsed: 0n, execution: { alkanes: [], storage: [], data: '0x', error: res.error } };
    return {
        status: ExecutionStatus.SUCCESS,
        gasUsed: res.gasUsed,
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
    return outpointResponseToObject(protobuf.OutpointResponse.fromBinary(Buffer.from((result).substr(2), "hex")).balances.entries);
}
//# sourceMappingURL=invoke.js.map