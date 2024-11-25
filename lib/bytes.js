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
exports.fromBuffer = exports.toBuffer = void 0;
exports.toProtobufAlkaneTransfer = toProtobufAlkaneTransfer;
exports.unpack = unpack;
exports.leftPad15 = leftPad15;
exports.leftPadByte = leftPadByte;
exports.leftPad16 = leftPad16;
exports.leftPad8 = leftPad8;
exports.toUint128 = toUint128;
exports.u128ToBuffer = u128ToBuffer;
exports.encodeVarInt = encodeVarInt;
exports.encipher = encipher;
exports.decipher = decipher;
exports.decodeVarInt = decodeVarInt;
exports.tryDecodeVarInt = tryDecodeVarInt;
exports.pack = pack;
const seekbuffer_js_1 = require("./seekbuffer.js");
const proto = __importStar(require("./proto/alkanes"));
function toProtobufAlkaneTransfer(v) {
    const result = proto.AlkaneTransfer.create();
    result.id = { block: toUint128(v.id.block), tx: toUint128(v.id.tx) };
    result.value = toUint128(v.value);
    return result;
}
function unpack(v) {
    return Array.from(v)
        .reduce((r, v, i) => {
        if (i % 15 === 0) {
            r.push([]);
        }
        r[r.length - 1].push(v);
        return r;
    }, [])
        .map((v) => BigInt("0x" + Buffer.from(v.reverse()).toString("hex")));
}
function leftPad15(v) {
    if (v.length > 30)
        throw Error("varint in encoding cannot exceed 15 bytes");
    return "0".repeat(30 - v.length) + v;
}
function leftPadByte(v) {
    if (v.length % 2) {
        return "0" + v;
    }
    return v;
}
function leftPad16(v) {
    if (v.length > 16)
        throw Error("varint in encoding cannot exceed 15 bytes");
    return "0".repeat(32 - v.length) + v;
}
function leftPad8(v) {
    if (v.length > 16)
        throw Error("varint in encoding cannot exceed 15 bytes");
    return "0".repeat(16 - v.length) + v;
}
function toUint128(v) {
    let hex = leftPad16(v.toString(16));
    return { hi: BigInt('0x' + hex.substr(0, 16)), lo: BigInt('0x' + hex.substr(16, 32)) };
}
function u128ToBuffer(v) {
    return BigInt('0x' + Buffer.from(leftPad8(v.hi.toString(16)) + leftPad8(v.lo.toString(16)), 'hex').toString('hex'));
}
function encodeVarInt(value) {
    const v = [];
    while (value >> 7n > 0n) {
        v.push(Number(value & 0xffn) | 128);
        value = BigInt(value >> 7n);
    }
    v.push(Number(value & 0xffn));
    return Buffer.from(v);
}
function encipher(values) {
    return Buffer.concat(values.map((v) => encodeVarInt(v)));
}
const toBuffer = (v) => {
    return Buffer.from(Array.from(Buffer.from(leftPad16(v.toString(16)), 'hex')).reverse());
};
exports.toBuffer = toBuffer;
const fromBuffer = (v) => {
    return BigInt('0x' + Buffer.from(Array.from(v).reverse()).toString('hex'));
};
exports.fromBuffer = fromBuffer;
function decipher(values) {
    let seekBuffer = new seekbuffer_js_1.SeekBuffer(values);
    let v = null;
    const result = [];
    while ((v = decodeVarInt(seekBuffer)) !== BigInt(-1)) {
        result.push(v);
    }
    return result;
}
function decodeVarInt(seekBuffer) {
    try {
        return tryDecodeVarInt(seekBuffer);
    }
    catch (e) {
        return BigInt(-1);
    }
}
function tryDecodeVarInt(seekBuffer) {
    let result = BigInt(0);
    for (let i = 0; i <= 18; i++) {
        const byte = seekBuffer.readUInt8();
        if (byte === undefined) {
            throw new Error("Unterminated");
        }
        const value = BigInt(byte) & 127n;
        if (i === 18 && (value & 124n) !== 0n) {
            throw new Error("Overflow");
        }
        result = BigInt(result | (value << BigInt(7 * i)));
        if ((byte & 128) === 0) {
            return result;
        }
    }
    throw new Error("Overlong");
}
function pack(v) {
    return Buffer.concat(v.map((segment) => {
        return Buffer.from(leftPad15(Buffer.from(Array.from(Buffer.from(leftPadByte(segment.toString(16)), "hex")).reverse()).toString("hex")), "hex");
    }));
}
//# sourceMappingURL=bytes.js.map