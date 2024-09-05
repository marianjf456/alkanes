import {
  wasmi
} from "./wasmi";
import { ProtoruneRuneId } from "protorune/assembly/indexer/ProtoruneRuneId";
import { IndexPointer } from "metashrew-as/assembly/indexer/tables";
import { ALKANES_INDEX } from "./tables";

class AlkaneContextIncomingRune {
  public runeId: ProtoruneRuneId;
  public amount: u128;
  static from(runeId: ProtoruneRuneId, amount: u128): AlkaneContextIncomingRune {
    const result = new AlkaneContextIncomingRune();
    result.runeId = runeId;
    result.amount = amount;
    return result;
  }
  static fromIncomingRune(rune: IncomingRune): AlkaneContextIncomingRune {
    return AlkaneContextIncomingRune.from(rune.runeId, rune.amount);
  }
}

class AlkaneContext {
  public self: ProtoruneRuneId;
  public caller: ProtoruneRuneId;
  public fuelLeft: u128;
  public incomingRunes: Array<AlkaneContextIncomingRune>;
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
    const result = new ArrayBuffer((5 + this.incomingRunes.length*3)*16);
    const varints = this.flatten()
    memory.copy(changetype<
  }
}

class AlkaneInstance {
  public module: wasmi.Module;
  public instance: wasmi.Instance;
  public store: wasmi.Store;
  public engine: wasmi.Engine;
  public context: AlkaneContext;
}

export function loadAlkane(alkaneId: ProtoruneRuneId): AlkaneInstance {
  const alkane = new AlkaneInstance();
  const bytecode = ALKANES_INDEX.select(alkaneId.toBytes()).get();
  alkane.engine = wasmi.Engine.default();

  alkane.store = alkane.engine.store(
}
