import { AlkaneId } from "./AlkaneId";
import { u128 } from "as-bignum/assembly";
import { Box } from "metashrew-as/assembly/utils/box";
import { parseU128 } from "./utils";

export class AlkaneTransfer {
  public id: AlkaneId;
  public value: u128;
  constructor(id: AlkaneId, value: u128) {
    this.id = id;
    this.value = value;
  }
  static fromTuple(id: AlkaneId, value: u128): AlkaneTransfer {
    return new AlkaneTransfer(id, value);
  }
  static parse(v: Box): AlkaneTransfer {
    const block = parseU128(v);
    const tx = parseU128(v);
    const value = parseU128(v);
    return AlkaneTransfer.fromTuple(AlkaneId.fromId(block, tx), value);
  }
}

