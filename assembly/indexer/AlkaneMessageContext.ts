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

export class AlkaneMessageContext extends MessageContext {
  protocolTag(): u128 {
    return u128.from(1);
  }
  sequenceIndex(): IndexPointer {
    return ALKANES_INDEX.keyword("sequence");
  }
  advanceSequence(): u128 {
    const next = this.sequence() + u128.from(1);
    this.sequenceIndex().set(toArrayBuffer(next));
    return next;
  }
  reservedSequenceIndex(v: u128): IndexPointer {
    return ALKANES_INDEX.keyword("sequence-reserve/").select(toArrayBuffer(v));
  }
  takeCreate1(v: u128): boolean {
    const reserved = this.reservedSequenceIndex(v);
    if (reserved.get().byteLength === 0) {
      reserved.set(primitiveToBuffer<u8>(1));
      return true;
    } else {
      return false;
    }
  }
  sequence(): u128 {
    const nextSequenceBytes = this.sequenceIndex().get();
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

    logArrayBuffer(this.calldata);
    let calldata = _parseLeb128toU128Array(this.calldata);
    logArray(calldata);
    const cellpack = new Cellpack(calldata);
    if (cellpack.target.isCreate()) {
      const binary = this.findBinary();
      if (changetype<usize>(binary) === 0) {
        console.log("failed to create0");
        return false;
      } else {
        ALKANES_INDEX.select(cellpack.target.toBytes()).set(binary);
      }
    }
    if (cellpack.target.isCreateReserved()) {
      const binary = this.findBinary();
      if (
        changetype<usize>(binary) === 0 ||
        this.takeCreate1(cellpack.target.tx)
      ) {
        console.log("failed to create1");
        return false;
      } else {
        ALKANES_INDEX.select(cellpack.target.toBytes()).set(binary);
      }
    }
    let self = cellpack.target;
    let caller = ProtoruneRuneId.from(RuneId.fromU128(u128.Zero));
    const instance = new AlkaneInstance(
      this,
      self,
      caller,
      this.runes,
      cellpack.inputs,
    );
    const result = instance.call("__execute", new Array<i32>());
    return result.success;
  }
}
