import { wasmi } from "./wasmi";
import { AlkaneContext } from "./AlkaneContext";
import { ALKANES_INDEX } from "./tables";
import { IncomingRune } from "protorune/assembly/indexer/protomessage/IncomingRune";
import { ProtoruneRuneId } from "protorune/assembly/indexer/ProtoruneRuneId";
import { u128 } from "as-bignum/assembly";

export class AlkaneInstance {
  static FUEL_LIMIT: u64 = 0x10000000;
  static MEMORY_LIMIT: usize = 0x10000000;
  public module: wasmi.Module;
  public instance: wasmi.Instance = changetype<wasmi.Instance>(0);
  public store: wasmi.Store;
  public engine: wasmi.Engine;
  public context: AlkaneContext;
  public linker: wasmi.Linker;
  constructor(
    self: ProtoruneRuneId,
    caller: ProtoruneRuneId,
    incomingRunes: Array<IncomingRune>,
    inputs: Array<u128>,
  ) {
    const bytecode = ALKANES_INDEX.select(self.toBytes()).get();
    const engine = wasmi.Engine.default();
    this.engine = engine;
    const context = new AlkaneContext(
      self,
      caller,
      AlkaneInstance.FUEL_LIMIT,
      incomingRunes,
      inputs,
    );
    this.store = engine.store(context.pointer(), AlkaneInstance.MEMORY_LIMIT, AlkaneInstance.FUEL_LIMIT);
    this.context = context;
    this.linker = engine.linker();
    this.module = engine.module(bytecode);
  }
}
