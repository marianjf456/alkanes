import { u128 } from "as-bignum/assembly";
import { Box } from "metashrew-as/assembly/utils";
import { MAX_BYTES_LEB128_INT } from "metashrew-runes/assembly/indexer/constants/index";
import { readULEB128ToU128 } from "metashrew-runes/assembly/leb128";
import { Protostone } from "protorune/assembly/indexer/Protostone";
import { RunesTransaction } from "metashrew-runes/assembly/indexer/RunesTransaction";
import { NumberingProtostone } from "quorumgenesisprotorune/assembly/indexer/numbering/index";

export function _parseLeb128toU128Array(input: ArrayBuffer): Array<u128> {
  const result = new Array<u128>();
  const inputBox = Box.from(input);
  const defaultResult = new Array<u128>();

  while (inputBox.len > 0) {
    const value = u128.from(0);
    const size = readULEB128ToU128(inputBox, value);
    if (size > MAX_BYTES_LEB128_INT) return defaultResult;
    inputBox.shrinkFront(size);
    result.push(value);
  }

  if (result.length > 0) return result;
  else return new Array<u128>();
}

export function expandToNumberingAlign(
  v: Array<Protostone>,
  tx: RunesTransaction,
): Array<Protostone> {
  const result = new Array<Protostone>(0);
  for (let i = 0; i < v.length; i++) {
    result.push(NumberingProtostone.fromProtocolMessage(v[i], tx).unwrap());
  }
  return result;
}
