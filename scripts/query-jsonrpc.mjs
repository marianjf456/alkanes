import { AlkanesRpc } from "../lib/rpc.js";

const rpc = new AlkanesRpc({ baseUrl: 'http://localhost:8091' });
const prod_rpc = new AlkanesRpc({ baseUrl: 'https://mainnet.sandshrew.io/v2/lasereyes' });

// Query protorunes balance
// const balance = await rpc.protorunesbyaddress({
//   address: 'bc1pr8vjq0fk89f5sw3r4n9scrasvw7kaud9akhzw57c3ygycsjspvvseyjcma',
//   protocolTag: 1n,
// });

// console.log('Protorunes balance:', balance);


// const prod_balance = await prod_rpc.getbytecode({
//   block: 4n,
//   tx: 65518n,
// });

// console.log('Protorunes balance:', prod_balance);
let tx = 600n;
// // Simulate transaction
const simulation = await rpc.simulate({
  alkanes: [],
  block: '',
  transaction: '',
  height: 1000000n,
  txindex: 0,
  target: {
    block: 2n,
    tx: tx,
  },
  inputs: [99n],
  pointer: 0,
  refundPointer: 0,
  vout: 0,
});

console.log('Simulation result:', simulation);
const prodsimulation = await prod_rpc.simulate({
  alkanes: [],
  block: '',
  transaction: '',
  height: 1000000n,
  txindex: 0,
  target: {
    block: 2n,
    tx: tx,
  },
  inputs: [99n],
  pointer: 0,
  refundPointer: 0,
  vout: 0,
});

console.log('prodsimulation result:', prodsimulation);


// diff balance: '082735FBD38C58D44087BAFB1D33584DDF669CC0C1C3D542082CC31F1B84CAC4'
// const txid = '0E46A59CB7816C3143EFEA573E81567550E73CC9EC572A5382BE93B1B01D0A62'

// const balance = await rpc.protorunesbyoutpoint({
//   txid: txid,
//   vout: 0,
//   protocolTag: 1n,
// });

// console.log('Protorunes balance:', balance);


// const prod_balance = await prod_rpc.protorunesbyoutpoint({
//   txid: txid,
//   vout: 0,
//   protocolTag: 1n,
// });

// console.log('Protorunes balance:', prod_balance);

// let trace = await rpc.trace({
//   vout: 4, txid: "2460BCC3D92C061E4A098F51F2B58A3C609F15B1C918C359AC62DFD824933C0B"
// });

// console.log('465 trace result:', JSON.stringify(trace, (key, value) =>
//   typeof value === 'bigint' ? value.toString() + 'n' : value
// ));

//reverts
// let trace = await rpc.trace({
//   vout: 4, txid: "0664FC9A61F5D789478D26323FEB0E23165F78A8CE52484461D483303BD9442A"
// });

// console.log('466 trace result:', JSON.stringify(trace, (key, value) =>
//   typeof value === 'bigint' ? value.toString() + 'n' : value
// ));

// works
// let trace = await rpc.trace({
//   vout: 4, txid: "8BF101787934450931352550F2989D4AEB281DAFA99151C886607E1069178AE9"
// });

// console.log('467 trace result:', JSON.stringify(trace, (key, value) =>
//   typeof value === 'bigint' ? value.toString() + 'n' : value
// ));

//reverts
// trace = await rpc.trace({
//   vout: 4, txid: "B6CE851A52A55DD8D6023B50D75F63BC45127A56EB565C4CFCB615ACCB3F38E8"
// });

// console.log('468 trace result:', JSON.stringify(trace, (key, value) =>
//   typeof value === 'bigint' ? value.toString() + 'n' : value
// ));

//reverts
// let trace = await rpc.trace({
//   vout: 4, txid: "F72971536286B7E5938FA59221F5C76219E6F2E6D6F6613BBC98721D1DD27A4B"
// });

// console.log('469 trace result:', JSON.stringify(trace, (key, value) =>
//   typeof value === 'bigint' ? value.toString() + 'n' : value
// ));


// let t = await rpc.alkanes_id_to_outpoint({
//   block: 2n, tx: 16n
// });

// console.log('result:', t);