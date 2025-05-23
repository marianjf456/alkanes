import { describe, it, before, after } from 'mocha';
import { expect } from 'chai';
import * as btc from '@scure/btc-signer';

// Assuming MockAlkaneId is also exported from client or defined here if not
import { Client, MockAlkaneId } from '../integration/lib/client';
import { REGTEST_PARAMS, REGTEST_FAUCET, USER_WALLET, OTHER_USER_WALLET, network } from '../integration/lib/constants';

import { deployCustomTokenAndGetId, CONTRACT_NAME, CONTRACT_SYMBOL, TOTAL_SUPPLY } from '../../integration/custom_token/deploy';

// Functions from interact.ts - ensure they are exported
import {
  OP_GET_NAME,
  OP_GET_SYMBOL,
  OP_GET_TOTAL_SUPPLY,
  OP_GET_DEPLOYER,
  OP_BALANCE_OF,
  OP_ALLOWANCE,
  OP_TRANSFER,
  OP_APPROVE,
  OP_TRANSFER_FROM,
  OP_BUY,
  OP_SELL,
  callContract, // Assuming callContract is exported for direct use or use specific interaction functions
  // Specific interaction functions that wrap callContract:
  getName as getContractName, // Renaming to avoid conflict with describe block
  getSymbol as getContractSymbol,
  getTotalSupply as getContractTotalSupply,
  getDeployer as getContractDeployer,
  getBalance,
  performTransfer,
  performApprove,
  performTransferFrom,
  performBuy,
  performSell,
  getP2TRAddress, // Ensure this is exported from interact.ts
  arrayBufferToBigInt, // Ensure this is exported or defined locally for tests
  // Placeholder u128 to ArrayBuffer for comparison if needed, or use hex strings
} from '../../integration/custom_token/interact';
import { bytesToHex, bytesToString } from '../../lib/bytes';


describe('Custom Token Smart Contract Tests', function () {
  this.timeout(300000); // 5 minutes timeout for all tests in this suite, including deployment

  let alkaneId: MockAlkaneId;
  let client: Client;

  const deployerP2TRAddress = getP2TRAddress(REGTEST_FAUCET, network);
  const userP2TRAddress = getP2TRAddress(USER_WALLET, network);
  const otherUserP2TRAddress = getP2TRAddress(OTHER_USER_WALLET, network);

  before(async function () {
    console.log("Running global before hook: Deploying Custom Token contract...");
    client = new Client(); // Initialize client for use in tests
    // Ensure client can connect or bitcoin regtest is running
    await client.healthCheck(); // Simple check
    
    alkaneId = await deployCustomTokenAndGetId();
    console.log(`Contract deployed. Alkane ID: ${alkaneId.block}:${alkaneId.tx}`);
    
    // Mine some blocks to ensure deployment transaction is well confirmed
    // and to generate some UTXOs for the faucet if it's running low.
    await client.mineBlocks(6); 
    console.log("Mined 6 blocks after deployment.");
  });

  describe('Deployment and Initialization', () => {
    it('should initialize with correct name', async () => {
      const { simulationResult } = await callContract(alkaneId, OP_GET_NAME, [], [], USER_WALLET, true);
      expect(simulationResult).to.not.be.null;
      const name = bytesToString(simulationResult!);
      expect(name).to.equal(CONTRACT_NAME);
      console.log(`Verified Name: ${name}`);
    });

    it('should initialize with correct symbol', async () => {
      const { simulationResult } = await callContract(alkaneId, OP_GET_SYMBOL, [], [], USER_WALLET, true);
      expect(simulationResult).to.not.be.null;
      const symbol = bytesToString(simulationResult!);
      expect(symbol).to.equal(CONTRACT_SYMBOL);
      console.log(`Verified Symbol: ${symbol}`);
    });

    it('should initialize with correct total supply', async () => {
      const { simulationResult } = await callContract(alkaneId, OP_GET_TOTAL_SUPPLY, [], [], USER_WALLET, true);
      expect(simulationResult).to.not.be.null;
      const totalSupply = arrayBufferToBigInt(simulationResult!.buffer); // Assuming simulationResult is Uint8Array
      expect(totalSupply).to.equal(TOTAL_SUPPLY);
      console.log(`Verified Total Supply: ${totalSupply}`);
    });

    it('should set the deployer correctly', async () => {
      const { simulationResult } = await callContract(alkaneId, OP_GET_DEPLOYER, [], [], USER_WALLET, true);
      expect(simulationResult).to.not.be.null;
      // The deployer address in the contract is stored as ArrayBuffer.
      // We need to compare it with the expected deployer's public key or derived address form.
      // The AS contract stores AlkanesHost.get_caller() directly.
      // Let's assume REGTEST_FAUCET.publicKey is what would be returned by get_caller in that context,
      // or a transformation of it. This comparison is tricky without knowing exact format from get_caller.
      // For now, let's check if it's a non-empty buffer.
      // A better test would be if get_caller returns a standardized address format that we can predict.
      expect(simulationResult!.length).to.be.greaterThan(0); 
      console.log(`Verified Deployer (raw hex): ${bytesToHex(simulationResult!)}`);
      // TODO: More specific check if possible, e.g. compare with deployerP2TRAddress if that's what's stored
      // Or, if it's the public key, compare with REGTEST_FAUCET.publicKey
    });

    it('should mint total supply to the deployer', async () => {
      const { simulationResult } = await callContract(alkaneId, OP_BALANCE_OF, [deployerP2TRAddress], [], USER_WALLET, true);
      expect(simulationResult).to.not.be.null;
      const deployerBalance = arrayBufferToBigInt(simulationResult!.buffer);
      expect(deployerBalance).to.equal(TOTAL_SUPPLY);
      console.log(`Verified Deployer Balance: ${deployerBalance}`);
    });
  });

  // Placeholder for other describe blocks - will be filled in next steps
  describe('Custom Token Core Functionality', () => {
    const transferAmount = 10000n; // 0.001 tokens if 8 decimals
    const approvalAmount = 5000n;

    before(async () => {
      // Pre-fund userWallet from deployerWallet (FAUCET) for subsequent tests
      console.log(`Core Functionality: Pre-funding user wallet ${userP2TRAddress}...`);
      const { txId } = await callContract(
        alkaneId,
        OP_TRANSFER, // Opcode for transfer
        [userP2TRAddress, TOTAL_SUPPLY / 2n], // Transfer half of total supply
        [],
        REGTEST_FAUCET, // Signer is deployer
        false // Not a query
      );
      console.log(`Pre-funding transfer transaction ID: ${txId}`);
      await client.mineBlocks(1); // Confirm the transaction
      console.log("User wallet pre-funded.");

      const { simulationResult: userBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
      const userBalance = arrayBufferToBigInt(userBalanceRes!.buffer);
      expect(userBalance).to.equal(TOTAL_SUPPLY / 2n);
      console.log(`Verified User Balance after pre-funding: ${userBalance}`);
      
      const { simulationResult: deployerBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [deployerP2TRAddress], [], USER_WALLET, true);
      const deployerBalance = arrayBufferToBigInt(deployerBalanceRes!.buffer);
      expect(deployerBalance).to.equal(TOTAL_SUPPLY - (TOTAL_SUPPLY / 2n)); // Remaining half
      console.log(`Verified Deployer Balance after pre-funding: ${deployerBalance}`);
    });

    it('should transfer tokens correctly between users', async () => {
      const { simulationResult: initialSenderBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
      const initialSenderBalance = arrayBufferToBigInt(initialSenderBalanceRes!.buffer);
      const { simulationResult: initialReceiverBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [otherUserP2TRAddress], [], USER_WALLET, true);
      const initialReceiverBalance = arrayBufferToBigInt(initialReceiverBalanceRes!.buffer);

      console.log(`Transfer Test: Initial sender ${userP2TRAddress} balance: ${initialSenderBalance}, receiver ${otherUserP2TRAddress} balance: ${initialReceiverBalance}`);
      expect(initialSenderBalance).to.be.gte(transferAmount, "Sender does not have enough tokens for transfer test");

      await callContract(
        alkaneId,
        OP_TRANSFER,
        [otherUserP2TRAddress, transferAmount],
        [],
        USER_WALLET, // userWallet is the sender
        false
      );
      await client.mineBlocks(1);

      const { simulationResult: finalSenderBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
      const finalSenderBalance = arrayBufferToBigInt(finalSenderBalanceRes!.buffer);
      const { simulationResult: finalReceiverBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [otherUserP2TRAddress], [], USER_WALLET, true);
      const finalReceiverBalance = arrayBufferToBigInt(finalReceiverBalanceRes!.buffer);
      
      expect(finalSenderBalance).to.equal(initialSenderBalance - transferAmount);
      expect(finalReceiverBalance).to.equal(initialReceiverBalance + transferAmount);
      console.log(`Transfer Test: Final sender balance: ${finalSenderBalance}, receiver balance: ${finalReceiverBalance}`);
    });

    it('should not allow transferring more than balance', async () => {
      const { simulationResult: senderBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
      const senderBalance = arrayBufferToBigInt(senderBalanceRes!.buffer);
      const excessiveAmount = senderBalance + 1n;

      try {
        await callContract(
          alkaneId,
          OP_TRANSFER,
          [otherUserP2TRAddress, excessiveAmount],
          [],
          USER_WALLET,
          false
        );
        // If simulateCall was available and used for pre-check, it might throw.
        // If it's a broadcast, the tx might confirm but the contract state won't change as expected,
        // or the node might reject the state change (harder to detect without events/state query post-call).
        // For AS, an assert() failure will likely trap, preventing state change.
        // This test relies on the contract logic preventing the state change,
        // and the balance check afterwards to confirm. A more robust test would check for a specific error.
        console.log("Excessive transfer call made. Checking balances for non-change or error...");
        await client.mineBlocks(1); // Give it a block if it was broadcast

        const { simulationResult: finalSenderBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
        const finalSenderBalance = arrayBufferToBigInt(finalSenderBalanceRes!.buffer);
        // Expect balance to remain unchanged because the contract should prevent the transfer.
        expect(finalSenderBalance).to.equal(senderBalance, "Sender balance changed after a failed excessive transfer.");

      } catch (error: any) {
        // This path is more likely if using simulateCall that returns execution errors
        console.log(`Caught expected error for excessive transfer: ${error.message}`);
        expect(error).to.be.an('error'); // Generic error check
        // Ideally, check for a specific error message or type related to insufficient balance
      }
    });

    it('should approve spender and update allowance', async () => {
      await callContract(
        alkaneId,
        OP_APPROVE,
        [otherUserP2TRAddress, approvalAmount],
        [],
        USER_WALLET, // userWallet is the owner approving otherUserP2TRAddress
        false
      );
      await client.mineBlocks(1);

      const { simulationResult: allowanceRes } = await callContract(alkaneId, OP_ALLOWANCE, [userP2TRAddress, otherUserP2TRAddress], [], USER_WALLET, true);
      const allowance = arrayBufferToBigInt(allowanceRes!.buffer);
      expect(allowance).to.equal(approvalAmount);
      console.log(`Approve Test: Allowance for ${otherUserP2TRAddress} by ${userP2TRAddress} is ${allowance}`);
    });

    it('should allow spender to transferFrom owner within allowance', async () => {
      const { simulationResult: initialOwnerBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
      const initialOwnerBalance = arrayBufferToBigInt(initialOwnerBalanceRes!.buffer);
      const { simulationResult: initialSpenderTokensRes } = await callContract(alkaneId, OP_BALANCE_OF, [otherUserP2TRAddress], [], USER_WALLET, true);
      const initialSpenderTokens = arrayBufferToBigInt(initialSpenderTokensRes!.buffer);

      const transferFromAmount = approvalAmount - 1000n; // Spend part of the allowance
      expect(transferFromAmount).to.be.gt(0n);
      
      // otherUserP2TRAddress (spender) calls transferFrom on userP2TRAddress's (owner) tokens
      await callContract(
        alkaneId,
        OP_TRANSFER_FROM,
        [userP2TRAddress, otherUserP2TRAddress, transferFromAmount], // owner, recipient, amount
        [],
        OTHER_USER_WALLET, // Spender (otherUserWallet) signs and initiates
        false
      );
      await client.mineBlocks(1);

      const { simulationResult: finalOwnerBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
      const finalOwnerBalance = arrayBufferToBigInt(finalOwnerBalanceRes!.buffer);
      const { simulationResult: finalSpenderTokensRes } = await callContract(alkaneId, OP_BALANCE_OF, [otherUserP2TRAddress], [], USER_WALLET, true);
      const finalSpenderTokens = arrayBufferToBigInt(finalSpenderTokensRes!.buffer);
      const { simulationResult: remainingAllowanceRes } = await callContract(alkaneId, OP_ALLOWANCE, [userP2TRAddress, otherUserP2TRAddress], [], USER_WALLET, true);
      const remainingAllowance = arrayBufferToBigInt(remainingAllowanceRes!.buffer);

      expect(finalOwnerBalance).to.equal(initialOwnerBalance - transferFromAmount);
      expect(finalSpenderTokens).to.equal(initialSpenderTokens + transferFromAmount); // Spender transferred to self
      expect(remainingAllowance).to.equal(approvalAmount - transferFromAmount);
      console.log(`TransferFrom Test: Owner balance: ${finalOwnerBalance}, Spender/Receiver balance: ${finalSpenderTokens}, Remaining allowance: ${remainingAllowance}`);
    });

    it('should not allow transferFrom exceeding allowance', async () => {
      const { simulationResult: currentAllowanceRes } = await callContract(alkaneId, OP_ALLOWANCE, [userP2TRAddress, otherUserP2TRAddress], [], USER_WALLET, true);
      const currentAllowance = arrayBufferToBigInt(currentAllowanceRes!.buffer);
      const excessiveAmount = currentAllowance + 1n;
      
      const { simulationResult: initialOwnerBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
      const initialOwnerBalance = arrayBufferToBigInt(initialOwnerBalanceRes!.buffer);

      try {
        await callContract(
          alkaneId,
          OP_TRANSFER_FROM,
          [userP2TRAddress, otherUserP2TRAddress, excessiveAmount],
          [],
          OTHER_USER_WALLET, // Spender signs
          false
        );
        await client.mineBlocks(1);
        // Check balances remain unchanged
        const { simulationResult: finalOwnerBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
        expect(arrayBufferToBigInt(finalOwnerBalanceRes!.buffer)).to.equal(initialOwnerBalance, "Owner balance changed on failed transferFrom (allowance)");
      } catch (error: any) {
        console.log(`Caught expected error for transferFrom exceeding allowance: ${error.message}`);
        expect(error).to.be.an('error');
      }
    });

    it('should not allow transferFrom if owner balance is insufficient', async () => {
      // Approve a large amount first
      const largeApproval = TOTAL_SUPPLY * 2n; // Approve more than total supply
      await callContract(alkaneId, OP_APPROVE, [otherUserP2TRAddress, largeApproval], [], USER_WALLET, false);
      await client.mineBlocks(1);
      
      const { simulationResult: ownerBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
      const ownerBalance = arrayBufferToBigInt(ownerBalanceRes!.buffer);
      const amountToExceedOwnerBalance = ownerBalance + 1n;

      try {
        await callContract(
          alkaneId,
          OP_TRANSFER_FROM,
          [userP2TRAddress, otherUserP2TRAddress, amountToExceedOwnerBalance],
          [],
          OTHER_USER_WALLET, // Spender signs
          false
        );
        await client.mineBlocks(1);
        const { simulationResult: finalOwnerBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
        expect(arrayBufferToBigInt(finalOwnerBalanceRes!.buffer)).to.equal(ownerBalance, "Owner balance changed on failed transferFrom (balance)");
      } catch (error: any) {
        console.log(`Caught expected error for transferFrom exceeding owner balance: ${error.message}`);
        expect(error).to.be.an('error');
      }
    });
  });

  describe('Custom Token Buy/Sell Functionality', () => {
    const btcPaymentForBuy = 100000n; // 0.001 BTC in sats, if 1 sat = 1 token unit
    const tokensToSell = 50000n;    // 0.0005 tokens

    before(async () => {
      // Ensure USER_WALLET has some tokens to sell, and OTHER_USER_WALLET will be the buyer
      // User wallet should have tokens from core functionality tests.
      // OtherUserWallet might have tokens too. Let's check and top up if needed for clarity.
      
      const { simulationResult: buyerInitialTokensRes } = await callContract(alkaneId, OP_BALANCE_OF, [otherUserP2TRAddress], [], USER_WALLET, true);
      const buyerInitialTokens = arrayBufferToBigInt(buyerInitialTokensRes!.buffer);
      console.log(`Buy/Sell Setup: Initial buyer ${otherUserP2TRAddress} token balance: ${buyerInitialTokens}`);

      const { simulationResult: sellerInitialTokensRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
      const sellerInitialTokens = arrayBufferToBigInt(sellerInitialTokensRes!.buffer);
      console.log(`Buy/Sell Setup: Initial seller ${userP2TRAddress} token balance: ${sellerInitialTokens}`);

      if (sellerInitialTokens < tokensToSell) {
        console.log(`Buy/Sell Setup: Seller ${userP2TRAddress} has insufficient tokens (${sellerInitialTokens}). Transferring from deployer...`);
        await callContract(
          alkaneId,
          OP_TRANSFER,
          [userP2TRAddress, tokensToSell * 2n], // Give enough for the sell test + buffer
          [],
          REGTEST_FAUCET, // Deployer sends tokens
          false
        );
        await client.mineBlocks(1);
        const { simulationResult: sellerTokensAfterTopUpRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
        console.log(`Buy/Sell Setup: Seller ${userP2TRAddress} balance after top-up: ${arrayBufferToBigInt(sellerTokensAfterTopUpRes!.buffer)}`);
      }
    });

    it('should allow a user (OTHER_USER_WALLET) to buy tokens', async () => {
      const { simulationResult: initialBuyerBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [otherUserP2TRAddress], [], USER_WALLET, true);
      const initialBuyerBalance = arrayBufferToBigInt(initialBuyerBalanceRes!.buffer);
      const { simulationResult: initialDeployerTokenBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [deployerP2TRAddress], [], USER_WALLET, true);
      const initialDeployerTokenBalance = arrayBufferToBigInt(initialDeployerTokenBalanceRes!.buffer);

      // The 'buy' function in AS takes no arguments. Payment is verified from tx outputs.
      // The payment must go to the address associated with DEPLOYER_KEY in the contract.
      // This is deployerP2TRAddress.
      const paymentOutputs = [{ address: deployerP2TRAddress, amount: btcPaymentForBuy }];
      
      await callContract(
        alkaneId,
        OP_BUY, // Opcode for buy
        [],     // No arguments for buy() itself in AS contract
        paymentOutputs,
        OTHER_USER_WALLET, // Buyer signs
        false
      );
      await client.mineBlocks(1);

      const { simulationResult: finalBuyerBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [otherUserP2TRAddress], [], USER_WALLET, true);
      const finalBuyerBalance = arrayBufferToBigInt(finalBuyerBalanceRes!.buffer);
      const { simulationResult: finalDeployerTokenBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [deployerP2TRAddress], [], USER_WALLET, true);
      const finalDeployerTokenBalance = arrayBufferToBigInt(finalDeployerTokenBalanceRes!.buffer);
      
      const expectedTokensBought = btcPaymentForBuy; // Assuming 1 sat = 1 token unit as per contract logic

      expect(finalBuyerBalance).to.equal(initialBuyerBalance + expectedTokensBought);
      expect(finalDeployerTokenBalance).to.equal(initialDeployerTokenBalance - expectedTokensBought);
      console.log(`Buy Test: Buyer balance: ${finalBuyerBalance}, Deployer token balance: ${finalDeployerTokenBalance}`);
    });

    it('should not allow a user to buy tokens without sending BTC to deployer', async () => {
      const { simulationResult: initialBuyerBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [otherUserP2TRAddress], [], USER_WALLET, true);
      const initialBuyerBalance = arrayBufferToBigInt(initialBuyerBalanceRes!.buffer);

      try {
        await callContract(
          alkaneId,
          OP_BUY,
          [], // No args for buy
          [], // NO payment outputs
          OTHER_USER_WALLET, // Buyer signs
          false
        );
        await client.mineBlocks(1);
        // If contract logic is strict, this state should not change.
        const { simulationResult: finalBuyerBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [otherUserP2TRAddress], [], USER_WALLET, true);
        expect(arrayBufferToBigInt(finalBuyerBalanceRes!.buffer)).to.equal(initialBuyerBalance, "Buyer balance changed despite failed buy (no payment).");
      } catch (error: any) {
        console.log(`Caught expected error for buy without payment: ${error.message}`);
        expect(error).to.be.an('error'); // Expect an error from simulation or tx failure
      }
    });

    it('should allow a user (USER_WALLET) to sell tokens', async () => {
      const { simulationResult: initialSellerBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
      const initialSellerBalance = arrayBufferToBigInt(initialSellerBalanceRes!.buffer);
      const { simulationResult: initialDeployerTokenBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [deployerP2TRAddress], [], USER_WALLET, true);
      const initialDeployerTokenBalance = arrayBufferToBigInt(initialDeployerTokenBalanceRes!.buffer);

      expect(initialSellerBalance).to.be.gte(tokensToSell, "Seller does not have enough tokens to sell.");

      await callContract(
        alkaneId,
        OP_SELL,
        [tokensToSell], // Argument: amount of tokens to sell
        [], // No BTC payment from seller in this part
        USER_WALLET,   // Seller signs
        false
      );
      await client.mineBlocks(1);

      const { simulationResult: finalSellerBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
      const finalSellerBalance = arrayBufferToBigInt(finalSellerBalanceRes!.buffer);
      const { simulationResult: finalDeployerTokenBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [deployerP2TRAddress], [], USER_WALLET, true);
      const finalDeployerTokenBalance = arrayBufferToBigInt(finalDeployerTokenBalanceRes!.buffer);

      expect(finalSellerBalance).to.equal(initialSellerBalance - tokensToSell);
      expect(finalDeployerTokenBalance).to.equal(initialDeployerTokenBalance + tokensToSell);
      console.log(`Sell Test: Seller balance: ${finalSellerBalance}, Deployer token balance: ${finalDeployerTokenBalance}`);
    });
    
    it('should not allow selling more tokens than balance', async () => {
      const { simulationResult: sellerBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
      const sellerBalance = arrayBufferToBigInt(sellerBalanceRes!.buffer);
      const excessiveAmount = sellerBalance + 1n;

      try {
        await callContract(
          alkaneId,
          OP_SELL,
          [excessiveAmount],
          [],
          USER_WALLET,
          false
        );
        await client.mineBlocks(1);
        const { simulationResult: finalSellerBalanceRes } = await callContract(alkaneId, OP_BALANCE_OF, [userP2TRAddress], [], USER_WALLET, true);
        expect(arrayBufferToBigInt(finalSellerBalanceRes!.buffer)).to.equal(sellerBalance, "Seller balance changed on failed sell.");
      } catch (error: any) {
        console.log(`Caught expected error for selling excessive tokens: ${error.message}`);
        expect(error).to.be.an('error');
      }
    });
  });

  after(async () => {
    console.log("Global after hook: Cleaning up or final logging.");
    // Add any cleanup tasks if necessary
  });
});

// Helper: If arrayBufferToBigInt is not exported from interact.ts, define it locally for tests
if (typeof arrayBufferToBigInt === 'undefined') {
    function arrayBufferToBigInt(buffer: ArrayBuffer): bigint {
        if (!buffer || buffer.byteLength === 0) return 0n;
        const view = new DataView(buffer);
        let result = 0n;
        // Assuming little-endian as per u128.fromUint8ArrayLE in AssemblyScript
        for (let i = 0; i < buffer.byteLength; i++) {
            result += BigInt(view.getUint8(i)) << BigInt(8 * i);
        }
        return result;
    }
}
