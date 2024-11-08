import MessageContextParcel from "proto"

export function encodeSimulateRequest({
  alkanes,
  transaction,
  block,
  calldata,
  txindex,
  vout,
  pointer,
  refund_pointer,
}: {
  alkanes: [{ block: BigInt; tx: BigInt }];
  transaction: string;
  block: string;
  calldata: string;
  txindex: number;
  vout: number;
  pointer: number;
  refund_pointer: number;
}):string {
  const input: any = new MessageContextParcel{
    alkanes,
  transaction,
  block,
  calldata,
  txindex,
  vout,
  pointer,
  refund_pointer,

  };

  return (
    "0x" + Buffer.from(MessageContextParcel.toBinary(input)).toString("hex")
  );
}

export function decodeSimulateRequest(request: string): string {
    const res = SimulateResponse.fromHex(request)
  return res;
}
