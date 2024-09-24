import { fromArrayBuffer } from "metashrew-runes/assembly/utils";
import { Box } from "metashrew-as/assembly/utils/box";
import { u128 } from "as-bignum/assembly"

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

export function arrayBufferToU128List(v: ArrayBuffer): Array<u128> {
  const box = Box.from(v)
  const result = new Array<u128>(0);
  while (box.len !== 0 && box.len % 16 === 0) {
    result.push(parseU128(box));
  }
  return result;
}

export function toU128List(v: ArrayBuffer): Array<u128> {
  const result = new Array<u128>(0);
  const buffer = Box.from(v);
  for (let i: i32 = 0; i < v.byteLength; i += 16) {
    result.push(
      fromArrayBuffer(buffer.sliceFrom(i).setLength(16).toArrayBuffer()),
    );
  }
  return result;
}

export function writeBuffer(ptr: usize, buffer: ArrayBuffer): void {
  memory.copy(ptr, changetype<usize>(buffer) - 4, <usize>buffer.byteLength + 4);
}
