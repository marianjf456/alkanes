"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SandshrewProvider = void 0;
const abstract_provider_1 = require("./abstract-provider");
let id = 0;
class SandshrewProvider extends abstract_provider_1.AbstractProvider {
    constructor(url) {
        super();
        this.url = url;
    }
    async call(method, params) {
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
    async enrichOutput({ vout, txid }) {
        return await this.call('ord_output', [`${txid}:$${vout}`]);
    }
    async getBTCOnlyUTXOs(address) {
        const utxos = await this.getUTXOs(address);
        console.log(utxos);
        return utxos;
    }
    async getUTXOs(address) {
        return await this.call('alkanes_protorunesbyaddress', [{ address, protocolTag: '1' }]);
    }
}
exports.SandshrewProvider = SandshrewProvider;
//# sourceMappingURL=sandshrew-provider.js.map