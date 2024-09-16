import { ProtoruneRuneId } from "protorune/assembly/indexer/ProtoruneRuneId";

export class AlkaneId extends ProtoruneRuneId {
  public get hi(): u128 {
    return this.block;
  }
  public get lo(): u128 {
    return this.tx;
  }
  isCreate0(): boolean {
    return this.hi.isZero() && this.lo.isZero();
  }
  isCreate1(): boolean {
    return this.hi.eq(u128.from(1));
  }
}
