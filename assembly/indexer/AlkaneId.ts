import { ProtoruneRuneId } from "protorune/assembly/indexer/ProtoruneRuneId";
import { u128 } from "as-bignum/assembly";

export class AlkaneId extends ProtoruneRuneId {
  isCreate(): boolean {
    return this.block.isZero() && this.tx.isZero();
  }
  isCreateReserved(): boolean {
    return this.block === u128.from(1);
  }
}
