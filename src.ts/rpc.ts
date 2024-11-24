"use strict";

import * as protowallet from "./wallet";
import * as invoke from "./invoke";
import * as wallet from "metashrew-runes/lib/src.ts/wallet";
import {
  OutPoint,
  RuneOutput,
  decodeRunesResponse,
  encodeBlockHeightInput
} from "./outpoint";
import { MetashrewRunes } from "metashrew-runes/lib/src.ts/rpc";
import * as protobuf from "./proto/protorune";
import {
  RunestoneProtostoneUpgrade,
  encodeRunestoneProtostone,
} from "./protorune/proto_runestone_upgrade";
import { Edict } from "@magiceden-oss/runestone-lib/dist/src/edict.js";
import { AlkaneTransfer } from "./alkane";
import { Rune } from "@magiceden-oss/runestone-lib/dist/src/rune.js";
import { u64, u32, u128 } from '@magiceden-oss/runestone-lib/dist/src/integer';
import { ProtoruneEdict } from "./protorune/protoruneedict";
import { ProtoruneRuneId } from "./protorune/protoruneruneid";

import { Psbt } from "bitcoinjs-lib";
import { ProtoStone } from "./protorune/protostone";
import { toUint128, toBuffer, leftPadByte } from "./bytes";

const addHexPrefix = (s) => (s.substr(0, 2) === "0x" ? s : "0x" + s);

let id = 0;

export class AlkanesRpc extends MetashrewRunes {
  async protorunesbyaddress({ address, protocolTag }: any): Promise<{
    outpoints: OutPoint[];
    balanceSheet: RuneOutput[];
  }> {
    const buffer = protowallet.encodeProtorunesWalletInput(
      address,
      protocolTag
    );
    const byteString = await this._call({
      method: "protorunesbyaddress",
      input: buffer,
    });
    const decoded = wallet.decodeWalletOutput(byteString);
    return decoded;
  }

  async runesbyaddress({ address }: any): Promise<{
    outpoints: OutPoint[];
    balanceSheet: RuneOutput[];
  }> {
    const buffer = wallet.encodeWalletInput(address);
    const byteString = await this._call({
      method: "runesbyaddress",
      input: buffer,
    });
    const decoded = wallet.decodeWalletOutput(byteString);
    return decoded;
  }

  async runesbyheight({ height }: { height: number }) {
    const payload = encodeBlockHeightInput(height);
    const response = await this._call({
      method: "runesbyheight",
      input: payload,
    });
    const decodedResponse = decodeRunesResponse(response);
    return decodedResponse;
  }

  async protorunesbyoutpoint({ txid, vout, protocolTag }: any): Promise<any> {
    const buffer =
      "0x" +
      Buffer.from(
        protobuf.OutpointWithProtocol.toBinary({
          protocol: toUint128(protocolTag),
          txid: Buffer.from(txid, "hex"),
          vout,
        })
      ).toString("hex");
    return protobuf.OutpointResponse.fromBinary(
      Buffer.from(
        (
          await this._call({
            method: "protorunesbyoutpoint",
            input: buffer,
          })
        ).substr(2),
        "hex"
      )
    );
  }

  async simulate({
    alkanes,
    transaction,
    height,
    block,
    inputs,
    tx,
    txindex,
    vout,
    pointer,
    refundPointer,
  }: any): Promise<any> {
    const buffer = invoke.encodeSimulateRequest({
      alkanes,
      transaction,
      block,
      height,
      tx,
      inputs,
      txindex,
      vout,
      pointer,
      refundPointer,
    });
    const byteString = await this._call({
      method: "simulate",
      input: buffer,
    });
    const decoded = invoke.decodeSimulateRequest(byteString);
    return decoded;
  }
  async runtime({ protocolTag }: any): Promise<{
    balances: RuneOutput[];
  }> {
    const buffer = protowallet.encodeRuntimeInput(protocolTag);
    const byteString = await this._call({
      method: "protorunesbyaddress",
      input: buffer,
    });
    const decoded = protowallet.decodeRuntimeOutput(byteString);
    return decoded;
  }

  async pack({
    runes,
    cellpack,
    pointer,
    refundPointer,
    edicts,
  }: {
    runes: AlkaneTransfer[];
    cellpack: Buffer;
    pointer: number;
    refundPointer: number;
    edicts: Edict[];
  }): Promise<any> {
    const protostone = new ProtoStone({
      message: {
        calldata: cellpack,
        pointer,
        refundPointer,
      },
      protocolTag: BigInt(1),
      edicts,
    });
    return encodeRunestoneProtostone({
      edicts: runes.map((r) => ({ id: new ProtoruneRuneId(u128(r.id.block), u128(r.id.tx)), output: u32(2), amount: u128(r.value) })),
      pointer: 3,
      protostones: [protostone],
    }).encodedRunestone;
  }
}
