import { u128 } from "as-bignum/assembly";
import { AlkaneId } from "./AlkaneId";

@final
@unmanaged
export class Cellpack {
  public target: AlkaneId;
  public input: Array<u128>;
  constructor(ary: Array<u128>) {
    const alkaneId = new AlkaneId(0, 0);
    this.target = alkaneId;
    this.target.block = ary[0];
    this.target.tx = ary[1];
    this.input = ary.slice(2);
  }
}
