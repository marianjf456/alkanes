import { env } from "./env";
import { u128 } from "as-bignum/assembly";
import { StoragePointer } from "./StoragePointer";
export function __execute(): i32 {
  env.pointer("test").set(new ArrayBuffer(0x02));
  return env.returndata(new ArrayBuffer(0));
}
