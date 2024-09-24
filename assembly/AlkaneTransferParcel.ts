import { AlkaneTransfer } from "./AlkaneTransfer";
import { u128 } from "as-bignum/assembly";
import { u128ListToArrayBuffer } from "./utils";
import { Box } from "metashrew-as/assembly/utils/box";

@final
@unmanaged
export class AlkaneTransferParcel {
  [key: string]: number;
  static wrap(ary: Array<AlkaneTransfer>): AlkaneTransferParcel {
    return changetype<AlkaneTransferParcel>(ary);
  }
  unwrap(): Array<AlkaneTransfer> {
    return changetype<Array<AlkaneTransfer>>(this);
  }
  toArray(): Array<u128> {
    const parcel: Array<AlkaneTransfer> = this.unwrap();
    const result = new Array<u128>(0);
    for (let i = 0; i < parcel.length; i++) {
      result.push(parcel[i].id.block);
      result.push(parcel[i].id.tx);
      result.push(parcel[i].value);
    }
    return result;
  }
  serialize(): ArrayBuffer {
    return u128ListToArrayBuffer(this.toArray());
  }
  static parse(v: ArrayBuffer): AlkaneTransferParcel {
    const result = new Array<AlkaneTransfer>(0);
    const box = Box.from(v);
    while (box.len > 0) {
      result.push(AlkaneTransfer.parse(box));
    }
    return AlkaneTransferParcel.wrap(result);
  }
}

