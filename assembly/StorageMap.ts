import { Box } from "metashrew-as/assembly/utils/box";
import { parsePrimitive, parseBytes, decodeHex } from "metashrew-as/assembly/utils";
import { writeBuffer } from "./utils";

export function parseStorageMap<T extends AlkaneStorageMap>(v: ArrayBuffer): T {
  const result = instantiate<T>();
  result.parse(v);
  return result;
}

export function consumeToStorageMap<T extends AlkaneStorageMap>(v: Box): T {
  const result = instantiate<T>();
  result.consume(v);
  return result;
}

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
    return changetype<ArrayBuffer>(0);
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
  static parseStorageMap(v: ArrayBuffer): StorageMap {
    return parseStorageMap<StorageMap>(v);
  }
  static consumeToStorageMap(v: Box): StorageMap {
    return consumeToStorageMap<StorageMap>(v);
  }
  parse(v: ArrayBuffer): void {
    return this.consume(Box.from(v));
  }
  consume(v: Box): void {
    const n = parsePrimitive<u32>(v);
    for (let i: i32 = 0; i < <i32>n; i++) {
      const key = parseBytes(v, parsePrimitive<u32>(v)).toArrayBuffer();
      this.store(key, parseBytes(v, parsePrimitive<u32>(v)).toArrayBuffer());
      
    }
  }
}
