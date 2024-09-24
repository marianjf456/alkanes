import {
  buildProgram,
  formatKv,
  TEST_BTC_ADDRESS1,
  TEST_BTC_ADDRESS2,
} from "metashrew-runes/lib/tests/utils/general";
import { DEBUG_WASM } from "./utils/general";
import { expectBalances } from "protorune/lib/tests//utils/matchers";
import { runesbyaddress } from "metashrew-runes/lib/tests/utils/rune-helpers";
import { protorunesbyaddress } from "protorune/lib/tests/utils/view-helpers";
import {
  createMultipleProtomessageFixture,
  createProtoruneFixture,
} from "protorune/lib/tests/utils/fixtures";
import { Cellpack } from "../src.ts/alkane";
import { u128 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { loadWasmFile } from "../src.ts/wasm";
import * as btc from "@scure/btc-signer";
import { hex, utf8 } from "@scure/base";
import { createAlkaneFixture } from "./utils/fixtures";

const ALKANES_PROTOCOL_TAG = 1n;
const WASM_PATH = "tests/static/simple_wasm.wasm";

const privKey = hex.decode(
  "0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a"
);
const pubKey = btc.utils.pubSchnorr(privKey);

describe("alkane deployments", () => {
  let program: ReturnType<typeof buildProgram>;
  beforeEach(async () => {
    program = buildProgram(DEBUG_WASM);
    program.setBlockHeight(840000);
  });

  const expectRunesBalances = (address: string, index: number) =>
    expectBalances(program, address, index, runesbyaddress);
  const expectProtoRunesBalances = (
    address: string,
    index: number,
    protocol: any
  ) => expectBalances(program, address, index, protorunesbyaddress, protocol);

  it("should test fixture initial values before protoburn", async () => {
    let { block, premineAmount } = await createProtoruneFixture(
      ALKANES_PROTOCOL_TAG,
      true
    );
    program.setBlock(block.toHex());
    await program.run("_start");
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).equals([premineAmount]);
    await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS2,
      2,
      ALKANES_PROTOCOL_TAG
    ).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS1,
      1,
      ALKANES_PROTOCOL_TAG
    ).isZero();
  });
  it("should test fixture initial values protoburn", async () => {
    let { block, premineAmount } =
      await createProtoruneFixture(ALKANES_PROTOCOL_TAG);
    program.setBlock(block.toHex());
    await program.run("_start");
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
    await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS2,
      2,
      ALKANES_PROTOCOL_TAG
    ).equals([premineAmount]);
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS1,
      1,
      ALKANES_PROTOCOL_TAG
    ).isZero();
  });
  it("cellpack deployment without inscription should refund to refund pointer", async () => {
    const amount1 = 100000n;
    const cellpack = new Cellpack(u128(0), u128(1), [
      /*u128(999)*/
    ]);

    let { block, premineAmount } = await createMultipleProtomessageFixture({
      protocolTag: ALKANES_PROTOCOL_TAG,
      protomessagePointer: 1, // address 2
      protomessageRefundPointer: 2, // address 1
      calldata: cellpack.serializeToCalldata(),
      amount1: amount1,
      amount2: 0n,
    });
    program.setBlock(block.toHex());
    await program.run("_start"); // default behavior is to refund to refundPointer (address 1)
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
    await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS2,
      2,
      ALKANES_PROTOCOL_TAG
    ).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS1,
      1,
      ALKANES_PROTOCOL_TAG
    ).equals([premineAmount, premineAmount]);
  });
  it("cellpack deployment with inscription should TODO", async () => {
    const amountToTransferToProtomessage = 0n;
    const wasmFile = loadWasmFile(WASM_PATH);

    const cellpack = new Cellpack(u128(0), u128(0), [
      /*u128(999)*/
    ]);

    let { block, amount } = await createAlkaneFixture({
      protocolTag: ALKANES_PROTOCOL_TAG,
      protomessagePointer: 1, // address 2
      protomessageRefundPointer: 2, // address 1
      programWasm: wasmFile,
      calldata: cellpack.serializeToCalldata(),
      amount: amountToTransferToProtomessage,
    });

    program.setBlock(block.toHex());
    await program.run("_start"); // default behavior is to refund to refundPointer (address 1)
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
    await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
    // await expectProtoRunesBalances(
    //   TEST_BTC_ADDRESS2,
    //   2,
    //   ALKANES_PROTOCOL_TAG
    // ).isZero();
    // await expectProtoRunesBalances(
    //   TEST_BTC_ADDRESS1,
    //   1,
    //   ALKANES_PROTOCOL_TAG
    // ).equals([premineAmount, premineAmount]);
  });
});
