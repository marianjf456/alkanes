"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.encodeSimulateRequest = encodeSimulateRequest;
exports.decodeSimulateResponse = decodeSimulateResponse;
const bytes_1 = require("./bytes");
const alkanes_1 = require("./proto/alkanes");
const utils_1 = require("./utils");
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
//# sourceMappingURL=invoke.js.map