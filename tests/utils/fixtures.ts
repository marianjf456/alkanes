import { ProtoStone } from "protorune/lib/src.ts/protostone";
import { createProtoruneFixture } from "protorune/lib/tests/utils/fixtures";
import { constructProtostoneTx } from "protorune/lib/tests/utils/protoburn";

import { u128, u64, u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { RuneId } from "@magiceden-oss/runestone-lib/dist/src/runeid";

import * as btc from "@scure/btc-signer";
import * as psbt from "@scure/btc-signer/psbt";
import {
  constructRevealTxInput,
  CUSTOM_SCRIPTS,
} from "../../src.ts/inscriptions";
//@ts-ignore
import bitcoinjs = require("bitcoinjs-lib");

import { encodeRunestoneProtostone } from "protorune/lib/src.ts/runestone_protostone_upgrade";

import { hex } from "@scure/base";

const privKey1 = hex.decode(
  "0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a"
);
const pubKey1 = btc.utils.pubSchnorr(privKey1);

const privKey2 = hex.decode(
    "0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0b"
  );
const pubKey2 = btc.utils.pubSchnorr(privKey2);

/**
 * Returns the btc.Transaction transaction with a protoburn and a inscription envelope.
 * @param inputs
 * @param outputs
 * @param edicts
 * @param protostones
 * @param runeTransferPointer
 * @returns
 */
export const constructProtostoneTxWithInscription = (
  inputs: {
    inputTxHash: Buffer | undefined;
    inputTxOutputIndex: number;
  }[],
  inscriptionInput: psbt.TransactionInputUpdate,
  outputs: {
    address: Uint8Array;
    btcAmount: bigint;
  }[],
  edicts?: {
    id: {
      block: bigint;
      tx: number;
    };
    amount: bigint;
    output: number;
  }[],
  protostones?: ProtoStone[],
  runeTransferPointer?: number,
  // input: any
): string => {
  const tx = new btc.Transaction({ customScripts: CUSTOM_SCRIPTS, allowUnknownOutputs: true });
  // TODO: Test inputs that contain protorunes that also may be a part of the protomessage
  // removed for now because we can't find the utxo that creates this input
  // inputs.forEach((input, idx) => {
  //   tx.addInput({
  //     // txid: input.inputTxHash,
  //     // index: input.inputTxOutputIndex,
  //     nonWitnessUtxo: {
  //       version: 1,

  //       inputs: [],
  //       outputs: [{
  //         amount: input.inputTxOutputIndex,
  //         script: Uint8Array.from([0])
  //       }],
  //       lockTime: 0
  //     }
  //   });
  //   tx.signIdx(privKey1, idx)
  // });
  tx.addInput(inscriptionInput);

  outputs.forEach((output) => {
    tx.addOutput({
      script: btc.p2tr(output.address).script,
      amount: output.btcAmount,
    });
  });

  const runestone = encodeRunestoneProtostone({
    edicts: edicts,
    pointer: runeTransferPointer, // default output for leftover runes, default goes to the protoburn
    protostones: protostones,
  }).encodedRunestone;

  tx.addOutput({
    script: runestone,
    amount: 0n,
  });

  tx.sign(privKey1)
  tx.finalize()

  return tx.hex;
};

export async function createAlkaneFixture({
  protocolTag,
  protomessagePointer,
  protomessageRefundPointer,
  programWasm,
  calldata,
  amount,
}: {
  protocolTag: bigint;
  protomessagePointer: number;
  protomessageRefundPointer: number;
  programWasm: Uint8Array;
  calldata: Buffer;
  amount?: bigint;
}) {
  let {
    input,
    block,
    output,
    refundOutput,
    runeId,
    pointerToReceiveRunes,
    premineAmount,
  } =
    // this fixture always assumes a protoburn and default values
    await createProtoruneFixture(protocolTag);

  if (typeof amount === "undefined") {
    amount = premineAmount;
  }

  const inputs = [
    {
      inputTxHash: block.transactions?.at(2)?.getHash(), //protoburn is at tx2
      inputTxOutputIndex: pointerToReceiveRunes,
    },
  ];
//   const outputs = [output, refundOutput].map((v) => {
//     const {hash, version} = bitcoinjs.address.fromBase58Check(v.address)
//     return {
//       address: new Uint8Array([version, ...hash]),
//       btcAmount: BigInt(v.btcAmount),
//     };
//   });
  const outputs = [
    {
        address: pubKey1,
        btcAmount: 1n
    },
    {
        address: pubKey2,
        btcAmount: 1n
    },
  ]

  const edicts = [];
  const protostones = [
    ProtoStone.edicts({
      protocolTag: protocolTag,
      edicts: [
        {
          amount: u128(amount),
          id: new RuneId(u64(runeId.block), u32(runeId.tx)),
          output: u32(5),
        },
      ],
    }),
    ProtoStone.message({
      protocolTag: protocolTag,
      pointer: protomessagePointer,
      refundPointer: protomessageRefundPointer,
      calldata,
    }),
  ];
  // leftover protorunes go to output2, which is ADDRESS 1
  const runeTransferPointer = 2;

  // constructing tx 3: protomessage
  // right now, address 2 has all the protorunes

  // construct the transaction with the protoburn and inscription envelope
  // TODO: Change pubKey and privKey
  const revealTxInput = constructRevealTxInput(programWasm, pubKey1, privKey1);
  const inscriptionProtoburnHex = constructProtostoneTxWithInscription(
    inputs,
    revealTxInput,
    outputs,
    edicts,
    protostones,
    runeTransferPointer,
    // input
  );
  block.transactions?.push(
    bitcoinjs.Transaction.fromHex(inscriptionProtoburnHex)
  );

  return { block, runeId, amount };
}
