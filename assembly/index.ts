import { env } from "./env";
export function __execute(): i32 {
  return env.returndata();
}
