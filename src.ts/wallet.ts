import { decodeRunes } from "./outpoint";
import {
  ProtorunesWalletRequest,
  WalletRequest,
  WalletResponse,
  RuntimeInput,
  Runtime,
  Outpoint,
} from "./proto/protorune";
import { decodeOutpointViewBase, OutPoint, RuneOutput } from "./outpoint";
import { stripHexPrefix } from "./utils";
import leb128 from "leb128";
import { toBuffer, toUint128 } from "./bytes";

/**
 * Encodes the protocolTag in LEB128 format
 * @param protocolTag
 * @returns the protocolTag in LEB128 format
 */
function encodeProtocolTag(protocolTag: bigint): { hi: bigint, lo: bigint } {
  return toUint128(protocolTag);
}

/**
 * Protocol tag needs to be LEB128 encoded to pass into the protocol
 * @param address
 * @param protocolTag
 * @returns ProtorunesWalletRequest protobuf hex buffer
 */
export function encodeProtorunesWalletInput(
  address: string,
  protocolTag: bigint
) {
  const input: ProtorunesWalletRequest = {
    wallet: Uint8Array.from(Buffer.from(address, "utf-8")),
    protocolTag: encodeProtocolTag(protocolTag),
  };
  return (
    "0x" + Buffer.from(ProtorunesWalletRequest.toBinary(input)).toString("hex")
  );
}

export function encodeWalletInput(
  address: string,
) {
  const input: WalletRequest = {
    wallet: Uint8Array.from(Buffer.from(address, "utf-8")),
  };
  return (
    "0x" + Buffer.from(WalletRequest.toBinary(input)).toString("hex")
  );
}

export function decodeWalletOutput(hex: string): {
  outpoints: OutPoint[];
  balanceSheet: RuneOutput[];
} {
  const wo = WalletResponse.fromBinary(
    (Uint8Array as any).from((Buffer as any).from(stripHexPrefix(hex), "hex") as Buffer) as Uint8Array);
  return {
    outpoints: wo.outpoints.map((op) => decodeOutpointViewBase(op)),
    balanceSheet: decodeRunes(wo.balances),
  };
}

export function encodeRuntimeInput(protocolTag: bigint) {
  const input: RuntimeInput = {
    protocolTag: encodeProtocolTag(protocolTag),
  };
  return "0x" + Buffer.from(RuntimeInput.toBinary(input)).toString("hex");
}

export function decodeRuntimeOutput(hex: string) {
  const runtime = Runtime.fromBinary(
    Uint8Array.from(Buffer.from(stripHexPrefix(hex), "hex"))
  );
  const balances = decodeRunes(runtime.balances);
  return {
    balances,
  };
}
