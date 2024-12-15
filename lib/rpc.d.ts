import { OutPoint, RuneOutput } from "./outpoint";
import { BaseRpc } from "./base-rpc";
import { AlkaneTransfer } from "./alkane";
import { ProtoruneEdict } from "./protorune/protoruneedict";
export declare class AlkanesRpc extends BaseRpc {
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
    protorunesbyoutpoint({ txid, vout, protocolTag }: {
        txid: any;
        vout: any;
        protocolTag: any;
    }): Promise<any>;
    trace({ txid, vout }: {
        txid: string;
        vout: number;
    }): Promise<any>;
    simulate({ alkanes, transaction, height, block, txindex, target, inputs, vout, pointer, refundPointer, }: any): Promise<any>;
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
