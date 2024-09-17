import { wasmi } from "./wasmi";
import { AlkaneContext } from "./AlkaneContext";
import { ALKANES_INDEX } from "./tables";
import { IncomingRune } from "protorune/assembly/indexer/protomessage/IncomingRune";
import { ProtoruneRuneId } from "protorune/assembly/indexer/ProtoruneRuneId";
import { u128 } from "as-bignum/assembly";

export function readArrayBuffer(caller: wasmi.Caller, ptr: i32): ArrayBuffer {
  const caller = wasmi.Caller.wrap<wasmi.Caller>(_caller);
  const mem: usize = caller.memory();
  if (ptr < 4) return new ArrayBuffer(0);
  const start = load<u32>(mem + <usize>ptr - 4);
  const buffer = new ArrayBuffer(<i32>start);
  memory.copy(changetype<usize>(buffer), mem + <usize>ptr, <usize>buffer.byteLength);
  return buffer;
}

export function writeMemory(caller: wasmi.Caller, ptr: i32, v: ArrayBuffer): void {
  memory.copy(changetype<usize>(wasmi.Caller.wrap<wasmi.Caller>(_caller).memory() + <usize>ptr), changetype<usize>(v), <usize>v.byteLength);
}

export function deref(caller: wasmi.Caller, ptr: i32, i: usize): i32 {
  return load<i32>(caller.memory() + <usize>ptr + <usize>sizeof<i32>()*i);
}

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
    })
    .define("env", "__request_load", (_caller: usize, ptr: i32): i32 => {
      const caller = wasmi.Caller.wrap<wasmi.Caller>(_caller);
      return ALKANES_INDEX.keyword("storage/").select(changetype<AlkaneContext>(caller.context()).self.toBytes()).keyword("/").select(readArrayBuffer(caller, deref(caller, ptr, 0))).get().byteLength;
    })
    .define("env", "__load", (_caller: usize, ptr: i32): i32 => {
      const caller = wasmi.Caller.wrap<wasmi.Caller>(_caller);
      writeMemory(_caller, deref(caller, ptr, 1), ALKANES_INDEX.keyword("storage/").select(changetype<AlkaneContext>(caller.context()).self.toBytes()).keyword("/").select(readArrayBuffer(caller, deref(caller, ptr, 0))).get());
      return 0;
    })
    .define("env", "__request_transaction", (_caller: usize, ptr: i32): i32 => {
      return <i32>changetype<AlkaneContext>(wasmi.Caller.wrap<wasmi.Caller>(_caller).context()).messageContext.transaction.bytes.len;
    })
    .define("env", "__load_transaction", (_caller: usize, ptr: i32): i32 => {
      writeMemory(caller, deref(caller, ptr, 0), changetype<AlkaneContext>(wasmi.Caller.wrap<wasmi.Caller>(_caller).context()).messageContext.transaction.bytes.toArrayBuffer());
      return 0;
    })
    .define("env", "__request_block", (_caller: usize, ptr: i32): i32 => {
      return <i32>changetype<AlkaneContext>(wasmi.Caller.wrap<wasmi.Caller>(_caller).context()).messageContext.block.bytes.len;
    })
    .define("env", "__load_block", (_caller: usize, ptr: i32): i32 => {
      writeMemory(caller, deref(caller, ptr, 0), changetype<AlkaneContext>(wasmi.Caller.wrap<wasmi.Caller>(_caller).context()).messageContext.block.bytes.toArrayBuffer());
      return 0;
    })
    .define("env", "__commit", (_caller: usize, ptr: i32): i32 => {
    })
    .define("env", "__sequence", (_caller: usize, ptr: i32): i32 => {
      writeMemory(caller, deref(caller, ptr, 0), changetype<Uint8Array>(changetype<AlkaneContext>(wasmi.Caller.wrap(_caller).context()).messageContext.sequence().toBytes()).buffer);
      return 0;
    })
    .define("env", "__fuel", (_caller: usize, ptr: i32): i32 => {
      writeMemory(caller, deref(caller, ptr, 0), primitiveToBuffer<u64>(changetype<AlkaneContext>(wasmi.Caller.wrap(_caller).context()).instance.store.fuel()));
      return 0;
    })
    .define("env", "__call", (_caller: usize, ptr: i32): i32 => {
    })
    .define("env", "__delegatecall", (_caller: usize, ptr: i32): i32 => {
    })
    .define("env", "__staticcall", (_caller: usize, ptr: i32): i32 => {
    })
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
    messageContext: AlkaneMessageContext,
    self: ProtoruneRuneId,
    caller: ProtoruneRuneId,
    incomingRunes: Array<IncomingRune>,
    inputs: Array<u128>,
  ) {
    const bytecode = ALKANES_INDEX.select(self.toBytes()).get();
    const engine = wasmi.Engine.default();
    this.engine = engine;
    const context = new AlkaneContext(
      messageContext,
      this,
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
