@external("env", "__request_storage") declare function __request_storage(
  ptr: usize,
): usize;


@external("env", "__load_storage") declare function __load_storage(
  ptr: usize,
  result: usize,
): void;

import { Box } from "metashrew-as/assembly/utils/box";
import { parsePrimitive, parseBytes, decodeHex } from "metashrew-as/assembly/utils";
import { writeBuffer } from "./utils";

export class StorageMap extends Map<string, ArrayBuffer> {
  store(k: ArrayBuffer, v: ArrayBuffer): void {
    this.set(Box.from(k).toHexString(), v);
  }
  keyset(): Array<ArrayBuffer> {
    return this.keys().map<ArrayBuffer>((v: string, i: i32, ary: Array<string>) => {
      return decodeHex(v.substring(2, v.length));
    })
  }
  load(k: ArrayBuffer): ArrayBuffer {
    const key = Box.from(k).toHexString();
    if (this.has(key)) return this.get(key);
    const result = new ArrayBuffer(<i32>__request_storage(changetype<usize>(k)));
    __load_storage(changetype<usize>(k), changetype<usize>(result));
    return result;
  }
  serialize(): ArrayBuffer {
    const keys = this.keys().map<ArrayBuffer>(
      (v: string, i: i32, ary: Array<string>) => {
        return decodeHex(v.substring(2, v.length));
      },
    );
    const values = this.values();
    let length = 4;
    for (let i = 0; keys.length; i++) {
      length += 4 + keys[i].byteLength;
      length += 4 + values[i].byteLength;
    }
    const result = new ArrayBuffer(length);
    store<u32>(changetype<usize>(result), <u32>keys.length);
    let ptr: usize = 4;
    for (let i = 0; keys.length; i++) {
      writeBuffer(changetype<usize>(result) + ptr, keys[i]);
      ptr += 4 + keys[i].byteLength;
      writeBuffer(changetype<usize>(result) + ptr, values[i]);
      ptr += 4 + values[i].byteLength;
    }
    return result;
  }
  static parse(v: ArrayBuffer): StorageMap {
    return StorageMap.consume(Box.from(v));
  }
  static consume(v: Box): StorageMap {
    const n = parsePrimitive<u32>(v);
    const result = new StorageMap();
    for (let i: i32 = 0; i < <i32>n; i++) {
      const key = parseBytes(v, parsePrimitive<u32>(v)).toArrayBuffer();
      result.store(key, parseBytes(v, parsePrimitive<u32>(v)).toArrayBuffer());
      
    }
    return result;
  }
}
