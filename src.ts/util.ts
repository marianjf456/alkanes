import { u128 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { Tag } from "protorune/src.ts/tag";

export function encodeToCalldata(data: Buffer[]): u128[] {
  const nums = data.map((buf) => {
    return u128(BigInt(`0x${buf.toString("hex")}`));
  });
  // const t = Uint8Array.from(nums);
  console.log("encoded calldata", nums);

  return nums;
}
