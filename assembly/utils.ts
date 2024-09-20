import { fromArrayBuffer } from "metashrew-runes/assembly/utils";

export function u128ListToArrayBuffer(flat: Array<u128>): ArrayBuffer {
  return flat.reduce<ArrayBuffer>((r: ArrayBuffer, v: u128, i: i32, ary: Array<u128>) => {
    memory.copy(changetype<usize>(r) + i*16, changetype<usize>(changetype<Uint8Array>(v.toBytes()).buffer), <usize>16);
    return r;
  }, new ArrayBuffer(flat.length * 16));
}

export function parseU128(v: Box): u128 {
  const result = fromArrayBuffer(v.sliceFrom(0).setLength(16).toArrayBuffer());
  v.shrinkFront(16);
  return result;
}
