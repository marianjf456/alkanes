extern crate alloc;
use bitcoin::blockdata::block::Block;
use bitcoin::consensus::Decodable;
use bitcoin::hashes::Hash;
use std::collections::HashMap;
use std::fmt::Write;
use std::panic;
use std::sync::Arc;

#[link(wasm_import_module = "env")]
extern "C" {
    fn __host_len() -> i32;
    fn __flush(ptr: i32);
    fn __get(ptr: i32, v: i32);
    fn __get_len(ptr: i32) -> i32;
    fn __load_input(ptr: i32);
}

#[no_mangle]
pub extern "C" fn _start() -> () {}

#[no_mangle]
pub extern "C" fn _test() -> () {}
