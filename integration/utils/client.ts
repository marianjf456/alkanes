import { INIT_OPTIONS, REGTEST_FAUCET, RANDOM_ADDRESS } from "./constants";
import { timeout } from "./utils";
import bitcoin from "bitcoinjs-lib";

export class Client {
  network: bitcoin.Network;
  version: string;
  networkType: string;
  url: string;
  apiUrl: string;
  projectId?: string;
  rpcUrl: string;
  constructor(networkType: keyof typeof INIT_OPTIONS = "regtest") {
    const params = INIT_OPTIONS[networkType];
    this.network = params.network;
    this.networkType = params.networkType;
    this.url = params.url;
    this.apiUrl = params.apiUrl;
    this.projectId = params.projectId;
    this.rpcUrl = `${params.url}/${params.version}/${params.projectId}`;
    this.version = params.version;
  }
  async call(method: string, ...params: any[]) {
    const body = {
      method,
      params: params || [],
      jsonrpc: "2.0",
      id: 1,
    };
    return await fetch(this.rpcUrl, {
      method: "POST",
      body: JSON.stringify(body),
    }).then((res) => res.json());
  }

  async init(addresses: any[]) {
    const blockCount = await this.call("btc_getblockcount");
    if (blockCount.data.result > 250) return blockCount.data.result;
    try {
      await this.call(
        "btc_generatetoaddress",
        60,
        REGTEST_FAUCET.nativeSegwit.address,
      );
      await addresses.reduce(async (a, address) => {
        await a;
        await this.call("btc_generatetoaddress", 1, address);
      }, Promise.resolve());
      const tx = await this.call(
        "btc_generatetoaddress",
        200 - addresses.length,
        RANDOM_ADDRESS,
      );
      await timeout(8000);
      return tx.data.result;
    } catch (e) {
      console.log("err: ", e);
      return e;
    }
  }
}
