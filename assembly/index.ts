import { env } from "./env";
import { Box } from "metashrew-as/assembly/utils/box";

export function __execute(): i32 {
  console.log(Box.from(env.block).toHexString());

  return 0;
}
