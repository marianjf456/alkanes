import { Box } from "metashrew-as/assembly/utils/box";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { console } from "metashrew-as/assembly/utils/logging";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import { input, _flush } from "metashrew-as/assembly//indexer";
import { AlkaneIndex } from "./AlkaneIndex";

export function _start(): void {
  const data = input();
  const box = Box.from(data);
  const height = parsePrimitive<u32>(box);
  const block = new Block(box);
  new AlkaneIndex().indexBlock(height, block);
  console.log("got block " + height.toString(10));
  _flush();
}
