import { ProtoruneRuneId } from "protorune/assembly/indexer/ProtoruneRuneId";
import { u128 } from "as-bignum/assembly";
import { IncomingRune } from "protorune/assembly/indexer/protomessage/IncomingRune";
import { AlkaneContextIncomingRune } from "./AlkaneContextIncomingRune";
import { toArrayBuffer } from "metashrew-runes/assembly/utils";

export class AlkaneContext {
  public self: ProtoruneRuneId;
  public caller: ProtoruneRuneId;
  public fuelLeft: u128;
  public incomingRunes: Array<AlkaneContextIncomingRune>;
  constructor(
    self: ProtoruneRuneId,
    caller: ProtoruneRuneId,
    fuelLeft: u64,
    incomingRunes: Array<IncomingRune>,
    inputs: Array<u128>,
  ) {
    this.self = self;
    this.caller = caller;
    this.fuelLeft = u128.from(fuelLeft);
    this.incomingRunes = incomingRunes.map<AlkaneContextIncomingRune>(
      (v: IncomingRune, i: i32, ary: Array<IncomingRune>) =>
        AlkaneContextIncomingRune.fromIncomingRune(v),
    );
  }
  pointer(): usize {
    return changetype<usize>(this);
  }
  flatten(): Array<u128> {
    const result = new Array<u128>(0);
    result.push(this.self.block);
    result.push(this.self.tx);
    result.push(this.caller.block);
    result.push(this.caller.tx);
    result.push(this.fuelLeft);
    for (let i = 0; i < this.incomingRunes.length; i++) {
      const rune = this.incomingRunes[i];
      result.push(rune.runeId.block);
      result.push(rune.runeId.tx);
      result.push(rune.amount);
    }
    return result;
  }
  serialize(): ArrayBuffer {
    const varints = this.flatten();
    const result = new ArrayBuffer(varints.length * 0x10);
    for (let i: i32 = 0; i < varints.length; i++) {
      memory.copy(
        changetype<usize>(result) + i * 16,
        changetype<usize>(toArrayBuffer(varints[i])),
        0x10,
      );
    }
    return result;
  }
}
