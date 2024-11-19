import { SimulateResponse, AlkaneTransfer } from "./proto/alkanes";
export declare function encodeSimulateRequest({ alkanes, transaction, height, block, tx, inputs, txindex, vout, pointer, refundPointer, }: {
    alkanes: AlkaneTransfer[];
    transaction: string;
    block: bigint;
    tx: bigint;
    inputs: bigint[];
    height: bigint;
    txindex: number;
    vout: number;
    pointer: number;
    refundPointer: number;
}): string;
export declare function decodeSimulateRequest(request: string): SimulateResponse;
