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
exports.AlkanesRpc = void 0;
const protowallet = __importStar(require("./wallet"));
const invoke = __importStar(require("./invoke"));
const wallet = __importStar(require("metashrew-runes/lib/src.ts/wallet"));
const outpoint_1 = require("metashrew-runes/lib/src.ts/outpoint");
const rpc_1 = require("metashrew-runes/lib/src.ts/rpc");
const protobuf = __importStar(require("./proto/protorune"));
const proto_runestone_upgrade_1 = require("./protorune/proto_runestone_upgrade");
const integer_1 = require("@magiceden-oss/runestone-lib/dist/src/integer");
const protoruneruneid_1 = require("./protorune/protoruneruneid");
const protostone_1 = require("./protorune/protostone");
const bytes_1 = require("./bytes");
const addHexPrefix = (s) => (s.substr(0, 2) === "0x" ? s : "0x" + s);
let id = 0;
class AlkanesRpc extends rpc_1.MetashrewRunes {
    async protorunesbyaddress({ address, protocolTag }) {
        const buffer = protowallet.encodeProtorunesWalletInput(address, protocolTag);
        const byteString = await this._call({
            method: "protorunesbyaddress",
            input: buffer,
        });
        const decoded = wallet.decodeWalletOutput(byteString);
        return decoded;
    }
    async runesbyaddress({ address }) {
        const buffer = wallet.encodeWalletInput(address);
        const byteString = await this._call({
            method: "runesbyaddress",
            input: buffer,
        });
        const decoded = wallet.decodeWalletOutput(byteString);
        return decoded;
    }
    async runesbyheight({ height }) {
        const payload = (0, outpoint_1.encodeBlockHeightInput)(height);
        const response = await this._call({
            method: "runesbyheight",
            input: payload,
        });
        const decodedResponse = (0, outpoint_1.decodeRunesResponse)(response);
        return decodedResponse;
    }
    async protorunesbyoutpoint({ txid, vout, protocolTag }) {
        const buffer = "0x" +
            Buffer.from(protobuf.OutpointWithProtocol.toBinary({
                protocol: (0, bytes_1.toBuffer)(protocolTag),
                txid: Buffer.from(txid, "hex"),
                vout,
            })).toString("hex");
        return protobuf.OutpointResponse.fromBinary(Buffer.from((await this._call({
            method: "protorunesbyoutpoint",
            input: buffer,
        })).substr(2), "hex"));
    }
    async simulate({ alkanes, transaction, height, block, inputs, tx, txindex, vout, pointer, refundPointer, }) {
        const buffer = invoke.encodeSimulateRequest({
            alkanes,
            transaction,
            block,
            height,
            tx,
            inputs,
            txindex,
            vout,
            pointer,
            refundPointer,
        });
        const byteString = await this._call({
            method: "simulate",
            input: buffer,
        });
        const decoded = invoke.decodeSimulateRequest(byteString);
        return decoded;
    }
    async runtime({ protocolTag }) {
        const buffer = protowallet.encodeRuntimeInput(protocolTag);
        const byteString = await this._call({
            method: "protorunesbyaddress",
            input: buffer,
        });
        const decoded = protowallet.decodeRuntimeOutput(byteString);
        return decoded;
    }
    async pack({ runes, cellpack, pointer, refundPointer, edicts, }) {
        const protostone = new protostone_1.ProtoStone({
            message: {
                calldata: cellpack,
                pointer,
                refundPointer,
            },
            protocolTag: BigInt(1),
            edicts,
        });
        return (0, proto_runestone_upgrade_1.encodeRunestoneProtostone)({
            edicts: runes.map((r) => ({ id: new protoruneruneid_1.ProtoruneRuneId((0, integer_1.u128)(r.id.block), (0, integer_1.u128)(r.id.tx)), output: (0, integer_1.u32)(2), amount: (0, integer_1.u128)(r.value) })),
            pointer: 3,
            protostones: [protostone],
        }).encodedRunestone;
    }
}
exports.AlkanesRpc = AlkanesRpc;
//# sourceMappingURL=rpc.js.map