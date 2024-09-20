import { ProtoruneRuneId } from "protorune/assembly/indexer/ProtoruneRuneId";
import { u128 } from "as-bignum/assembly";

export class AlkaneId extends ProtoruneRuneId {
  constructor() {
    super(0, 0);
  }
  static from(hi: u128, lo: u128): AlkaneId {
    const result = new AlkaneId(0, 0);
    result.block = hi;
    result.tx = lo;
    return result;
  }
  isCreate(): boolean {
    return this.block.isZero() && this.tx.isZero();
  }
  isCreateReserved(): boolean {
    return this.block === u128.from(1);
  }
}
