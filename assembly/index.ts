import { env } from "./env";
import { u128 } from "as-bignum/assembly";
export function __execute(): i32 {
  return env.returndata(new ArrayBuffer(0));
}
