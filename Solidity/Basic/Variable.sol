// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionLab {

    uint a; // State Variables
    uint b; // State Valiables
    address k; // State Variables

    constructor(uint _a,uint _b) {
        a = _a;
        b = _b;
    }

    function sumFunction() private view returns(uint c) {
        return a + b;
    }

    function anotherFunction () internal view returns (uint ){
        uint d = sumFunction(); // d is a local variable
        return d;
    }

    function payableFunc() public payable  returns (uint){
        uint amount = msg.value; //Global variable
        return amount;
    }
}

    