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
