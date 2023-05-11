/**
 * Blocks and Hashes
Blockchain is aptly named! It is, in fact, a chain of blocks. 

Each block contains transactional data, some metadata describing the block itself, and a link to the previous block before it. These components are fed into a hash function to create a unique sequence of bits to represent the block.

Hash Function
Hash functions are used to take input data of any size and output a unique series of bits of a specific size representing that original data.

An ideal cryptographic hash function can, given any input, return a consistent yet seemingly random output.

It's important that the output is consistent so we can depend on putting the same inputs in and receiving the same output.

It's also important for the randomness to be strong enough where it's impossible to re-construct the input from the output. This way, we know it's tamper-proof.

For example the SHA256 algorithm will take an input like Dan and return a consistent output:

const hash = SHA256("Dan");
console.log( hash.toString() ); // b12595…1cbe7e
 The log is shortened, it is actually 64 hexadecimal characters long. SHA256 outputs 256 bits. Since a hexadecimal character requires 4 bits, there are 64 hexadecimal characters in a SHA256 hash.

If, instead my input was the lower case dan, the result would be completely different:

const hash = SHA256("dan");
console.log( hash.toString() ); // ec4f2d…56f1cb
These hash outputs are seemingly random in relation to their inputs: "Dan" and "dan". They are also consistent, putting in these inputs will always yield these same outputs. For these reasons sha256 is an ideal cryptographic hash function and is often used in cryptographic programs.

Crypto-JS
The crypto-js library provides us with several cryptographic utilities. Specifically the SHA256 method is an implementation of the SHA256 algorithm designed by the NSA.

This function will take any string as an argument, regardless of size, and hash it to a 256 bit array. If we call toString() on that returned object we'll receive a 64 character hexadecimal string.

Hexadecimal
You'll notice that the outputs shown consist of a set of characters ranging from a to f and 0 to 9. These are hexadecimal characters. It has become commonplace to use hexadecimal when displaying a hash.

 You'll also often see a hash with a 0x in front of it. This prefix means that hexadecimal notation is being used. So if you see a string of characters "0x123abc", the "0x" is denoting the use of hexadecimals and the string's value is actually just "123abc".

For the test file in this stage you'll notice that the hash of the block is being tested by the regular expression (regex) /^[0-9A-F]{64}$/i. It's simply testing to see that this is a hexadecimal output of 64 characters.

 Regular expressions can help define a search pattern for input data. Learn more about regular expressions on MDN

Why 64 Hexadecimal Characters?

A bit can represent two values: 0 and 1. Two bits can represent four values 00, 01, 10 and 11. Four bits can represent 16 values 0000 through 1111. We can map each of these values to a character in the hexadecimal alphabet since it contains 16 characters! Since SHA256 outputs 256 bits, we divide that by the number of bits to represent a hexadecimal character (4) to get 64 characters.



 Your Goal: Return a Hash
In your Block.js file, we have a class Block. Using the SHA256 function from the Crypto JS Library, return a valid hash in the toHash function.

For now, there's no need to hash anything in particular since the block contains none of the components we mentioned above.

 Feel free to hash a message, your own name, or nothing at all! So long as it is a 64 character hexadecimal string you will pass this stage.


 */
