"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DAEMON_RPC_ADDR = exports.ORD_HOST = exports.ORD_PORT = exports.METASHREW_URI = exports.RPCAUTH = exports.RPCPASSWORD = exports.RPCUSER = void 0;
exports.RPCUSER = process.env.RPCUSER || 'bitcoinrpc';
exports.RPCPASSWORD = process.env.RPCPASSWORD || 'bitcoinrpc';
exports.RPCAUTH = process.env.RPCAUTH || `${exports.RPCUSER}:${exports.RPCPASSWORD}`;
exports.METASHREW_URI = process.env.METASHREW_URI || "http://metashrew-view:8080";
exports.ORD_PORT = process.env.ORD_PORT && Number(process.env.ORD_PORT) || 8090;
exports.ORD_HOST = process.env.ORD_HOST || "ord";
exports.DAEMON_RPC_ADDR = process.env.DAEMON_RPC_ADDR || '127.0.0.1:18443';
//# sourceMappingURL=params.js.map