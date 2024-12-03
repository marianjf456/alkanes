import { AlkaneTransfer, AlkaneId } from "./bytes";
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
    gasUsed: bigint;
    execution: ExecutionResult;
};
export declare function decodeSimulateResponse(response: string): DecodedSimulateResponse;
export declare function outpointResponseToObject(v: any[]): any;
export declare function decodeOutpointResponse(result: any): any;
