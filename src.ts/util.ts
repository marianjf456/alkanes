import { encodeRunestoneProtostone } from "protorune/lib/src.ts/runestone_protostone_upgrade.js";
import { ProtoStone } from "protorune/lib/src.ts/protostone.js";
import * as bitcoin from "bitcoinjs-lib";

export const STUB = "";

export const assembleTx = ({
  feeUtxos,
  toAddress,
  network,
  amount,
}: {
  feeUtxos;
  toAddress: string;
  network: bitcoin.Network;
  amount: number;
}) => {
  let tx = new bitcoin.Psbt({ network });
  const script = createRuneEtchScript({
    runeName,
    perMintAmount: amount,
    divisibility,
    pointer: 1,
  });
  const output = { script: script, value: 0 };
  tx.addOutput(output);
};

export const createRuneEtchScript = ({
  pointer = 0,
  runeName,
  symbol,
  divisibility,
  perMintAmount,
  premine = 0,
  cap,
  turbo,
}: {
  pointer?: number;
  runeName: string;
  symbol: string;
  divisibility?: number;
  perMintAmount: number;
  cap?: number;
  premine?: number;
  turbo?: boolean;
}) => {
  const runeEtch = encodeRunestoneProtostone({
    etching: {
      divisibility,
      premine: BigInt(premine),
      runeName,
      symbol,
      terms: {
        cap: cap && BigInt(cap),
        amount: perMintAmount && BigInt(perMintAmount),
      },
      turbo,
    },
    pointer,
    protostones: [
      {
        protocolTag: 64n,
        burn: {
          pointer: 1,
        },
      },
    ].map((v) => new ProtoStone(v)),
  }).encodedRunestone;
  return runeEtch;
};
