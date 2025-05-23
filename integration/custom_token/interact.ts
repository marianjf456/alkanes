import * as btc from '@scure/btc-signer';
import { Transaction } from '@scure/btc-signer';
import { ProtoStone, ProtoStoneMessage } from '../../lib/protorune/protostone';
import { REGTEST_PARAMS, REGTEST_FAUCET, USER_WALLET, OTHER_USER_WALLET, network } from '../lib/constants';
import { Client, MockAlkaneId } from '../lib/client';
import { stringToBytes, bytesToHex, bytesToString, hexToBytes } from '../../lib/bytes';
import { encipher } from '../../lib/opcodes'; // Assuming this is the correct path
import { u128 } from "as-bignum/assembly"; // For type annotation, actual values are BigInt

// --- Configuration ---
// This Alkane ID would come from the deploy.ts script output.
// Replace with actual block and tx index after deployment.
const DEPLOYED_ALKANE_ID: MockAlkaneId = {
  block: 700000n, // Placeholder block height
  tx: 1,          // Placeholder transaction index in the block
};

const client = new Client();
const deployerWallet = REGTEST_FAUCET; // Matches deployer in deploy.ts
const userWallet = USER_WALLET;
const otherUserWallet = OTHER_USER_WALLET;

// --- Assumed Opcodes (must match contract's internal dispatch or export order if numeric) ---
// These are based on the order of functions in the AssemblyScript contract, assuming a simple numeric dispatch.
// init was 0 in deploy.ts
const OP_TRANSFER = 1;
const OP_APPROVE = 2;
const OP_TRANSFER_FROM = 3;
const OP_BUY = 4;
const OP_SELL = 5;
const OP_BALANCE_OF = 6;
const OP_ALLOWANCE = 7;
const OP_GET_NAME = 8;
const OP_GET_SYMBOL = 9;
const OP_GET_TOTAL_SUPPLY = 10;
const OP_GET_DEPLOYER = 11;

// Helper to convert P2TR object to string address
function getP2TRAddress(wallet: typeof REGTEST_FAUCET, networkObj: typeof REGTEST_PARAMS.network): string {
    return btc.p2tr(wallet.publicKey!, undefined, networkObj).address!;
}

// --- Helper for Calling Contract Functions ---
async function callContract(
  alkaneId: MockAlkaneId,
  opcode: number,
  args: (string | bigint | number | Uint8Array)[], // More specific typing for args
  paymentOutputs: btc.TxOutput[] = [], // For 'buy' or other payable functions
  signerWallet: typeof REGTEST_FAUCET = userWallet // Default to user for interactions
): Promise<{ txId: string, simulationResult?: Uint8Array | null }> { // simulationResult for queries
  
  const calldata = encipher([opcode, ...args]);
  console.log(`Calling contract with opcode ${opcode}, args: ${args.join(', ')}, calldata: ${bytesToHex(new Uint8Array(calldata))}`);

  const protostoneData = {
    protostones: [
      ProtoStone.message({
        protocolTag: 1n, // Alkanes protocol tag
        calldata: new Uint8Array(calldata),
        pointer: BigInt(alkaneId.tx), // Use tx index from AlkaneID as pointer to the deployed contract
        // blockHeight: alkaneId.block // Assuming ProtoStoneMessage might take blockHeight for targeting
                                     // The spec for ProtoStone.message used pointer, not blockHeight directly
                                     // If pointer refers to ordinal on a specific block, this is implicit.
      }),
    ],
  };
  const protostonePayload = ProtoStone.encode(protostoneData);

  // For query functions, we might use a simulate_call endpoint if available
  // For now, all calls create a transaction.
  // A real client would differentiate or have a specific query method.
  const isQuery = [OP_GET_NAME, OP_GET_SYMBOL, OP_GET_TOTAL_SUPPLY, OP_GET_DEPLOYER, OP_BALANCE_OF, OP_ALLOWANCE].includes(opcode);

  if (isQuery && client.simulateCall) { // Hypothetical simulateCall for queries
    console.log(`Simulating query for opcode ${opcode}...`);
    try {
        const result = await client.simulateCall({
            alkane_id_block: alkaneId.block,
            alkane_id_tx_index: BigInt(alkaneId.tx),
            calldata: new Uint8Array(calldata),
            // payment: paymentOutputs, // unlikely for queries
        });
        console.log("Simulation successful.");
        return { txId: "simulation", simulationResult: result ? new Uint8Array(result) : null };
    } catch (e) {
        console.error("Simulation failed:", e);
        throw e;
    }
  }

  // Proceed with transaction for state changes or if no simulateCall
  const tx = new Transaction();
  const signerP2TR = btc.p2tr(signerWallet.publicKey!, undefined, REGTEST_PARAMS.network);

  // Input: Placeholder - find a UTXO for the signerWallet
  // This needs a proper UTXO management system. For now, assume faucet can cover.
  // Or use a pre-funded UTXO for the signer.
  // Using REGTEST_FAUCET for simplicity to fund any transaction if signerWallet has no UTXOs.
  const fundingSourceWallet = REGTEST_FAUCET; 
  const fundingSourceP2TR = btc.p2tr(fundingSourceWallet.publicKey!, undefined, REGTEST_PARAMS.network);
  const utxos = await client.getUtxos(fundingSourceP2TR.address!);
  if (utxos.length === 0) {
    throw new Error(`No UTXOs found for ${fundingSourceP2TR.address} to fund the transaction.`);
  }
  const utxo = utxos.sort((a,b) => b.value - a.value)[0]; // Use largest UTXO

  tx.addInput({
    txid: utxo.txid,
    index: utxo.vout,
    witnessUtxo: { script: fundingSourceP2TR.script!, amount: BigInt(utxo.value) },
    tapInternalKey: fundingSourceWallet.publicKey!,
  });

  // Outputs for payments (e.g., for 'buy')
  for (const pOut of paymentOutputs) {
    tx.addOutput({ address: pOut.address, amount: BigInt(pOut.amount) });
  }

  // OP_RETURN output for protostone data
  tx.addOutput({
    script: btc.Script.encode([btc.OP.RETURN, protostonePayload]),
    amount: 0n,
  });

  // Change output
  const feeRate = 1; // sat/vB
  let totalOutputAmount = paymentOutputs.reduce((sum, p) => sum + p.amount, 0n);
  // Estimate size and fee (rough estimate)
  const estimatedSize = tx.vsize + 34; // Add 34 for change output
  const fee = BigInt(estimatedSize * feeRate);
  const changeAmount = BigInt(utxo.value) - totalOutputAmount - fee;

  if (changeAmount > 546n) { // Dust limit
    tx.addOutput({ address: signerP2TR.address!, amount: changeAmount });
  } else if (changeAmount < 0n) {
    throw new Error(`Insufficient funds for transaction: needed ${totalOutputAmount + fee}, got ${utxo.value}`);
  }
  // If change is dust, it's contributed to fees.

  tx.signIdx(signerWallet.privateKey!, 0); // Assuming single input from signer
  tx.finalize();

  console.log(`Broadcasting transaction for opcode ${opcode}...`);
  const txId = await client.broadcastTx(tx.hex);
  console.log(`Transaction broadcasted: ${txId}. Waiting for confirmation...`);
  await client.waitForTx(txId);
  console.log(`Transaction ${txId} confirmed.`);
  
  // For state-changing operations, we might want to fetch events or logs if the API supports it.
  // For queries made via tx, the result isn't directly returned here.
  // One would typically look at events or use an off-chain indexer/API that can read contract state.
  // The `simulationResult` path is preferred for queries.
  return { txId, simulationResult: null };
}

// --- Interaction Functions ---

async function getName(alkaneId: MockAlkaneId) {
  console.log("\n--- Getting Name ---");
  const { simulationResult } = await callContract(alkaneId, OP_GET_NAME, []);
  if (simulationResult) {
    console.log("Name (raw):", bytesToHex(simulationResult));
    console.log("Name (decoded):", bytesToString(simulationResult));
  } else {
    console.log("Query made via transaction, result not directly available from this call.");
  }
}

async function getSymbol(alkaneId: MockAlkaneId) {
  console.log("\n--- Getting Symbol ---");
  const { simulationResult } = await callContract(alkaneId, OP_GET_SYMBOL, []);
  if (simulationResult) {
    console.log("Symbol (raw):", bytesToHex(simulationResult));
    console.log("Symbol (decoded):", bytesToString(simulationResult));
  } else {
    console.log("Query made via transaction, result not directly available from this call.");
  }
}

async function getTotalSupply(alkaneId: MockAlkaneId) {
  console.log("\n--- Getting Total Supply ---");
  const { simulationResult } = await callContract(alkaneId, OP_GET_TOTAL_SUPPLY, []);
  if (simulationResult) {
    console.log("Total Supply (raw):", bytesToHex(simulationResult));
    // Assuming u128 LE bytes from AS. Needs arrayBufferToU128 from deploy.ts or similar.
    // For simplicity, logging hex. Proper decoding needed.
    // const supply = u128.fromUint8ArrayLE(Uint8Array.wrap(simulationResult));
    // console.log("Total Supply (decoded):", supply.toString());
    console.log("Total Supply (decoded, hex for u128):", bytesToHex(simulationResult));
  } else {
    console.log("Query made via transaction, result not directly available from this call.");
  }
}

async function getDeployer(alkaneId: MockAlkaneId) {
  console.log("\n--- Getting Deployer ---");
  const { simulationResult } = await callContract(alkaneId, OP_GET_DEPLOYER, []);
  if (simulationResult) {
    console.log("Deployer Address (raw hex):", bytesToHex(simulationResult));
  } else {
    console.log("Query made via transaction, result not directly available from this call.");
  }
}

async function getBalance(alkaneId: MockAlkaneId, ownerAddressString: string) {
  console.log(`\n--- Getting Balance for ${ownerAddressString} ---`);
  const { simulationResult } = await callContract(alkaneId, OP_BALANCE_OF, [ownerAddressString]);
  if (simulationResult) {
    console.log(`Balance of ${ownerAddressString} (raw):`, bytesToHex(simulationResult));
    // const balance = u128.fromUint8ArrayLE(Uint8Array.wrap(simulationResult));
    // console.log(`Balance (decoded): ${balance.toString()}`);
    console.log(`Balance (decoded, hex for u128): ${bytesToHex(simulationResult)}`);
  } else {
    console.log("Query made via transaction, result not directly available from this call.");
  }
}

async function performTransfer(alkaneId: MockAlkaneId, recipientAddressString: string, amount: bigint) {
  console.log(`\n--- Performing Transfer: ${amount} to ${recipientAddressString} ---`);
  const senderAddressString = getP2TRAddress(userWallet, REGTEST_PARAMS.network);
  await callContract(alkaneId, OP_TRANSFER, [recipientAddressString, amount], [], userWallet);
  console.log("Transfer call completed.");
  await getBalance(alkaneId, senderAddressString);
  await getBalance(alkaneId, recipientAddressString);
}

async function performApprove(alkaneId: MockAlkaneId, spenderAddressString: string, amount: bigint) {
  console.log(`\n--- Performing Approve: Spender ${spenderAddressString}, Amount ${amount} ---`);
  const ownerAddressString = getP2TRAddress(userWallet, REGTEST_PARAMS.network); // User is owner
  await callContract(alkaneId, OP_APPROVE, [spenderAddressString, amount], [], userWallet);
  console.log("Approve call completed.");
  // Call allowance to verify
  console.log(`--- Getting Allowance for Owner ${ownerAddressString}, Spender ${spenderAddressString} ---`);
  const { simulationResult } = await callContract(alkaneId, OP_ALLOWANCE, [ownerAddressString, spenderAddressString]);
  if (simulationResult) {
    console.log(`Allowance (raw):`, bytesToHex(simulationResult));
    console.log(`Allowance (decoded, hex for u128): ${bytesToHex(simulationResult)}`);
  } else {
    console.log("Query made via transaction, result not directly available from this call.");
  }
}

async function performTransferFrom(alkaneId: MockAlkaneId, ownerAddressString: string, recipientAddressString: string, amount: bigint) {
  console.log(`\n--- Performing TransferFrom: Owner ${ownerAddressString}, Recipient ${recipientAddressString}, Amount ${amount} ---`);
  // Current user (userWallet) is the spender
  const spenderAddressString = getP2TRAddress(userWallet, REGTEST_PARAMS.network);
  await callContract(alkaneId, OP_TRANSFER_FROM, [ownerAddressString, recipientAddressString, amount], [], userWallet);
  console.log("TransferFrom call completed.");
  await getBalance(alkaneId, ownerAddressString);
  await getBalance(alkaneId, recipientAddressString);
  await getBalance(alkaneId, spenderAddressString); // Spender's balance shouldn't change
}

async function performBuy(alkaneId: MockAlkaneId, deployerBtcAddress: string, btcAmountSats: bigint) {
  console.log(`\n--- Performing Buy: Paying ${btcAmountSats} sats to ${deployerBtcAddress} ---`);
  const buyerWallet = otherUserWallet; // Assuming 'otherUserWallet' is the buyer
  const buyerTokenAddressString = getP2TRAddress(buyerWallet, REGTEST_PARAMS.network);
  
  const paymentOutputs: btc.TxOutput[] = [{ address: deployerBtcAddress, amount: btcAmountSats }];
  await callContract(alkaneId, OP_BUY, [], paymentOutputs, buyerWallet); // No args for buy() itself
  console.log("Buy call completed.");
  await getBalance(alkaneId, buyerTokenAddressString); // Check buyer's new token balance
  // Also check deployer's token balance if desired (would require deployer's token address string)
}

async function performSell(alkaneId: MockAlkaneId, amountTokens: bigint) {
  console.log(`\n--- Performing Sell: Selling ${amountTokens} tokens ---`);
  const sellerWallet = userWallet; // User sells tokens
  const sellerTokenAddressString = getP2TRAddress(sellerWallet, REGTEST_PARAMS.network);
  await callContract(alkaneId, OP_SELL, [amountTokens], [], sellerWallet);
  console.log("Sell call completed.");
  await getBalance(alkaneId, sellerTokenAddressString);
  // Also check deployer's token balance
  const deployerTokenAddress = getP2TRAddress(deployerWallet, REGTEST_PARAMS.network);
  await getBalance(alkaneId, deployerTokenAddress);
}


// --- Main Demo Function ---
async function main() {
  console.log("Starting custom token interaction script...");
  console.log(`Using Alkane ID: Block ${DEPLOYED_ALKANE_ID.block}, Tx ${DEPLOYED_ALKANE_ID.tx}`);

  // Ensure client is connected (or can connect)
  // await client.ensureConnected(); // Example

  // Addresses for interaction
  const deployerAddressString = getP2TRAddress(deployerWallet, REGTEST_PARAMS.network);
  const userAddressString = getP2TRAddress(userWallet, REGTEST_PARAMS.network);
  const otherUserAddressString = getP2TRAddress(otherUserWallet, REGTEST_PARAMS.network);

  // 1. Query initial state
  await getName(DEPLOYED_ALKANE_ID);
  await getSymbol(DEPLOYED_ALKANE_ID);
  await getTotalSupply(DEPLOYED_ALKANE_ID);
  await getDeployer(DEPLOYED_ALKANE_ID);
  await getBalance(DEPLOYED_ALKANE_ID, deployerAddressString); // Deployer should have total supply
  await getBalance(DEPLOYED_ALKANE_ID, userAddressString);   // User should have 0

  // 2. Transfer tokens from Deployer to User
  // This requires deployerWallet to sign. Modifying callContract or having separate helper.
  // For now, let's assume userWallet has some tokens from a previous faucet-like operation
  // or we'll do a user-to-otherUser transfer.
  // Let's perform a transfer from userWallet (assuming it got tokens) to otherUserWallet
  // To make this runnable, userWallet needs tokens first.
  // Let's assume deployer transfers to userWallet.
  console.log(`\n--- Performing Initial Transfer from Deployer to User (${userAddressString}) ---`);
  const initialTransferAmount = 100000n; // 1 token with 8 decimals, or 100000 smallest units
  // This call needs to be signed by deployerWallet
  await callContract(DEPLOYED_ALKANE_ID, OP_TRANSFER, [userAddressString, initialTransferAmount], [], deployerWallet);
  console.log("Initial transfer from deployer to user completed.");
  await getBalance(DEPLOYED_ALKANE_ID, deployerAddressString);
  await getBalance(DEPLOYED_ALKANE_ID, userAddressString);

  // 3. User transfers to OtherUser
  const transferAmount = 30000n;
  await performTransfer(DEPLOYED_ALKANE_ID, otherUserAddressString, transferAmount);

  // 4. User approves OtherUser to spend tokens
  const approveAmount = 10000n;
  await performApprove(DEPLOYED_ALKANE_ID, otherUserAddressString, approveAmount);

  // 5. OtherUser performs transferFrom User's tokens to themselves (or another address)
  // Here, otherUserWallet is the spender (signer)
  const transferFromAmount = 5000n;
  console.log(`\n--- OtherUser Performing TransferFrom: Owner ${userAddressString}, Recipient ${otherUserAddressString}, Amount ${transferFromAmount} ---`);
  await callContract(
    DEPLOYED_ALKANE_ID,
    OP_TRANSFER_FROM,
    [userAddressString, otherUserAddressString, transferFromAmount],
    [], // No payment outputs
    otherUserWallet // Signer is otherUserWallet (the spender)
  );
  console.log("TransferFrom by OtherUser completed.");
  await getBalance(DEPLOYED_ALKANE_ID, userAddressString);
  await getBalance(DEPLOYED_ALKANE_ID, otherUserAddressString);


  // 6. Perform Buy (OtherUser buys tokens from Deployer)
  const btcPaymentAmountSats = 100000n; // e.g., 100,000 satoshis
  // Deployer's BTC address (where payment should be sent)
  // This must be an address the deployer controls and can be verified by the contract's 'buy' logic.
  // The AS 'buy' logic compares output.script_pubkey with DEPLOYER_KEY from storage.
  // So, the payment must go to the P2TR address associated with deployerWallet.publicKey
  const deployerBtcPaymentAddress = getP2TRAddress(deployerWallet, REGTEST_PARAMS.network);
  await performBuy(DEPLOYED_ALKANE_ID, deployerBtcPaymentAddress, btcPaymentAmountSats);

  // 7. Perform Sell (User sells tokens back to Deployer)
  const sellAmountTokens = 20000n;
  await performSell(DEPLOYED_ALKANE_ID, sellAmountTokens);

  console.log("\nCustom token interaction script finished.");
}

// Execute main demo
main().catch(console.error);

// Note on u128 decoding for display:
// The `bytesToHex` is a placeholder. For actual display of u128 values from simulationResult:
// import { u128 as U128 } from "as-bignum/assembly"; // At top
// function arrayBufferToU128(buffer: ArrayBuffer): U128 {
//   if (!buffer || buffer.byteLength == 0) return U128.Zero;
//   return U128.fromUint8ArrayLE(Uint8Array.wrap(buffer));
// }
// Then in query functions:
// const val = arrayBufferToU128(simulationResult);
// console.log("Decoded value:", val.toString());
// This requires `as-bignum` to be available in the JS context, or a compatible JS library for u128.
// For simplicity in this script generation, direct u128 JS object decoding is omitted from callContract,
// but the raw hex is logged. The AS type `u128` is from `as-bignum`.
// The `encipher` function is also assumed to handle BigInt for u128 args correctly.
// The `bytesToString` should correctly decode UTF8 strings from ArrayBuffer.
// The `client.simulateCall` is hypothetical; if not present, queries also go via tx and results are not immediate.
// The UTXO management in `callContract` is simplified (uses faucet's largest UTXO for any call not by faucet).
// A more robust solution would use specific UTXOs belonging to the `signerWallet`.
// The script assumes `REGTEST_FAUCET` has spendable UTXOs.
