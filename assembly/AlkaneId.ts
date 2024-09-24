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
  static fromProtoruneId(id: ProtoruneRuneId): AlkaneId {
    return AlkaneId.fromId(id.block, id.tx);
  }
  isCreate(): bool {
    return this.block.isZero() && this.tx.isZero();
  }
  isCreateReserved(): bool {
    return this.block === u128.from(1);
  }
  static fromOther<T>(v: T): AlkaneId {
    return changetype<AlkaneId>(v);
  }
  eq(v: AlkaneId): boolean {
    return this.block === v.block && this.tx === v.tx;
  }
  isFactory(): boolean {
    return this.block === u128.from(4) || this.block === u128.from(5);
  }
  getFactoryType(): u128 {
    if (!this.isFactory()) return u128.Max;
    if (this.block === u128.from(4)) return u128.Zero;
    if (this.block === u128.from(5)) return u128.from(1);
    return u128.Max;
  }
}
