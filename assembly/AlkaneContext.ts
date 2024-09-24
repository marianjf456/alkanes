import { AlkaneId } from "./AlkaneId";
import { toU128List } from "./utils";
import { Box } from "metashrew-as/assembly/utils/box";
import { u128 } from "as-bignum/assembly";

export class AlkaneContext {
  public self: AlkaneId;
  public caller: AlkaneId;
  public runes: Map<string, u128>;
  public inputs: Array<u128>;
  constructor(v: ArrayBuffer) {
    const values = toU128List(v);
    this.inputs = new Array<u128>(0);
    this.runes = new Map<string, u128>();
    this.self = AlkaneId.fromId(values[0], values[1]);
    this.caller = AlkaneId.fromId(values[2], values[3]);
    const alkaneCount = values[4];
    let i: i32 = 5;
    for (; i < alkaneCount*3 + 5; i += 3) {
      const thisAlkane = AlkaneId.fromId(values[i], values[i + 1]);
      thisAlkane.toBytes();
      this.runes.set(
        Box.from(thisAlkane.toBytes()).toHexString(),
        values[i + 3],
      );
    }
    for (; i < values.length; i++) {
      this.inputs.push(values[i]);
    }
  }
}
