// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
// there are two types of Datatypes: the reference and value type
contract DataTypes {
   bool public B = true; // True or false
   uint public U = 1234; // uint = uint256 0 to 2**256 - 1
                        //         uint8 0 to 2**8 - 1
                        //          uint16 0 tp 2**16 - 1
    int public i = -1234;  // int  =  int256 -2**255 to 2**255 - 1
                            //         int128 -2**127 to 2**127 - 1
    
    // to get the maximum value a declared integer can carry
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    address public myAddress = 0xA9b81Fa3f26D6216E7e6dC2202698b627294Ec48;
    
}