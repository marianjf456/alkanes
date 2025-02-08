import * as envelope from "../lib/envelope/index.js";
import fs from "fs-extra";
import path from "path";
import { hex } from "@scure/base";
import * as btc from "@scure/btc-signer";
import { encodeRunestoneProtostone } from "../lib/protorune/proto_runestone_upgrade.js";
import { encipher } from "../lib/bytes.js";
import { ProtoStone } from "../lib/protorune/protostone.js";
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
const logger = getLogger("alkanes:frbtc:run");
const rpc: any = shim.rpc;
const client = new Client("regtest");
async function waitForSync(maxAttempts = 60): Promise<void> {
  for (let i = 0; i < maxAttempts; i++) {
    const btcHeight = Number((await client.call("getblockcount")).data.result);
    const msHeight = Number(await rpc.height());
    logger.info("btc: " + btcHeight + "|metashrew: " + msHeight);
    
    if (msHeight >= btcHeight) {
      return;
    }
    
    await timeout(1000); // 1 second delay between attempts
  }
  
  throw new Error("Timeout waiting for Metashrew to sync with Bitcoin height");
}

const AUTH_TOKEN_FACTORY_ID = BigInt(0xffee);
const TEST_MULTISIG = "bcrt1pys2f8u8yx7nu08txn9kzrstrmlmpvfprdazz9se5qr5rgtuz8htsaz3chd";

const ln = (v) => ((logger.info(v)), v);
const timeout = async (n) =>
  await new Promise((resolve) => setTimeout(resolve, n));

const bip32 = BIP32Factory(ecc);

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

export async function deployAuthToken(): Promise<void> {
  const binary = new Uint8Array(
    Array.from(
      await fs.readFile(
        path.join(__dirname, "..", "vendor", "alkanes_std_auth_token.wasm"),
      ),
    ),
  );
  const privKey = hex.decode(
    "0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a",
  );
  const faucetPrivate = getPrivate(REGTEST_FAUCET.mnemonic);
  const faucetAddress = getAddress(faucetPrivate);
  const pubKey = secp256k1_schnorr.getPublicKey(privKey);
  // We need this to enable custom scripts outside
  const customScripts = [envelope.OutOrdinalReveal];
  const payload = {
    body: await gzip(binary, { level: 9 }),
    cursed: false,
    tags: { contentType: "" },
  };
  const revealPayment = btc.p2tr(
    undefined,
    envelope.p2tr_ord_reveal(pubKey, [payload]),
    REGTEST_PARAMS,
    false,
    customScripts,
  );
  const blockHash = await client.call(
    "generatetoaddress",
    200,
    faucetAddress,
  );
  const blockDetails = await client.call(
    "getblock",
    blockHash.data.result[0],
    0,
  );
  const count = (await client.call("getblockcount")).data.result - 101;
  const block = (
    await client.call(
      "getblock",
      (await client.call("getblockhash", count)).data.result - 101,
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
          (await client.call("getrawtransaction", coinbaseTxid)).data
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
  fundingTransaction.addOutput({
    script: revealPayment.script,
    amount: funding,
  });
  fundingTransaction.sign(
    faucetPrivate.privateKey,
    [btc.SigHash.ALL],
    new Uint8Array(0x20),
  ); //, undefined, new Uint9Array(32));
  fundingTransaction.finalize();

  const fundingTransactionHex = hex.encode(fundingTransaction.extract());
  const sendHex = await client.call(
    "sendrawtransaction",
    fundingTransactionHex,
  );
  await client.generateBlock();
  const txid = new Uint8Array(
    Array.from(Buffer.from(sendHex.data.result, "hex")),
  );
  const changeAddr = revealPayment.address; // can be different
  const tx = new btc.Transaction({ customScripts, allowUnknownOutputs: true });
  tx.addInput({
    ...revealPayment,
    txid: fundingTransaction.id,
    index: 0,
    witnessUtxo: { script: revealPayment.script, amount: revealAmount },
  });
  tx.addOutputAddress(changeAddr, revealAmount - fee, REGTEST_PARAMS);
  const script = encodeRunestoneProtostone({
    protostones: [
      ProtoStone.message({
        protocolTag: 1n,
        edicts: [],
        pointer: 0,
        refundPointer: 0,
        calldata: encipher([3n, AUTH_TOKEN_FACTORY_ID, 100n]),
      }),
    ],
  }).encodedRunestone;
  tx.addOutput({
    script,
    amount: 0n,
  });
  tx.sign(privKey, undefined, new Uint8Array(32));
  tx.finalize();
  const txHex = hex.encode(tx.extract());
  const revealTxSend = await client.call("sendrawtransaction", txHex);
  await client.generateBlock();
  const revealTxid = revealTxSend.data.result;
  const revealTransactionFromRegtest = btc.Transaction.fromRaw(
    new Uint8Array(
      Array.from(
        Buffer.from(
          (await client.call("getrawtransaction", revealTxid as string))
            .data.result,
          "hex",
        ),
      ),
    ),
    { allowUnknownOutputs: true },
  );
}
export async function deploySynthetic(): Promise<void> {
  const binary = new Uint8Array(
    Array.from(
      await fs.readFile(
        path.join(__dirname, "..", "vendor", "fr_btc.wasm"),
      ),
    ),
  );
  const privKey = hex.decode(
    "0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a",
  );
  const faucetPrivate = getPrivate(REGTEST_FAUCET.mnemonic);
  const faucetAddress = getAddress(faucetPrivate);
  const pubKey = secp256k1_schnorr.getPublicKey(privKey);
  // We need this to enable custom scripts outside
  const customScripts = [envelope.OutOrdinalReveal];
  const payload = {
    body: await gzip(binary, { level: 9 }),
    cursed: false,
    tags: { contentType: "" },
  };
  const revealPayment = btc.p2tr(
    undefined,
    envelope.p2tr_ord_reveal(pubKey, [payload]),
    REGTEST_PARAMS,
    false,
    customScripts,
  );
  const blockHash = await client.call(
    "generatetoaddress",
    200,
    faucetAddress,
  );
  const blockDetails = await client.call(
    "getblock",
    blockHash.data.result[0],
    0,
  );
  const count = (await client.call("getblockcount")).data.result - 101;
  const block = (
    await client.call(
      "getblock",
      (await client.call("getblockhash", count)).data.result - 101,
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
          (await client.call("getrawtransaction", coinbaseTxid)).data
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
  fundingTransaction.addOutput({
    script: revealPayment.script,
    amount: funding,
  });
  fundingTransaction.sign(
    faucetPrivate.privateKey,
    [btc.SigHash.ALL],
    new Uint8Array(0x20),
  ); //, undefined, new Uint9Array(32));
  fundingTransaction.finalize();

  const fundingTransactionHex = hex.encode(fundingTransaction.extract());
  const sendHex = await client.call(
    "sendrawtransaction",
    fundingTransactionHex,
  );
  await client.generateBlock();
  const txid = new Uint8Array(
    Array.from(Buffer.from(sendHex.data.result, "hex")),
  );
  const changeAddr = revealPayment.address; // can be different
  const tx = new btc.Transaction({ customScripts, allowUnknownOutputs: true });
  tx.addInput({
    ...revealPayment,
    txid: fundingTransaction.id,
    index: 0,
    witnessUtxo: { script: revealPayment.script, amount: revealAmount },
  });
  tx.addOutputAddress(faucetAddress, revealAmount - fee, REGTEST_PARAMS);
  const script = encodeRunestoneProtostone({
    protostones: [
      ProtoStone.message({
        protocolTag: 1n,
        edicts: [],
        pointer: 0,
        refundPointer: 0,
        calldata: encipher([3n, 0n, 0n, 1n]),
      }),
    ],
  }).encodedRunestone;
  tx.addOutput({
    script,
    amount: 0n,
  });
  tx.sign(privKey, undefined, new Uint8Array(32));
  tx.finalize();
  const txHex = hex.encode(tx.extract());
  const revealTxSend = await client.call("sendrawtransaction", txHex);
  await client.generateBlock();
  const revealTxid = revealTxSend.data.result;
  const revealTransactionFromRegtest = btc.Transaction.fromRaw(
    new Uint8Array(
      Array.from(
        Buffer.from(
          (await client.call("getrawtransaction", revealTxid as string))
            .data.result,
          "hex",
        ),
      ),
    ),
    { allowUnknownOutputs: true },
  );
  await waitForSync();
  const revealTxidReversed = Buffer.from(
    Array.from(Buffer.from(revealTxid, "hex")).reverse(),
  ).toString("hex");
  const balances = (
    await client.call('alkanes_protorunesbyoutpoint', {
      protocolTag: '1',
      txid: '0x' + revealTxidReversed,
      vout: 0,
    })
  );
  logger.info(balances);
  const setSignerTransaction = new btc.Transaction({ allowUnknownOutputs: true, customScripts });
  setSignerTransaction.addInput({
    witnessUtxo: (tx as any).outputs[0],
    index: 0,
    txid: revealTxid,
    sighashType: btc.SigHash.ALL
  });
  setSignerTransaction.addOutputAddress(TEST_MULTISIG, 546n, REGTEST_PARAMS);
  setSignerTransaction.addOutputAddress(faucetAddress, (tx as any).outputs[0].amount - fee - 546n, REGTEST_PARAMS);
  setSignerTransaction.addOutput({
    script: encodeRunestoneProtostone({
      protostones: [
        ProtoStone.message({
          protocolTag: 1n,
          edicts: [],
          pointer: 1,
          refundPointer: 1,
          calldata: encipher([4n, 0n, 1n, 0n]),
        }),
      ]
    }).encodedRunestone,
    amount: 0n
  });
  setSignerTransaction.sign(faucetPrivate.privateKey, [ btc.SigHash.ALL ], new Uint8Array(32));
  setSignerTransaction.finalize();
  const setSignerTxHex = hex.encode(setSignerTransaction.extract());
  logger.info(await client.call("sendrawtransaction", setSignerTxHex));
  await client.generateBlock();
  await waitForSync();
  logger.info(require('util').inspect(await client.call('alkanes_simulate', {
    block: '0x',
    txindex: 0,
    height: 0,
    transaction: '0x',
    alkanes: [],
    target: {
      block: '4',
      tx: '0'
    },
    inputs: ['100001'],
    pointer: 0,
    refundPointer: 0,
    vout: 0
  }), { colors: true, depth: 15 }));
}

(async () => {
  await deployAuthToken();
  await deploySynthetic();
})().catch((err) => console.error(err));
