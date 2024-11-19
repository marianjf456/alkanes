import { SeekBuffer } from "./seekbuffer.js";
export function unpack(v) {
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
export function encodeVarInt(value) {
    const v = [];
    while (value >> 7n > 0n) {
        v.push(Number(value & 0xffn) | 128);
        value = BigInt(value >> 7n);
    }
    v.push(Number(value & 0xffn));
    return Buffer.from(v);
}
export function encipher(values) {
    return Buffer.concat(values.map((v) => encodeVarInt(v)));
}
export function decipher(values) {
    let seekBuffer = new SeekBuffer(values);
    let v = null;
    const result = [];
    while ((v = decodeVarInt(seekBuffer)) !== BigInt(-1)) {
        result.push(v);
    }
    return result;
}
export function decodeVarInt(seekBuffer) {
    try {
        return tryDecodeVarInt(seekBuffer);
    }
    catch (e) {
        return BigInt(-1);
    }
}
export function tryDecodeVarInt(seekBuffer) {
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
export function pack(v) {
    return Buffer.concat(v.map((segment) => {
        return Buffer.from(leftPad15(Buffer.from(Array.from(Buffer.from(leftPadByte(segment.toString(16)), "hex")).reverse()).toString("hex")), "hex");
    }));
}
//# sourceMappingURL=bytes.js.map