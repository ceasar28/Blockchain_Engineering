// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import {Bank} from "./Bank.sol";

contract BankFactory {
    // instantiate Bank contract
    Bank bank;
    //keep track of created Bank addresses in array
    Bank[] public list_of_banks;

    // function arguments are passed to the constructor of the new created contract
    function createBank(address _owner, uint256 _funds) external {
        // create new banks
        bank = new Bank(_owner, _funds);

        // Add bank to the list_of_banks ie array that contains the banks
        list_of_banks.push(bank);
    }

    // Hint The value at index 0 in the list_of_banks array becomes the address of the created contract!
}
