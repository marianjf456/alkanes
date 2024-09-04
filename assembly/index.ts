import { Box } from "metashrew-as/assembly/utils/box"
import { _flush, input, get, set, Index } from "metashrew-as/assembly/indexer/index";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { Transaction, Input, Output } from "metashrew-as/assembly/blockdata/transaction";

import { console } from "metashrew-as/assembly/utils/logging";
import { toRLP, RLPItem } from "metashrew-as/assembly/utils/rlp";

import { Protorune } from "protorune/assembly/indexer/index";
import { MessageContext } from "protorune/assembly/indexer/protomessage/MessageContext";
import { 
  NumberingMixin, 
  NumberingMixinProtocol, 
  NumberingProtoburn, 
  NumberingProtostone, 
  NumberingRunestone, 
  RuneSource 
} from "quorum/assembly/indexer/numbering/index";

export class AlkaneMessageContext extends MessageContext {
  handle(): boolean {
    //TODO: implement handle()
    return true
  }
}

class AlkaneIndex {

}

//TODO: figure out how to define the class
export class Alkane<T extends AlkaneMessageContext> extends AlkaneIndex {

}

export function _start(): void {
  const data = input();
  const box = Box.from(data);
  const height = parsePrimitive<u32>(box);
  const block = new Block(box);
  console.log("got block " + height.toString(10));
  _flush();
}
