import { toProtobufAlkaneTransfer, AlkaneTransfer, AlkaneId, fromUint128, toUint128, encipher } from "./bytes";
import { alkanes as alkanes_protobuf } from "./proto/alkanes";
import { stripHexPrefix } from "./utils";
import { protorune as protobuf } from "./proto/protorune";
const {
  SimulateResponse,
  MessageContextParcel,
  AlkanesTrace
} = alkanes_protobuf;

export function toAlkaneTransfer(v) {
  return {
    id: toAlkaneId(v.id),
    value: fromUint128(v.value)
  };
}

export function fromCallType(v: number): string {
  switch (v) {
    case 1:
      return 'call';
    case 2:
      return 'delegatecall';
    case 3:
      return 'staticcall';
    default:
      return 'unknowncall';
  }
}

export function toAlkaneId(v) {
  return {
    block: fromUint128(v.block),
    tx: fromUint128(v.tx)
  };
}

export function toContext(v) {
  return {
    myself: toAlkaneId(v.myself),
    caller: toAlkaneId(v.caller),
    incomingAlkanes: v.incoming_alkanes.map((v) => toAlkaneTransfer(v)),
    vout: v.vout
  };
}
export function toEvent(v) {
  let k = null;
  switch (k = Object.keys(v)[0]) {
    case 'create_alkane':
      return {
        event: 'create',
        data: toAlkaneId(v[k].new_alkane)
      };
    case 'enter_context':
      return {
        event: 'invoke',
        data: {
          type: fromCallType(v[k].call_type),
          context: toContext(v[k].context.inner),
          fuel: v[k].context.fuel
        }
      };
    case 'exit_context':
      return {
        event: 'return',
        data: {
          status: v[k].status == 0 ? 'revert': 'success',
          response: v[k].response,
          fuelUsed: v[k].fuel_used
        }
      };
  }
  
}

export function encodeTraceRequest({
  txid,
  vout
}: {
  txid: string;
  vout: number;
}): string {
  const input = {
    txid: Buffer.from(stripHexPrefix(txid), 'hex'),
    vout: vout
  };
  return (
    "0x" + Buffer.from(new protobuf.Outpoint(input).serializeBinary()).toString("hex")
  );
}

export function decodeTraceResponse(hex: string): any {
  return alkanes_protobuf.AlkanesTrace.deserializeBinary(Buffer.from(stripHexPrefix(hex), 'hex')).toObject().events.map((v) => toEvent(v));
}

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
  height: bigint;
  block: string;
  txindex: number;
  vout: number;
  pointer: number;
  refundPointer: number;
}): string {
  const input = {
    alkanes: alkanes.map((v) => toProtobufAlkaneTransfer(v)),
    transaction: Uint8Array.from(Buffer.from(transaction, "hex")),
    height: Number(height),
    txindex,
    calldata: encipher([target.block, target.tx, ...inputs]),
    block: Uint8Array.from(Buffer.from(block, 'hex')),
    vout,
    pointer,
    refund_pointer: refundPointer,
  };

  return (
    "0x" + Buffer.from(new alkanes_protobuf.MessageContextParcel(input).serializeBinary()).toString("hex")
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
  gasUsed: number;
  execution: ExecutionResult
};

export function decodeSimulateResponse(response: string): DecodedSimulateResponse {
  const res = alkanes_protobuf.SimulateResponse.deserializeBinary(Buffer.from(stripHexPrefix(response), "hex"));
  if (res.error || !res.execution) return { status: ExecutionStatus.REVERT, gasUsed: 0, execution: { alkanes: [], storage: [], data: '0x', error: res.error } };
  return {
    status: ExecutionStatus.SUCCESS,
    gasUsed: res.gas_used,
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
    token: {
      id: { block: fromUint128(item.rune.runeId.height), tx: fromUint128(item.rune.runeId.txindex) },
      name: item.rune.name,
      symbol: item.rune.symbol
    },
    value: fromUint128(item.balance),
  }));
}

export function decodeOutpointResponse(result: any): any {
  return outpointResponseToObject(protobuf.OutpointResponse.deserializeBinary(
      Buffer.from(
        (
          result
        ).substr(2),
        "hex"
      )
    ).balances.entries);
}
