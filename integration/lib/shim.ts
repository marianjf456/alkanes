import { Client } from "./client";
const client = new Client("regtest");
function convertTypesJsonrpc(o) {
  if (typeof o === 'object') {
    if (Array.isArray(o)) return o.map((v) => convertTypesJsonrpc(v));
    if (o === null) return null;
    if (Buffer.isBuffer(o) || o instanceof Uint8Array) {
      return '0x' + Buffer.from(o).toString('hex');
    }
    return Object.fromEntries(Object.entries(o).map(([k, v]) => [ k, convertTypesJsonrpc(v) ]));
  } else if (typeof o === 'bigint') {
    return o.toString(10);
  } else {
    return o;
  }
}

export const rpc = new Proxy(client, {
  get(target, prop, receiver) {
    return async (...args) => {
      const split: string[] = (prop as string).split('_') as string[];
      const method: string = (split.length === 1 ? 'alkanes_' + split[split.length - 1] : prop) as any;
      return ((await client.call(method, ...args.map((v) => convertTypesJsonrpc(v)))).data as any).result;
    }
  }
});
