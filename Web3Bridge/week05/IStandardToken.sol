// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

interface IstandardToken {
    // Hint: The interface gives us all the functionalities to interact with the deployed token contract.
    function balanceOf(address _owner) external view returns (uint256 balance);

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external returns (bool success);

    function transfer(
        address _to,
        uint256 _value
    ) external returns (bool success);

    function withdrawEther() external;
}
