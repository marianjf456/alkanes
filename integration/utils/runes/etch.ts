import { encodeRunestoneProtostone } from "protorune/lib/src.ts/runestone_protostone_upgrade";

export async function etch() {
  return encodeRunestoneProtostone({
    etching: {
      runeName: "TESTTESTTEST",
      premine: BigInt(200.0),
      symbol: "T",
    },
    pointer: 0,
  });
}
