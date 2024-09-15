import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";
import { ProtoruneRuneId } from "protorune/assembly/indexer/ProtoruneRuneId";
import { logArrayBuffer } from "protorune/assembly/utils";
import { u128 } from "as-bignum/assembly";
import { MessageContext } from "protorune/assembly/indexer/protomessage/MessageContext";
import { primitiveToBuffer } from "metashrew-as/assembly/utils/utils";
import { AlkaneInstance } from "./AlkaneInstance";
import { _parseLeb128toU128Array } from "./utils";
import { console } from "metashrew-as/assembly/utils/logging";

export class AlkaneMessageContext extends MessageContext {
  protocolTag(): u128 {
    // TODO: This doesn't seem to be overwriting
    return u128.from(1);
  }
  handle(): boolean {
    console.log("inside AlkaneMessageContext handle ");
    logArrayBuffer(this.calldata);
    let calldata = _parseLeb128toU128Array(this.calldata);

    console.log("leb decoded calldata ");
    // let self = ProtoruneRuneId.from(
    //   RuneId.fromBytes(primitiveToBuffer(calldata.slice(0, 2))),
    // );
    // console.log("self block: " + self.block.toString());
    // console.log("self tx: " + self.tx.toString());

    // let caller = ProtoruneRuneId.from(RuneId.fromU128(u128.Zero));

    // const instance = new AlkaneInstance(
    //   self,
    //   caller,
    //   this.runes,
    //   calldata.slice(2),
    // );
    return false;
  }
}
