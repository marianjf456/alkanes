import * as envelope from "../../lib/esm/index.js";
import fs from "fs-extra";
import path from "path";
import { hex } from "@scure/base";
import * as btc from "@scure/btc-signer";
import { encodeRunestoneProtostone } from "../../lib/esm/protorune/proto_runestone_upgrade.js";
import { ProtoStone } from "../../lib/esm/protorune/protostone.js";
import crypto from "node:crypto";
import { schnorr as secp256k1_schnorr } from "@noble/curves/secp256k1";
import { TEST_NETWORK } from "@scure/btc-signer";

export async function deployGenesis(): Promise<void> {
  const binary = new Uint8Array(Array.from(await fs.readFile(path.join(__dirname, '..', '..', 'vendor', 'alkanes_std_genesis_alkane.wasm'))));
  const privKey = hex.decode('0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a');
  const pubKey = secp256k1_schnorr.getPublicKey(privKey);
    // We need this to enable custom scripts outside
  const customScripts = [envelope.OutOrdinalReveal];
  const payload = {
    body: binary
  };
  const revealPayment = btc.p2tr(
    undefined,
    envelope.p2tr_ord_reveal(pubKey, [payload]),
    TEST_NETWORK,
    false,
    customScripts
  );
  const changeAddr = revealPayment.address; // can be different
  const revealAmount = 2000n;
  const fee = 500n;
  const tx = new btc.Transaction({ customScripts });
  tx.addInput({
    ...revealPayment,
    txid: crypto.randomBytes(32).toString('hex'),
    index: 0,
    witnessUtxo: { script: revealPayment.script, amount: revealAmount }
  });
  tx.addOutputAddress(changeAddr, revealAmount - fee, TEST_NETWORK);
  tx.addOutput({
    script: encodeRunestoneProtostone({
      protostones: [ProtoStone.message({
        protocolTag: 1n,
	edicts: [],
	pointer: 1,
	refund_pointer: 1,
	message: encipher([1n, 0n, 0n])
      })]
    }).encodedRunestone,
    value: 0n
  });
  tx.sign(privKey, undefined, new Uint8Array(32));
  tx.finalize();
  const txHex = hex.encode(tx.extract());
  console.log(txHex);
}
