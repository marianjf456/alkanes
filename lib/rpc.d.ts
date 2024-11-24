import { OutPoint, RuneOutput } from "./outpoint";
import { MetashrewRunes } from "metashrew-runes/lib/src.ts/rpc";
import { AlkaneTransfer } from "./alkane";
import { ProtoruneEdict } from "./protorune/protoruneedict";
export declare class AlkanesRpc extends MetashrewRunes {
    protorunesbyaddress({ address, protocolTag }: any): Promise<{
        outpoints: OutPoint[];
        balanceSheet: RuneOutput[];
    }>;
    runesbyaddress({ address }: any): Promise<{
        outpoints: OutPoint[];
        balanceSheet: RuneOutput[];
    }>;
    runesbyheight({ height }: {
        height: number;
    }): Promise<{
        runes: Array<{
            runeId: string;
            name: string;
            divisibility: number;
            spacers: number;
            symbol: string;
        }>;
    }>;
    protorunesbyoutpoint({ txid, vout, protocolTag }: any): Promise<any>;
    simulate({ alkanes, transaction, height, block, inputs, tx, txindex, vout, pointer, refundPointer, }: any): Promise<any>;
    runtime({ protocolTag }: any): Promise<{
        balances: RuneOutput[];
    }>;
    pack({ runes, cellpack, pointer, refundPointer, edicts, }: {
        runes: AlkaneTransfer[];
        cellpack: Buffer;
        pointer: number;
        refundPointer: number;
        edicts: ProtoruneEdict[];
    }): Promise<any>;
}
