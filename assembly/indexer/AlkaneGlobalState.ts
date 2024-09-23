import { AlkaneId } from "../AlkaneId";
import { u128 } from "as-bignum/assembly";
import { Box } from "metashrew-as/assembly/utils/box";
import { ALKANES_INDEX } from "./tables";
import {
  fromArrayBuffer,
  isNullPtr,
  toArrayBuffer,
} from "metashrew-runes/assembly/utils";
import { nullptr } from "metashrew-as/assembly/utils/pointer";
import { AtomicTransaction } from "metashrew-as/assembly/indexer/atomic";
import { decodeHex } from "metashrew-as/assembly/utils/hex";
import { AlkaneMessageContext } from "./AlkaneMessageContext";

export class AlkaneState {
  public balances: Map<string, u128> = new Map<string, u128>();
  public storage: Map<string, ArrayBuffer> = new Map<string, ArrayBuffer>();

  isNull(): bool {
    return isNullPtr(this);
  }
  _indexBalances(alkaneHex: string, atomic: AtomicTransaction): void {
    const keys = this.balances.keys();
    const alkaneId = decodeHex(alkaneHex.substring(2, alkaneHex.length));
    for (let i: i32 = 0; i < keys.length; i++) {
      atomic.set(
        ALKANES_INDEX.keyword("balances/")
          .select(alkaneId)
          .keyword("/")
          .select(decodeHex(keys[i].substring(2, keys[i].length)))
          .unwrap(),
        toArrayBuffer(this.balances.get(keys[i])),
      );
    }
  }
  _indexStorage(alkaneHex: string, atomic: AtomicTransaction): void {
    const keys = this.storage.keys();
    const alkaneId = decodeHex(alkaneHex.substring(2, alkaneHex.length));
    for (let i: i32 = 0; i < keys.length; i++) {
      atomic.set(
        ALKANES_INDEX.keyword("storage/")
          .select(alkaneId)
          .keyword("/")
          .select(decodeHex(keys[i].substring(2, keys[i].length)))
          .unwrap(),
        this.storage.get(keys[i]),
      );
    }
  }
  _pipeBalancesTo(state: AlkaneState): void {
    const keys = this.balances.keys();
    for (let i: i32 = 0; i < keys.length; i++) {
      state.balances.set(keys[i], this.balances.get(keys[i]));
    }
  }
  _pipeStorageTo(state: AlkaneState): void {
    const keys = this.storage.keys();
    for (let i: i32 = 0; i < keys.length; i++) {
      state.storage.set(keys[i], this.storage.get(keys[i]));
    }
  }
  flush(alkaneHex: string, atomic: AtomicTransaction) {
    this._indexBalances(alkaneHex, atomic);
    this._indexStorage(alkaneHex, atomic);
  }
  pipeTo(state: AlkaneState): void {
    this._pipeBalancesTo(state);
    this._pipeStorageTo(state);
  }
}


@unmanaged
@final
export class AlkaneCheckpoint {
  [key: string]: number;
  static wrap(v: Map<string, AlkaneState>): AlkaneCheckpoint {
    return changetype<AlkaneCheckpoint>(v);
  }
  unwrap(): Map<string, AlkaneState> {
    return changetype<Map<string, AlkaneState>>(this);
  }
  pipeTo(checkpoint: AlkaneCheckpoint): void {
    const dest = this.unwrap();
    const src = checkpoint.unwrap();
    const keys = src.keys();
    for (let i: i32 = 0; i < keys.length; i++) {
      if (!dest.has(keys[i])) {
        dest.set(keys[i], src.get(keys[i]));
      } else {
        src.get(keys[i]).pipeTo(dest.get(keys[i]));
      }
    }
  }
  flush(atomic: AtomicTransaction): void {
    const map = this.unwrap();
    const keys = map.keys();
    for (let i: i32 = 0; i < keys.length; i++) {
      map.get(keys[i]).flush(keys[i], atomic);
    }
  }
  isNull(): boolean {
    return changetype<usize>(this) === 0;
  }
}

export class AlkaneGlobalState {
  public context: AlkaneMessageContext;
  public store: Array<AlkaneCheckpoint>;
  constructor(context: AlkaneMessageContext) {
    this.context = context;
    this.store = new Array<AlkaneCheckpoint>(0);
  }
  unwrap(): Array<AlkaneCheckpoint> {
    return this.store;
  }
  checkpoint(): void {
    this.unwrap().push(AlkaneCheckpoint.wrap(new Map<string, AlkaneState>()));
  }
  commit(): void {
    const ary = this.unwrap();
    const top = ary.pop();
    const current = this.current();
    if (changetype<usize>(current) === 0) {
      top.flush(this.context.runtime);
    } else {
      top.pipeTo(current);
    }
  }
  isNull(): bool {
    return isNullPtr(this.current());
  }

  balance(_who: AlkaneId, _what: AlkaneId): u128 {
    if (this.isNull()) return nullptr();
    const checkpoints = this.unwrap();
    const whoBytes = _who.toBytes();
    const who = Box.from(whoBytes).toHexString();
    const whatBytes = _what.toBytes();
    const what = Box.from(whatBytes).toHexString();
    for (let i = checkpoints.length - 1; i > 0; i--) {
      const checkpoint = checkpoints[i].unwrap();
      if (checkpoint.has(who) && checkpoint.get(who).balances.has(what))
        return checkpoint.get(who).balances.get(what);
    }
    return fromArrayBuffer(
      ALKANES_INDEX.keyword("balances/")
        .select(whoBytes)
        .keyword("/")
        .select(whatBytes)
        .get(),
    );
  }
  lookup(_who: AlkaneId, _what: AlkaneId): ArrayBuffer {
    if (this.isNull()) return changetype<ArrayBuffer>(0);
    const checkpoints = this.unwrap();
    const whoBytes = _who.toBytes();
    const who = Box.from(whoBytes).toHexString();
    const whatBytes = _what.toBytes();
    const what = Box.from(whatBytes).toHexString();
    for (let i = checkpoints.length - 1; i > 0; i--) {
      const checkpoint = checkpoints[i].unwrap();
      if (checkpoint.has(who) && checkpoint.get(who).storage.has(what))
        return checkpoint.get(who).storage.get(what);
    }
    return ALKANES_INDEX.keyword("balances/")
      .select(whoBytes)
      .keyword("/")
      .select(whatBytes)
      .get();
  }
  current(): AlkaneCheckpoint {
    const ary = this.unwrap();
    if (ary.length === 0) return changetype<AlkaneCheckpoint>(0);
    return ary[ary.length - 1];
  }
  setStorage(_who: AlkaneId, _what: ArrayBuffer, data: ArrayBuffer): void {
    const who = _who.toBytes();
    const whoBytes = Box.from(who).toHexString();
    const current = this.current().unwrap();
    if (!current.has(whoBytes)) current.set(whoBytes, new AlkaneState());
    current.get(whoBytes).storage.set(Box.from(_what).toHexString(), data);
  }
  setBalance(_who: AlkaneId, _what: AlkaneId, data: u128): void {
    const who = _who.toBytes();
    const what = _what.toBytes();
    const whoBytes = Box.from(who).toHexString();
    const current = this.current().unwrap();
    if (!current.has(whoBytes)) current.set(whoBytes, new AlkaneState());
    current.get(whoBytes).balances.set(Box.from(what).toHexString(), data);
  }
}
