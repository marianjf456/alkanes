// Host function imports (Assumed)
// These functions are expected to be provided by the Alkanes runtime environment.
// Their exact names, signatures, and namespaces might differ.
declare namespace AlkanesHost {
  // Returns the address of the account that called the contract function.
  function get_caller(): ArrayBuffer;

  // Retrieves a value from contract storage by key.
  // Returns null if the key does not exist.
  function get_storage(key: ArrayBuffer): ArrayBuffer | null;

  // Sets a value in contract storage.
  function set_storage(key: ArrayBuffer, value: ArrayBuffer): void;

  // Retrieves the list of outputs from the current Bitcoin transaction.
  // This is crucial for the 'buy' functionality.
  // The exact structure of TxOutput will depend on the host's implementation.
  function get_tx_outputs(): Array<TxOutput>; // Array<TxOutput> or an ArrayBuffer that needs decoding

  // Emits an event from the contract.
  function emit_event(topic: string, data: ArrayBuffer): void;

  // Gets the current block height.
  function get_block_height(): u64;

  // Gets the current block timestamp.
  function get_block_time(): u64;

  // Gets the current transaction hash.
  function get_transaction_hash(): ArrayBuffer;
  
  // Logs a message from the contract (for debugging or information).
  function log(message: string): void;
}

// Hypothetical structure for transaction outputs.
// The actual fields and types will depend on what AlkanesHost.get_tx_outputs() provides.
// It's possible get_tx_outputs() returns an ArrayBuffer that needs to be parsed.
// For now, we define a class. If it's an ArrayBuffer, parsing logic will be needed.
export class TxOutput {
  constructor(
    public script_pubkey: ArrayBuffer, // The output script (e.g., P2PKH, P2SH, P2WPKH)
    public value_sats: u64             // The amount in satoshis
  ) {}

  // Placeholder: If get_tx_outputs() returns raw bytes, a static method to parse them.
  // static fromBytes(bytes: ArrayBuffer): TxOutput { ... }
  // static parseMultiple(bytes: ArrayBuffer): Array<TxOutput> { ... }
}


import { u128 } from "as-bignum/assembly"; // For large integer support (totalSupply, balances, amounts)

// --- Utility Functions ---

function stringToArrayBuffer(str: string): ArrayBuffer {
  return String.UTF8.encode(str);
}

function arrayBufferToString(buffer: ArrayBuffer): string {
  return String.UTF8.decode(buffer);
}

function u128ToArrayBuffer(value: u128): ArrayBuffer {
  return value.toUint8Array().buffer; // as-bignum u128 to ArrayBuffer
}

function arrayBufferToU128(buffer: ArrayBuffer): u128 {
  // Ensure the buffer is not null and has a reasonable length for u128
  if (!buffer || buffer.byteLength == 0) return u128.Zero; // Or handle error appropriately
  return u128.fromUint8ArrayLE(Uint8Array.wrap(buffer)); // Assuming LE, common for numbers
}

function u64ToArrayBuffer(value: u64): ArrayBuffer {
  const buffer = new ArrayBuffer(8);
  const view = new DataView(buffer);
  view.setUint64(0, value, true); // true for little-endian
  return buffer;
}

function arrayBufferToU64(buffer: ArrayBuffer): u64 {
    if (!buffer || buffer.byteLength == 0) return 0; // Or handle as error
  const view = new DataView(buffer);
  return view.getUint64(0, true); // true for little-endian
}


// Storage key generation helpers
const NAME_KEY = stringToArrayBuffer("/name");
const SYMBOL_KEY = stringToArrayBuffer("/symbol");
const TOTAL_SUPPLY_KEY = stringToArrayBuffer("/totalsupply");
const DEPLOYER_KEY = stringToArrayBuffer("/deployer");
const BALANCES_PREFIX = "/balances/";
const ALLOWANCES_PREFIX = "/allowances/";

function balanceKey(ownerAddress: string): ArrayBuffer {
  return stringToArrayBuffer(BALANCES_PREFIX + ownerAddress);
}

function allowanceKey(ownerAddress: string, spenderAddress: string): ArrayBuffer {
  return stringToArrayBuffer(ALLOWANCES_PREFIX + ownerAddress + "/" + spenderAddress);
}

// --- Event Argument Encoding ---
// These are simplified examples. A more robust encoding (e.g., CBOR, Protobuf) might be used.

// For Transfer(from: ArrayBuffer, to: ArrayBuffer, amount: u128)
function encodeTransferEventArgs(from: ArrayBuffer, to: ArrayBuffer, amount: u128): ArrayBuffer {
  const fromLen = from.byteLength;
  const toLen = to.byteLength;
  const amountBytes = u128ToArrayBuffer(amount);
  const amountLen = amountBytes.byteLength;

  const buffer = new ArrayBuffer(4 + fromLen + 4 + toLen + 4 + amountLen); // 4 bytes for each length prefix
  const view = new DataView(buffer);
  let offset = 0;

  view.setUint32(offset, fromLen, true); offset += 4;
  memory.copy(buffer, offset, from, 0, fromLen); offset += fromLen;

  view.setUint32(offset, toLen, true); offset += 4;
  memory.copy(buffer, offset, from, 0, toLen); offset += toLen; // Bug: should be 'to'

  view.setUint32(offset, amountLen, true); offset += 4;
  memory.copy(buffer, offset, amountBytes, 0, amountLen);
  
  return buffer;
}
// Fix for encodeTransferEventArgs
function encodeTransferEventArgsFixed(from: ArrayBuffer, to: ArrayBuffer, amount: u128): ArrayBuffer {
  const fromBytes = Uint8Array.wrap(from); // Convert ArrayBuffer to Uint8Array for easier handling
  const toBytes = Uint8Array.wrap(to);
  const amountBytes = Uint8Array.wrap(u128ToArrayBuffer(amount));

  // Simple concatenation for this example. A more robust solution might use length prefixes or a fixed-size format.
  const totalLength = fromBytes.length + toBytes.length + amountBytes.length;
  const result = new Uint8Array(totalLength);
  let offset = 0;
  result.set(fromBytes, offset); offset += fromBytes.length;
  result.set(toBytes, offset); offset += toBytes.length;
  result.set(amountBytes, offset);
  return result.buffer;
}


// For Approval(owner: ArrayBuffer, spender: ArrayBuffer, amount: u128)
function encodeApprovalEventArgs(owner: ArrayBuffer, spender: ArrayBuffer, amount: u128): ArrayBuffer {
  // Similar to encodeTransferEventArgs, ensuring correct buffer source for memory.copy
  const ownerBytes = Uint8Array.wrap(owner);
  const spenderBytes = Uint8Array.wrap(spender);
  const amountBytes = Uint8Array.wrap(u128ToArrayBuffer(amount));

  const totalLength = ownerBytes.length + spenderBytes.length + amountBytes.length;
  const result = new Uint8Array(totalLength);
  let offset = 0;
  result.set(ownerBytes, offset); offset += ownerBytes.length;
  result.set(spenderBytes, offset); offset += spenderBytes.length;
  result.set(amountBytes, offset);
  return result.buffer;
}

// For TokensPurchased(buyer: ArrayBuffer, seller: ArrayBuffer, btcAmountSats: u64, tokenAmount: u128)
function encodeTokensPurchasedEventArgs(buyer: ArrayBuffer, seller: ArrayBuffer, btcAmountSats: u64, tokenAmount: u128): ArrayBuffer {
  const buyerBytes = Uint8Array.wrap(buyer);
  const sellerBytes = Uint8Array.wrap(seller);
  const btcAmountBytes = Uint8Array.wrap(u64ToArrayBuffer(btcAmountSats));
  const tokenAmountBytes = Uint8Array.wrap(u128ToArrayBuffer(tokenAmount));
  
  const totalLength = buyerBytes.length + sellerBytes.length + btcAmountBytes.length + tokenAmountBytes.length;
  const result = new Uint8Array(totalLength);
  let offset = 0;
  result.set(buyerBytes, offset); offset += buyerBytes.length;
  result.set(sellerBytes, offset); offset += sellerBytes.length;
  result.set(btcAmountBytes, offset); offset += btcAmountBytes.length;
  result.set(tokenAmountBytes, offset);
  return result.buffer;
}

// For SellSuccess(seller: ArrayBuffer, recipient: ArrayBuffer, tokenAmount: u128)
function encodeSellSuccessEventArgs(seller: ArrayBuffer, recipient: ArrayBuffer, tokenAmount: u128): ArrayBuffer {
    const sellerBytes = Uint8Array.wrap(seller);
    const recipientBytes = Uint8Array.wrap(recipient);
    const tokenAmountBytes = Uint8Array.wrap(u128ToArrayBuffer(tokenAmount));

    const totalLength = sellerBytes.length + recipientBytes.length + tokenAmountBytes.length;
    const result = new Uint8Array(totalLength);
    let offset = 0;
    result.set(sellerBytes, offset); offset += sellerBytes.length;
    result.set(recipientBytes, offset); offset += recipientBytes.length;
    result.set(tokenAmountBytes, offset);
    return result.buffer;
}


// --- Contract Class ---
// @contract
export class CustomToken {

  // --- Internal Storage Helper Methods ---
  private _getStorageString(key: ArrayBuffer): string | null {
    const valueBuffer = AlkanesHost.get_storage(key);
    if (valueBuffer) {
      return arrayBufferToString(valueBuffer);
    }
    return null;
  }

  private _setStorageString(key: ArrayBuffer, value: string): void {
    AlkanesHost.set_storage(key, stringToArrayBuffer(value));
  }

  private _getStorageU128(key: ArrayBuffer): u128 {
    const valueBuffer = AlkanesHost.get_storage(key);
    if (valueBuffer) {
      return arrayBufferToU128(valueBuffer);
    }
    return u128.Zero; // Default to zero if not found or error
  }

  private _setStorageU128(key: ArrayBuffer, value: u128): void {
    AlkanesHost.set_storage(key, u128ToArrayBuffer(value));
  }
  
  private _getStorageAddress(key: ArrayBuffer): ArrayBuffer | null {
    return AlkanesHost.get_storage(key);
  }

  private _setStorageAddress(key: ArrayBuffer, value: ArrayBuffer): void {
    AlkanesHost.set_storage(key, value);
  }

  // --- Public Contract Functions ---

  // Initialization function, expected to be called once.
  init(name: string, symbol: string, totalSupply: u128): void {
    // Ensure it can only be called once
    const existingDeployer = this._getStorageAddress(DEPLOYER_KEY);
    assert(!existingDeployer, "Contract already initialized.");

    const deployerAddress = AlkanesHost.get_caller();
    this._setStorageAddress(DEPLOYER_KEY, deployerAddress);
    this._setStorageString(NAME_KEY, name);
    this._setStorageString(SYMBOL_KEY, symbol);
    this._setStorageU128(TOTAL_SUPPLY_KEY, totalSupply);

    // Mint total supply to the deployer
    const deployerAddressString = arrayBufferToString(deployerAddress); // Assuming addresses are stored/keyed as strings
    this._setStorageU128(balanceKey(deployerAddressString), totalSupply);
    
    AlkanesHost.log("CustomToken: Initialized. Name: " + name + ", Symbol: " + symbol + ", TotalSupply: " + totalSupply.toString());
  }

  // --- Token Operations ---

  transfer(recipientAddressString: string, amount: u128): void {
    assert(amount > u128.Zero, "Transfer amount must be positive.");
    const callerAddress = AlkanesHost.get_caller();
    const callerAddressString = arrayBufferToString(callerAddress); // Assuming addresses are keyed as strings

    const callerBalance = this._getStorageU128(balanceKey(callerAddressString));
    assert(callerBalance >= amount, "Insufficient balance.");

    this._setStorageU128(balanceKey(callerAddressString), callerBalance - amount);
    
    const recipientBalance = this._getStorageU128(balanceKey(recipientAddressString));
    this._setStorageU128(balanceKey(recipientAddressString), recipientBalance + amount);

    AlkanesHost.emit_event(
      "Transfer", 
      encodeTransferEventArgsFixed(callerAddress, stringToArrayBuffer(recipientAddressString), amount)
    );
    AlkanesHost.log("CustomToken: Transferred " + amount.toString() + " from " + callerAddressString + " to " + recipientAddressString);
  }

  approve(spenderAddressString: string, amount: u128): void {
    assert(amount >= u128.Zero, "Approval amount cannot be negative."); // Allow 0 to reset approval
    const ownerAddress = AlkanesHost.get_caller();
    const ownerAddressString = arrayBufferToString(ownerAddress);

    this._setStorageU128(allowanceKey(ownerAddressString, spenderAddressString), amount);

    AlkanesHost.emit_event(
      "Approval",
      encodeApprovalEventArgs(ownerAddress, stringToArrayBuffer(spenderAddressString), amount)
    );
    AlkanesHost.log("CustomToken: Approved " + spenderAddressString + " to spend " + amount.toString() + " for " + ownerAddressString);
  }

  transferFrom(ownerAddressString: string, recipientAddressString: string, amount: u128): void {
    assert(amount > u128.Zero, "TransferFrom amount must be positive.");
    const spenderAddress = AlkanesHost.get_caller();
    const spenderAddressString = arrayBufferToString(spenderAddress);

    const ownerBalance = this._getStorageU128(balanceKey(ownerAddressString));
    assert(ownerBalance >= amount, "Owner has insufficient balance.");

    const currentAllowance = this._getStorageU128(allowanceKey(ownerAddressString, spenderAddressString));
    assert(currentAllowance >= amount, "Spender has insufficient allowance.");

    // Update owner's balance
    this._setStorageU128(balanceKey(ownerAddressString), ownerBalance - amount);
    // Update allowance
    this._setStorageU128(allowanceKey(ownerAddressString, spenderAddressString), currentAllowance - amount);
    // Update recipient's balance
    const recipientBalance = this._getStorageU128(balanceKey(recipientAddressString));
    this._setStorageU128(balanceKey(recipientAddressString), recipientBalance + amount);

    AlkanesHost.emit_event(
      "Transfer",
      encodeTransferEventArgsFixed(stringToArrayBuffer(ownerAddressString), stringToArrayBuffer(recipientAddressString), amount)
    );
    AlkanesHost.log("CustomToken: Transferred (from) " + amount.toString() + " from " + ownerAddressString + " to " + recipientAddressString + " by " + spenderAddressString);
  }

  buy(): void {
    const buyerAddress = AlkanesHost.get_caller();
    const buyerAddressString = arrayBufferToString(buyerAddress);
    const deployerAddressBuffer = this._getStorageAddress(DEPLOYER_KEY);
    assert(deployerAddressBuffer, "Deployer address not set in contract.");
    // const deployerAddressString = arrayBufferToString(deployerAddressBuffer!); // Not used for TxOutput check

    // ASSUMPTION: AlkanesHost.get_tx_outputs() returns outputs for the *current* transaction.
    const txOutputs = AlkanesHost.get_tx_outputs();
    assert(txOutputs.length > 0, "No transaction outputs found for payment verification.");

    let btcAmountSats: u64 = 0;
    let paymentFound = false;
    for (let i = 0; i < txOutputs.length; i++) {
      const output = txOutputs[i];
      // Direct ArrayBuffer comparison might be tricky if not identical objects.
      // Assuming script_pubkey of deployer is known or can be derived/matched.
      // For simplicity, if deployerAddressBuffer IS the script_pubkey:
      if (memory.compare(output.script_pubkey, deployerAddressBuffer!) == 0) {
         // This comparison needs to be robust. If deployerAddressBuffer is a simple ID
         // and output.script_pubkey is an actual Bitcoin script, this direct compare won't work.
         // This part HIGHLIGHTS a major complexity in real BTC integration.
         // For this example, we assume deployerAddressBuffer is the exact script_pubkey bytes.
        btcAmountSats += output.value_sats;
        paymentFound = true;
      }
    }

    assert(paymentFound && btcAmountSats > 0, "No BTC payment to deployer address found in this transaction.");

    const tokensToBuy = u128.fromU64(btcAmountSats); // 1 satoshi = 1 token unit

    const deployerAddressString = arrayBufferToString(deployerAddressBuffer!); // For balance key
    const deployerBalance = this._getStorageU128(balanceKey(deployerAddressString));
    assert(deployerBalance >= tokensToBuy, "Deployer has insufficient token balance to fulfill the buy order.");

    // Transfer tokens from deployer to buyer
    this._setStorageU128(balanceKey(deployerAddressString), deployerBalance - tokensToBuy);
    const buyerBalance = this._getStorageU128(balanceKey(buyerAddressString));
    this._setStorageU128(balanceKey(buyerAddressString), buyerBalance + tokensToBuy);

    AlkanesHost.emit_event(
      "TokensPurchased",
      encodeTokensPurchasedEventArgs(buyerAddress, deployerAddressBuffer!, btcAmountSats, tokensToBuy)
    );
    AlkanesHost.log("CustomToken: Buyer " + buyerAddressString + " purchased " + tokensToBuy.toString() + " tokens for " + btcAmountSats.toString() + " sats.");
  }

  sell(amount: u128): void {
    assert(amount > u128.Zero, "Sell amount must be positive.");
    const sellerAddress = AlkanesHost.get_caller();
    const sellerAddressString = arrayBufferToString(sellerAddress);
    
    const deployerAddressBuffer = this._getStorageAddress(DEPLOYER_KEY);
    assert(deployerAddressBuffer, "Deployer address not set.");
    const deployerAddressString = arrayBufferToString(deployerAddressBuffer!);

    const sellerBalance = this._getStorageU128(balanceKey(sellerAddressString));
    assert(sellerBalance >= amount, "Seller has insufficient token balance.");

    // Transfer tokens from seller to deployer
    this._setStorageU128(balanceKey(sellerAddressString), sellerBalance - amount);
    const deployerBalance = this._getStorageU128(balanceKey(deployerAddressString));
    this._setStorageU128(balanceKey(deployerAddressString), deployerBalance + amount);

    AlkanesHost.emit_event(
      "SellSuccess",
      encodeSellSuccessEventArgs(sellerAddress, deployerAddressBuffer!, amount)
    );
    AlkanesHost.log("CustomToken: Seller " + sellerAddressString + " sold " + amount.toString() + " tokens to deployer.");
  }

  // --- Query Functions ---

  balanceOf(ownerAddressString: string): u128 {
    return this._getStorageU128(balanceKey(ownerAddressString));
  }

  allowance(ownerAddressString: string, spenderAddressString: string): u128 {
    return this._getStorageU128(allowanceKey(ownerAddressString, spenderAddressString));
  }

  getName(): string {
    const name = this._getStorageString(NAME_KEY);
    return name ? name : ""; // Should ideally not be null after init
  }

  getSymbol(): string {
    const symbol = this._getStorageString(SYMBOL_KEY);
    return symbol ? symbol : ""; // Should ideally not be null after init
  }

  getTotalSupply(): u128 {
    return this._getStorageU128(TOTAL_SUPPLY_KEY);
  }

  getDeployer(): ArrayBuffer {
    const deployer = this._getStorageAddress(DEPLOYER_KEY);
    // If deployer is null, it means contract is not initialized.
    // Returning an empty ArrayBuffer or asserting might be options.
    return deployer ? deployer : new ArrayBuffer(0); 
  }
}

// Entry point for contract calls (if needed by the runtime, similar to Rust's __execute)
// The Alkanes runtime might call exported class methods directly by name,
// or it might call a single exported function like `main` or `_start` which then dispatches.
// For now, assuming direct method calls are possible.
// If a single entry point is required:
/*
export function _start(): void {
  // Logic to read opcode and calldata, then dispatch to appropriate CustomToken method.
  // This would require additional host functions to get calldata and opcode.
  // e.g., let opcode = AlkanesHost.get_opcode();
  // e.g., let calldata = AlkanesHost.get_calldata();
  // For now, this is a placeholder.
}
*/
// For direct calls, ensure methods are exported if not automatically by `export class`.
// The `as-pect` test framework, for example, often calls exported functions directly.
// No explicit `_start` needed if the runtime calls methods by name.
// AssemblyScript typically exports functions marked with `export`.
// Public methods of an exported class are generally callable.
