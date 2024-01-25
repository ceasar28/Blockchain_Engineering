// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// This is used as a template to initialize state variables
contract Bank {
    uint256 public bank_funds;
    address public owner;
    address public deployer;

    // The constructor initializes state variables passed to by the BankFactory.
    constructor(address _owner, uint256 _funds) {
        bank_funds = _funds;
        owner = _owner;
        deployer = msg.sender;
    }
}
