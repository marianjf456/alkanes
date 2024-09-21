export class AlkaneCheckpoint {
  public balances: Map<string, u128>;
  public storage: Map<string, ArrayBuffer>;
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
}

export class AlkaneGlobalState {
  public context: AlkaneMessageContext;
  public store: Map<string, AlkaneState>;
  constructor(context: AlkaneMessageContext) {
    this.context = context;
    this.store = new Map<string, AlkaneState>();
  }
  unwrap(): Array<Map<string, AlkaneState>> {
    return this.store;
  }
  checkpoint(): void {
    this.unwrap().push(new Map<string, AlkaneState>());
  }
  commit(): void {
    const ary = this.unwrap();
    const top = ary.pop();
    const current = this.current();
    if (changetype<usize>(current) === 0) {
      const alkanes = top.keys();
      for (let i = 0; i < alkanes.length; i++) {
g       
      }
      this.context.runtime.
    }
  }
  balance(_who: AlkaneId, _what: AlkaneId): u128 {
    const checkpoints = this.unwrap();
    if (this.current().isNull()) return changetype<u128>(0);
    const whoBytes = _who.toBytes();
    const who = Box.from(whoBytes).toHexString();
    const whatBytes = Box.from(_what.toBytes()).toHexString();
    const what = Box.from(whatBytes.toBytes()).toHexString();
    for (let i = checkpoints.length - 1; i > 0; i--) {
      if (checkpoints[i].has(who) && checkpoints[i].get(who).balances.has(what)) return checkpoints[i].get(who).balances.get(what);
    }
    return fromArrayBuffer(ALKANES_INDEX.keyword("balances/").select(whoBytes).keyword("/").select(whatBytes).get());
  }
  lookup(_who: AlkaneId, _what: ArrayBuffer): u128 {
    const checkpoints = this.unwrap();
    if (this.current().isNull()) return changetype<u128>(0);
    const whoBytes = _who.toBytes();
    const who = Box.from(whoBytes).toHexString();
    const whatBytes = Box.from(_what.toBytes()).toHexString();
    const what = Box.from(whatBytes.toBytes()).toHexString();
    for (let i = checkpoints.length - 1; i > 0; i--) {
      if (checkpoints[i].has(who) && checkpoints[i].get(who).storage.has(what)) return checkpoints[i].get(who).storage.get(what);
    }
    return ALKANES_INDEX.keyword("storage/").select(whoBytes).keyword("/").select(whatBytes).get();
  }
  current(): AlkaneState {
    const ary = this.unwrap();
    if (ary.length === 0) return changetype<AlkaneState>(0);
    return ary[ary.length - 1];
  }


}

