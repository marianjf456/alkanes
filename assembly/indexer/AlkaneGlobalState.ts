import { AlkaneId } from "../AlkaneId";
import { u128 } from "as-bignum/assembly";
import { Box } from "metashrew-as/assembly/utils/box";
import { ALKANES_INDEX } from "./tables";
import { fromArrayBuffer, isNullPtr } from "metashrew-runes/assembly/utils";
import { nullptr } from "metashrew-as/assembly/utils/pointer";

export class AlkaneCheckpoint {
  public balances: Map<string, u128> = new Map<string, u128>();
  public storage: Map<string, ArrayBuffer> = new Map<string, ArrayBuffer>();

  isNull(): bool {
    return isNullPtr(this);
  }
}


@unmanaged
@final
export class AlkaneState {
  [key: string]: number;
  static wrap(v: Array<AlkaneCheckpoint>): AlkaneState {
    return changetype<AlkaneState>(v);
  }
  unwrap(): Array<AlkaneCheckpoint> {
    return changetype<Array<AlkaneCheckpoint>>(this);
  }
  isNull(): boolean {
    return changetype<usize>(this) === 0;
  }
  current(): AlkaneCheckpoint {
    const ary = this.unwrap();
    if (ary.length == 0) return nullptr();
    return ary[ary.length - 1];
  }
}

export class AlkaneGlobalState {
  static wrap(v: Array<Map<string, AlkaneState>>): AlkaneGlobalState {
    return changetype<AlkaneGlobalState>(v);
  }
  static default(): AlkaneGlobalState {
    return AlkaneGlobalState.wrap(new Array<Map<string, AlkaneState>>(0));
  }
  unwrap(): Array<Map<string, AlkaneState>> {
    return changetype<Array<Map<string, AlkaneState>>>(this);
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
      if (
        checkpoints[i].has(who) &&
        !checkpoints[i].get(who).current().isNull()
      )
        if (checkpoints[i].get(who).current().balances.has(what))
          return checkpoints[i].get(who).current().balances.get(what);
    }
    return fromArrayBuffer(
      ALKANES_INDEX.keyword("balances/")
        .select(whoBytes)
        .keyword("/")
        .select(whatBytes)
        .get(),
    );
  }
  lookup(_who: AlkaneId, _what: ArrayBuffer): ArrayBuffer {
    if (this.isNull()) return nullptr();
    const checkpoints = this.unwrap();
    const whoBytes = _who.toBytes();
    const who = Box.from(whoBytes).toHexString();
    const whatBytes = _what;
    const what = Box.from(whatBytes).toHexString();
    for (let i = checkpoints.length - 1; i >= 0; i--) {
      if (
        checkpoints[i].has(who) &&
        !checkpoints[i].get(who).current().isNull()
      )
        if (!checkpoints[i].get(who).current().storage.has(what))
          return checkpoints[i].get(who).current().storage.get(what);
    }
    return ALKANES_INDEX.keyword("storage/")
      .select(whoBytes)
      .keyword("/")
      .select(whatBytes)
      .get();
  }
  current(): Map<string, AlkaneState> {
    const ary = this.unwrap();
    if (ary.length === 0) return changetype<Map<string, AlkaneState>>(0);
    return ary[ary.length - 1];
  }
}
