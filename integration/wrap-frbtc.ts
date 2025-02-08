import * as envelope from "alkanes/lib/index.js";
import fs from "fs-extra";
import path from "path";
import { hex } from "@scure/base";
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
import { REGTEST_PARAMS } from "./lib/constants";
import { gzip as _gzip } from "node:zlib";
import { promisify } from "node:util";
import { Client } from "./lib/client";
import { REGTEST_FAUCET } from "./lib/constants";
import { BitcoinBlock } from "bitcoin-block";
import bip39 = require("bip39");
import BIP32Factory from "bip32";
import bitcoin = require("bitcoinjs-lib");
import * as ecc from "tiny-secp256k1";
import * as shim from "./lib/shim";
import { getLogger } from "./lib/logger";

const rpc: any = shim.rpc;
const logger = getLogger("alkanes:wrap-frbtc");
async function waitForSync(maxAttempts = 60): Promise<void> {
  for (let i = 0; i < maxAttempts; i++) {
    const btcHeight = Number((await client.call("getblockcount")).data.result);
    const msHeight = Number(await rpc.height());
    logger.info("btc: " + btcHeight + "|metashrew: " + msHeight);
    
    if (msHeight >= btcHeight) {
      return;
    }
    
    await timeout(1000);
  }
  
  throw new Error("Timeout waiting for Metashrew to sync with Bitcoin height");
}
const AUTH_TOKEN_FACTORY_ID = BigInt(0xffee);
const TEST_MULTISIG = "bcrt1pys2f8u8yx7nu08txn9kzrstrmlmpvfprdazz9se5qr5rgtuz8htsaz3chd";

const ln = (v) => ((console.log(v)), v);
const timeout = async (n) =>
  await new Promise((resolve) => setTimeout(resolve, n));

const bip32 = BIP32Factory(ecc);

const client = new Client("regtest");

const gzip = promisify(_gzip);

const getAddress = (node) => {
  return bitcoin.payments.p2wpkh({
    pubkey: node.publicKey,
    network: bitcoin.networks.regtest,
  }).address;
};

const getPrivate = (mnemonic) => {
  const seed = bip39.mnemonicToSeedSync(mnemonic);
  const root = bip32.fromSeed(seed, bitcoin.networks.regtest);
  return root.derivePath("m/84'/0'/0'/0/0");
};

export async function wrapBTC() {
  const faucetPrivate = getPrivate(REGTEST_FAUCET.mnemonic);
  const faucetAddress = getAddress(faucetPrivate);
  // We need this to enable custom scripts outside
  const customScripts = [envelope.OutOrdinalReveal];
  const blockHash = await client.call(
    "btc_generatetoaddress",
    200,
    faucetAddress,
  );
  const blockDetails = await client.call(
    "btc_getblock",
    blockHash.data.result[0],
    0,
  );
  const count = (await client.call("btc_getblockcount")).data.result - 101;
  const block = (
    await client.call(
      "btc_getblock",
      (await client.call("btc_getblockhash", count)).data.result - 101,
      0,
    )
  ).data.result;
  const fee = 30000n;
  const decoded = BitcoinBlock.decode(
    Buffer.from(blockDetails.data.result, "hex"),
  );
  const coinbase = decoded.tx[0];
  const fundingTransaction = new btc.Transaction({
    allowLegacyWitnessUtxo: true,
    allowUnknownOutputs: true,
  });
  const coinbaseTxid = Buffer.from(
    Array.from(Buffer.from(coinbase.txid)).reverse(),
  ).toString("hex");
  const coinbaseTransaction = btc.Transaction.fromRaw(
    new Uint8Array(
      Array.from(
        Buffer.from(
          (await client.call("btc_getrawtransaction", coinbaseTxid)).data
            .result,
          "hex",
        ),
      ),
    ),
    { allowUnknownOutputs: true },
  );
  fundingTransaction.addInput({
    witnessUtxo: (coinbaseTransaction as any).outputs[0],
    txid: coinbaseTransaction.id,
    sighashType: btc.SigHash.ALL,
    index: 0,
  });
  let revealAmount = (coinbaseTransaction as any).outputs[0].amount - fee;
  const funding = revealAmount;
  fundingTransaction.addOutputAddress(TEST_MULTISIG, funding - 546n*3n, REGTEST_PARAMS);
  fundingTransaction.addOutputAddress(faucetAddress, 546n*3n, REGTEST_PARAMS);
  const script = encodeRunestoneProtostone({
    protostones: [
      ProtoStone.message({
        protocolTag: 1n,
        edicts: [],
        pointer: 1,
        refundPointer: 1,
        calldata: encipher([4n, 0n, 77n]),
      }),
    ],
  }).encodedRunestone;
  fundingTransaction.addOutput({
    script,
    amount: 0n,
  });
  fundingTransaction.sign(faucetPrivate.privateKey, [ btc.SigHash.ALL],  new Uint8Array(0x20));
  fundingTransaction.finalize();
  const fundingTransactionHex = hex.encode(fundingTransaction.extract());
  const sendHex = await client.call(
    "btc_sendrawtransaction",
    fundingTransactionHex,
  );
  await client.generateBlock();
  const txid = new Uint8Array(
    Array.from(Buffer.from(sendHex.data.result, "hex")),
  );
  const txidReversed = Buffer.from(
    Array.from(Buffer.from(txid, "hex")).reverse(),
  ).toString("hex");
  await timeout(30000);
  const balances = (
    (await client.call('alkanes_protorunesbyaddress', {
      protocolTag: '1',
      address: faucetAddress
    })).data.result
  ).outpoints.filter((v) => v.runes.length > 0);
  console.log(require('util').inspect(balances, { colors: true, depth: 15 }));
  const unwrapTransaction = new btc.Transaction({
    allowLegacyWitnessUtxo: true,
    allowUnknownOutputs: true,
  });

  unwrapTransaction.addInput({
    witnessUtxo: (fundingTransaction as any).outputs[1],
    txid: fundingTransaction.id,
    sighashType: btc.SigHash.ALL,
    index: 1,
  });
  unwrapTransaction.addOutputAddress(faucetAddress, 546n, REGTEST_PARAMS);
  unwrapTransaction.addOutputAddress(TEST_MULTISIG, 546n, REGTEST_PARAMS);
  const unwrapScript = encodeRunestoneProtostone({
    protostones: [
      ProtoStone.message({
        protocolTag: 1n,
        edicts: [],
        pointer: 0,
        refundPointer: 0,
        calldata: encipher([4n, 0n, 78n, 1n]),
      }),
    ],
  }).encodedRunestone;
  unwrapTransaction.addOutput({
    script: unwrapScript,
    amount: 0n,
  });
  unwrapTransaction.sign(faucetPrivate.privateKey, [ btc.SigHash.ALL],  new Uint8Array(0x20));
  unwrapTransaction.finalize();
  const unwrapTransactionHex = hex.encode(unwrapTransaction.extract());
  const sendHexUnwrap = await client.call(
    "btc_sendrawtransaction",
    unwrapTransactionHex,
  );
  await client.generateBlock();
}

(async () => {
  await wrapBTC();
})().catch((err) => console.error(err));
