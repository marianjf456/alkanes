export const RPCUSER = process.env.RPCUSER || 'bitcoinrpc';
export const RPCPASSWORD = process.env.RPCPASSWORD || 'bitcoinrpc';

export const RPCAUTH =
  process.env.RPCAUTH || `${RPCUSER}:${RPCPASSWORD}`;

export const METASHREW_URI =
  process.env.METASHREW_URI || "http://metashrew-view:8080";

export const ORD_PORT = process.env.ORD_PORT && Number(process.env.ORD_PORT) || 8090;

export const ORD_HOST = process.env.ORD_HOST || "ord";

export const DAEMON_RPC_ADDR = process.env.DAEMON_RPC_ADDR || '127.0.0.1:18443';
