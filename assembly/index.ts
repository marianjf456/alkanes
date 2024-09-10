import { Box } from "metashrew-as/assembly/utils/box";
import { _flush, input } from "metashrew-as/assembly/indexer/index";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { AlkaneIndex } from "./indexer";

import { console } from "metashrew-as/assembly/utils/logging";

export function __execute(): i32 {
  // console.log(Box.from(env.block).toHexString());

  return 0;
}

export function _start(): void {
  const data = input();
  const box = Box.from(data);
  const height = parsePrimitive<u32>(box);
  const block = new Block(box);
  new AlkaneIndex().indexBlock(height, block);
  console.log("got block " + height.toString(10));
  _flush();
}
