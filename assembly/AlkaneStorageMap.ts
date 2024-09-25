@external("env", "__request_storage") declare function __request_storage(
  ptr: usize,
): usize;


@external("env", "__load_storage") declare function __load_storage(
  ptr: usize,
  result: usize,
): void;

import { StorageMap } from "./StorageMap";
import { Box } from "metashrew-as/assembly/utils/box";

export class AlkaneStorageMap extends StorageMap {
  load(k: ArrayBuffer): ArrayBuffer {
    const value = super.load(k);
    if (changetype<usize>(value) !== 0) return value;
    const result = new ArrayBuffer(<i32>__request_storage(changetype<usize>(k)));
    __load_storage(changetype<usize>(k), changetype<usize>(result));
    return result;
  }
  static parse(v: ArrayBuffer): StorageMap {
    return AlkaneStorageMap.from(StorageMap.parseStorageMap(v));
  }
  static consume(v: Box): StorageMap {
    return AlkaneStorageMap.from(StorageMap.consumeToStorageMap(v));
  }
  static from<T>(v: T): AlkaneStorageMap {
    return changetype<AlkaneStorageMap>(v);
  }
}
