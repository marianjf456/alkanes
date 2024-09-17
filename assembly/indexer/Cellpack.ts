import { u128 } from "as-bignum/assembly";
import { AlkaneId } from "./AlkaneId";

export class Cellpack {
  public target: AlkaneId;
  public inputs: Array<u128>;
  constructor(ary: Array<u128>) {
    const alkaneId = new AlkaneId(0, 0);
    this.target = alkaneId;
    this.inputs = ary.slice(2);
    this.target.block = ary[0];
    this.target.tx = ary[1];
  }
}
