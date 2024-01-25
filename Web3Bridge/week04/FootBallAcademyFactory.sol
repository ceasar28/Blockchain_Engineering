// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import {FootBallAcademy} from "./FootBallAcademy.sol";

contract FootBallAcademyFactory {
    FootBallAcademy[] public footBallAcademy;

    function createPlayerProfile(
        address _owner,
        uint _wingNumber,
        string calldata _name,
        string calldata _email,
        string calldata _gender,
        uint _age,
        string calldata _country
    ) external {
        FootBallAcademy football = new FootBallAcademy(_owner);

        football.setPlayerProfile(
            _wingNumber,
            _name,
            _email,
            _gender,
            _age,
            _country
        );

        footBallAcademy.push(football);
    }

    function createClub(
        address _owner,
        string calldata _clubName,
        string calldata _name,
        uint _age,
        string calldata _country,
        uint _clubNetworth,
        address user
    ) external {
        FootBallAcademy footballclub = new FootBallAcademy(_owner);

        footballclub.setClubs(
            _clubName,
            _name,
            _age,
            _country,
            _clubNetworth,
            user
        );

        footBallAcademy.push(footballclub);
    }

    function getPlayersCount() external view returns (uint) {
        return footBallAcademy.length;
    }

    function viewPlayerProfile(
        uint index
    )
        external
        view
        returns (
            string memory name,
            string memory email,
            uint phoneNumber,
            string memory gender,
            uint age,
            string memory country,
            uint wingNumber
        )
    {
        return footBallAcademy[index].getPlayerProfile();
    }

    function viewClubs(
        uint index
    )
        external
        view
        returns (string memory, string memory, uint, string memory, uint, bool)
    {
        //address owner = footBallAcademy[index].owner();
        return footBallAcademy[index].getClubs();
    }
}
