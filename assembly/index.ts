import { env } from "./env";
import { u128 } from "as-bignum/assembly";
export function __execute(): i32 {
  env.keyword("/test").keyword("/other").set(new ArrayBuffer(0x02));
  return env.returndata(new ArrayBuffer(0));
}
