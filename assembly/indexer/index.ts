import { Box } from "metashrew-as/assembly/utils/box";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { console } from "metashrew-as/assembly/utils/logging";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import { input, _flush } from "metashrew-as/assembly//indexer";
import { AlkaneIndex } from "./AlkaneIndex";
import { SpendablesIndex } from "metashrew-spendables/assembly/indexer";
import { GENESIS } from "metashrew-runes/assembly/indexer/constants";

export function _start(): void {
  const data = input();
  const box = Box.from(data);
  const height = parsePrimitive<u32>(box);
  if (height < GENESIS - 6) {
    _flush();
    return;
  }
  const block = new Block(box);
  if (height >= GENESIS) {
    new SpendablesIndex().indexBlock(height, block);
  }
  new AlkaneIndex().indexBlock(height, block);
  console.log("got block " + height.toString(10));
  _flush();
}

export * from "protorune/assembly/view";
