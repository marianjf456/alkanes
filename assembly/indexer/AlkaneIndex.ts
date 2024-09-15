import { Protorune } from "protorune/assembly/indexer/index";
import { Protostone } from "protorune/assembly/indexer/Protostone";
import { ProtoruneBalanceSheet } from "protorune/assembly/indexer/ProtoruneBalanceSheet";
import { Edict } from "metashrew-runes/assembly/indexer/Edict";
import { RunestoneMessage } from "metashrew-runes/assembly/indexer/RunestoneMessage";
import { RunesBlock } from "metashrew-runes/assembly/indexer/RunesBlock";
import { RunesTransaction } from "metashrew-runes/assembly/indexer/RunesTransaction";
import { AlkaneMessageContext } from "./AlkaneMessageContext";

export class AlkaneIndex extends Protorune<AlkaneMessageContext> {
}
