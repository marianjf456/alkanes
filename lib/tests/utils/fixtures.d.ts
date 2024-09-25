import { ProtoStone } from "protorune/lib/src.ts/protostone";
import * as psbt from "@scure/btc-signer/psbt";
import bitcoinjs = require("bitcoinjs-lib");
/**
 * Returns the btc.Transaction transaction with a protoburn and a inscription envelope.
 * @param inputs
 * @param outputs
 * @param edicts
 * @param protostones
 * @param runeTransferPointer
 * @returns
 */
export declare const constructProtostoneTxWithInscription: (inputs: {
    inputTxHash: Buffer | undefined;
    inputTxOutputIndex: number;
}[], inscriptionInput: psbt.TransactionInputUpdate, outputs: {
    address: Uint8Array;
    btcAmount: bigint;
}[], edicts?: {
    id: {
        block: bigint;
        tx: number;
    };
    amount: bigint;
    output: number;
}[], protostones?: ProtoStone[], runeTransferPointer?: number) => string;
export declare function createAlkaneFixture({ protocolTag, protomessagePointer, protomessageRefundPointer, programWasm, calldata, amount, }: {
    protocolTag: bigint;
    protomessagePointer: number;
    protomessageRefundPointer: number;
    programWasm: Uint8Array;
    calldata: Buffer;
    amount?: bigint;
}): Promise<{
    block: bitcoinjs.Block;
    runeId: {
        block: bigint;
        tx: number;
    };
    amount: bigint;
}>;
