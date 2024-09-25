
@external("env", "__request_context") declare function __request_context(): usize;


@external("env", "__load_context") declare function __load_context(
  ptr: usize,
): void;


@external("env", "__request_storage") declare function __request_storage(
  ptr: usize,
): usize;


@external("env", "__load_storage") declare function __load(
  ptr: usize,
  result: usize,
): void;


@external("env", "__call") declare function __call(
  cellpack: usize,
  values: usize,
  fuel: u64,
): usize;


@external("env", "__delegatecall") declare function __delegatecall(
  cellpack: usize,
  values: usize,
  fuel: u64,
): usize;


@external("env", "__staticcall") declare function __staticcall(
  cellpack: usize,
  values: usize,
  fuel: u64,
): usize;


@external("env", "__balance") declare function __balance(
  who: usize,
  what: usize,
  result: usize,
): void;


@external("env", "__sequence") declare function __sequence(ptr: usize): void;


@external("env", "__request_transaction") declare function __request_transaction(): usize;


@external("env", "__load_transaction") declare function __load_transaction(
  ptr: usize,
): void;


@external("env", "__request_block") declare function __request_block(): usize;
@external("env", "__load_block") declare function __load_block(ptr: usize): void;
@external("env", "__fuel") declare function __fuel(ptr: i32): void;

import { fromArrayBuffer } from "metashrew-runes/assembly/utils";
import { u128ListToArrayBuffer } from "./utils";
import { u128 } from "as-bignum/assembly";
import { AlkaneId } from "./AlkaneId";
import { Cellpack } from "./Cellpack";
import { Box, primitiveToBuffer } from "metashrew-as/assembly/utils";
import { AlkaneStorageMap } from "./AlkaneStorageMap";
import { AlkaneContext } from "./AlkaneContext";
import { AlkaneTransfer } from "./AlkaneTransfer";
import { AlkaneTransferParcel } from "./AlkaneTransferParcel";
import { StoragePointer } from "./StoragePointer";


export function loadContext(): AlkaneContext {
  const buffer = new ArrayBuffer(<i32>__request_context());
  __load_context(changetype<usize>(buffer));
  return new AlkaneContext(buffer);
}

export class AlkaneEnvironment {
  private _block: ArrayBuffer;
  private _transaction: ArrayBuffer;
  private _sequence: u128;
  private _context: AlkaneContext;
  private _storage: AlkaneStorageMap;
  private _payout: Array<AlkaneTransfer>;
  constructor() {
    this._block = changetype<ArrayBuffer>(0);
    this._transaction = changetype<ArrayBuffer>(0);
    this._sequence = changetype<u128>(0);
    this._context = changetype<AlkaneContext>(0);
    this._payout = changetype<Array<AlkaneTransfer>>(0);
    this._storage = changetype<AlkaneStorageMap>(0);
  }
  get payout(): AlkaneTransferParcel {
    if (changetype<usize>(this._payout)) {
      this._payout = new Array<AlkaneTransfer>();
    }
    return AlkaneTransferParcel.wrap(this._payout);
  }
  pay(id: AlkaneId, amount: u128): void {
    this.payout.unwrap().push(AlkaneTransfer.fromTuple(id, amount));
  }
  keyword(s: string): StoragePointer {
    return StoragePointer.for(s);
  }
  select(v: ArrayBuffer): StoragePointer {
    return StoragePointer.wrap(v);
  }
  returndata(v: ArrayBuffer): i32 {
    const payout = this.payout;
    return <i32>(
      changetype<usize>(
        Box.concat([
          Box.from(this.storage.serialize()),
          Box.from(primitiveToBuffer<u32>(payout.unwrap().length)),
          Box.from(payout.serialize()),
	  Box.from(v)
        ]),
      )
    );
  }
  get context(): ExecutionContext {
    if (changetype<usize>(this._context) === 0)
      this._context = loadContext();
    return this._context;
  }
  get block(): ArrayBuffer {
    if (changetype<usize>(this._block) === 0) {
      this._block = new ArrayBuffer(<i32>__request_block());
      __load_block(changetype<usize>(this._block));
    }
    return this._block;
  }
  get transaction(): ArrayBuffer {
    if (changetype<usize>(this._transaction) === 0) {
      this._block = new ArrayBuffer(<i32>__request_transaction());
      __load_block(changetype<usize>(this._transaction));
    }
    return this._transaction;
  }
  get storage(): AlkaneStorageMap {
    if (changetype<usize>(this._storage) === 0) {
      this._storage = new AlkaneStorageMap();
    }
    return this._storage;
  }
  get sequence(): u128 {
    const buffer = new ArrayBuffer(16);
    __sequence(changetype<usize>(buffer));
    return fromArrayBuffer(buffer);
  }
  get fuel(): u64 {
    const buffer = new ArrayBuffer(sizeof<u64>());
    __fuel(changetype<usize>(buffer));
    return load<u64>(changetype<usize>(buffer));
  }
  call(
    target: AlkaneId,
    inputs: Array<u128>,
    values: Array<AlkaneTransfer>,
    fuel: u64,
  ): CallResult {
    const result = new ArrayBuffer(
      __call(
        changetype<usize>(Cellpack.fromTuple(target, inputs).serialize()),
        changetype<usize>(AlkaneTransferParcel.wrap(values).serialize()),
        fuel,
      ),
    );
    __returndatacopy(changetype<usize>(result));
    return CallResult.parse(result);
  }
  staticcall(
    target: AlkaneId,
    inputs: Array<u128>,
    values: Array<AlkaneTransfer>,
    fuel: u64,
  ): CallResult {
    const result = new ArrayBuffer(
      __staticcall(
        changetype<usize>(Cellpack.fromTuple(target, inputs).serialize()),
        changetype<usize>(AlkaneTransferParcel.wrap(values).serialize()),
        fuel,
      ),
    );
    __returndatacopy(changetype<usize>(result));
    return CallResult.parse(result);
  }
  delegatecall(
    target: AlkaneId,
    inputs: Array<u128>,
    values: Array<AlkaneTransfer>,
    fuel: u64,
  ): CallResult {
    const result = new ArrayBuffer(
      __delegatecall(
        changetype<usize>(Cellpack.fromTuple(target, inputs).serialize()),
        changetype<usize>(AlkaneTransferParcel.wrap(values).serialize()),
        fuel,
      ),
    );
    __returndatacopy(changetype<usize>(result));
    return CallResult.parse(result);
  }
  balance(who: AlkaneId, what: AlkaneId): u128 {
    const result = new ArrayBuffer(16);
    __balance(
      changetype<usize>(who.serialize()),
      changetype<usize>(what.serialize()),
      changetype<usize>(result),
    );
    return result;
  }
}

export const env = new AlkaneEnvironment();
