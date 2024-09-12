import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";
import { ProtoruneRuneId } from "protorune/assembly/indexer/ProtoruneRuneId";
import { u128 } from "as-bignum/assembly";
import { MessageContext } from "protorune/assembly/indexer/protomessage/MessageContext";
import { primitiveToBuffer } from "metashrew-as/assembly/utils/utils";
import { AlkaneInstance } from "./AlkaneInstance";
import { _parseLeb128toU128Array } from "./utils";

export class AlkaneMessageContext extends MessageContext {
  handle(): boolean {
    let calldata = _parseLeb128toU128Array(this.calldata);

    let self = ProtoruneRuneId.from(
      RuneId.fromBytes(primitiveToBuffer(calldata.slice(0, 2))),
    );
    let caller = ProtoruneRuneId.from(RuneId.fromU128(u128.Zero));

    const instance = new AlkaneInstance(
      self,
      caller,
      this.runes,
      calldata.slice(2),
    );
    return true;
  }
}
