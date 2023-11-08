// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Variable {

    int num;
    uint float;
    string money;
    bool saved;

function setVariables (int _num,uint _float,string memory _money,bool _saved) public  returns(string memory ){
num = _num;
float = _float;
money = _money;
saved = _saved;

return "Successfuly set";
 }

 function getVariables () public view returns(int,uint,string memory, bool){
    return (num, float, money, saved);
 }
}

// https://academy.metacrafters.io/swap

// Challenge
// Write a simple contract and declare four different types of variables. Write get and set functions for each of these variables. Return the value of the variable in the “set function”.