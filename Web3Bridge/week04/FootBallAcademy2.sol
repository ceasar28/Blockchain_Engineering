// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract FootBallAcademy2 {
    address owner;
    address deployer;
    address payable academyFunds;

    struct PlayerProfile {
        string name;
        string email;
        uint256 phoneNumber;
        string gender;
        uint age;
        string country;
        uint256 wingNumber;
        bool isAvailable;
        Status status;
    }

    mapping(uint256 wing => PlayerProfile) wingToPlayerProfile;

    enum Status {
        Active,
        Injury,
        Benched,
        Retired
    }

    struct Clubs {
        string clubName;
        CoachProfile coachProfile;
        // uint256 price;
        bool requestPlayer;
        uint256 clubNetworth;
    }

    struct CoachProfile {
        string name;
        uint age;
        string country;
    }

    mapping(address => Clubs) addressToClubs;

    event ClubSetted(
        string _clubName,
        string _name,
        uint _age,
        string _country,
        uint _clubNetworth,
        address user
    );

    event PlayerProfileSetted(
        uint _wingNumber,
        string _name,
        string _email,
        string _gender,
        uint _phoneNumber,
        uint _age,
        string _country
    );

    constructor(address _owner) {
        owner = _owner;
        deployer = msg.sender;
    }

    function setPlayerProfile(
        uint _wingNumber,
        string calldata _name,
        string calldata _email,
        string calldata _gender,
        uint _phoneNumber,
        uint _age,
        string calldata _country,
        bool isTrue,
        Status status
    ) external {
        PlayerProfile storage newPlayerProfile = wingToPlayerProfile[
            _wingNumber
        ];

        newPlayerProfile.name = _name;
        newPlayerProfile.email = _email;
        newPlayerProfile.phoneNumber = _phoneNumber;
        newPlayerProfile.gender = _gender;
        newPlayerProfile.age = _age;
        newPlayerProfile.country = _country;
        newPlayerProfile.wingNumber = _wingNumber;
        newPlayerProfile.isAvailable = true;
        newPlayerProfile.status;

        emit PlayerProfileSetted(
            _wingNumber,
            _name,
            _email,
            _gender,
            _phoneNumber,
            _age,
            _country
        );
    }

    function getPlayerProfile(
        uint _wingNumber
    )
        external
        view
        returns (
            string memory,
            string memory,
            uint,
            string memory gender,
            uint,
            string memory,
            uint,
            bool,
            Status
        )
    {
        PlayerProfile storage playerProfile = wingToPlayerProfile[_wingNumber];

        return (
            playerProfile.name,
            playerProfile.email,
            playerProfile.phoneNumber,
            playerProfile.gender,
            playerProfile.age,
            playerProfile.country,
            playerProfile.wingNumber,
            playerProfile.isAvailable,
            playerProfile.status
        );
    }

    function setClubs(
        string calldata _clubName,
        string calldata _name,
        uint _age,
        string calldata _country,
        bool,
        uint _clubNetworth,
        address user
    ) external {
        Clubs storage newClubs = addressToClubs[user];

        newClubs.clubName = _clubName;
        newClubs.coachProfile.name = _name;
        newClubs.coachProfile.age = _age;
        newClubs.coachProfile.country = _country;
        newClubs.clubNetworth = _clubNetworth;
        newClubs.requestPlayer = true;

        emit ClubSetted(_clubName, _name, _age, _country, _clubNetworth, user);
    }

    function getClubs(
        address user
    )
        external
        view
        returns (string memory, string memory, uint, string memory, uint, bool)
    {
        Clubs memory club = addressToClubs[user];

        return (
            club.clubName,
            club.coachProfile.name,
            club.coachProfile.age,
            club.coachProfile.country,
            club.clubNetworth,
            club.requestPlayer
        );
    }
}
