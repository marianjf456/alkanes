import { AlkaneTransfer, AlkaneId } from "./bytes";
export declare function formatKey(v: any): string;
export declare function toAlkaneTransfer(v: any): {
    id: {
        block: bigint;
        tx: bigint;
    };
    value: bigint;
};
export declare function fromCallType(v: number): string;
export declare function toAlkaneId(v: any): {
    block: bigint;
    tx: bigint;
};
export declare function toStorageSlot(v: any): {
    key: string;
    value: string;
};
export declare function toContext(v: any): {
    myself: {
        block: bigint;
        tx: bigint;
    };
    caller: {
        block: bigint;
        tx: bigint;
    };
    inputs: any;
    incomingAlkanes: any;
    vout: any;
};
export declare function toResponse(v: any): {
    alkanes: any;
    data: string;
    storage: any;
};
export declare function toEvent(v: any): {
    event: string;
    data: {
        block: bigint;
        tx: bigint;
    };
} | {
    event: string;
    data: {
        type: string;
        context: {
            myself: {
                block: bigint;
                tx: bigint;
            };
            caller: {
                block: bigint;
                tx: bigint;
            };
            inputs: any;
            incomingAlkanes: any;
            vout: any;
        };
        fuel: any;
        status?: undefined;
        response?: undefined;
    };
} | {
    event: string;
    data: {
        status: string;
        response: {
            alkanes: any;
            data: string;
            storage: any;
        };
        type?: undefined;
        context?: undefined;
        fuel?: undefined;
    };
};
export declare function encodeTraceRequest({ txid, vout }: {
    txid: string;
    vout: number;
}): string;
export declare function decodeTraceResponse(hex: string): any;
export declare function encodeSimulateRequest({ alkanes, transaction, height, block, inputs, target, txindex, vout, pointer, refundPointer, }: {
    alkanes: AlkaneTransfer[];
    transaction: string;
    target: AlkaneId;
    inputs: bigint[];
    height: bigint;
    block: string;
    txindex: number;
    vout: number;
    pointer: number;
    refundPointer: number;
}): string;
export type ExecutionResult = {
    error: null | string;
    storage: any[];
    alkanes: any[];
    data: string;
};
export type DecodedSimulateResponse = {
    status: number;
    gasUsed: number;
    execution: ExecutionResult;
};
export declare function decodeSimulateResponse(response: string): DecodedSimulateResponse;
export declare function outpointResponseToObject(v: any[]): any;
export declare function decodeOutpointResponse(result: any): any;
