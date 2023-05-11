/**
 * Previous Hash
It's time to add one more crucial input to our block's hash calculation: the hash of the previous block in the chain.

Linking Blocks

This creates a chain where any change to the data of an earlier block will affect each subsequent block.

 Let's take a look at what a change would do in details.

 Changing Data
The diagram below shows how each block contains a hash of the block data and the previous block hash. Understanding this architecture will help us understand why a blockchain is considered so secure.

Linking Blocks

Thought experiment: What would happen if we changed Alice's BTC to "4 BTC" in the Genesis Block? 

Let's highlight any changes in red:

Changing BTC

Wow! Every single hash changed 

Since the first block data affected the hash calculation of the Genesis Block, its hash changed. The Genesis hash then affects the hash calculation of Block #1 since it's hash includes the previous block's hash (Genesis Block hash). Therefore, Block #1's hash has changed as well. The Block #1 hash then affects the hash calculation of Block #2. This sort of pattern will continue until the Nth block in an N length blockchain. With that in mind, we can conclude that changing an earlier block in a blockchain will always affect every block after that initial block change.

This means that to make even the slightest change in the data of the genesis block would require replacing the entire blockchain.

 The reason blockchains are secure is that a massive network is continuously working to compute a single block while a hacker would need to compute multiple blocks to actually affect the history of a blockchain. This process of computation is called mining and we'll talk about why it's computationally expensive in a future stage.

 Your Goal: Link Blocks
To link the blocks you have to accomplish two things:

Add a previousHash property to each block. The value of this property should be the hash of the block before it in the chain.
Use this previousHash property in the calculation of the block's hash.
💡 Hints
A good spot to add the previousHash property on the block would be in the addBlock function, where a block is placed on the chain.
So far, the Block class in your Block.js file does not yet contain a previousHash property and currently only hashes this.data of a block - you must also include the block's this.previousHash property in the toHash function!
You can add multiple inputs to the SHA256 function by using the + operator, for example:
const hash = SHA256("dog" + "cat); // hash of dog and cat together

 */
