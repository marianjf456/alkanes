"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.encodeProtorunesWalletInput = encodeProtorunesWalletInput;
exports.encodeRuntimeInput = encodeRuntimeInput;
exports.decodeRuntimeOutput = decodeRuntimeOutput;
const outpoint_1 = require("./outpoint");
const protorune_1 = require("./proto/protorune");
const utils_1 = require("./utils");
const bytes_1 = require("./bytes");
/**
 * Encodes the protocolTag in LEB128 format
 * @param protocolTag
 * @returns the protocolTag in LEB128 format
 */
function encodeProtocolTag(protocolTag) {
    return (0, bytes_1.toUint128)(protocolTag);
}
/**
 * Protocol tag needs to be LEB128 encoded to pass into the protocol
 * @param address
 * @param protocolTag
 * @returns ProtorunesWalletRequest protobuf hex buffer
 */
function encodeProtorunesWalletInput(address, protocolTag) {
    const input = {
        wallet: Uint8Array.from(Buffer.from(address, "utf-8")),
        protocolTag: encodeProtocolTag(protocolTag),
    };
    return ("0x" + Buffer.from(protorune_1.ProtorunesWalletRequest.toBinary(input)).toString("hex"));
}
function encodeRuntimeInput(protocolTag) {
    const input = {
        protocolTag: encodeProtocolTag(protocolTag),
    };
    return "0x" + Buffer.from(protorune_1.RuntimeInput.toBinary(input)).toString("hex");
}
function decodeRuntimeOutput(hex) {
    const runtime = protorune_1.Runtime.fromBinary(Uint8Array.from(Buffer.from((0, utils_1.stripHexPrefix)(hex), "hex")));
    const balances = (0, outpoint_1.decodeRunes)(runtime.balances);
    return {
        balances,
    };
}
//# sourceMappingURL=wallet.js.map