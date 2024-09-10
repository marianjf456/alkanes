import { _flush } from "metashrew-as/assembly/indexer/index";
import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";
import { ProtoruneRuneId } from "protorune/assembly/indexer/ProtoruneRuneId";
import { u128 } from "as-bignum/assembly";
import { Protorune } from "protorune/assembly/indexer/index";
import { Protostone } from "protorune/assembly/indexer/Protostone";
import { ProtoruneBalanceSheet } from "protorune/assembly/indexer/ProtoruneBalanceSheet";
import { Edict } from "metashrew-runes/assembly/indexer/Edict";
import { RunestoneMessage } from "metashrew-runes/assembly/indexer/RunestoneMessage";
import { RunesTransaction } from "metashrew-runes/assembly/indexer/RunesTransaction";
import { RunesBlock } from "metashrew-runes/assembly/indexer/RunesBlock";
import { MessageContext } from "protorune/assembly/indexer/protomessage/MessageContext";
import {
  NumberingProtoburn,
  NumberingProtostone,
  NumberingRunestone,
} from "quorumgenesisprotorune/assembly/indexer/numbering/index";
import { AlkaneInstance } from "./vm";
import { primitiveToBuffer } from "metashrew-as/assembly/utils/utils";
import { _parseLeb128toU128Array } from "../utils";

class AlkaneMessageContext extends MessageContext {
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
