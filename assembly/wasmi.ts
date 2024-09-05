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
