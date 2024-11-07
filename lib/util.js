"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.createProtoStone = exports.STUB = void 0;
const runestone_protostone_upgrade_js_1 = require("protorune/lib/src.ts/runestone_protostone_upgrade.js");
const protostone_js_1 = require("protorune/lib/src.ts/protostone.js");
exports.STUB = "";
const createProtoStone = ({ runeName, mintAmount, divisibility, premine, cap }) => (0, runestone_protostone_upgrade_js_1.encodeRunestoneProtostone)({
    // flags: 3,
    etching: {
        runeName,
        divisibility,
        symbol: '烙',
        premine,
        terms: {
            cap,
            amount: mintAmount,
            // height: {
            //   end: 850946,
            // },
        },
        turbo: true,
    },
    pointer: 2,
    protostones: [{
            protocolTag: 64n,
            burn: {
                pointer: 1
            }
        }].map((v) => new protostone_js_1.ProtoStone(v))
});
exports.createProtoStone = createProtoStone;
//# sourceMappingURL=util.js.map