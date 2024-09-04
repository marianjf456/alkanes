extern crate alloc;
use bitcoin::blockdata::block::Block;
use bitcoin::consensus::Decodable;
use bitcoin::hashes::Hash;
use core::ffi;
use core::ffi::CStr;
use std::collections::HashMap;
use std::fmt::Write;
use std::mem;
use std::os::raw::c_char;
use std::panic;
use std::sync::{Arc, Mutex};
use anyhow::{Result, anyhow};
use wasmi;

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
    context: *mut core::ffi::c_void,
}

#[no_mangle]
pub extern "C" fn __wasmi_store_new(
    engine: *mut wasmi::Engine,
    context: *mut core::ffi::c_void,
    memory_limit: usize,
    fuel_limit: u64,
) -> *mut wasmi::Store<State> {
    let mut store = wasmi::Store::<State>::new(
        unsafe { &*engine },
        State {
            context,
            limiter: wasmi::StoreLimitsBuilder::new()
                .memory_size(memory_limit)
                .build(),
        },
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

#[no_mangle]
pub extern "C" fn __wasmi_module_new(
    engine: *mut wasmi::Engine,
    program: *const u8,
    sz: usize,
) -> *mut wasmi::Module {
    Box::leak(Box::new(
        wasmi::Module::new(unsafe { &*engine }, unsafe {
            std::slice::from_raw_parts::<'static, u8>(program, sz)
        })
        .unwrap(),
    )) as *mut wasmi::Module
}

#[no_mangle]
pub extern "C" fn __wasmi_linker_new(engine: *mut wasmi::Engine) -> *mut wasmi::Linker<State> {
    Box::leak(Box::new(wasmi::Linker::new(unsafe { &*engine }))) as *mut wasmi::Linker<State>
}

#[no_mangle]
pub extern "C" fn __wasmi_func_wrap(
    _linker: *mut wasmi::Linker<State>,
    module: *const c_char,
    func: *const c_char,
    handler: unsafe extern "C" fn(caller: *mut wasmi::Caller<'static, State>, v: i32) -> i32,
) -> () {
    let linker: &'static mut wasmi::Linker<State> = unsafe { &mut *_linker };
    let raw_fn_ptr: usize = unsafe {
        std::mem::transmute::<
            unsafe extern "C" fn(caller: *mut wasmi::Caller<'static, State>, v: i32) -> i32,
            usize,
        >(handler)
    };
    linker
        .func_wrap(
            unsafe { CStr::from_ptr(module).to_str().unwrap() },
            unsafe { CStr::from_ptr(func).to_str().unwrap() },
            move |mut caller: wasmi::Caller<'_, State>, v: i32| -> i32 {
                unsafe {
                    std::mem::transmute::<
                        usize,
                        unsafe extern "C" fn(
                            caller: *mut wasmi::Caller<'static, State>,
                            v: i32,
                        ) -> i32,
                    >(raw_fn_ptr)(
                        std::mem::transmute::<
                            *mut wasmi::Caller<'_, State>,
                            *mut wasmi::Caller<'static, State>,
                        >((&mut caller) as *mut wasmi::Caller<'_, State>),
                        v,
                    )
                }
            },
        )
        .unwrap();
}

#[no_mangle]
pub extern "C" fn __wasmi_linker_instantiate(
  linker: *mut wasmi::Linker<State>,
  store: *mut wasmi::Store<State>,
  module: *mut wasmi::Module
) -> *mut wasmi::Instance {
  Box::leak(Box::new(unsafe { (&mut *linker).instantiate(&mut *store, &*module).unwrap().ensure_no_start(&mut *store).unwrap()  })) as *mut wasmi::Instance
}

#[no_mangle]
pub extern "C" fn __wasmi_store_get_fuel(store: *mut wasmi::Store<State>) -> i32 {
  unsafe { (&*store).get_fuel().unwrap() as i32 }
}

#[no_mangle]
pub extern "C" fn __wasmi_store_set_fuel(store: *mut wasmi::Store<State>, fuel: i32) -> () {
  wasmi::Store::set_fuel(unsafe { &mut *store }, fuel as u64);
}

fn wasmi_instance_call(instance: *mut wasmi::Instance, store: *mut wasmi::Store<State>, name: *const c_char, args: *const i32, len: i32, result: *mut i32) -> Result<()> {
  let str_name = CStr::from_ptr(name).to_str()?;
  let func = (&mut *instance).get_func(&mut *store, str_name).ok_or("").map_err(|_| anyhow!(format!("call to {} failed"), str_name))?;
  let args: &[wasmi::Val] = unsafe { std::slice::from_raw_parts<'static, i32>(args, len as usize).into_iter().map(|v| wasmi::Val::I32(v)) };
  let result_buffer = [wasmi::Val::I32(0)];
  func.call(&mut *store, args, &mut result_buffer)?;
  unsafe { *result = result_buffer[0].i32().ok_or("").map_err(|_| anyhow!("result was not an i32"))?; }
  Ok(())
}

#[no_mangle]
pub extern "C" fn __wasmi_instance_call(instance: *mut wasmi::Instance, store: *mut wasmi::Store<State>, name: *const c_char, args: *const i32, len: i32, result: *mut i32) -> i32 {
  match wasmi_instance_call(instance, store, name, args, len, result) {
    Ok(_) => 1,
    Err(_) => 0
  }
}
