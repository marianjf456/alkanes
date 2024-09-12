import { Protorune } from "protorune/assembly/indexer/index";
import { Protostone } from "protorune/assembly/indexer/Protostone";
import { ProtoruneBalanceSheet } from "protorune/assembly/indexer/ProtoruneBalanceSheet";
import { Edict } from "metashrew-runes/assembly/indexer/Edict";
import { RunestoneMessage } from "metashrew-runes/assembly/indexer/RunestoneMessage";
import { RunesBlock } from "metashrew-runes/assembly/indexer/RunesBlock";
import { RunesTransaction } from "metashrew-runes/assembly/indexer/RunesTransaction";
import {
  NumberingProtoburn,
  NumberingProtostone,
  NumberingRunestone,
} from "quorumgenesisprotorune/assembly/indexer/numbering/index";
import { AlkaneMessageContext } from "./AlkaneMessageContext";

class ProtostoneReduce {
  tx: RunesTransaction;
  stones: Array<NumberingProtostone> = new Array<NumberingProtostone>();
  constructor(tx: RunesTransaction) {
    this.tx = tx;
  }
}

export class AlkaneIndex extends Protorune<AlkaneMessageContext> {
  processRunestone(
    block: RunesBlock,
    tx: RunesTransaction,
    txid: ArrayBuffer,
    height: u32,
    i: u32,
  ): RunestoneMessage {
    const baseRunestone = tx.runestone();
    if (changetype<usize>(baseRunestone) === 0)
      return changetype<RunestoneMessage>(0);
    const runestone = NumberingRunestone.fromProtocolMessage(baseRunestone, tx);
    const balancesByOutput = changetype<Map<u32, ProtoruneBalanceSheet>>(
      runestone.process(tx, txid, height, i),
    );
    const protostones = Protostone.from(runestone.unwrap()).protostones(
      tx.outs.length + 1,
    );
    const _burns = protostones.burns();
    const burns = new Array<NumberingProtoburn<NumberingRunestone>>();

    for (let i = 0; i < _burns.length; i++) {
      burns.push(NumberingProtoburn.fromBurn(_burns[i], runestone));
    }

    const runestoneOutputIndex = tx.runestoneOutputIndex();
    const edicts = Edict.fromDeltaSeries(runestone.edicts);

    if (burns.length > 0) {
      this.processProtoburns(
        baseRunestone.unallocatedTo,
        balancesByOutput,
        txid,
        runestoneOutputIndex,
        Protostone.from(runestone.unwrap()),
        edicts,
        burns,
      );
    }
    const stones = protostones.flat().reduce((reduce, stone) => {
      reduce.stones.push(
        NumberingProtostone.fromProtocolMessage(stone, reduce.tx),
      );
      return reduce;
    }, new ProtostoneReduce(tx)).stones;
    this.processProtostones(stones, block, height, tx, txid, i);
    return runestone;
  }
}
