"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DAEMON_RPC_ADDR = exports.ESPLORA_HOST = exports.ORD_HOST = exports.ESPLORA_PORT = exports.ORD_PORT = exports.MEMSHREW_URI = exports.METASHREW_URI = exports.RPCAUTH = exports.RPCPASSWORD = exports.RPCUSER = void 0;
exports.RPCUSER = process.env.RPCUSER || 'bitcoinrpc';
exports.RPCPASSWORD = process.env.RPCPASSWORD || 'bitcoinrpc';
exports.RPCAUTH = process.env.RPCAUTH || `${exports.RPCUSER}:${exports.RPCPASSWORD}`;
exports.METASHREW_URI = process.env.METASHREW_URI || "http://metashrew-view:8080";
exports.MEMSHREW_URI = process.env.MEMSHREW_URI || "http://memshrew:8080";
exports.ORD_PORT = process.env.ORD_PORT && Number(process.env.ORD_PORT) || 8090;
exports.ESPLORA_PORT = process.env.ESPLORA_PORT && Number(process.env.ESPLORA_PORT) || 50010;
exports.ORD_HOST = process.env.ORD_HOST || "ord";
exports.ESPLORA_HOST = process.env.ESPLORA_HOST || "esplora";
exports.DAEMON_RPC_ADDR = process.env.DAEMON_RPC_ADDR || '127.0.0.1:18443';
//# sourceMappingURL=params.js.map