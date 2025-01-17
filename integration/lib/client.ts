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
    this.rpcUrl = params.url;
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
      headers: {
        Authorization:
          "Basic " + Buffer.from("bitcoinrpc:bitcoinrpc").toString("base64"),
        'Content-Type': 'application/json'
      },
      method: "POST",
      body: JSON.stringify(body),
    }).then(async (res) => ({ data: await res.json() }));
  }
  async generateBlock() {
    await timeout(5000);
    const mempool = await this.call("getrawmempool", true);
    const keys = Object.keys(mempool.data.result);
    const blockHash = await this.call("generateblock", RANDOM_ADDRESS, keys);
    await timeout(5000);
    return { mempool: keys, blockHash };
  }
  async init(addresses: any[]) {
    const blockCount = await this.call("getblockcount");
    if (blockCount.data.result > 250) return blockCount.data.result;
    try {
      await this.call(
        "generatetoaddress",
        60,
        REGTEST_FAUCET.nativeSegwit.address,
      );
      await addresses.reduce(async (a, address) => {
        await a;
        await this.call("generatetoaddress", 1, address);
      }, Promise.resolve());
      const tx = await this.call(
        "generatetoaddress",
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
