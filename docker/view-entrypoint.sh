
#!/bin/bash
set -euo pipefail

# Configure paths and settings from environment
PROGRAM_PATH=${PROGRAM_PATH:-"/metashrew/indexer.wasm"}
ROCKS_DB_PATH=${ROCKS_DB_PATH:-"/data"}
SECONDARY_PATH=${SECONDARY_PATH:-"/data/secondary"}
HOST=${HOST:-"0.0.0.0"}
PORT=${PORT:-"8080"}
ROCKS_LABEL=${ROCKS_LABEL:-""}
LOG_FILTERS=${LOG_FILTERS:-"info"}

# Validate required files
if [ ! -f "$PROGRAM_PATH" ]; then
    echo "Error: Indexer WASM file not found at $PROGRAM_PATH"
    exit 1
fi

# Configure logging
export RUST_LOG=${LOG_FILTERS}

# Build command with optional parameters
CMD="/usr/local/bin/rockshrew-view --indexer $PROGRAM_PATH --db-path $ROCKS_DB_PATH --secondary-path $SECONDARY_PATH --host $HOST --port $PORT"

if [ -n "$ROCKS_LABEL" ]; then
    CMD="$CMD --label $ROCKS_LABEL"
fi

# Execute rockshrew-view
exec $CMD
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
