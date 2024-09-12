import { ProtoruneRuneId } from "protorune/assembly/indexer/ProtoruneRuneId";
import { IncomingRune } from "protorune/assembly/indexer/protomessage/IncomingRune";
import { u128 } from "as-bignum/assembly";

export class AlkaneContextIncomingRune {
  public runeId: ProtoruneRuneId = changetype<ProtoruneRuneId>(0);
  public amount: u128 = changetype<u128>(0);
  static from(
    runeId: ProtoruneRuneId,
    amount: u128,
  ): AlkaneContextIncomingRune {
    const result = new AlkaneContextIncomingRune();
    result.runeId = runeId;
    result.amount = amount;
    return result;
  }
  static fromIncomingRune(rune: IncomingRune): AlkaneContextIncomingRune {
    return AlkaneContextIncomingRune.from(
      ProtoruneRuneId.from(rune.runeId),
      rune.amount,
    );
  }
}
