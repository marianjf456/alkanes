import { ProtoStone } from "protorune/lib/src.ts/protostone";
import { encodeRunestoneProtostone } from "protorune/lib/src.ts/runestone_protostone_upgrade";

export async function burn(
  runeid: { block: bigint; tx: number },
  amount: bigint,
  protocolTag: bigint,
) {
  return encodeRunestoneProtostone({
    edicts: [
      {
        amount,
        id: runeid,
        //target self
        output: 0,
      },
    ],
    protostones: [ProtoStone.burn({ pointer: 1, protocolTag })],
  });
}
