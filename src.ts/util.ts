import { u128 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { Tag } from "protorune/src.ts/tag";

export function encodeToCalldata(data: Buffer[]): Buffer {
  const nums = data.map((buf) => {
    return u128(BigInt(`0x${buf.toString("hex")}`));
  });
  return Tag.encodeU128(nums);
}
