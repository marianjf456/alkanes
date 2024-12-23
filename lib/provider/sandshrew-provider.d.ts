import { AbstractProvider } from "./abstract-provider";
export declare class SandshrewProvider extends AbstractProvider {
    url: string;
    constructor(url: string);
    call(method: string, params: any[]): Promise<any>;
    enrichOutput({ vout, txid }: {
        vout: number;
        txid: string;
    }): Promise<any>;
    getBTCOnlyUTXOs(address: string): Promise<any>;
    getUTXOs(address: string): Promise<any>;
}
