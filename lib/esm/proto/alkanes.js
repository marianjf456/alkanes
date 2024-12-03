"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AlkaneInventoryResponse = exports.AlkaneInventoryRequest = exports.SimulateResponse = exports.ExtendedCallResponse = exports.KeyValuePair = exports.MessageContextParcel = exports.AlkaneTransfer = exports.AlkaneId = exports.uint128 = void 0;
const runtime_1 = require("@protobuf-ts/runtime");
const runtime_2 = require("@protobuf-ts/runtime");
const runtime_3 = require("@protobuf-ts/runtime");
const runtime_4 = require("@protobuf-ts/runtime");
// @generated message type with reflection information, may provide speed optimized methods
class uint128$Type extends runtime_4.MessageType {
    constructor() {
        super("alkanes.uint128", [
            {
                no: 1,
                name: "lo",
                kind: "scalar",
                T: 4 /*ScalarType.UINT64*/,
                L: 0 /*LongType.BIGINT*/,
            },
            {
                no: 2,
                name: "hi",
                kind: "scalar",
                T: 4 /*ScalarType.UINT64*/,
                L: 0 /*LongType.BIGINT*/,
            },
        ]);
    }
    create(value) {
        const message = globalThis.Object.create(this.messagePrototype);
        message.lo = 0n;
        message.hi = 0n;
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* uint64 lo */ 1:
                    message.lo = reader.uint64().toBigInt();
                    break;
                case /* uint64 hi */ 2:
                    message.hi = reader.uint64().toBigInt();
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* uint64 lo = 1; */
        if (message.lo !== 0n)
            writer.tag(1, runtime_1.WireType.Varint).uint64(message.lo);
        /* uint64 hi = 2; */
        if (message.hi !== 0n)
            writer.tag(2, runtime_1.WireType.Varint).uint64(message.hi);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message alkanes.uint128
 */
exports.uint128 = new uint128$Type();
// @generated message type with reflection information, may provide speed optimized methods
class AlkaneId$Type extends runtime_4.MessageType {
    constructor() {
        super("alkanes.AlkaneId", [
            { no: 1, name: "block", kind: "message", T: () => exports.uint128 },
            { no: 2, name: "tx", kind: "message", T: () => exports.uint128 },
        ]);
    }
    create(value) {
        const message = globalThis.Object.create(this.messagePrototype);
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* alkanes.uint128 block */ 1:
                    message.block = exports.uint128.internalBinaryRead(reader, reader.uint32(), options, message.block);
                    break;
                case /* alkanes.uint128 tx */ 2:
                    message.tx = exports.uint128.internalBinaryRead(reader, reader.uint32(), options, message.tx);
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* alkanes.uint128 block = 1; */
        if (message.block)
            exports.uint128
                .internalBinaryWrite(message.block, writer.tag(1, runtime_1.WireType.LengthDelimited).fork(), options)
                .join();
        /* alkanes.uint128 tx = 2; */
        if (message.tx)
            exports.uint128
                .internalBinaryWrite(message.tx, writer.tag(2, runtime_1.WireType.LengthDelimited).fork(), options)
                .join();
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message alkanes.AlkaneId
 */
exports.AlkaneId = new AlkaneId$Type();
// @generated message type with reflection information, may provide speed optimized methods
class AlkaneTransfer$Type extends runtime_4.MessageType {
    constructor() {
        super("alkanes.AlkaneTransfer", [
            { no: 1, name: "id", kind: "message", T: () => exports.AlkaneId },
            { no: 2, name: "value", kind: "message", T: () => exports.uint128 },
        ]);
    }
    create(value) {
        const message = globalThis.Object.create(this.messagePrototype);
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* alkanes.AlkaneId id */ 1:
                    message.id = exports.AlkaneId.internalBinaryRead(reader, reader.uint32(), options, message.id);
                    break;
                case /* alkanes.uint128 value */ 2:
                    message.value = exports.uint128.internalBinaryRead(reader, reader.uint32(), options, message.value);
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* alkanes.AlkaneId id = 1; */
        if (message.id)
            exports.AlkaneId.internalBinaryWrite(message.id, writer.tag(1, runtime_1.WireType.LengthDelimited).fork(), options).join();
        /* alkanes.uint128 value = 2; */
        if (message.value)
            exports.uint128
                .internalBinaryWrite(message.value, writer.tag(2, runtime_1.WireType.LengthDelimited).fork(), options)
                .join();
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message alkanes.AlkaneTransfer
 */
exports.AlkaneTransfer = new AlkaneTransfer$Type();
// @generated message type with reflection information, may provide speed optimized methods
class MessageContextParcel$Type extends runtime_4.MessageType {
    constructor() {
        super("alkanes.MessageContextParcel", [
            {
                no: 1,
                name: "alkanes",
                kind: "message",
                repeat: 1 /*RepeatType.PACKED*/,
                T: () => exports.AlkaneTransfer,
            },
            {
                no: 2,
                name: "transaction",
                kind: "scalar",
                T: 12 /*ScalarType.BYTES*/,
            },
            { no: 3, name: "block", kind: "scalar", T: 12 /*ScalarType.BYTES*/ },
            {
                no: 4,
                name: "height",
                kind: "scalar",
                T: 4 /*ScalarType.UINT64*/,
                L: 0 /*LongType.BIGINT*/,
            },
            { no: 6, name: "txindex", kind: "scalar", T: 13 /*ScalarType.UINT32*/ },
            { no: 5, name: "calldata", kind: "scalar", T: 12 /*ScalarType.BYTES*/ },
            { no: 7, name: "vout", kind: "scalar", T: 13 /*ScalarType.UINT32*/ },
            { no: 8, name: "pointer", kind: "scalar", T: 13 /*ScalarType.UINT32*/ },
            {
                no: 9,
                name: "refund_pointer",
                kind: "scalar",
                T: 13 /*ScalarType.UINT32*/,
            },
        ]);
    }
    create(value) {
        const message = globalThis.Object.create(this.messagePrototype);
        message.alkanes = [];
        message.transaction = new Uint8Array(0);
        message.block = new Uint8Array(0);
        message.height = 0n;
        message.txindex = 0;
        message.calldata = new Uint8Array(0);
        message.vout = 0;
        message.pointer = 0;
        message.refundPointer = 0;
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* repeated alkanes.AlkaneTransfer alkanes */ 1:
                    message.alkanes.push(exports.AlkaneTransfer.internalBinaryRead(reader, reader.uint32(), options));
                    break;
                case /* bytes transaction */ 2:
                    message.transaction = reader.bytes();
                    break;
                case /* bytes block */ 3:
                    message.block = reader.bytes();
                    break;
                case /* uint64 height */ 4:
                    message.height = reader.uint64().toBigInt();
                    break;
                case /* uint32 txindex */ 6:
                    message.txindex = reader.uint32();
                    break;
                case /* bytes calldata */ 5:
                    message.calldata = reader.bytes();
                    break;
                case /* uint32 vout */ 7:
                    message.vout = reader.uint32();
                    break;
                case /* uint32 pointer */ 8:
                    message.pointer = reader.uint32();
                    break;
                case /* uint32 refund_pointer */ 9:
                    message.refundPointer = reader.uint32();
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* repeated alkanes.AlkaneTransfer alkanes = 1; */
        for (let i = 0; i < message.alkanes.length; i++)
            exports.AlkaneTransfer.internalBinaryWrite(message.alkanes[i], writer.tag(1, runtime_1.WireType.LengthDelimited).fork(), options).join();
        /* bytes transaction = 2; */
        if (message.transaction.length)
            writer.tag(2, runtime_1.WireType.LengthDelimited).bytes(message.transaction);
        /* bytes block = 3; */
        if (message.block.length)
            writer.tag(3, runtime_1.WireType.LengthDelimited).bytes(message.block);
        /* uint64 height = 4; */
        if (message.height !== 0n)
            writer.tag(4, runtime_1.WireType.Varint).uint64(message.height);
        /* uint32 txindex = 6; */
        if (message.txindex !== 0)
            writer.tag(6, runtime_1.WireType.Varint).uint32(message.txindex);
        /* bytes calldata = 5; */
        if (message.calldata.length)
            writer.tag(5, runtime_1.WireType.LengthDelimited).bytes(message.calldata);
        /* uint32 vout = 7; */
        if (message.vout !== 0)
            writer.tag(7, runtime_1.WireType.Varint).uint32(message.vout);
        /* uint32 pointer = 8; */
        if (message.pointer !== 0)
            writer.tag(8, runtime_1.WireType.Varint).uint32(message.pointer);
        /* uint32 refund_pointer = 9; */
        if (message.refundPointer !== 0)
            writer.tag(9, runtime_1.WireType.Varint).uint32(message.refundPointer);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message alkanes.MessageContextParcel
 */
exports.MessageContextParcel = new MessageContextParcel$Type();
// @generated message type with reflection information, may provide speed optimized methods
class KeyValuePair$Type extends runtime_4.MessageType {
    constructor() {
        super("alkanes.KeyValuePair", [
            { no: 1, name: "key", kind: "scalar", T: 12 /*ScalarType.BYTES*/ },
            { no: 2, name: "value", kind: "scalar", T: 12 /*ScalarType.BYTES*/ },
        ]);
    }
    create(value) {
        const message = globalThis.Object.create(this.messagePrototype);
        message.key = new Uint8Array(0);
        message.value = new Uint8Array(0);
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* bytes key */ 1:
                    message.key = reader.bytes();
                    break;
                case /* bytes value */ 2:
                    message.value = reader.bytes();
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* bytes key = 1; */
        if (message.key.length)
            writer.tag(1, runtime_1.WireType.LengthDelimited).bytes(message.key);
        /* bytes value = 2; */
        if (message.value.length)
            writer.tag(2, runtime_1.WireType.LengthDelimited).bytes(message.value);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message alkanes.KeyValuePair
 */
exports.KeyValuePair = new KeyValuePair$Type();
// @generated message type with reflection information, may provide speed optimized methods
class ExtendedCallResponse$Type extends runtime_4.MessageType {
    constructor() {
        super("alkanes.ExtendedCallResponse", [
            {
                no: 1,
                name: "alkanes",
                kind: "message",
                repeat: 1 /*RepeatType.PACKED*/,
                T: () => exports.AlkaneTransfer,
            },
            {
                no: 2,
                name: "storage",
                kind: "message",
                repeat: 1 /*RepeatType.PACKED*/,
                T: () => exports.KeyValuePair,
            },
            { no: 3, name: "data", kind: "scalar", T: 12 /*ScalarType.BYTES*/ },
        ]);
    }
    create(value) {
        const message = globalThis.Object.create(this.messagePrototype);
        message.alkanes = [];
        message.storage = [];
        message.data = new Uint8Array(0);
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* repeated alkanes.AlkaneTransfer alkanes */ 1:
                    message.alkanes.push(exports.AlkaneTransfer.internalBinaryRead(reader, reader.uint32(), options));
                    break;
                case /* repeated alkanes.KeyValuePair storage */ 2:
                    message.storage.push(exports.KeyValuePair.internalBinaryRead(reader, reader.uint32(), options));
                    break;
                case /* bytes data */ 3:
                    message.data = reader.bytes();
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* repeated alkanes.AlkaneTransfer alkanes = 1; */
        for (let i = 0; i < message.alkanes.length; i++)
            exports.AlkaneTransfer.internalBinaryWrite(message.alkanes[i], writer.tag(1, runtime_1.WireType.LengthDelimited).fork(), options).join();
        /* repeated alkanes.KeyValuePair storage = 2; */
        for (let i = 0; i < message.storage.length; i++)
            exports.KeyValuePair.internalBinaryWrite(message.storage[i], writer.tag(2, runtime_1.WireType.LengthDelimited).fork(), options).join();
        /* bytes data = 3; */
        if (message.data.length)
            writer.tag(3, runtime_1.WireType.LengthDelimited).bytes(message.data);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message alkanes.ExtendedCallResponse
 */
exports.ExtendedCallResponse = new ExtendedCallResponse$Type();
// @generated message type with reflection information, may provide speed optimized methods
class SimulateResponse$Type extends runtime_4.MessageType {
    constructor() {
        super("alkanes.SimulateResponse", [
            {
                no: 1,
                name: "execution",
                kind: "message",
                T: () => exports.ExtendedCallResponse,
            },
            {
                no: 2,
                name: "gas_used",
                kind: "scalar",
                T: 4 /*ScalarType.UINT64*/,
                L: 0 /*LongType.BIGINT*/,
            },
            { no: 3, name: "error", kind: "scalar", T: 9 /*ScalarType.STRING*/ },
        ]);
    }
    create(value) {
        const message = globalThis.Object.create(this.messagePrototype);
        message.gasUsed = 0n;
        message.error = "";
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* alkanes.ExtendedCallResponse execution */ 1:
                    message.execution = exports.ExtendedCallResponse.internalBinaryRead(reader, reader.uint32(), options, message.execution);
                    break;
                case /* uint64 gas_used */ 2:
                    message.gasUsed = reader.uint64().toBigInt();
                    break;
                case /* string error */ 3:
                    message.error = reader.string();
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* alkanes.ExtendedCallResponse execution = 1; */
        if (message.execution)
            exports.ExtendedCallResponse.internalBinaryWrite(message.execution, writer.tag(1, runtime_1.WireType.LengthDelimited).fork(), options).join();
        /* uint64 gas_used = 2; */
        if (message.gasUsed !== 0n)
            writer.tag(2, runtime_1.WireType.Varint).uint64(message.gasUsed);
        /* string error = 3; */
        if (message.error !== "")
            writer.tag(3, runtime_1.WireType.LengthDelimited).string(message.error);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message alkanes.SimulateResponse
 */
exports.SimulateResponse = new SimulateResponse$Type();
// @generated message type with reflection information, may provide speed optimized methods
class AlkaneInventoryRequest$Type extends runtime_4.MessageType {
    constructor() {
        super("alkanes.AlkaneInventoryRequest", [
            { no: 1, name: "id", kind: "message", T: () => exports.AlkaneId },
        ]);
    }
    create(value) {
        const message = globalThis.Object.create(this.messagePrototype);
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* alkanes.AlkaneId id */ 1:
                    message.id = exports.AlkaneId.internalBinaryRead(reader, reader.uint32(), options, message.id);
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* alkanes.AlkaneId id = 1; */
        if (message.id)
            exports.AlkaneId.internalBinaryWrite(message.id, writer.tag(1, runtime_1.WireType.LengthDelimited).fork(), options).join();
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message alkanes.AlkaneInventoryRequest
 */
exports.AlkaneInventoryRequest = new AlkaneInventoryRequest$Type();
// @generated message type with reflection information, may provide speed optimized methods
class AlkaneInventoryResponse$Type extends runtime_4.MessageType {
    constructor() {
        super("alkanes.AlkaneInventoryResponse", [
            {
                no: 1,
                name: "alkanes",
                kind: "message",
                repeat: 1 /*RepeatType.PACKED*/,
                T: () => exports.AlkaneTransfer,
            },
        ]);
    }
    create(value) {
        const message = globalThis.Object.create(this.messagePrototype);
        message.alkanes = [];
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* repeated alkanes.AlkaneTransfer alkanes */ 1:
                    message.alkanes.push(exports.AlkaneTransfer.internalBinaryRead(reader, reader.uint32(), options));
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* repeated alkanes.AlkaneTransfer alkanes = 1; */
        for (let i = 0; i < message.alkanes.length; i++)
            exports.AlkaneTransfer.internalBinaryWrite(message.alkanes[i], writer.tag(1, runtime_1.WireType.LengthDelimited).fork(), options).join();
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message alkanes.AlkaneInventoryResponse
 */
exports.AlkaneInventoryResponse = new AlkaneInventoryResponse$Type();
//# sourceMappingURL=alkanes.js.map