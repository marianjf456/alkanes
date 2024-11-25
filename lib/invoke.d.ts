import { AlkaneTransfer, AlkaneId } from "./bytes";
import { SimulateResponse } from "./proto/alkanes";
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
export declare function decodeSimulateResponse(response: string): SimulateResponse;
