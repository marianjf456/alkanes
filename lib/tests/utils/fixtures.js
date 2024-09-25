"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.constructProtostoneTxWithInscription = void 0;
exports.createAlkaneFixture = createAlkaneFixture;
const protostone_1 = require("protorune/lib/src.ts/protostone");
const fixtures_1 = require("protorune/lib/tests/utils/fixtures");
const integer_1 = require("@magiceden-oss/runestone-lib/dist/src/integer");
const runeid_1 = require("@magiceden-oss/runestone-lib/dist/src/runeid");
const btc = __importStar(require("@scure/btc-signer"));
const inscriptions_1 = require("../../src.ts/inscriptions");
//@ts-ignore
const bitcoinjs = require("bitcoinjs-lib");
const runestone_protostone_upgrade_1 = require("protorune/lib/src.ts/runestone_protostone_upgrade");
const base_1 = require("@scure/base");
const privKey1 = base_1.hex.decode("0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a");
const pubKey1 = btc.utils.pubSchnorr(privKey1);
const privKey2 = base_1.hex.decode("0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0b");
const pubKey2 = btc.utils.pubSchnorr(privKey2);
/**
 * Returns the btc.Transaction transaction with a protoburn and a inscription envelope.
 * @param inputs
 * @param outputs
 * @param edicts
 * @param protostones
 * @param runeTransferPointer
 * @returns
 */
const constructProtostoneTxWithInscription = (inputs, inscriptionInput, outputs, edicts, protostones, runeTransferPointer) => {
    const tx = new btc.Transaction({ customScripts: inscriptions_1.CUSTOM_SCRIPTS, allowUnknownOutputs: true });
    // TODO: Test inputs that contain protorunes that also may be a part of the protomessage
    // removed for now because we can't find the utxo that creates this input
    // inputs.forEach((input, idx) => {
    //   tx.addInput({
    //     // txid: input.inputTxHash,
    //     // index: input.inputTxOutputIndex,
    //     nonWitnessUtxo: {
    //       version: 1,
    //       inputs: [],
    //       outputs: [{
    //         amount: input.inputTxOutputIndex,
    //         script: Uint8Array.from([0])
    //       }],
    //       lockTime: 0
    //     }
    //   });
    //   tx.signIdx(privKey1, idx)
    // });
    tx.addInput(inscriptionInput);
    outputs.forEach((output) => {
        tx.addOutput({
            script: btc.p2tr(output.address).script,
            amount: output.btcAmount,
        });
    });
    const runestone = (0, runestone_protostone_upgrade_1.encodeRunestoneProtostone)({
        edicts: edicts,
        pointer: runeTransferPointer, // default output for leftover runes, default goes to the protoburn
        protostones: protostones,
    }).encodedRunestone;
    tx.addOutput({
        script: runestone,
        amount: 0n,
    });
    tx.sign(privKey1);
    tx.finalize();
    return tx.hex;
};
exports.constructProtostoneTxWithInscription = constructProtostoneTxWithInscription;
async function createAlkaneFixture({ protocolTag, protomessagePointer, protomessageRefundPointer, programWasm, calldata, amount, }) {
    let { input, block, output, refundOutput, runeId, pointerToReceiveRunes, premineAmount, } = 
    // this fixture always assumes a protoburn and default values
    await (0, fixtures_1.createProtoruneFixture)(protocolTag);
    if (typeof amount === "undefined") {
        amount = premineAmount;
    }
    const inputs = [
        {
            inputTxHash: block.transactions?.at(2)?.getHash(), //protoburn is at tx2
            inputTxOutputIndex: pointerToReceiveRunes,
        },
    ];
    //   const outputs = [output, refundOutput].map((v) => {
    //     const {hash, version} = bitcoinjs.address.fromBase58Check(v.address)
    //     return {
    //       address: new Uint8Array([version, ...hash]),
    //       btcAmount: BigInt(v.btcAmount),
    //     };
    //   });
    const outputs = [
        {
            address: pubKey1,
            btcAmount: 1n
        },
        {
            address: pubKey2,
            btcAmount: 1n
        },
    ];
    const edicts = [];
    const protostones = [
        protostone_1.ProtoStone.edicts({
            protocolTag: protocolTag,
            edicts: [
                {
                    amount: (0, integer_1.u128)(amount),
                    id: new runeid_1.RuneId((0, integer_1.u64)(runeId.block), (0, integer_1.u32)(runeId.tx)),
                    output: (0, integer_1.u32)(5),
                },
            ],
        }),
        protostone_1.ProtoStone.message({
            protocolTag: protocolTag,
            pointer: protomessagePointer,
            refundPointer: protomessageRefundPointer,
            calldata,
        }),
    ];
    // leftover protorunes go to output2, which is ADDRESS 1
    const runeTransferPointer = 2;
    // constructing tx 3: protomessage
    // right now, address 2 has all the protorunes
    // construct the transaction with the protoburn and inscription envelope
    // TODO: Change pubKey and privKey
    const revealTxInput = (0, inscriptions_1.constructRevealTxInput)(programWasm, pubKey1, privKey1);
    const inscriptionProtoburnHex = (0, exports.constructProtostoneTxWithInscription)(inputs, revealTxInput, outputs, edicts, protostones, runeTransferPointer);
    block.transactions?.push(bitcoinjs.Transaction.fromHex(inscriptionProtoburnHex));
    return { block, runeId, amount };
}
//# sourceMappingURL=fixtures.js.map