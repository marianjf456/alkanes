import { AlkaneTransfer } from "./AlkaneTransfer";
import { u128 } from "as-bignum/assembly";
import { Box } from "metashrew-as/assembly/utils/box";
import { parseU128 } from "./utils";

export class CallResult {
  public alkanes: Array<AlkaneTransfer>;
  public data: Array<u128>;
  constructor(alkanes: Array<AlkaneTransfer>, data: Array<u128>) {
    this.alkanes = alkanes;
    this.data = data;
  }
  static fromTuple(
    alkanes: Array<AlkaneTransfer>,
    data: Array<u128>,
  ): CallResult {
    return new CallResult(alkanes, data);
  }
  static parse(v: ArrayBuffer): CallResult {
    if (v.byteLength % 16 !== 0 || v.byteLength === 0)
      return changetype<CallResult>(0);
    const input = Box.from(v);
    const assets = parseU128(input).toU64();
    if (<u64>input.len < <u64>16 * assets) return changetype<AlkaneTransfer>(0);
    const alkanes = new Array<AlkaneTransfer>(0);
    const data = new Array<u128>(0);
    for (let i: u64 = 0; i < assets.length && input.len !== 0; i++) {
      alkanes.push(AlkaneTransfer.parse(input));
    }
    while (input.len !== 0) {
      data.push(parseU128(input));
    }
    return CallResult.fromTuple(alkanes, data);
  }
  isRevert(): boolean {
    return changetype<usize>(this) === 0;
  }
}
