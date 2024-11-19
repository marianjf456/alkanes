#!/bin/bash -x

_DAEMON_RPC_ADDR=${DAEMON_RPC_ADDR:-127.0.0.1:8332}
_INDEXER=${INDEXER:-/metashrew/indexer.wasm}
_AUTH=${AUTH:-bitcoinrpc:bitcoinrpc}
_LOG_FILTERS=${LOG_FILTERS:-DEBUG}
_REDIS_URL=${REDIS_URL:-redis://keydb:6379}

echo "waiting for $_INDEXER to appear ..."
while [ ! -f $_INDEXER ]; do
  sleep 5
done
export RUST_LOG=${_LOG_FILTERS}

/opt/metashrew/target/release/metashrew-keydb --daemon-rpc-url $_DAEMON_RPC_ADDR --redis $_REDIS_URL --indexer $_INDEXER --auth ${_AUTH}
