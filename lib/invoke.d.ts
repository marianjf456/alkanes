import { AlkaneTransfer, AlkaneId } from "./bytes";
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
    height: number;
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
