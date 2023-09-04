// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import {FootBallAcademy2} from "./FootBallAcademy2.sol";

contract FootBallAcademyFactory2 {
    FootBallAcademy2[] footBallAcademy;

    function createPlayerProfile(
        address _owner,
        uint _wingNumber,
        string calldata _name,
        string calldata _email,
        string calldata _gender,
        uint _phoneNumber,
        uint _age,
        string calldata _country,
        bool isTrue,
        FootBallAcademy2.Status status
    ) external {
        FootBallAcademy2 football = new FootBallAcademy2(_owner);

        football.setPlayerProfile(
            _wingNumber,
            _name,
            _email,
            _gender,
            _phoneNumber,
            _age,
            _country,
            isTrue,
            status
        );
    }

    function createPlayerProfile(address _owner) external {
        FootBallAcademy2 football = new FootBallAcademy2(_owner);

        football.setPlayerProfile(
            10,
            "Mars",
            "mars@gmail.com",
            "M",
            7064643074,
            20,
            "Canada",
            true,
            FootBallAcademy2.Status.Injury
        );
    }
}
