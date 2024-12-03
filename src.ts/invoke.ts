import { toProtobufAlkaneTransfer, AlkaneTransfer, AlkaneId, fromUint128, toUint128, encipher } from "./bytes";
import {
  SimulateResponse,
  MessageContextParcel
} from "./proto/alkanes";
import { stripHexPrefix } from "./utils";
import * as protobuf from "./proto/protorune";

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

class ExecutionStatus {
  static SUCCESS: number = 0;
  static REVERT: number = 1;
  constructor() {}
}

export type ExecutionResult = {
  error: null | string;
  storage: any[];
  alkanes: any[];
  data: string;
};

export type DecodedSimulateResponse = {
  status: number;
  gasUsed: bigint;
  execution: ExecutionResult
};

export function decodeSimulateResponse(response: string): DecodedSimulateResponse {
  const res = SimulateResponse.fromBinary(Buffer.from(stripHexPrefix(response), "hex"));
  if (res.error) return { status: ExecutionStatus.REVERT, gasUsed: 0n, execution: { alkanes: [], storage: [], data: '0x', error: res.error } };
  return {
    status: ExecutionStatus.SUCCESS,
    gasUsed: res.gasUsed,
    execution: {
      alkanes: res.execution.alkanes,
      storage: res.execution.storage,
      error: null,
      data: '0x' + Buffer.from(res.execution.data).toString('hex')
    }
  };
}

export function outpointResponseToObject(v: any[]): any {
  return v.map((item) => ({
    id: { block: fromUint128(item.rune.runeId.height), tx: fromUint128(item.rune.runeId.txindex) },
    value: fromUint128(item.balance),
  }));
}

export function decodeOutpointResponse(result: any): any {
  return outpointResponseToObject(protobuf.OutpointResponse.fromBinary(
      Buffer.from(
        (
          result
        ).substr(2),
        "hex"
      )
    ).balances.entries);
}
