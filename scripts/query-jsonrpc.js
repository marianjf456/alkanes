import { AlkanesRpc } from "../lib/rpc.js";

const alkanes = new AlkanesRpc('https://mainnet.sandshrew.io/v2/lasereyes');

// Query protorunes balance
const balance = await alkanes.protorunesbyaddress({
  address: 'bc1pr8vjq0fk89f5sw3r4n9scrasvw7kaud9akhzw57c3ygycsjspvvseyjcma',
  protocolTag: 1n,
});

console.log('Protorunes balance:', balance);

// Simulate transaction
const simulation = await alkanes.simulate({
  alkanes: [],
  block: '',
  transaction: '',
  height: 1000000n,
  txindex: 0,
  target: {
    block: 2n,
    tx: 465n,
  },
  inputs: [99n],
  pointer: 0,
  refundPointer: 0,
  vout: 0,
});

console.log('Simulation result:', simulation);
