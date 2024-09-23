
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
<<<<<<< HEAD
@external("env", "__load_block") declare function __load_block(ptr: usize): void;
@external("env", "__fuel") declare function __fuel(): usize;
=======


@external("env", "__load_block") declare function __load_block(
  ptr: usize,
): void;


@external("env", "__fuel") declare function __fuel(): u64;
>>>>>>> c1f7ae22bb477ff27b73636df2c3fa89b6f82e4e

import { fromArrayBuffer } from "metashrew-runes/assembly/utils";
import { u128 } from "as-bignum/assembly";
import { AlkaneId } from "./AlkaneId";
import { Cellpack } from "./Cellpack";
import { parseU128, u128ListToArrayBuffer } from "./utils";
import { Box, primitiveToBuffer } from "metashrew-as/assembly/utils";

import { decodeHex } from "metashrew-as/assembly/utils";

export function writeBuffer(ptr: usize, buffer: ArrayBuffer): void {
  memory.copy(ptr, changetype<usize>(buffer) - 4, <usize>buffer.byteLength + 4);
}

export class StorageMap extends Map<string, ArrayBuffer> {
  store(k: ArrayBuffer, v: ArrayBuffer): void {
    this.set(Box.from(k).toHexString(), v);
  }
  load(k: ArrayBuffer): ArrayBuffer {
    const key = Box.from(k).toHexString();
    if (this.has(key)) return this.get(key);
    const result = new ArrayBuffer(__request_storage(changetype<usize>(k)));
    __load_storage(changetype<usize>(k), changetype<usize>(result));
  }
  serialize(): ArrayBuffer {
    const keys = this.keys().map<ArrayBuffer>(
      (v: string, i: i32, ary: Array<string>) => {
        return decodeHex(v.substring(2, v.length));
      },
    );
    const values = this.values();
    let length = 4;
    for (let i = 0; keys.length; i++) {
      length += 4 + keys[i].byteLength;
      length += 4 + values[i].byteLength;
    }
    const result = new ArrayBuffer(length);
    store<u32>(changetype<usize>(result), <u32>keys.length);
    let ptr: usize = 4;
    for (let i = 0; keys.length; i++) {
      writeBuffer(changetype<usize>(result) + ptr, keys[i]);
      ptr += 4 + keys[i].byteLength;
      writeBuffer(changetype<usize>(result) + ptr, values[i]);
      ptr += 4 + values[i].byteLength;
    }
    return result;
  }
}

function toU128List(v: ArrayBuffer): Array<u128> {
  const result = new Array<u128>(0);
  const buffer = Box.from(v);
  for (let i: i32 = 0; i < v.byteLength; i += 16) {
    result.push(
      fromArrayBuffer(buffer.sliceFrom(i).setLength(16).toArrayBuffer()),
    );
  }
  return result;
}

export class AlkaneContext {
  public self: AlkaneId;
  public caller: AlkaneId;
  public runes: Map<string, u128>;
  constructor(v: ArrayBuffer) {
    const values = toU128List(v);
    this.runes = new Map<string, u128>();
    this.self = AlkaneId.fromId(values[0], values[1]);
    this.caller = AlkaneId.fromId(values[2], values[3]);
    for (let i: i32 = 4; i < values.length; i += 3) {
      const thisAlkane = AlkaneId.fromId(values[i], values[i + 1]);
      thisAlkane.toBytes();
      this.runes.set(
        Box.from(thisAlkane.toBytes()).toHexString(),
        values[i + 3],
      );
    }
  }
  static load(): AlkaneContext {
    const buffer = new ArrayBuffer(<i32>__request_context());
    __load_context(changetype<usize>(buffer));
    return new AlkaneContext(buffer);
  }
}

export class AlkaneTransfer {
  public id: AlkaneId;
  public value: u128;
  constructor(id: AlkaneId, value: u128) {
    this.id = id;
    this.value = value;
  }
  static fromTuple(id: AlkaneId, value: u128): AlkaneTransfer {
    return new AlkaneTransfer(id, value);
  }
  static parse(v: Box): AlkaneTransfer {
    const block = parseU128(v);
    const tx = parseU128(v);
    const value = parseU128(v);
    return AlkaneTransfer.fromTuple(AlkaneId.fromId(block, tx), value);
  }
}


@final
@unmanaged
export class AlkaneTransferParcel {
  [key: string]: number;
  static wrap(ary: Array<AlkaneTransfer>): AlkaneTransferParcel {
    return changetype<AlkaneTransferParcel>(ary);
  }
  unwrap(): Array<AlkaneTransfer> {
    return changetype<Array<AlkaneTransfer>>(this);
  }
  toArray(): Array<u128> {
    const parcel: Array<AlkaneTransfer> = this.unwrap();
    const result = new Array<u128>(0);
    for (let i = 0; i < parcel.length; i++) {
      result.push(parcel[i].id.block);
      result.push(parcel[i].id.tx);
      result.push(parcel[i].value);
    }
    return result;
  }
  serialize(): ArrayBuffer {
    return u128ListToArrayBuffer(this.toArray());
  }
}

export class CallResult {
  public alkanes: Array<AlkaneTransfer>;
  public data: Array<u128>;
  constructor(alkanes: Array<AlkaneTransfer>, data: Array<u128>) {
    this.alkanes = alkanes;
    this.data = data;
  }
  static fromTuple(
    alkanes: Array<AlkaneTransfer>,
    data: Array<u128>,
  ): CallResult {
    return new CallResult(alkanes, data);
  }
  static parse(v: ArrayBuffer): CallResult {
    if (v.byteLength % 16 !== 0 || v.byteLength === 0)
      return changetype<CallResult>(0);
    const input = Box.from(v);
    const assets = parseU128(input).toU64();
    if (<u64>input.len < <u64>16 * assets) return changetype<AlkaneTransfer>(0);
    const alkanes = new Array<AlkaneTransfer>(0);
    const data = new Array<u128>(0);
    for (let i: u64 = 0; i < assets.length && input.len !== 0; i++) {
      alkanes.push(AlkaneTransfer.parse(input));
    }
    while (input.len !== 0) {
      data.push(parseU128(input));
    }
    return CallResult.fromTuple(alkanes, data);
  }
  isRevert(): boolean {
    return changetype<usize>(this) === 0;
  }
}

export class AlkaneEnvironment {
  private _block: ArrayBuffer;
  private _transaction: ArrayBuffer;
  private _sequence: u128;
  private _context: AlkaneContext;
  private _storage: StorageMap;
  private _payout: Array<AlkaneTransfer>;
  constructor() {
    this._block = changetype<ArrayBuffer>(0);
    this._transaction = changetype<ArrayBuffer>(0);
    this._sequence = changetype<u128>(0);
    this._context = changetype<AlkaneContext>(0);
    this._payout = changetype<Array<AlkaneTransfer>>(0);
    this._storage = changetype<StorageMap>(0);
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
  returndata(): i32 {
    const payout = this.payout;
    return <i32>(
      changetype<usize>(
        Box.concat([
          Box.from(primitiveToBuffer<u32>(payout.unwrap().length)),
          Box.from(payout.serialize()),
          Box.from(this.storage.serialize()),
        ]),
      )
    );
  }
  get context(): ExecutionContext {
    if (changetype<usize>(this._context) === 0)
      this._context = ExecutionContext.load();
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
  get storage(): StorageMap {
    if (changetype<usize>(this._storage) === 0) {
      this._storage = new StorageMap();
    }
    return this._storage;
  }
  get sequence(): u128 {
    const buffer = new ArrayBuffer(16);
    __sequence(changetype<usize>(buffer));
    return fromArrayBuffer(buffer);
  }
  get fuel(): u64 {
    const buffer = new ArrayBuffer(8);
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
