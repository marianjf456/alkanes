extern crate alloc;
use bitcoin::blockdata::block::Block;
use bitcoin::consensus::Decodable;
use bitcoin::hashes::Hash;
use std::collections::HashMap;
use std::fmt::Write;
use std::panic;
use std::sync::Arc;

#[no_mangle]
pub extern "C" fn _start() -> () {}

#[no_mangle]
pub extern "C" fn _test() -> () {}
