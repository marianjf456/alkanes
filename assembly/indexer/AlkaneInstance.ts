import { wasmi } from "./wasmi";
import { AlkaneContext } from "./AlkaneContext";
import { ALKANES_INDEX } from "./tables";
import { IncomingRune } from "protorune/assembly/indexer/protomessage/IncomingRune";
import { ProtoruneRuneId } from "protorune/assembly/indexer/ProtoruneRuneId";
import { u128 } from "as-bignum/assembly";

export function makeLinker(engine: wasmi.Engine): wasmi.Linker {
  return engine
    .linker()
    .define("env", "__request_context", (_caller: usize, ptr: i32): i32 => {
      const caller = wasmi.Caller.wrap<wasmi.Caller>(_caller);
      const context = changetype<AlkaneContext>(caller.context());
      return context.serialize().byteLength;
    })
    .define("env", "__load_context", (_caller: usize, ptr: i32): i32 => {
      const caller = wasmi.Caller.wrap<wasmi.Caller>(_caller);
      const context = changetype<AlkaneContext>(caller.context());
      const mem: usize = caller.memory();
      const serialized = context.serialize();
      const start = mem + <usize>load<i32>(load<usize>(mem + <usize>ptr));
      if (start < mem + 4) return start - mem;
      memory.copy(start, changetype<usize>(serialized), serialized.byteLength);
      return start - mem;
    });
}

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
    const store = this.store = engine.store(
      context.pointer(),
      AlkaneInstance.MEMORY_LIMIT,
      AlkaneInstance.FUEL_LIMIT,
    );
    this.context = context;
    const linker = this.linker = makeLinker(engine);
    const module = this.module = engine.module(bytecode);
    this.instance = linker.instantiate(module, store);
  }
  call(name: string, args: Array<i32>): wasmi.Result<i32> {
    return this.instance.call(this.store, name, args);
  }
}
