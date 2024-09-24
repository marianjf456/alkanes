import { ProtoruneRuneId } from "protorune/assembly/indexer/ProtoruneRuneId";
import { u128 } from "as-bignum/assembly";
import { Box } from "metashrew-as/assembly/utils/box";
import { parseU128 } from "./utils";

export class AlkaneId extends ProtoruneRuneId {
  constructor(hi: u64 = 0, lo: u32 = 0) {
    super(hi, lo);
  }
  static fromId(hi: u128, lo: u128): AlkaneId {
    const result = new AlkaneId();
    result.block = hi;
    result.tx = lo;
    return result;
  }
  static parse(v: ArrayBuffer): AlkaneId {
    const box = Box.from(v);
    const hi = parseU128(box);
    return AlkaneId.fromId(hi, parseU128(box));
  }
  static fromProtoruneId(id: ProtoruneRuneId) {
    return AlkaneId.fromId(id.block, id.tx);
  }
  isCreate(): bool {
    return this.block.isZero() && this.tx.isZero();
  }
  isCreateReserved(): bool {
    return this.block === u128.from(1);
  }
}
