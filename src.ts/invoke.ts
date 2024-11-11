import {
  SimulateResponse,
  MessageContextParcel,
  AlkaneTransfer,
} from "./proto/alkanes";

export function encodeSimulateRequest({
  alkanes,
  transaction,
  height,
  block,
  calldata,
  txindex,
  vout,
  pointer,
  refundPointer,
}: {
  alkanes: AlkaneTransfer[];
  transaction: string;
  block: bigint;
  height: bigint;
  calldata: string;
  txindex: number;
  vout: number;
  pointer: number;
  refundPointer: number;
}): string {
  let input: MessageContextParcel = MessageContextParcel.create();
  input = {
    alkanes,
    transaction: Uint8Array.from(Buffer.from(transaction, "hex")),
    block,
    height,
    calldata: Uint8Array.from(Buffer.from(calldata, "hex")),
    txindex,
    vout,
    pointer,
    refundPointer,
  };

  return (
    "0x" + Buffer.from(MessageContextParcel.toBinary(input)).toString("hex")
  );
}

export function decodeSimulateRequest(request: string): SimulateResponse {
  const res = SimulateResponse.fromBinary(Buffer.from(request, "hex"));
  return res;
}
