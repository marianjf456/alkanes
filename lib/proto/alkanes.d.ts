import type { BinaryWriteOptions } from "@protobuf-ts/runtime";
import type { IBinaryWriter } from "@protobuf-ts/runtime";
import type { BinaryReadOptions } from "@protobuf-ts/runtime";
import type { IBinaryReader } from "@protobuf-ts/runtime";
import type { PartialMessage } from "@protobuf-ts/runtime";
import { MessageType } from "@protobuf-ts/runtime";
/**
 * @generated from protobuf message alkanes.uint128
 */
export interface uint128 {
    /**
     * @generated from protobuf field: uint64 lo = 1;
     */
    lo: bigint;
    /**
     * @generated from protobuf field: uint64 hi = 2;
     */
    hi: bigint;
}
/**
 * @generated from protobuf message alkanes.AlkaneId
 */
export interface AlkaneId {
    /**
     * @generated from protobuf field: alkanes.uint128 block = 1;
     */
    block?: uint128;
    /**
     * @generated from protobuf field: alkanes.uint128 tx = 2;
     */
    tx?: uint128;
}
/**
 * @generated from protobuf message alkanes.AlkaneTransfer
 */
export interface AlkaneTransfer {
    /**
     * @generated from protobuf field: alkanes.AlkaneId id = 1;
     */
    id?: AlkaneId;
    /**
     * @generated from protobuf field: alkanes.uint128 value = 2;
     */
    value?: uint128;
}
/**
 * @generated from protobuf message alkanes.MessageContextParcel
 */
export interface MessageContextParcel {
    /**
     * @generated from protobuf field: repeated alkanes.AlkaneTransfer alkanes = 1;
     */
    alkanes: AlkaneTransfer[];
    /**
     * @generated from protobuf field: bytes transaction = 2;
     */
    transaction: Uint8Array;
    /**
     * @generated from protobuf field: bytes block = 3;
     */
    block: Uint8Array;
    /**
     * @generated from protobuf field: uint64 height = 4;
     */
    height: bigint;
    /**
     * @generated from protobuf field: uint32 txindex = 6;
     */
    txindex: number;
    /**
     * @generated from protobuf field: bytes calldata = 5;
     */
    calldata: Uint8Array;
    /**
     * @generated from protobuf field: uint32 vout = 7;
     */
    vout: number;
    /**
     * @generated from protobuf field: uint32 pointer = 8;
     */
    pointer: number;
    /**
     * @generated from protobuf field: uint32 refund_pointer = 9;
     */
    refundPointer: number;
}
/**
 * @generated from protobuf message alkanes.KeyValuePair
 */
export interface KeyValuePair {
    /**
     * @generated from protobuf field: bytes key = 1;
     */
    key: Uint8Array;
    /**
     * @generated from protobuf field: bytes value = 2;
     */
    value: Uint8Array;
}
/**
 * @generated from protobuf message alkanes.ExtendedCallResponse
 */
export interface ExtendedCallResponse {
    /**
     * @generated from protobuf field: repeated alkanes.AlkaneTransfer alkanes = 1;
     */
    alkanes: AlkaneTransfer[];
    /**
     * @generated from protobuf field: repeated alkanes.KeyValuePair storage = 2;
     */
    storage: KeyValuePair[];
    /**
     * @generated from protobuf field: bytes data = 3;
     */
    data: Uint8Array;
}
/**
 * @generated from protobuf message alkanes.SimulateResponse
 */
export interface SimulateResponse {
    /**
     * @generated from protobuf field: alkanes.ExtendedCallResponse execution = 1;
     */
    execution?: ExtendedCallResponse;
    /**
     * @generated from protobuf field: uint64 gas_used = 2;
     */
    gasUsed: bigint;
    /**
     * @generated from protobuf field: string error = 3;
     */
    error: string;
}
/**
 * @generated from protobuf message alkanes.AlkaneInventoryRequest
 */
export interface AlkaneInventoryRequest {
    /**
     * @generated from protobuf field: alkanes.AlkaneId id = 1;
     */
    id?: AlkaneId;
}
/**
 * @generated from protobuf message alkanes.AlkaneInventoryResponse
 */
export interface AlkaneInventoryResponse {
    /**
     * @generated from protobuf field: repeated alkanes.AlkaneTransfer alkanes = 1;
     */
    alkanes: AlkaneTransfer[];
}
declare class uint128$Type extends MessageType<uint128> {
    constructor();
    create(value?: PartialMessage<uint128>): uint128;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: uint128): uint128;
    internalBinaryWrite(message: uint128, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message alkanes.uint128
 */
export declare const uint128: uint128$Type;
declare class AlkaneId$Type extends MessageType<AlkaneId> {
    constructor();
    create(value?: PartialMessage<AlkaneId>): AlkaneId;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: AlkaneId): AlkaneId;
    internalBinaryWrite(message: AlkaneId, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message alkanes.AlkaneId
 */
export declare const AlkaneId: AlkaneId$Type;
declare class AlkaneTransfer$Type extends MessageType<AlkaneTransfer> {
    constructor();
    create(value?: PartialMessage<AlkaneTransfer>): AlkaneTransfer;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: AlkaneTransfer): AlkaneTransfer;
    internalBinaryWrite(message: AlkaneTransfer, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message alkanes.AlkaneTransfer
 */
export declare const AlkaneTransfer: AlkaneTransfer$Type;
declare class MessageContextParcel$Type extends MessageType<MessageContextParcel> {
    constructor();
    create(value?: PartialMessage<MessageContextParcel>): MessageContextParcel;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: MessageContextParcel): MessageContextParcel;
    internalBinaryWrite(message: MessageContextParcel, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message alkanes.MessageContextParcel
 */
export declare const MessageContextParcel: MessageContextParcel$Type;
declare class KeyValuePair$Type extends MessageType<KeyValuePair> {
    constructor();
    create(value?: PartialMessage<KeyValuePair>): KeyValuePair;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: KeyValuePair): KeyValuePair;
    internalBinaryWrite(message: KeyValuePair, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message alkanes.KeyValuePair
 */
export declare const KeyValuePair: KeyValuePair$Type;
declare class ExtendedCallResponse$Type extends MessageType<ExtendedCallResponse> {
    constructor();
    create(value?: PartialMessage<ExtendedCallResponse>): ExtendedCallResponse;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: ExtendedCallResponse): ExtendedCallResponse;
    internalBinaryWrite(message: ExtendedCallResponse, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message alkanes.ExtendedCallResponse
 */
export declare const ExtendedCallResponse: ExtendedCallResponse$Type;
declare class SimulateResponse$Type extends MessageType<SimulateResponse> {
    constructor();
    create(value?: PartialMessage<SimulateResponse>): SimulateResponse;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: SimulateResponse): SimulateResponse;
    internalBinaryWrite(message: SimulateResponse, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message alkanes.SimulateResponse
 */
export declare const SimulateResponse: SimulateResponse$Type;
declare class AlkaneInventoryRequest$Type extends MessageType<AlkaneInventoryRequest> {
    constructor();
    create(value?: PartialMessage<AlkaneInventoryRequest>): AlkaneInventoryRequest;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: AlkaneInventoryRequest): AlkaneInventoryRequest;
    internalBinaryWrite(message: AlkaneInventoryRequest, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message alkanes.AlkaneInventoryRequest
 */
export declare const AlkaneInventoryRequest: AlkaneInventoryRequest$Type;
declare class AlkaneInventoryResponse$Type extends MessageType<AlkaneInventoryResponse> {
    constructor();
    create(value?: PartialMessage<AlkaneInventoryResponse>): AlkaneInventoryResponse;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: AlkaneInventoryResponse): AlkaneInventoryResponse;
    internalBinaryWrite(message: AlkaneInventoryResponse, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message alkanes.AlkaneInventoryResponse
 */
export declare const AlkaneInventoryResponse: AlkaneInventoryResponse$Type;
export {};
