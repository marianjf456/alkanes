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
const bip32 = BIP32Factory(ecc);
bitcoin.initEccLib(ecc);
const TEST_MULTISIG =
  "bcrt1pys2f8u8yx7nu08txn9kzrstrmlmpvfprdazz9se5qr5rgtuz8htsaz3chd";
function getMultisigScriptPubkey(): string {
  const scriptPubkey = bitcoin.address.toOutputScript(TEST_MULTISIG, bitcoin.networks.regtest);
  return hex.encode(scriptPubkey);
}

console.log("Multisig scriptPubkey:", getMultisigScriptPubkey());
