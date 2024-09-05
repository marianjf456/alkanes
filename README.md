# alkanes

![Tests](https://img.shields.io/github/actions/workflow/status/AssemblyScript/assemblyscript/test.yml?branch=main&label=test&logo=github)
![Publish](https://img.shields.io/github/actions/workflow/status/AssemblyScript/assemblyscript/publish.yml?branch=main&label=publish&logo=github)

Repository for the ALKANES metaprotocol.

**The ALKANES specification is hosted at** 👉🏻👉🏼👉🏽👉🏾👉🏿 [https://github.com/kungfuflex/alkanes/wiki](https://github.com/kungfuflex/alkanes/wiki)

#### NOTE: ALKANES does not have a network token

Protocol fees are accepted in terms of Bitcoin and compute is metered with the wasmi fuel implementation, for protection against DoS.

## Building

The ALKANES build script is invoked with the command:

```sh
yarn build
```

This will compile the Rust sources for the runtime / wasmi exports to a WASM target, and it will also build the AssemblyScript sources. Finally, it will use binaryen wasm-merge to link the wasm32 binaries and merge them to a single binary.

The ALKANES build is representative of the database it should construct against the host chain for which it processes block history.

The ALKANES wasm build is output to build/alkanes.wasm and can be run in METASHREW and target any Bitcoin compatible network. Bitcoin forks or drivechains which use the Auxpow structure in the block header are now supported by merit of the inclusion of the most up to date metasrhew-as library. Supported networks thus include Dogecoin and Bellscoin.

## Indexing

```sh
RUST_LOG=DEBUG ./metashrew/target/debug/metashrew-keydb --daemon-rpc-url http://localhost:8332 --indexer ./alkanes/build/alkanes.wasm --redis redis+unix:///$HOME/keydb --start-block 840000 --auth bitcoinrpc:bitcoinrpc
```

## Metaprotocol

ALKANES is a protorunes-compatible subprotocol enabling a programmable variant of runes, via a shared execution environment analogous to smart contracts. Alkanes themselves are assets that can be transacted with on the alkanes meteaprotocol. An alkane is a smart contract but also always a fungible asset. Protocol messages are Runestone compatible (per the runes protocol spec) but extended with the protorunes Protostone structure and, more specifically, the cellpack structure, which functions like a minimal transaction payload on OP_RETURN.


## Author

flex
