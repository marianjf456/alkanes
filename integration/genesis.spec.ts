import * as envelope from "../lib/esm/index.js";
import fs from "fs-extra";
import path from "path";
import { hex } from "@scure/base";
import * as btc from "@scure/btc-signer";
import { encodeRunestoneProtostone } from "../lib/esm/protorune/proto_runestone_upgrade.js";
import { encipher } from "../lib/esm/bytes.js";
import { ProtoStone } from "../lib/esm/protorune/protostone.js";
import crypto from "node:crypto";
import { schnorr as secp256k1_schnorr } from "@noble/curves/secp256k1";
import { TEST_NETWORK } from "@scure/btc-signer";
import { gzip as _gzip } from "node:zlib";
import { promisify } from "node:util";
import { Client } from "./lib/client";
import { REGTEST_FAUCET } from "./lib/constants";
import { BitcoinBlock } from "bitcoin-block";
import bip39 = require("bip39");
import BIP32Factory from "bip32";
import bitcoin = require("bitcoinjs-lib");
import * as ecc from "tiny-secp256k1";

const bip32 = BIP32Factory(ecc);

const client = new Client("regtest");

const gzip = promisify(_gzip);

const getAddress = async (node) => {
  return bitcoin.payments.p2wpkh({ pubkey: node.publicKey, network: bitcoin.networks.regtest }).address;
};

const getPrivate = (mnemonic) => {
  const seed = bip39.mnemonicToSeedSync(mnemonic);
  const root = bip32.fromSeed(seed, bitcoin.networks.regtest);
  return root.derivePath("m/84'/0'/0'/0/0");
};

export async function deployGenesis(): Promise<void> {
  const binary = new Uint8Array(Array.from(await fs.readFile(path.join(__dirname, '..', 'vendor', 'alkanes_std_genesis_alkane.wasm'))));
  const privKey = hex.decode('0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a');
  const faucetPrivate = getPrivate(REGTEST_FAUCET.mnemonic);
  const faucetAddress = getAddress(faucetPrivate);
  const pubKey = secp256k1_schnorr.getPublicKey(privKey);
    // We need this to enable custom scripts outside
  const customScripts = [envelope.OutOrdinalReveal];
  const payload = {
    body: await gzip(binary, { level: 9 }),
    cursed: false,
    tags: { contentType: 'application/octet-stream' }
  };
  const revealPayment = btc.p2tr(
    undefined,
    envelope.p2tr_ord_reveal(pubKey, [payload]),
    TEST_NETWORK,
    false,
    customScripts
  );
  await client.call('generatetoaddress', 1, faucetAddress);
  const count = (await client.call('getblockcount')).data.result;
  const block = (await client.call('getblock', (await client.call('getblockhash', count)).data.result, 0 )).data.result;
  const fee = 500n;
  const decoded = BitcoinBlock.decode(Buffer.from(block, 'hex'));
  const coinbase = decoded.tx[0];
  const fundingTransaction = new btc.Transaction();
  fundingTransaction.addInput({
    txid: coinbase.txid,
    index: 0
  });
  const funding = BigInt(coinbase.vout[0].value) - fee;
  fundingTransaction.addOutput({
    script: revealPayment.script,
    amount: funding
  });
  console.log(fundingTransaction);
  fundingTransaction.sign(faucetPrivate.privateKey, [0])//, undefined, new Uint9Array(32));
  const fundingTransactionHex = hex.encode(fundingTransaction.extract());
  const txid = await client.call('sendrawtransaction', fundingTransactionHex);
  console.log(txid);
  process.exit(0);
  const changeAddr = revealPayment.address; // can be different
  const revealAmount = 2000n;
  const tx = new btc.Transaction({ customScripts, allowUnknownOutputs: true });
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
    amount: 0n
  });
  tx.sign(privKey, undefined, new Uint8Array(32));
  tx.finalize();
  const txHex = hex.encode(tx.extract());
  console.log(await client.call('sendrawtransaction', txHex));
}

(async () => {
  await deployGenesis();
})().catch((err) => console.error(err));
