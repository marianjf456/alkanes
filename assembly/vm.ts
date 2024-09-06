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
  constructor(self: ProtoruneRuneId, caller: ProtoruneRuneId, fuelLeft: u64, incomingRunes: Array<IncomingRune>) {
    this.self = self;
    this.caller = caller;
    this.fuelLeft = u128.from(fuelLeft);
    this.incomingRunes = incomingRunes.map<AlkaneContextIncomingRune>((v: IncomingRune, i: i32, ary: Array<IncomingRune>) => AlkaneContextIncomingRune.fromIncomingRune(v));
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
    const varints = this.flatten()
    const result = new ArrayBuffer(varints.length * 0x10);
    for (let i: i32 = 0; i < varints.length; i++) {
      memory.copy(changetype<usize>(result) + i*16, toArrayBuffer(varints[i]), 0x10);
    }
    return result;
  }
}

const FUEL_LIMIT: u64 = 0x10000000;
const MEMORY_LIMIT: usize = 0x10000000;

export class AlkaneInstance {
  public module: wasmi.Module;
  public instance: wasmi.Instance;
  public store: wasmi.Store;
  public engine: wasmi.Engine;
  public context: AlkaneContext;
  public linker: wasmi.Linker;
  constructor(self: ProtoruneRuneId, caller: ProtoruneRuneId, incomingRunes: Array<IncomingRune>): AlkaneInstance {
    const bytecode = ALKANES_INDEX.select(alkaneId.toBytes()).get();
    const engine = wasmi.Engine.default();
    this.engine = engine;
    this.context = new AlkaneContext(self, caller, incomingRunes);
    this.store = engine.store(context.pointer(), FUEL_LIMIT, MEMORY_LIMIT);
    this.linker = engine.linker();
    this.module = engine.module(bytecode);
  }
}
