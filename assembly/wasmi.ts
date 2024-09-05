@external("alkanes_runtime", "__wasmi_caller_memory") declare function __wasmi_caller_memory(caller: usize): usize;

@external("alkanes_runtime", "__wasmi_caller_context") declare function __wasmi_caller_context(caller: usize): usize;

@external("alkanes_runtime", "__wasmi_engine_new") declare function __wasmi_engine_new(): usize;

@external("alkanes_runtime", "__wasmi_engine_free") declare function __Wasmi_engine_free(engine: usize): void;

@external("alkanes_runtime", "__wasmi_store_new") declare function __wasmi_store_new(engine: usize, context: usize, memory_limit: usize, fuel_limit: u64): usize;

@external("alkanes_runtime", "__wasmi_store_free") declare function __wasmi_store_free(store: usize): void;

@external("alkanes_runtime", "__wasmi_module_new") declare function __wasmi_module_new(engine: usize, program: usize, sz: usize): usize;

@external("alkanes_runtime", "__wasmi_linker_new") declare function __wasmi_linker_new(engine: usize): usize;

@external("alkanes_runtime", "__wasmi_func_wrap") declare function __wasmi_func_wrap(linker: usize, module: usize, func: usize, handler: usize): void;

@external("alkanes_runtime", "__wasmi_linker_instantiate") declare function __wasmi_linker_instantiate(linker: usize, store: usize, module: usize): usize;

@external("alkanes_runtime", "__wasmi_store_set_fuel") declare function __wasmi_store_set_fuel(store: usize, fuel: i32): void;

@external("alkanes_runtime", "__wasmi_instance_call") declare function __wasmi_instance_call(instance: usize, store: usize, name: usize, args: usize, len: i32, result: usize): i32;

class Result<T> {
  public value: T;
  constructor(success: boolean, value: T) {
    this.success = success;
    this.value = value;
  }
  static Ok<T>(value: T): Result<T> {
    return new Result<T>(true, value);
  }
  static Err<T>(): Result<T> {
    return new Result<T>(false, changetype<T>(0));
  }
}

export function _toCStr(v: string): ArrayBuffer {
   const s = String.UTF8.encode(v);
   const result = new ArrayBuffer(s.byteLength + 1);
   memory.copy(changetype<usize>(result), changetype<usize>(s), <usize>s.byteLength);
   store<u8>(changetype<usize>(result) + s.byteLength, <u8>1);
   return result;
}

@final
@unmanaged
class Instance {
  [key: string]: number;
  static wrap(v: usize) {
    return changetype<Instance>(v);
  }
  unwrap(): usize {
    return changetype<usize>(this);
  }
  call<T>(store: Store, name: string, args: Array<i32>): Result<i32> {
    const result = new ArrayBuffer(4);
    const hadError = __wasmi_instance_call(changetype<usize>(store), _toCStr(name), changetype<usize>(args.dataStart), args.length, changetype<usize>(result));
    if (hadError !== 0) return Result.Err<i32>();
    return Result.Ok<i32>(load<i32>(changetype<usize>(result)));
  }
}

namespace wasmi {
  export type Instance = usize;
  export type CStr = usize;
  export function call(instance: Instance, 
}
