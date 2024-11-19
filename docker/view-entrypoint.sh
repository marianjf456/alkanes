#!/bin/bash

_INDEXER=${INDEXER:-/metashrew/indexer.wasm}
_LOG_FILTERS=${LOG_FILTERS:-DEBUG}
export REDIS_URI=${REDIS_URL:-redis://keydb:6379}
export PROGRAM_PATH=${_INDEXER}

echo "waiting for $_INDEXER to appear ..."
while [ ! -f $_INDEXER ]; do
  sleep 5
done
export RUST_LOG=${_LOG_FILTERS}


/opt/metashrew/target/release/metashrew-keydb-view
