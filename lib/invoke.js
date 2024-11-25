"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.encodeSimulateRequest = encodeSimulateRequest;
exports.decodeSimulateResponse = decodeSimulateResponse;
const bytes_1 = require("./bytes");
const alkanes_1 = require("./proto/alkanes");
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
function decodeSimulateResponse(response) {
    const res = alkanes_1.SimulateResponse.fromBinary(Buffer.from(response, "hex"));
    return res;
}
//# sourceMappingURL=invoke.js.map