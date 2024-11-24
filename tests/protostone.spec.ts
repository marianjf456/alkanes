"use strict";

import { pack, unpack, encipher, decipher } from "../lib/esm/bytes";
import { ProtoStone } from "../lib/esm/protorune/protostone";
import { encodeRunestoneProtostone } from "../lib/esm/protorune/proto_runestone_upgrade.js";

describe('protostone encoding', () => {
  it('should pack/unpack', () => {
    console.log(pack(unpack(encipher([1n, 0n, 2n]))));
  });
  it('should encipher varints', () => {
    console.log(encodeRunestoneProtostone({ protostones: [ ProtoStone.message({
      protocolTag: 1n,
      edicts: [],
      pointer: 0,
      refundPointer: 0,
      calldata: encipher([1n, 0n, 0n]),
    }) ] }));
  });
});
