import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";
import { ProtoruneRuneId } from "protorune/assembly/indexer/ProtoruneRuneId";
import { logArrayBuffer } from "protorune/assembly/utils";
import { u128 } from "as-bignum/assembly";
import { MessageContext } from "protorune/assembly/indexer/protomessage/MessageContext";
import { primitiveToBuffer } from "metashrew-as/assembly/utils/utils";
import { AlkaneInstance } from "./AlkaneInstance";
import { _parseLeb128toU128Array } from "./utils";
import { console } from "metashrew-as/assembly/utils/logging";
import { Cellpack } from "../Cellpack";
import { ALKANES_INDEX } from "./tables";
import { Inscription } from "metashrew-as/assembly/blockdata/inscription";
import { fromArrayBuffer, toArrayBuffer } from "metashrew-runes/assembly/utils";
import { IndexPointer } from "metashrew-as/assembly/indexer/tables";
import { logArray } from "quorumgenesisprotorune/assembly/utils";
import { AlkaneGlobalState } from "./AlkaneGlobalState";
import { AlkaneContextIncomingRune } from "./AlkaneContextIncomingRune";
import { IncomingRune } from "protorune/assembly/indexer/protomessage/IncomingRune";

export class AlkaneMessageContext extends MessageContext {
  protocolTag(): u128 {
    return u128.from(1);
  }
  sequenceIndex(): IndexPointer {
    return ALKANES_INDEX.keyword("sequence");
  }
  advanceSequence(): u128 {
    const next = this.sequence() + u128.from(1);
    this.runtime.set(this.sequenceIndex().unwrap(), toArrayBuffer(next));
    return next;
  }
  reservedSequenceIndex(v: u128): IndexPointer {
    return ALKANES_INDEX.keyword("sequence-reserve/").select(toArrayBuffer(v));
  }
  takeCreate1(v: u128): boolean {
    const reserved = this.reservedSequenceIndex(v);
    if (this.runtime.get(reserved.unwrap()).byteLength === 0) {
      this.runtime.set(reserved.unwrap(), primitiveToBuffer<u8>(1));
      return true;
    } else {
      return false;
    }
  }
  sequence(): u128 {
    const nextSequenceBytes = this.runtime.get(this.sequenceIndex().unwrap());
    return nextSequenceBytes.byteLength === 0
      ? u128.from(0)
      : fromArrayBuffer(nextSequenceBytes);
  }
  findBinary(): ArrayBuffer {
    for (let i = 0; i < this.transaction.ins.length; i++) {
      const inscription = this.transaction.ins[i].inscription();
      if (inscription !== null) {
        const body = (inscription as Inscription).body();
        if (body !== null) return body;
      }
    }
    return changetype<ArrayBuffer>(0);
  }
  handle(): boolean {
    console.log("inside AlkaneMessageContext handle ");

    let calldata = _parseLeb128toU128Array(this.calldata);
    const cellpack = new Cellpack(calldata);
    let self = cellpack.target;
    let caller = ProtoruneRuneId.from(RuneId.fromU128(u128.Zero));
    const state = new AlkaneGlobalState(this);
    const instance = new AlkaneInstance(
      this,
      self,
      caller,
      this.runes.map<AlkaneContextIncomingRune>((v: IncomingRune, i: i32, ary: Array<IncomingRune>) => {
        return AlkaneContextIncomingRune.fromIncomingRune(v);
      }),
      cellpack.inputs,
      state
    );
    const result = instance.run();
    return result.success;
  }
}
