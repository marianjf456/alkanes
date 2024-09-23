import { u128 } from "as-bignum/assembly";
import { AlkaneId } from "./AlkaneId";
import { u128ListToArrayBuffer, arrayBufferToU128List } from "./utils";
import { console } from "metashrew-as/assembly/utils";
import { logArray } from "quorumgenesisprotorune/assembly/utils";

export class Cellpack {
  public target: AlkaneId;
  public inputs: Array<u128>;
  constructor(ary: Array<u128>) {
    // TODO: Remove this check since we don't want this to crash our indexer. helpful right now for local testing
    assert(ary.length >= 2, "Cellpack received less than 2 u128s as input");
    const alkaneId = new AlkaneId();
    this.target = alkaneId;
    this.inputs = ary.slice(2);
    this.target.block = ary[0];
    this.target.tx = ary[1];
    console.log("cellpack block is " + this.target.block.toString());
    console.log("cellpack tx is " + this.target.tx.toString());
  }
  toArray(): Array<u128> {
    const result = new Array<u128>(0);
    result.push(this.target.block);
    result.push(this.target.tx);
    return result.concat(this.inputs);
  }
  serialize(): ArrayBuffer {
    return u128ListToArrayBuffer(this.toArray());
  }
  static fromTuple(id: AlkaneId, inputs: Array<u128>): Cellpack {
    const result = new Array<u128>(0);
    result.push(id.block);
    result.push(id.tx);
    return new Cellpack(result.concat(inputs));
  }
  static fromArrayBuffer(v: ArrayBuffer): Cellpack {
    let list = arrayBufferToU128List(v);
    if (list.length < 2) {
      return Cellpack.fromTuple(AlkaneId.from(u128.Zero, u128.Zero), new Array<u128>(0));

    }
    return Cellpack.fromTuple(AlkaneId.from(list[0], list[1]), list.slice(2, list.length));
  }
}
