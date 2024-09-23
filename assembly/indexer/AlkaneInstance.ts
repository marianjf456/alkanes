import { wasmi } from "./wasmi";
import { AlkaneContext } from "./AlkaneContext";
import { ALKANES_INDEX } from "./tables";
import { IncomingRune } from "protorune/assembly/indexer/protomessage/IncomingRune";
import { ProtoruneRuneId } from "protorune/assembly/indexer/ProtoruneRuneId";
import { AlkaneMessageContext } from "./AlkaneMessageContext";
import { u128 } from "as-bignum/assembly";
import { primitiveToBuffer } from "metashrew-as/assembly/utils/utils";
import { AlkaneGlobalState } from "./AlkaneGlobalState";

export function readArrayBuffer(caller: wasmi.Caller, ptr: i32): ArrayBuffer {
  const mem: usize = caller.memory();
  if (ptr < 4) return new ArrayBuffer(0);
  const start = load<u32>(mem + <usize>ptr - 4);
  const buffer = new ArrayBuffer(<i32>start);
  memory.copy(changetype<usize>(buffer), mem + <usize>ptr, <usize>buffer.byteLength);
  return buffer;
}

export function writeMemory(caller: wasmi.Caller, ptr: i32, v: ArrayBuffer): void {
  memory.copy(changetype<usize>(caller.memory() + <usize>ptr), changetype<usize>(v), <usize>v.byteLength);
}

export function deref(caller: wasmi.Caller, ptr: i32, i: usize): i32 {
  return load<i32>(caller.memory() + <usize>ptr + <usize>sizeof<i32>()*i);
}

export function makeLinker(engine: wasmi.Engine): wasmi.Linker {
  return engine
    .linker()
    .define("env", "__request_context", (_caller: usize, ptr: i32): i32 => {
      const caller = wasmi.Caller.wrap(_caller);
      const context = changetype<AlkaneContext>(caller.context());
      return context.serialize().byteLength;
    })
    .define("env", "__load_context", (_caller: usize, ptr: i32): i32 => {
      const caller = wasmi.Caller.wrap(_caller);
      const context = changetype<AlkaneContext>(caller.context());
      const mem: usize = caller.memory();
      const serialized = context.serialize();
      const start = mem + <usize>load<i32>(load<usize>(mem + <usize>ptr));
      if (start < mem + 4) return <i32>start - <i32>mem;
      memory.copy(start, changetype<usize>(serialized), serialized.byteLength);
      return <i32>start - <i32>mem;
    })
    .define("env", "__request_storage", (_caller: usize, ptr: i32): i32 => {
      const caller = wasmi.Caller.wrap(_caller);
      return ALKANES_INDEX.keyword("storage/").select(changetype<AlkaneContext>(caller.context()).self.toBytes()).keyword("/").select(readArrayBuffer(caller, deref(caller, ptr, 0))).get().byteLength;
    })
    .define("env", "__load_storage", (_caller: usize, ptr: i32): i32 => {
      const caller = wasmi.Caller.wrap(_caller);
      writeMemory(caller, deref(caller, ptr, 1), ALKANES_INDEX.keyword("storage/").select(changetype<AlkaneContext>(caller.context()).self.toBytes()).keyword("/").select(readArrayBuffer(caller, deref(caller, ptr, 0))).get());
      return 0;
    })
    .define("env", "__request_transaction", (_caller: usize, ptr: i32): i32 => {
      return <i32>changetype<AlkaneContext>(wasmi.Caller.wrap(_caller).context()).messageContext.transaction.bytes.len;
    })
    .define("env", "__load_transaction", (_caller: usize, ptr: i32): i32 => {
      const caller = wasmi.Caller.wrap(_caller);
      writeMemory(caller, deref(caller, ptr, 0), changetype<AlkaneContext>(caller.context()).messageContext.transaction.bytes.toArrayBuffer());
      return 0;
    })
    .define("env", "__request_block", (_caller: usize, ptr: i32): i32 => {
      return <i32>changetype<AlkaneContext>(wasmi.Caller.wrap(_caller).context()).messageContext.block.bytes.len;
    })
    .define("env", "__load_block", (_caller: usize, ptr: i32): i32 => {
      const caller = wasmi.Caller.wrap(_caller);
      writeMemory(caller, deref(caller, ptr, 0), changetype<AlkaneContext>(wasmi.Caller.wrap(_caller).context()).messageContext.block.bytes.toArrayBuffer());
      return 0;
    })
    .define("env", "__sequence", (_caller: usize, ptr: i32): i32 => {
      const caller = wasmi.Caller.wrap(_caller);
      writeMemory(caller, deref(caller, ptr, 0), changetype<Uint8Array>(changetype<AlkaneContext>(caller.context()).messageContext.sequence().toBytes()).buffer);
      return 0;
    })
    .define("env", "__fuel", (_caller: usize, ptr: i32): i32 => {
      const caller = wasmi.Caller.wrap(_caller);
      writeMemory(caller, deref(caller, ptr, 0), primitiveToBuffer<u64>(changetype<AlkaneContext>(caller.context()).instance.store.fuel()));
      return 0;
    })
    .define("env", "__call", (_caller: usize, ptr: i32): i32 => {
      const caller = wasmi.Caller.wrap(_caller);
      const context = changetype<AlkaneContext>(caller.context());
      const state = context.state;
      const cellpack = Cellpack.fromArrayBuffer(readArrayBuffer(caller, deref(caller, ptr, 0)));
      const incomingRunes = AlkaneTransferParcel.parse(readArrayBuffer(caller, deref(caller, ptr, 1)));
      state.checkpoint();
      const storageMap = StorageMap.parse(readArrayBuffer(caller, deref(caller, ptr, 2)));
      state.take(context.self, storageMap);
      state.transfer(context.self, cellpack.target, incomingRunes);
      const instance = new AlkaneInstance(context.messageContext, cellpack.target, context.self, incomingRunes, cellpack.inputs, state);
      const ptr = instance.call("__execute", new Array<i32>(0));
      // readArrayBufferFromMemory
      // if (success) state.commit();
      return 0;
    })
    .define("env", "__delegatecall", (_caller: usize, ptr: i32): i32 => {
      return 0;
    })
    .define("env", "__staticcall", (_caller: usize, ptr: i32): i32 => {
      return 0;
    })
}

export class AlkaneInstance {
  static FUEL_LIMIT: u64 = 0x10000000;
  static MEMORY_LIMIT: usize = 0x10000000;
  public module: wasmi.Module;
  public instance: wasmi.Instance;
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
    state: AlkaneGlobalState
  ) {
    const bytecode = ALKANES_INDEX.select(self.toBytes()).get();
    const engine = wasmi.Engine.default();
    this.engine = engine;
    const context = new AlkaneContext(
      messageContext,
      changetype<AlkaneInstance>(0),
      self,
      caller,
      AlkaneInstance.FUEL_LIMIT,
      incomingRunes,
      inputs,
      state
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
    this.context.instance = this;
  }
  call(name: string, args: Array<i32>): wasmi.Result<i32> {
    return this.instance.call(this.store, name, args);
  }
}
