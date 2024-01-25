// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

// allow user to stake standardToken
// able to view the total amount staked by a user
// allow user to be able to withdraw their stake amount

import {IstandardToken} from "./IstandardToken.sol";

contract Staking {
    IstandardToken standardToken;

    struct User {
        uint amountStaked;
        uint timeStaked;
    }
    mapping(address => User) user;

    event Staked(uint amountstake, uint totalAmount, uint time);

    constructor(address _standardToken) {
        standardToken = IstandardToken(_standardToken); // typecasting address to "contract" data type
    }

    function stake(uint amount) external {
        uint balance = standardToken.balanceOf(msg.sender);
        require(balance >= amount, "ERC20: Insufficient balance");
        bool success = standardToken.transferFrom(
            msg.sender,
            address(this),
            amount
        ); // When somebody stake token we want
        // them to send the token to this address. transfer the token from them to us.
        require(success, "Transfer Failed");

        User storage _user = user[msg.sender];
        _user.amountStaked += amount;
        _user.timeStaked = block.timestamp;

        emit Staked(amount, _user.amountStaked, block.timestamp);
    }

    function getStaked(address who) public view returns (uint _staked) {
        User storage _user = user[who];
        _staked = _user.amountStaked;
    }

    function withdraw(uint amount) external {
        User storage _user = user[msg.sender];
        // uint totalStaked=_user.amountStaked;
        uint totalStaked = getStaked(msg.sender);

        require(totalStaked >= amount, "Insufficient staked amount");
        _user.amountStaked -= amount;
        standardToken.transfer(msg.sender, amount);
    }

    function withdrawEther() external {
        standardToken.withdrawEther();
    }

    receive() external payable {}

    fallback() external payable {} // Hint: You can call more logic inside
    // your fallback function but for the receive function you cannot have other logic.
}
