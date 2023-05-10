/**
 * Target Difficulty
In bitcoin, the difficulty is adjusted every 2016 blocks, which is about every two weeks with the blocks being mined on average every 10 minutes.

At that point, the difficulty is adjusted to attempt to keep the mining intervals around that 10 minute per block mark.

 Your Goal: Proof of Work
Now it's time to actually mine the block. This is where we get the work part of proof of work!

In the mine function, prior to hashing the block, add a nonce property. This property should start at 0
Keep changing the nonce until you find a hash that is less than the TARGET_DIFFICULTY
You can compare a BigInt to another BigInt using the JavaScript comparison operators. You can convert from a hash to be a BigInt by:

const hash = SHA256("example");
const int = BigInt(`0x${hash}`);
 */

const SHA256 = require("crypto-js/sha256");
const TARGET_DIFFICULTY =
  BigInt(0x0fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
const MAX_TRANSACTIONS = 10;

const mempool = [];
const blocks = [];

function addTransaction(transaction) {
  // TODO: add transaction to mempool
  mempool.unshift(transaction);
  return;
}

function mine() {
  let transactions = mempool.slice(0, MAX_TRANSACTIONS); // get transactions from mempool

  mempool.splice(0, MAX_TRANSACTIONS); // remove mined transactions from mempool
  let nonce = 0;
  let hash = SHA256(
    JSON.stringify({
      id: blocks.length,
      transactions: transactions,
      nonce: nonce,
    })
  ); // hash block data
  let int = BigInt(`0x${hash}`);
  while (int >= TARGET_DIFFICULTY) {
    nonce++;
    hash = SHA256(
      JSON.stringify({
        id: blocks.length,
        transactions: transactions,
        nonce: nonce,
      })
    ); // hash block data
    int = BigInt(`0x${hash}`);
  }
  blocks.push({
    id: blocks.length,
    transactions: transactions,
    nonce: nonce,
    hash: hash,
  }); // add block to chain
}
