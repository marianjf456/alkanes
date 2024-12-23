import { AbstractProvider } from "./abstract-provider";
export type OutPointResponseOutPoint = {
    txid: string;
    vout: number;
};
export type OutPointResponseOutput = {
    script: string;
    value: number;
};
export type RuneResponse = {
    name: string;
    symbol: string;
    balance: bigint | number;
};
export type OutPointResponse = {
    runes: RuneResponse[];
    outpoint: OutPointResponseOutPoint;
    output: OutPointResponseOutput;
    height: number;
    txindex: number;
};
export type BalanceSheetItem = {
    rune: RuneResponse;
    balance: bigint | number;
};
export type GetUTXOsResponse = {
    balanceSheet: BalanceSheetItem[];
    outpoints: OutPointResponse[];
};
export declare class SandshrewProvider extends AbstractProvider {
    url: string;
    constructor(url: string);
    call(method: string, params: any[]): Promise<any>;
    enrichOutput({ vout, txid }: {
        vout: number;
        txid: string;
    }): Promise<any>;
    getBTCOnlyUTXOs(address: string): Promise<any>;
    getUTXOs(address: string): Promise<GetUTXOsResponse>;
}
