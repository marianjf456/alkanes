import bitcoin from "bitcoinjs-lib";

export const DEFAULT_FEE_RATE = 10;
export const DEFAULT_FEE = 250;
export const DEFAULT_FUND_AMOUNT = 120000;
export const DEFAULT_SEND_AMOUNT = 2000;

export const InvalidValues = {
  feeRate: [-1, 1000000000, 0.000000001, "string", 10e12],
  sendAmount: [-1, 1000000000, 0.000000001, "string", 10e12],
};

export const RANDOM_ADDRESS = "bcrt1qz3y37epk6hqlul2pt09hrwgj0s09u5g6kzrkm2";
export const DUMMY_ADDRESS =
  "bcrt1pket3e54uyfx59msvs6qqdrx4yyfrg0z2w2m8a0sfxvkrwwwn3afqpvzwgp";

export const REGTEST_FAUCET = {
  mnemonic:
    "hub dinosaur mammal approve riot rebel library legal sick discover loop alter",
  nativeSegwit: {
    address: "bcrt1qzr9vhs60g6qlmk7x3dd7g3ja30wyts48sxuemv",
    publicKey:
      "03d3af89f242cc0df1d7142e9a354a59b1cd119c12c31ff226b32fb77fa12acce2",
  },
  taproot: {
    address: "bcrt1p45un5d47hvfhx6mfezr6x0htpanw23tgll7ppn6hj6gfzu3x3dnsaegh8d",
    publicKey:
      "022ffc336daa8196f1aa796135a568b1125ba08c2879c22468effea8e4a0c4c8b9",
    publicKeyXonly:
      "2ffc336daa8196f1aa796135a568b1125ba08c2879c22468effea8e4a0c4c8b9",
  },
  privateKey: "bc1p45un5d47hvfhx6mfezr6x0htpanw23tgll7ppn6hj6gfzu3x3dns8g57gc",
  publicKey:
    "03d3af89f242cc0df1d7142e9a354a59b1cd119c12c31ff226b32fb77fa12acce2",
  wif: "cTBsa8seu4xA7EZ7N2AXeq2qUfrVsD2KS3F7Tj72WKaXF15hp7Vq",
};

// "m / purpose' / coin_type' / account' / change"
export const LEGACY_HD_PATH = "m/44'/0'/0'/0"; // Legacy btc
export const NESTED_SEGWIT_HD_PATH = "m/49'/0'/0'/0"; // BIP49 - P2WPKH-nested-in-P2SH (addresses starting with 3
export const SEGWIT_HD_PATH = "m/84'/0'/0'/0"; // BIP84 - Native bech32 Segwit - P2WPKH (addresses starting with bc1q)
export const TAPROOT_HD_PATH = "m/86'/0'/0'/0"; // BIP86 - P2TR (addresses starting with bc1p)

export const LEGACY_HD_PATH_TESTNET = "m/44'/1'/0'/0";
export const NESTED_SEGWIT_HD_PATH_TESTNET = "m/49'/1'/0'/0";
export const SEGWIT_HD_PATH_TESTNET = "m/84'/1'/0'/0";
export const TAPROOT_HD_PATH_TESTNET = "m/86'/1'/0'/0";

export const HDPATH = {
  mainnet: {
    legacy: "m/44'/0'/0'/0",
    nested: "m/49'/0'/0'/0",
    native: "m/84'/0'/0'/0",
    taproot: "m/86'/0'/0'/0",
  },
  testnet: {
    legacy: "m/44'/1'/0'/0",
    nested: "m/49'/1'/0'/0",
    native: "m/84'/1'/0'/0",
    taproot: "m/86'/1'/0'/0",
  },
  regtest: {
    legacy: "m/44'/0'/0'/0",
    nested: "m/49'/0'/0'/0",
    native: "m/84'/0'/0'/0",
    taproot: "m/86'/0'/0'/0",
  },
};

export const INIT_OPTIONS = {
  mainnet: {
    url: "https://mainnet.sandshrew.io",
    apiUrl: "https://mainnet-api.oyl.gg",
    version: "v1",
    projectId: process.env.MAINNET_API_KEY,
    networkType: "mainnet",
    network: bitcoin.networks.bitcoin,
  },
  testnet: {
    url: "https://testnet.sandshrew.io",
    apiUrl: "http://testnet-api.oyl.gg",
    version: "v1",
    projectId: process.env.TESTNET_API_KEY,
    networkType: "testnet",
    network: bitcoin.networks.testnet,
  },
  signet: {
    url: "https://signet.sandshrew.io",
    apiUrl: "http://signet-api.oyl.gg",
    version: "v1",
    projectId: process.env.TESTNET_API_KEY,
    networkType: "signet",
    network: bitcoin.networks.testnet,
  },
  regtest: {
    url: "http://localhost:3000",
    apiUrl: "https://staging-api.oyl.gg",
    version: "v1",
    projectId: "regtest",
    networkType: "regtest",
    network: bitcoin.networks.regtest,
  },
};

export const OYL_INIT_OPTIONS = {
  mainnet: {
    baseUrl: "https://mainnet.sandshrew.io",
    version: "v1",
    projectId: process.env.MAINNET_API_KEY,
    network: "mainnet",
  },
  testnet: {
    baseUrl: "https://testnet.sandshrew.io",
    version: "v1",
    projectId: process.env.TESTNET_API_KEY,
    network: "testnet",
  },
  signet: {
    baseUrl: "https://signet.sandshrew.io",
    version: "v1",
    projectId: process.env.TESTNET_API_KEY,
    network: "signet",
  },
  regtest: {
    baseUrl: "http://localhost:3000",
    version: "v1",
    projectId: "regtest",
    network: "regtest",
  },
};

export const ERRORS = {
  inputNotSigned: "Input was not signed",
  insufficientBalance: "Insufficient Balance",
  sendToLegacy: "Sending bitcoin to legacy address is not supported",
  sendToNestedSegwit:
    "Sending bitcoin to a nested-segwit address is not supported",
  notFinalized:
    "PSBT failed mempool acceptance. Signatures may be incorrect or it may not be finalized.",
  noUtxos: "No UTXOs",
  invalidPsbt: "Transaction could not be extracted do to invalid Psbt.",
  inMempool: "txn-mempool-conflict",
  multiOpreturn: "Error: multi-op-return",
  incorrectOwnerAddress: "Inscription does not belong to the address given",
  sendMergedInscription:
    "Unable to send from UTXO with multiple inscriptions. Split UTXO before sending.",
};

//
export const TESTNET_TEST_ACCOUNT = {
  address: "tb1pa8kj5lna6h4ezkmx0gtszr7rrfff3gefd4trj6hvgwsguwhhd8wqlc2se6",
  collectibleSendUtxoTxId: "",
  brc20SendUtxoTxId:
    "6909e6ec323aebdf3ea40bd6e373fcc2473504235366db87d3e602e50737d76e",
  brc20BuyUtxoTxId: "",
};
