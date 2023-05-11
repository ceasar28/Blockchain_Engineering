/**
 * Chain Validation
Blockchains are run by a network of computers. When a computer finds a new block, it broadcasts its new version of the blockchain to all of its peers. There may be multiple versions of the blockchain at any given time. However, the longest valid blockchain is the accepted one.

 Let's take a closer look at the logic behind this in details.

 Blockchain Consensus
Blockchains are said to share a common source of truth. This is because all machines operating in the network can come to a common consensus on what the truth is.

The consensus mechanism we describe in this lesson is referred to as Proof of Work. A major rule in Proof of Work is that the longest chain wins. This rule is in place to ensure that the version of the blockchain with the most computational resources behind it is the current version of the truth.

So the question we ought to be asking ourselves is: Why is it so difficult to compute a new block? 

The answer is, it is designed to be difficult. The difficulty is a feature of a blockchain designed to require significant resources in order to derive a new block. This is the security behind the network which makes it outrageously expensive to attack.  .

The process by which the a new block is derived is called mining and the difficult of mining is adjusted by the network as new resources flow into and out of the system.

Mining 
Mining is the process by which new blocks are discovered for a blockchain. A new block has to satisfy rules in order to fit into a blockchain.

These rules are the ones we've been working on! The new block must include a hash calculated by some metadata, some transactional data, and the previous hash of the block before it.

One final rule is added to manipulate the difficulty of the block: The block's hash must contain a certain number of zeroes.

 The only way to derive this hash with the data mentioned is to add a random value, referred to as a nonce, to the data during the hashing calculation. Essentially, the computer must continue to guess incessantly until it finds a block that satisfies these conditions.

Once a block is found, the computer broadcasts this block to the network and is rewarded financially for doing so.

 Your Goal: Create an isValid Function
Create a function called isValid on our Blockchain that will return true or false if a block is valid or invalid respectively
isValid should check the integrity of every block in its chain by looking at each block's previousHash field and making sure that it is equal to the hash of the block before it
💡 Hint
To compare the output of the SHA256 function you will need to convert it into a string (.toString) before comparing. Example:

const hash1 = SHA256("a");
const hash2 = SHA256("a");

console.log(hash1 === hash2); // false
console.log(hash1.toString() === hash2.toString()); // true
 Notice that first one is false! These two are objects and are compared by reference which is why we need to convert it to a string!


 */

const Block = require("./Block");

class Blockchain {
  constructor() {
    let Genesis = new Block("the genesis block");
    Genesis.toHash(); // calculate the hash of the Genesis block
    this.chain = [Genesis];
  }

  addBlock(block) {
    // pointing to the previous hash
    let [previousBlock] = this.chain.slice(-1); // to get the last block on the chain note slice returns an array, so destructure it
    block.previousHash = previousBlock.hash; // set previousHash
    block.toHash(); // calculate new hash using previousHash
    this.chain.push(block);
  }

  isValid() {
    // to compare outputs of SHA256, convert to string first because the SHA256 function returns an object which is a reference type
    for (let i = 0; i < this.chain.length; i++) {
      if (
        this.chain[i]["previousHash"].toString() ===
        this.chain[i - 1]["hash"].toString()
      ) {
        return true;
      }
      return false;
    }
  }
}

module.exports = Blockchain;
