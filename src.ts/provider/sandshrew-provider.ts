import { AbstractProvider } from "./abstract-provider";

let id = 0;

export class SandshrewProvider extends AbstractProvider {
  public url: string;
  constructor(url: string) {
    super();
    this.url = url;
  }
  async call(method: string, params: any[]): Promise<any> {
    const responseText = await (await fetch(this.url, {
      method: 'POST',
      body: JSON.stringify({
        jsonrpc: '2.0',
        id: id++,
        params,
        method
      }),
      headers: {
        'Content-Type': 'application/json'
      }
    })).text();
    return JSON.parse(responseText).result;
  }
  async enrichOutput({
    vout,
    txid
  }: {
    vout: number,
    txid: string
  }): Promise<any> {
    return await this.call('ord_output', [`${txid}:$${vout}`]);
  }
  async getBTCOnlyUTXOs(address: string): Promise<any> {
    const utxos = await this.getUTXOs(address);
    console.log(utxos);
    return utxos;
  }
  async getUTXOs(address: string): Promise<any> {
    return await this.call('alkanes_protorunesbyaddress', [{ address, protocolTag: '1' }]);
  }
}
