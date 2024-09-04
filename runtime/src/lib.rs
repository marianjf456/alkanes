extern crate alloc;
use bitcoin::blockdata::block::Block;
use bitcoin::consensus::Decodable;
use bitcoin::hashes::Hash;
use std::collections::HashMap;
use std::fmt::Write;
use std::panic;
use std::sync::Arc;
use wasmi;
use core::ffi;
use core::ffi::{CStr};
use std::os::raw::{c_char};
use std::mem;

#[no_mangle]
pub extern "C" fn __wasmi_engine_new() -> *mut wasmi::Engine {
  let mut config = wasmi::Config::default();
  config.consume_fuel(true);
  Box::leak(Box::new(wasmi::Engine::new(&config))) as *mut wasmi::Engine
}

#[no_mangle]
pub extern "C" fn __wasmi_engine_free(ptr: *mut wasmi::Engine) -> () {
  unsafe {
    let _ = Box::from_raw(ptr);
  }
}

pub struct State {
  limiter: wasmi::StoreLimits,
  context: *mut core::ffi::c_void
}

#[no_mangle]
pub extern "C" fn __wasmi_store_new(engine: *mut wasmi::Engine, context: *mut core::ffi::c_void, memory_limit: usize, fuel_limit: u64) -> *mut wasmi::Store<State> {
  let mut store = wasmi::Store::<State>::new(
    unsafe { &*engine },
    State {
      context,
      limiter: wasmi::StoreLimitsBuilder::new().memory_size(memory_limit).build(),
    }
  );
  store.limiter(|state| &mut state.limiter);
  wasmi::Store::<State>::set_fuel(&mut store, fuel_limit).unwrap();
  Box::leak(Box::new(store)) as *mut wasmi::Store<State>
}

#[no_mangle]
pub extern "C" fn __wasmi_store_free(ptr: *mut wasmi::Store<State>) -> () {
  unsafe {
    let _ = Box::from_raw(ptr);
  }
}

pub extern "C" fn __wasmi_module_new(engine: *mut wasmi::Engine, program: *const u8, sz: usize) -> *mut wasmi::Module {
  Box::leak(Box::new(wasmi::Module::new(unsafe { &*engine }, unsafe { std::slice::from_raw_parts::<'static, u8>(program, sz) }).unwrap())) as *mut wasmi::Module
}

pub extern "C" fn __wasmi_linker_new(engine: *mut wasmi::Engine) -> *mut wasmi::Linker<State> {
  Box::leak(Box::new(wasmi::Linker::new(unsafe { &*engine }))) as *mut wasmi::Linker<State>
}



pub extern "C" fn __wasmi_func_wrap(_linker: *mut wasmi::Linker<State>, module: *const c_char, func: *const c_char, handler: unsafe extern "C" fn(caller: *mut wasmi::Caller<'static, State>, v: i32) -> i32) -> () {
  let linker: &'static mut wasmi::Linker<State> = unsafe {
    &mut *_linker
  };
  linker.func_wrap(unsafe { CStr::from_ptr(module).to_str().unwrap() }, unsafe { CStr::from_ptr(func).to_str().unwrap() }, move |mut caller: wasmi::Caller<'a, State>, v: i32| -> i32 {
    handler(unsafe { std::mem::transmute::<*mut wasmi::Caller<'a, State>, *mut wasmi::Caller<'static, State>>((&mut caller) as *mut wasmi::Caller<'a, State>) }, v)
  }).unwrap();
}
