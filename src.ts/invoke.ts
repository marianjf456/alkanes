import { toProtobufAlkaneTransfer, AlkaneTransfer, AlkaneId, toUint128, encipher } from "./bytes";
import {
  SimulateResponse,
  MessageContextParcel
} from "./proto/alkanes";

export function encodeSimulateRequest({
  alkanes,
  transaction,
  height,
  block,
  inputs,
  target,
  txindex,
  vout,
  pointer,
  refundPointer,
}: {
  alkanes: AlkaneTransfer[];
  transaction: string;
  target: AlkaneId;
  inputs: bigint[];
  height: number;
  block: string;
  txindex: number;
  vout: number;
  pointer: number;
  refundPointer: number;
}): string {
  let input: MessageContextParcel = MessageContextParcel.create();
  input = {
    alkanes: alkanes.map((v) => toProtobufAlkaneTransfer(v)),
    transaction: Uint8Array.from(Buffer.from(transaction, "hex")),
    height: BigInt(height),
    txindex,
    calldata: encipher([target.block, target.tx, ...inputs]),
    block: Uint8Array.from(Buffer.from(block, 'hex')),
    vout,
    pointer,
    refundPointer,
  };

  return (
    "0x" + Buffer.from(MessageContextParcel.toBinary(input)).toString("hex")
  );
}

export function decodeSimulateResponse(response: string): SimulateResponse {
  const res = SimulateResponse.fromBinary(Buffer.from(response, "hex"));
  return res;
}
