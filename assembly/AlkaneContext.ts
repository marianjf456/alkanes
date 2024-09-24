import { AlkaneId } from "./AlkaneId";
import { toU128List } from "./utils";
import { Box } from "metashrew-as/assembly/utils/box";

export class AlkaneContext {
  public self: AlkaneId;
  public caller: AlkaneId;
  public runes: Map<string, u128>;
  constructor(v: ArrayBuffer) {
    const values = toU128List(v);
    this.runes = new Map<string, u128>();
    this.self = AlkaneId.fromId(values[0], values[1]);
    this.caller = AlkaneId.fromId(values[2], values[3]);
    for (let i: i32 = 4; i < values.length; i += 3) {
      const thisAlkane = AlkaneId.fromId(values[i], values[i + 1]);
      thisAlkane.toBytes();
      this.runes.set(
        Box.from(thisAlkane.toBytes()).toHexString(),
        values[i + 3],
      );
    }
  }
}
