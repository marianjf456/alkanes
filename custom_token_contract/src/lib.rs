use alkanes_runtime::{
    alkanes_api, CallResponse, Cbor, ExecutionContext, Hex, StorageMap, StoragePointer, StorageValue,
};
use alkanes_support::AlkaneResponder;
use anyhow::{bail, Result};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap; // Using BTreeMap for Map-like structures in storage

// Opcodes
const OPCODE_INIT: u32 = 0;
const OPCODE_TRANSFER: u32 = 1;
const OPCODE_APPROVE: u32 = 2;
const OPCODE_TRANSFER_FROM: u32 = 3;
const OPCODE_BUY: u32 = 50;
const OPCODE_SELL: u32 = 51;
const OPCODE_BALANCE_OF: u32 = 100;
const OPCODE_ALLOWANCE: u32 = 101;
const OPCODE_NAME: u32 = 102;
const OPCODE_SYMBOL: u32 = 103;
const OPCODE_TOTAL_SUPPLY: u32 = 104;
const OPCODE_DEPLOYER: u32 = 105;

// Storage key constants
const NAME_KEY: &str = "/name";
const SYMBOL_KEY: &str = "/symbol";
const TOTAL_SUPPLY_KEY: &str = "/totalsupply";
const DEPLOYER_KEY: &str = "/deployer";
const BALANCES_BASE_KEY: &str = "/balances/";
const ALLOWANCES_BASE_KEY: &str = "/allowances/";


// Contract Struct
pub struct CustomToken;

// Helper functions for storage
fn get_storage_string(key: &str) -> Result<String> {
    let pointer = StoragePointer::new(key.as_bytes());
    match alkanes_api::get_storage(&pointer) {
        Some(value) => String::from_utf8(value.into_inner()).map_err(|e| anyhow::anyhow!(e)),
        None => bail!("Key not found: {}", key),
    }
}

fn set_storage_string(key: &str, value: String) {
    let pointer = StoragePointer::new(key.as_bytes());
    alkanes_api::set_storage(&pointer, &StorageValue::new(value.into_bytes()));
}

fn get_storage_u128(key: &str) -> Result<u128> {
    let pointer = StoragePointer::new(key.as_bytes());
    match alkanes_api::get_storage(&pointer) {
        Some(value) => Ok(u128::from_le_bytes(
            value.into_inner().try_into().map_err(|_| anyhow::anyhow!("Invalid u128 bytes for key {}", key))?,
        )),
        None => bail!("Key not found: {}", key),
    }
}

fn set_storage_u128(key: &str, value: u128) {
    let pointer = StoragePointer::new(key.as_bytes());
    alkanes_api::set_storage(&pointer, &StorageValue::new(value.to_le_bytes().to_vec()));
}

fn get_storage_address(key: &str) -> Result<Vec<u8>> {
    let pointer = StoragePointer::new(key.as_bytes());
    match alkanes_api::get_storage(&pointer) {
        Some(value) => Ok(value.into_inner()),
        None => bail!("Key not found: {}", key),
    }
}

fn set_storage_address(key: &str, value: &Vec<u8>) {
    let pointer = StoragePointer::new(key.as_bytes());
    alkanes_api::set_storage(&pointer, &StorageValue::new(value.clone()));
}

fn get_balance(owner_address: &Vec<u8>) -> u128 {
    let balance_key = format!("{}{}", BALANCES_BASE_KEY, Hex(&owner_address));
    let pointer = StoragePointer::new(balance_key.as_bytes());
    match alkanes_api::get_storage(&pointer) {
        Some(value) => u128::from_le_bytes(
            value.into_inner().try_into().unwrap_or_else(|_| 0u128.to_le_bytes()), // Default to 0 if conversion fails
        ),
        None => 0, // Default to 0 if not found
    }
}

fn set_balance(owner_address: &Vec<u8>, amount: u128) {
    let balance_key = format!("{}{}", BALANCES_BASE_KEY, Hex(&owner_address));
    let pointer = StoragePointer::new(balance_key.as_bytes());
    alkanes_api::set_storage(&pointer, &StorageValue::new(amount.to_le_bytes().to_vec()));
}

fn get_allowance(owner_address: &Vec<u8>, spender_address: &Vec<u8>) -> u128 {
    let allowance_key = format!("{}{}/{}", ALLOWANCES_BASE_KEY, Hex(&owner_address), Hex(&spender_address));
    let pointer = StoragePointer::new(allowance_key.as_bytes());
    match alkanes_api::get_storage(&pointer) {
        Some(value) => u128::from_le_bytes(
             value.into_inner().try_into().unwrap_or_else(|_| 0u128.to_le_bytes()), // Default to 0 if conversion fails
        ),
        None => 0, // Default to 0 if not found
    }
}

fn set_allowance(owner_address: &Vec<u8>, spender_address: &Vec<u8>, amount: u128) {
    let allowance_key = format!("{}{}/{}", ALLOWANCES_BASE_KEY, Hex(&owner_address), Hex(&spender_address));
    let pointer = StoragePointer::new(allowance_key.as_bytes());
    alkanes_api::set_storage(&pointer, &StorageValue::new(amount.to_le_bytes().to_vec()));
}


// Placeholder for transaction output structure - ASSUMPTION
#[derive(Serialize, Deserialize, Clone, Debug)]
struct TransactionOutput {
    recipient_address: Vec<u8>,
    amount_sats: u64, // Assuming satoshis for BTC amount
}

// Placeholder for event structures
#[derive(Serialize, Deserialize, Debug)]
struct TransferEvent {
    from: Vec<u8>,
    to: Vec<u8>,
    amount: u128,
}

#[derive(Serialize, Deserialize, Debug)]
struct ApprovalEvent {
    owner: Vec<u8>,
    spender: Vec<u8>,
    amount: u128,
}

#[derive(Serialize, Deserialize, Debug)]
struct TokensPurchasedEvent {
    buyer: Vec<u8>,
    seller: Vec<u8>, // Should be deployer
    btc_amount_sats: u64,
    token_amount: u128,
}

#[derive(Serialize, Deserialize, Debug)]
struct SellSuccessEvent {
    seller: Vec<u8>,
    recipient: Vec<u8>, // Deployer, who will send BTC off-chain
    token_amount: u128,
}


// Structs for calldata deserialization
#[derive(Serialize, Deserialize)]
struct InitArgs {
    name: String,
    symbol: String,
    total_supply: u128,
}

#[derive(Serialize, Deserialize)]
struct TransferArgs {
    recipient_address: Vec<u8>,
    amount: u128,
}

#[derive(Serialize, Deserialize)]
struct ApproveArgs {
    spender_address: Vec<u8>,
    amount: u128,
}

#[derive(Serialize, Deserialize)]
struct TransferFromArgs {
    owner_address: Vec<u8>,
    recipient_address: Vec<u8>,
    amount: u128,
}

#[derive(Serialize, Deserialize)]
struct BuyArgs {
    // No direct arguments, payment is verified from transaction outputs
}

#[derive(Serialize, Deserialize)]
struct SellArgs {
    amount: u128,
}

#[derive(Serialize, Deserialize)]
struct BalanceOfArgs {
    owner_address: Vec<u8>,
}

#[derive(Serialize, Deserialize)]
struct AllowanceArgs {
    owner_address: Vec<u8>,
    spender_address: Vec<u8>,
}

impl AlkaneResponder for CustomToken {
    fn run(context: ExecutionContext, calldata: &[u8]) -> Result<CallResponse> {
        let opcode = u32::from_le_bytes(
            calldata
                .get(0..4)
                .ok_or_else(|| anyhow::anyhow!("Calldata too short to read opcode"))?
                .try_into()?,
        );
        let args_data = calldata.get(4..).unwrap_or_default();

        match opcode {
            OPCODE_INIT => Self::init(context, args_data),
            OPCODE_TRANSFER => Self::transfer(context, args_data),
            OPCODE_APPROVE => Self::approve(context, args_data),
            OPCODE_TRANSFER_FROM => Self::transfer_from(context, args_data),
            OPCODE_BUY => Self::buy(context, args_data),
            OPCODE_SELL => Self::sell(context, args_data),
            OPCODE_BALANCE_OF => Self::balance_of(args_data),
            OPCODE_ALLOWANCE => Self::allowance(args_data),
            OPCODE_NAME => Self::name(),
            OPCODE_SYMBOL => Self::symbol(),
            OPCODE_TOTAL_SUPPLY => Self::total_supply(),
            OPCODE_DEPLOYER => Self::deployer(),
            _ => bail!("Unknown opcode: {}", opcode),
        }
    }
}

impl CustomToken {
    fn init(context: ExecutionContext, args_data: &[u8]) -> Result<CallResponse> {
        // Check if already initialized
        if get_storage_address(DEPLOYER_KEY).is_ok() {
            bail!("Contract already initialized");
        }

        let args: InitArgs = alkanes_api::cbor_decode(args_data)?;
        let deployer_address = get_caller_address(&context);

        set_storage_string(NAME_KEY, args.name.clone());
        set_storage_string(SYMBOL_KEY, args.symbol.clone());
        set_storage_u128(TOTAL_SUPPLY_KEY, args.total_supply);
        set_storage_address(DEPLOYER_KEY, &deployer_address);

        // Mint total_supply to deployer
        set_balance(&deployer_address, args.total_supply);
        
        alkanes_api::log(&format!("Contract initialized by {}", Hex(&deployer_address)));
        alkanes_api::log(&format!("Name: {}, Symbol: {}, TotalSupply: {}", args.name, args.symbol, args.total_supply));


        Ok(CallResponse::default())
    }

    fn transfer(context: ExecutionContext, args_data: &[u8]) -> Result<CallResponse> {
        let args: TransferArgs = alkanes_api::cbor_decode(args_data)?;
        let caller_address = get_caller_address(&context);

        let caller_balance = get_balance(&caller_address);
        if caller_balance < args.amount {
            bail!("Insufficient balance for transfer");
        }

        set_balance(&caller_address, caller_balance - args.amount);
        let recipient_balance = get_balance(&args.recipient_address);
        set_balance(&args.recipient_address, recipient_balance + args.amount);

        alkanes_api::log(&format!(
            "Transfer: {} from {} to {}",
            args.amount,
            Hex(&caller_address),
            Hex(&args.recipient_address)
        ));
        // EVENT: Emit Transfer event
        // This requires an Alkanes API to emit events, e.g., alkanes_api::emit_event(topic, data_bytes);
        // For now, logging it. The actual event emission code would be:
        /*
        let event = TransferEvent {
            from: caller_address.clone(),
            to: args.recipient_address.clone(),
            amount: args.amount,
        };
        let event_data = alkanes_api::cbor_encode(&event)?;
        alkanes_api::emit_event("Transfer", &event_data); // Example topic "Transfer"
        */

        Ok(CallResponse::default())
    }

    fn approve(context: ExecutionContext, args_data: &[u8]) -> Result<CallResponse> {
        let args: ApproveArgs = alkanes_api::cbor_decode(args_data)?;
        let owner_address = get_caller_address(&context);

        set_allowance(&owner_address, &args.spender_address, args.amount);

        alkanes_api::log(&format!(
            "Approve: {} for {} by {}",
            args.amount,
            Hex(&args.spender_address),
            Hex(&owner_address)
        ));
        // EVENT: Emit Approval event
        // Similar to Transfer, actual event emission would be:
        /*
        let event = ApprovalEvent {
            owner: owner_address.clone(),
            spender: args.spender_address.clone(),
            amount: args.amount,
        };
        let event_data = alkanes_api::cbor_encode(&event)?;
        alkanes_api::emit_event("Approval", &event_data); // Example topic "Approval"
        */

        Ok(CallResponse::default())
    }

    fn transfer_from(context: ExecutionContext, args_data: &[u8]) -> Result<CallResponse> {
        let args: TransferFromArgs = alkanes_api::cbor_decode(args_data)?;
        let spender_address = get_caller_address(&context);

        let owner_balance = get_balance(&args.owner_address);
        if owner_balance < args.amount {
            bail!("Insufficient balance for transfer_from (owner)");
        }

        let current_allowance = get_allowance(&args.owner_address, &spender_address);
        if current_allowance < args.amount {
            bail!("Insufficient allowance for transfer_from");
        }

        set_balance(&args.owner_address, owner_balance - args.amount);
        set_allowance(
            &args.owner_address,
            &spender_address,
            current_allowance - args.amount,
        );
        let recipient_balance = get_balance(&args.recipient_address);
        set_balance(&args.recipient_address, recipient_balance + args.amount);

        alkanes_api::log(&format!(
            "TransferFrom: {} from {} to {} (spender {})",
            args.amount,
            Hex(&args.owner_address),
            Hex(&args.recipient_address),
            Hex(&spender_address)
        ));
        // EVENT: Emit Transfer event (for transfer_from)
        // Similar to Transfer, actual event emission would be:
        /*
        let event = TransferEvent {
            from: args.owner_address.clone(),
            to: args.recipient_address.clone(),
            amount: args.amount,
        };
        let event_data = alkanes_api::cbor_encode(&event)?;
        alkanes_api::emit_event("Transfer", &event_data);
        */

        Ok(CallResponse::default())
    }

    // --- Buy and Sell ---

    // ASSUMPTION FOR OPCODE_BUY:
    // The Alkanes runtime must provide an API to inspect the outputs of the current transaction.
    // This function simulates such an API call. In a real scenario, this would be replaced
    // by something like:
    // `let transaction_outputs: Vec<TransactionOutput> = alkanes_api::get_transaction_outputs()?;`
    // where `TransactionOutput` contains `recipient_address` (e.g. script pubkey) and `amount_sats`.
    fn get_transaction_outputs_from_host_assumed() -> Result<Vec<TransactionOutput>> {
        // This is a placeholder/simulation.
        // In a real Alkanes environment, this function would interact with the host.
        // For demonstration, we'll return an empty Vec. To test logic, you'd need to mock this.
        // Example of how it might be mocked for testing if `alkanes_api::get_context_data` existed:
        // ```
        // if let Some(outputs_bytes) = alkanes_api::get_context_data("mock_tx_outputs") {
        //     return alkanes_api::cbor_decode(&outputs_bytes);
        // }
        // Ok(Vec::new())
        // ```
        // For now, this function will always return an empty Vec, meaning BUY will fail
        // unless this function is modified to simulate incoming payments.
        // To simulate a payment for testing:
        /*
        Ok(vec![
            TransactionOutput {
                recipient_address: get_storage_address(DEPLOYER_KEY).unwrap_or_default(), // Needs error handling
                amount_sats: 1_000_000, // 0.01 BTC in satoshis
            }
        ])
        */
         Ok(Vec::new()) // Default: No outputs found, so BUY will typically fail payment verification.
    }


    fn buy(context: ExecutionContext, _args_data: &[u8]) -> Result<CallResponse> {
        let buyer_address = get_caller_address(&context);
        let deployer_address = get_storage_address(DEPLOYER_KEY)?;

        // CRUCIAL: Access transaction context to verify BTC was sent to deployer_address
        let transaction_outputs = Self::get_transaction_outputs_from_host_assumed()?;

        let mut btc_payment_sats: u64 = 0;
        for output in transaction_outputs {
            if output.recipient_address == deployer_address {
                btc_payment_sats += output.amount_sats;
            }
        }

        if btc_payment_sats == 0 {
            bail!("No BTC payment to deployer address found in this transaction's outputs.");
        }

        let tokens_to_buy = u128::from(btc_payment_sats); // 1:1 ratio (1 satoshi = 1 token unit)

        let deployer_balance = get_balance(&deployer_address);
        if deployer_balance < tokens_to_buy {
            bail!("Deployer has insufficient token balance to fulfill the buy order.");
        }

        // Transfer tokens from deployer to buyer
        set_balance(&deployer_address, deployer_balance - tokens_to_buy);
        let buyer_balance = get_balance(&buyer_address);
        set_balance(&buyer_address, buyer_balance + tokens_to_buy);

        alkanes_api::log(&format!(
            "Buy: {} tokens for {} by {} (paid {} sats to deployer)",
            tokens_to_buy,
            Hex(&buyer_address),
            Hex(&buyer_address), // Caller is buyer
            btc_payment_sats
        ));

        // EVENT: Emit TokensPurchased event
        // Similar to Transfer, actual event emission would be:
        /*
        let event = TokensPurchasedEvent {
            buyer: buyer_address.clone(),
            seller: deployer_address.clone(),
            btc_amount_sats,
            token_amount: tokens_to_buy,
        };
        let event_data = alkanes_api::cbor_encode(&event)?;
        alkanes_api::emit_event("TokensPurchased", &event_data);
        */

        Ok(CallResponse::default())
    }

    fn sell(context: ExecutionContext, args_data: &[u8]) -> Result<CallResponse> {
        let args: SellArgs = alkanes_api::cbor_decode(args_data)?;
        let seller_address = get_caller_address(&context);
        let deployer_address = get_storage_address(DEPLOYER_KEY)?;

        let seller_balance = get_balance(&seller_address);
        if seller_balance < args.amount {
            bail!("Insufficient token balance to sell.");
        }

        // Transfer tokens from seller to deployer
        set_balance(&seller_address, seller_balance - args.amount);
        let deployer_balance = get_balance(&deployer_address);
        set_balance(&deployer_address, deployer_balance + args.amount);

        alkanes_api::log(&format!(
            "Sell: {} tokens by {} to deployer {}",
            args.amount,
            Hex(&seller_address),
            Hex(&deployer_address)
        ));

        // EVENT: Emit SellSuccess event (for off-chain processing)
        // This event signals an off-chain system to transfer BTC from deployer to seller.
        /*
        let event = SellSuccessEvent {
            seller: seller_address.clone(),
            recipient: deployer_address.clone(), // Deployer is the recipient of tokens
            token_amount: args.amount,
        };
        let event_data = alkanes_api::cbor_encode(&event)?;
        alkanes_api::emit_event("SellSuccess", &event_data);
        */

        Ok(CallResponse::default())
    }


    // Query functions
    fn balance_of(args_data: &[u8]) -> Result<CallResponse> {
        let args: BalanceOfArgs = alkanes_api::cbor_decode(args_data)?;
        let balance = get_balance(&args.owner_address);
        Ok(CallResponse {
            exit_code: 0,
            data: balance.to_le_bytes().to_vec(),
            events: Vec::new(),
        })
    }

    fn allowance(args_data: &[u8]) -> Result<CallResponse> {
        let args: AllowanceArgs = alkanes_api::cbor_decode(args_data)?;
        let allowance_value = get_allowance(&args.owner_address, &args.spender_address);
        Ok(CallResponse {
            exit_code: 0,
            data: allowance_value.to_le_bytes().to_vec(),
            events: Vec::new(),
        })
    }

    fn name() -> Result<CallResponse> {
        let name_str = get_storage_string(NAME_KEY)?;
        Ok(CallResponse {
            exit_code: 0,
            data: name_str.into_bytes(),
            events: Vec::new(),
        })
    }

    fn symbol() -> Result<CallResponse> {
        let symbol_str = get_storage_string(SYMBOL_KEY)?;
        Ok(CallResponse {
            exit_code: 0,
            data: symbol_str.into_bytes(),
            events: Vec::new(),
        })
    }

    fn total_supply() -> Result<CallResponse> {
        let total_supply_val = get_storage_u128(TOTAL_SUPPLY_KEY)?;
        Ok(CallResponse {
            exit_code: 0,
            data: total_supply_val.to_le_bytes().to_vec(),
            events: Vec::new(),
        })
    }

    fn deployer() -> Result<CallResponse> {
        let deployer_address_val = get_storage_address(DEPLOYER_KEY)?;
        Ok(CallResponse {
            exit_code: 0,
            data: deployer_address_val,
            events: Vec::new(),
        })
    }
}


// C-style export for the WASM runtime
#[no_mangle]
pub extern "C" fn __execute(calldata_len: usize) -> usize {
    alkanes_api::load_call_data_from_host(calldata_len);
    let calldata = alkanes_api::get_call_data();
    let context = alkanes_api::get_execution_context();

    let response = CustomToken::run(context, &calldata).unwrap_or_else(|err| {
        let error_message = format!("Contract execution failed: {}", err);
        alkanes_api::log(&error_message); // Log the error
        CallResponse {
            exit_code: 1, // Indicate failure
            data: error_message.into_bytes(),
            events: Vec::new(), // Assuming events are part of CallResponse
        }
    });

    let response_bytes = alkanes_api::cbor_encode(&response).expect("Failed to encode response");
    alkanes_api::set_response(&response_bytes);
    response_bytes.len()
}

// Helper function to get caller address
fn get_caller_address(context: &ExecutionContext) -> Vec<u8> {
    context.caller.clone() 
}
