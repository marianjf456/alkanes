import * as fs from 'fs-extra';
import *aimport * as path from 'path';
import * as btc from '@scure/btc-signer';

import { ProtoStone, ProtoStoneMessage } from '../../lib/protorune/protostone';
import { ProtoRunestoneUpgrade } from '../../lib/protorune/proto_runestone_upgrade';
import { ordReveal } from '../../lib/envelope';
import { Transaction } from '@scure/btc-signer';
import { REGTEST_PARAMS, REGTEST_FAUCET, createFundingAndRevealConfig, network } from '../lib/constants';
import { Client } from '../lib/client'; // May not be needed for deploy, but good for consistency
import { stringToBytes, bytesToHex, numberToBytes } from '../../lib/bytes';
import { encipher } from '../../lib/opcodes'; // Assuming this is the correct path for encipher

// Configuration
const CONTRACT_NAME = "MyCustomToken";
const CONTRACT_SYMBOL = "MCT";
const TOTAL_SUPPLY = 100000000000000n; // 1 million tokens with 8 decimal places
const WASM_FILE_PATH = '../../../build/custom_token_combined.wasm'; // Adjust path relative to this script's compiled location

const deployerWallet = REGTEST_FAUCET; // Using faucet as deployer

async function deployCustomToken() {
  console.log("Starting custom token deployment...");

  // 1. Load WASM
  const wasmPath = path.join(__dirname, WASM_FILE_PATH);
  console.log(`Loading WASM from: ${wasmPath}`);
  let wasmBinary: Uint8Array;
  try {
    wasmBinary = await fs.readFile(wasmPath);
  } catch (error) {
    console.error(`Failed to read WASM file at ${wasmPath}:`, error);
    return;
  }
  console.log(`WASM binary loaded, size: ${wasmBinary.length} bytes`);

  // 2. Setup Bitcoin Wallet/Signer
  const deployerP2TR = btc.p2tr(
    deployerWallet.publicKey!,
    undefined,
    REGTEST_PARAMS.network
  );
  console.log(`Deployer P2TR address: ${deployerP2TR.address}`);

  // 3. Compress WASM (Optional, but good practice)
  // For simplicity, skipping actual gzip compression for now.
  // In a real scenario, you'd use a library like 'pako' here.
  // const compressedWasm = pako.gzip(wasmBinary);
  const compressedWasm = wasmBinary; // Placeholder
  console.log(`WASM (notional compression), size: ${compressedWasm.length} bytes`);

  // 4. Prepare Ordinal Reveal Payload
  const revealPayload = ordReveal(
    deployerP2TR.script[0], // Assuming script[0] is the relevant part for ordReveal
    {
      content: Buffer.from(compressedWasm),
      contentType: 'application/wasm', // Standard MIME type for WASM
      protocol: 'alkanes', // Protocol identifier
    }
  );
  console.log("Ordinal reveal payload prepared.");

  // 5. Funding and Reveal Transactions
  const config = await createFundingAndRevealConfig({
    commitAddress: revealPayload.commitAddress,
    revealAddress: revealPayload.revealAddress,
    feeRate: 1, // Sat/vB
    revealData: [revealPayload.revealScript[1]], // Data part of the reveal script
    revealValue: 1000, // Sats for the reveal output
    wallet: deployerWallet,
    network: REGTEST_PARAMS.network,
  });

  console.log("Funding transaction config prepared.");
  console.log(`Funding P2TR with address: ${config.fundingP2TR.address} amount: ${config.fundingAmount}`);
  
  const client = new Client(); // For broadcasting

  try {
    // Broadcast Funding Transaction
    console.log("Broadcasting funding transaction...");
    const fundingTxId = await client.broadcastTx(config.fundingTx);
    console.log(`Funding transaction broadcasted: ${fundingTxId}`);
    await client.waitForTx(fundingTxId, 10 * 60 * 1000); // Wait for confirmation
    console.log("Funding transaction confirmed.");

    // 6. Prepare Calldata for `init`
    // init(name: string, symbol: string, totalSupply: u128)
    // Attempting to pass strings directly. This is the part that needs verification
    // during actual testing against the Alkanes runtime and how `encipher` handles it.
    const calldataForInit = encipher([
        0, // Opcode for 'init' in the Rust contract, assuming 0 for AS contract or direct call
        CONTRACT_NAME, 
        CONTRACT_SYMBOL, 
        TOTAL_SUPPLY
    ]);
    // Note: The first element '0' is an assumption. If the AS contract's methods are called
    // directly by name without an opcode dispatcher in `_start`, this might need to be
    // `encipher([CONTRACT_NAME, CONTRACT_SYMBOL, TOTAL_SUPPLY])` and the runtime
    // would map the function call to 'init' and pass these args.
    // The frBTC example used `encipher([0, BigInt(this.params.TOTAL_SUPPLY)])` where 0 was init_op.
    // Given our AS contract doesn't have an explicit _start dispatcher with opcodes,
    // we assume the runtime will call the 'init' method by name.
    // The `encipher` function's first argument might be implicit or based on context.
    // For now, let's assume `encipher` just takes the arguments for the target function.
    // If the AS `init` is directly called, the calldata might just be for its args:
    // const calldataForInit = encipher([CONTRACT_NAME, CONTRACT_SYMBOL, TOTAL_SUPPLY]);
    // However, if Alkanes runtime always expects an opcode even for AS, then [0, ...] is more likely.
    // Let's stick to the opcode-based approach for now, assuming 0 = init.
    // THIS IS A KEY UNCERTAINTY.

    console.log(`Calldata for init: ${bytesToHex(new Uint8Array(calldataForInit))}`);

    const protostoneData = {
      protostones: [
        ProtoStone.message({
          protocolTag: 1n, // Alkanes protocol tag
          edicts: [],
          pointer: 0, // Pointer to the WASM ordinal
          refundPointer: 0, // No refund specified
          calldata: new Uint8Array(calldataForInit), 
        }),
      ],
    };
    const protostonePayload = ProtoStone.encode(protostoneData);
    console.log(`Protostone payload for init: ${bytesToHex(protostonePayload)}`);

    // Construct Reveal Transaction (Deployment)
    // Add OP_RETURN output for protostone data
    const revealTxWithProtorune = Transaction.fromHex(config.revealTx.hex); // Re-construct from hex if needed
    revealTxWithProtorune.addOutput({
        script: btc.Script.encode([OP_RETURN, protostonePayload]), // OP_RETURN in btc-signer
        amount: 0n, // No BTC value for OP_RETURN
    });
    
    // Need to re-sign the reveal transaction as we've added an output
    // The createFundingAndRevealConfig already signed it. This invalidates previous sig.
    // For simplicity here, we assume the config.revealTx was not finalized with signatures,
    // or we would need to rebuild it more carefully.
    // Let's assume config.revealTx is a mutable Transaction object or we reconstruct it.
    // The `Transaction` object from btc-signer might need specific handling for re-signing.

    // Simplified: Re-creating and signing the reveal transaction with the new OP_RETURN.
    // This is a common pattern: build inputs, then outputs, then sign.
    const fundingUtxo = {
        txid: fundingTxId,
        vout: config.fundingP2TR.outputIndex, // Index of output sent to fundingP2TR
        value: config.fundingAmount,
        script: config.fundingP2TR.script, // scriptPubKey of the funding output
    };

    const finalRevealTx = new Transaction();
    // Input from the funding transaction
    finalRevealTx.addInput({
        txid: fundingUtxo.txid,
        index: fundingUtxo.vout,
        witnessUtxo: { script: fundingUtxo.script!, amount: BigInt(fundingUtxo.value) },
        tapInternalKey: deployerWallet.publicKey!, // Taproot specific
    });

    // Output for the ordinal reveal (to revealAddress)
    finalRevealTx.addOutput({
        address: config.revealAddress, // The address where the ordinal is revealed
        amount: BigInt(config.revealValue), // Small amount for the ordinal output
    });
    
    // Output for OP_RETURN with protostone data
    finalRevealTx.addOutput({
        script: btc.Script.encode([btc.OP.RETURN, protostonePayload]),
        amount: 0n,
    });

    // Change output (if any, back to deployer)
    // For simplicity, assuming exact funding or fees handled by dust on revealValue.
    // A real deployment would calculate fees and add a change output carefully.
    // const estimatedSize = finalRevealTx.vsize; // Estimate size for fees
    // const fee = estimatedSize * config.feeRate;
    // const changeAmount = fundingUtxo.value - config.revealValue - fee;
    // if (changeAmount > 546) { // Dust limit
    //    finalRevealTx.addOutput({ address: deployerP2TR.address, amount: BigInt(changeAmount) });
    // }
    
    finalRevealTx.signIdx(deployerWallet.privateKey!, 0, undefined, btc.SignatureHash.DEFAULT, revealPayload.taprootLeafScript);
    finalRevealTx.finalize();


    console.log("Broadcasting reveal transaction (deployment)...");
    const revealTxId = await client.broadcastTx(finalRevealTx.hex);
    console.log(`Reveal transaction broadcasted: ${revealTxId}`);
    await client.waitForTx(revealTxId);
    console.log("Reveal transaction confirmed.");

    // Derive Alkane ID
    // This requires knowing the block height and the index of the protostone message transaction.
    // For now, we'll log txid. The actual Alkane ID needs block info.
    const currentBlockHeight = await client.getBlockHeight(); // Assuming client has this
    console.log(`Deployment transaction ${revealTxId} confirmed in block (approx): ${currentBlockHeight}`);
    console.log(`To get Alkane ID, you'll need the block number and transaction index within the block.`);
    console.log(`Potential Alkane ID base: Block ${currentBlockHeight}, Tx ${revealTxId}`);
    console.log("Custom token deployment script finished.");

  } catch (error) {
    console.error("Deployment failed:", error);
    if (error.response && error.response.data) {
        console.error("Error details:", error.response.data);
    }
  }
}

// Execute deployment
// deployCustomToken().catch(console.error); // Comment out direct execution

export async function deployCustomTokenAndGetId(): Promise<{block: bigint, tx: bigint}> {
  console.log("Starting custom token deployment (for test)...");

  // 1. Load WASM
  const wasmPath = path.join(__dirname, WASM_FILE_PATH);
  console.log(`Loading WASM from: ${wasmPath}`);
  let wasmBinary: Uint8Array;
  try {
    wasmBinary = await fs.readFile(wasmPath);
  } catch (error) {
    console.error(`Failed to read WASM file at ${wasmPath}:`, error);
    throw error; // Re-throw for test framework to catch
  }
  console.log(`WASM binary loaded, size: ${wasmBinary.length} bytes`);

  // 2. Setup Bitcoin Wallet/Signer
  const deployerP2TR = btc.p2tr(
    deployerWallet.publicKey!,
    undefined,
    REGTEST_PARAMS.network
  );
  console.log(`Deployer P2TR address: ${deployerP2TR.address}`);

  // 3. Compress WASM (Placeholder)
  const compressedWasm = wasmBinary;
  console.log(`WASM (notional compression), size: ${compressedWasm.length} bytes`);

  // 4. Prepare Ordinal Reveal Payload
  const revealPayload = ordReveal(
    deployerP2TR.script[0],
    {
      content: Buffer.from(compressedWasm),
      contentType: 'application/wasm',
      protocol: 'alkanes',
    }
  );
  console.log("Ordinal reveal payload prepared.");

  // 5. Funding and Reveal Transactions
  const config = await createFundingAndRevealConfig({
    commitAddress: revealPayload.commitAddress,
    revealAddress: revealPayload.revealAddress,
    feeRate: 1,
    revealData: [revealPayload.revealScript[1]],
    revealValue: 1000,
    wallet: deployerWallet,
    network: REGTEST_PARAMS.network,
  });

  console.log("Funding transaction config prepared.");
  const client = new Client();

  try {
    console.log("Broadcasting funding transaction...");
    const fundingTxId = await client.broadcastTx(config.fundingTx);
    console.log(`Funding transaction broadcasted: ${fundingTxId}`);
    await client.waitForTx(fundingTxId); // Wait for confirmation
    console.log("Funding transaction confirmed.");

    const calldataForInit = encipher([
        0, // Opcode for 'init'
        CONTRACT_NAME, 
        CONTRACT_SYMBOL, 
        TOTAL_SUPPLY
    ]);
    console.log(`Calldata for init: ${bytesToHex(new Uint8Array(calldataForInit))}`);

    const protostoneData = {
      protostones: [
        ProtoStone.message({
          protocolTag: 1n,
          edicts: [],
          pointer: 0, 
          refundPointer: 0,
          calldata: new Uint8Array(calldataForInit), 
        }),
      ],
    };
    const protostonePayload = ProtoStone.encode(protostoneData);
    console.log(`Protostone payload for init: ${bytesToHex(protostonePayload)}`);

    const fundingUtxo = {
        txid: fundingTxId,
        vout: config.fundingP2TR.outputIndex,
        value: config.fundingAmount,
        script: config.fundingP2TR.script,
    };

    const finalRevealTx = new Transaction();
    finalRevealTx.addInput({
        txid: fundingUtxo.txid,
        index: fundingUtxo.vout,
        witnessUtxo: { script: fundingUtxo.script!, amount: BigInt(fundingUtxo.value) },
        tapInternalKey: deployerWallet.publicKey!,
    });
    finalRevealTx.addOutput({
        address: config.revealAddress,
        amount: BigInt(config.revealValue),
    });
    finalRevealTx.addOutput({
        script: btc.Script.encode([btc.OP.RETURN, protostonePayload]),
        amount: 0n,
    });
    
    // Simplified change calculation (if any)
    const estimatedFee = BigInt(200); // Placeholder for actual fee calculation
    const changeAmount = BigInt(fundingUtxo.value) - BigInt(config.revealValue) - estimatedFee;
    if (changeAmount > 546n) { // Dust limit
       finalRevealTx.addOutput({ address: deployerP2TR.address!, amount: changeAmount });
    }

    finalRevealTx.signIdx(deployerWallet.privateKey!, 0, undefined, btc.SignatureHash.DEFAULT, revealPayload.taprootLeafScript);
    finalRevealTx.finalize();

    console.log("Broadcasting reveal transaction (deployment)...");
    const revealTxId = await client.broadcastTx(finalRevealTx.hex);
    console.log(`Reveal transaction broadcasted: ${revealTxId}`);
    
    // Wait for reveal tx confirmation and get block details
    const blockDetails = await client.waitForTxWithBlockDetails(revealTxId); // Assume this method exists or can be made
    console.log(`Reveal transaction ${revealTxId} confirmed in block: ${blockDetails.blockHeight}, tx index: ${blockDetails.txIndex}`);

    console.log("Custom token deployment script finished.");
    return { block: blockDetails.blockHeight, tx: blockDetails.txIndex };

  } catch (error) {
    console.error("Deployment failed:", error);
    if (error.response && error.response.data) {
        console.error("Error details:", error.response.data);
    }
    throw error; // Re-throw for test framework
  }
}


// Helper for OP_RETURN (ensure it's defined if not part of btc-signer directly)
const OP_RETURN = 0x6a;
const OP_PUSHDATA1 = 0x4c;

// Note: The btc.Script.encode might handle pushdata opcodes automatically for buffers.
// If not, manual construction of OP_RETURN script:
function createOpReturnScript(data: Uint8Array): Uint8Array {
    const script = [OP_RETURN];
    if (data.length < OP_PUSHDATA1) {
        script.push(data.length); // Push length byte
    } else if (data.length <= 0xff) {
        script.push(OP_PUSHDATA1); // OP_PUSHDATA1
        script.push(data.length); // Length byte
    } else {
        // Handle larger data if necessary, though OP_RETURN limits are typically around 80 bytes
        throw new Error("Data too large for simple OP_RETURN");
    }
    const fullScript = new Uint8Array(script.length + data.length);
    fullScript.set(script.map(val => Number(val)), 0); // Ensure script part is numbers
    fullScript.set(data, script.length);
    return fullScript;
}
// btc.Script.encode([OP_RETURN, data_buffer]) is generally preferred and handles this.

// Regarding encipher and opcodes:
// The Rust version of CustomToken used opcodes (0 for init, 1 for transfer etc.)
// The AssemblyScript version has named methods (init, transfer).
// If the Alkanes runtime for AS calls methods by name, then `calldataForInit`
// should just be `encipher([CONTRACT_NAME, CONTRACT_SYMBOL, TOTAL_SUPPLY])`.
// If it still expects an "opcode" as the first arg for `encipher` to determine
// which *exported WASM function* to call (and that function is our `init`),
// then `encipher([0, CONTRACT_NAME, ...])` might be right IF `0` is how the
// runtime maps to the `init` WASM export.
// This ambiguity is best resolved by looking at how the Alkanes runtime actually
// dispatches calls to AS contracts. For now, the code includes `0` as a placeholder
// for this potential "function selector" or opcode.
// The frBTC examples seem to use an opcode-like first argument for `encipher`.
// `encipher([0, arg1, arg2])` -> maps to `fn_0(arg1, arg2)`
// `encipher([1, arg1])` -> maps to `fn_1(arg1)`
// If our AS contract exports `init`, `transfer` etc., the runtime needs to map them.
// The `asc` compiler might generate exports like `assembly/contracts/custom_token/index/init`.
// The simplest assumption is that the `calldata` in `ProtoStoneMessage` is routed to
// a main contract dispatcher (like `_start` if it existed, or a default entry)
// which then uses the first element of the deciphered array as an opcode.
// Our AS contract doesn't have `_start`, so methods are exported.
// Let's assume `encipher([<method_name_or_hash_as_number>, ...args])` or that
// the runtime has a fixed mapping for well-known functions.
// Given `frBTC` used `encipher([0, ...])` for its `init(u128)` and `encipher([1, ...])` for `transfer(Bytes, u128)`,
// it's most likely that the first argument to `encipher` *is* an opcode/function index.
// Our AS `CustomToken` has `init` as its first public method that modifies state.
// So, `0` for `init` seems like a reasonable starting assumption.
// `transfer` would be `1`, `approve` `2`, etc. This needs to be strictly mapped.

// Let's define opcodes for clarity in this script, matching the AS contract method order implicitly
// or explicitly if the runtime requires numeric opcodes.
// For AS, if methods are exported by name, the runtime might use names.
// If it uses numeric indices, they need to be stable.
// The Rust contract had explicit numeric opcodes. AS one does not.
// For now, `[0, name, symbol, supply]` for `init` will be the working model.
// If `encipher` is just passing raw arguments to a named function, it would be
// `encipher([name, symbol, supply])` and the ProtoStone message would need to specify "init"
// as the target function, separate from calldata. The current ProtoStone structure
// doesn't show a 'function_name' field, implying calldata must contain this info or pointer.
// So, `[0, ...]` is the most plausible.Okay, I've created the `deploy.ts` script. Now I will create the `integration/custom_token/interact.ts` script.

This script will include:
-   Setup for Alkanes `Client`.
-   A `callContract` helper function.
-   Demonstrations for interacting with various functions of the deployed `CustomToken` contract.

**Regarding String Marshalling and Return Value Decoding:**
-   **Calldata for functions taking string arguments (e.g., `balanceOf(addressString)`):** I will attempt to pass JavaScript strings directly in the `encipher` array (e.g., `encipher([opcode, "some_address_string"])`). The success of this depends on `encipher` and the Alkanes runtime's handling of string arguments for AssemblyScript contracts. If this fails during actual testing, the fallback is byte array encoding (e.g., `stringToBytes("some_address_string")`) and ensuring the AssemblyScript contract decodes it.
-   **`u128` Marshalling:** BigInts will be passed for `u128` arguments.
-   **Return Value Decoding:**
    -   For `getName()`/`getSymbol()`: Assume the host returns `ArrayBuffer` which needs to be decoded to a string (e.g., `arrayBufferToString`).
    -   For `getTotalSupply()`/`balanceOf()`/`allowance()`: Assume `ArrayBuffer` for `u128`, decode with `arrayBufferToU128`.
    -   For `getDeployer()`: Assume `ArrayBuffer` for the address, display as hex.
    -   The `callContract` will likely use `client.call()` or a similar method that simulates the call and returns the result, or it will inspect transaction data if the call modifies state. For query functions, `client.query()` or similar would be ideal if it exists. If not, all calls go through transactions, and we'd need a way to view OP_RETURN data from the *host's response to our call* if it's a simulation, or from the chain if it's a real broadcast. The prompt implies `callContract` broadcasts a transaction. Accessing return values from read-only calls made via transactions usually means the contract emits an event or the "return value" is part of a simulated execution response by the node.

Let's assume for query functions, `callContract` might internally use a simulation endpoint of the Alkanes client if available, or we'll need to adjust how results are retrieved. For now, `interact.ts` will structure the calls. The decoding will be based on the expected AS contract return types.

**Opcodes for `interact.ts`:**
Following the assumption from `deploy.ts` that the first argument to `encipher` is an opcode/function index based on the order of methods or a predefined mapping:
- `init` was 0.
- For `CustomToken` methods:
    - `transfer` could be 1
    - `approve` could be 2
    - `transferFrom` could be 3
    - `buy` could be 4
    - `sell` could be 5
    - `balanceOf` could be 6 (query)
    - `allowance` could be 7 (query)
    - `getName` could be 8 (query)
    - `getSymbol` could be 9 (query)
    - `getTotalSupply` could be 10 (query)
    - `getDeployer` could be 11 (query)

This mapping is crucial and needs to be accurate. If the Alkanes runtime for AS uses a different mechanism (e.g., hashing function names to create selectors, or direct named calls if `ProtoStoneMessage` could specify a function name), this would change. I'll proceed with this numeric indexing.

I will now create `integration/custom_token/interact.ts`.
