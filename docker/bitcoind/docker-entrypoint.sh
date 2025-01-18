#!/bin/sh -x
set -e


BITCOIN_RPC_PORT=18444
CONTAINER_IP=$(hostname -i | awk '{print $1}')
bcli() {
    bitcoin-cli -rpcuser=bitcoinrpc -rpcpassword=bitcoinrpc -rpcport=$BITCOIN_RPC_PORT -rpcconnect=${CONTAINER_IP} "$@"
}

# Start bitcoind in background with the original command line arguments
bitcoind "$@" 

PID=$!

# Wait for bitcoind to be ready
until bcli getnewaddress > /dev/null 2>&1
do
  bcli getnewaddress
  echo "Waiting for bitcoind to be ready..."
  sleep 1
done

# Get a new address to mine to
ADDRESS=$(bcli getnewaddress)

# Generate 200 blocks to this address
bcli generatetoaddress 200 "$ADDRESS"
kill $PID

# Keep the container running with the original bitcoind process
exec bitcoind -daemon=0 "$@"
