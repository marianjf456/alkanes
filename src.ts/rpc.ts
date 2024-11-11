"use strict";

import * as protowallet from "./wallet";
import * as invoke from "./invoke";
import * as wallet from "metashrew-runes/lib/src.ts/wallet";
import {
  OutPoint,
  RuneOutput,
  decodeRunesResponse,
  encodeBlockHeightInput,
} from "metashrew-runes/lib/src.ts/outpoint";
import { MetashrewRunes } from "metashrew-runes/lib/src.ts/rpc";
import * as protobuf from "./proto/protorune";

import leb128 from "leb128";

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
          protocol: leb128.unsigned.encode(protocolTag),
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
    calldata,
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
      calldata,
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
}
