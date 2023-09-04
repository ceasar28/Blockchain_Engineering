// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Class Practice to test understanding nested structs, mapping and enum
 * @author Marcellus Ifeanyi
 * @notice This is practice code to test my understanding of structts, mappings,enums and nested structs.
 *
 *Task:
 * Create a smart contract that showcases various exemplary scenarios by utilizing nested structs and mappings within a primary struct. Within the main struct, integrate a secondary struct, and within this secondary struct, establish a mapping that links it to another struct. Moreover, incorporate an enumeration declaration within the main struct. Conclude by implementing a function that allows for the retrieval of information from the deepest nested struct."
 */

contract FootBallPlayer {
    /** 
 * PSUEDOCODE
 * 
struct MainStruct{
SecondaryStruct
EnumInMainStruct
}

struct SecondaryStruct{
mapping (address => AnotherStruct) name;
}

struct AnotherStruct{}

enum EnumInMainStruct{}

mapping (uint => MainStruct) mainstruct

 */

    /**
     * TYPE DECLARATIONS
     */

    // Main Struct: This contains the FootBall Player details
    struct PlayersData {
        string playerName;
        uint8 playerAge;
        string playerGender;
        uint256 playerNetworth;
        Club club;
        PlayerStatus playerStatus;
    }

    // Secondary Struct: This contains details about the players club
    struct Club {
        string clubName;
        uint8 clubRating;
        uint clubNetworth;
        // playersCountry struct that users the playersName as key to get the Country as Value
        mapping(string => PlayersCountry) playersCountry;
    }

    // Third Struct: This contains the details about the players country
    struct PlayersCountry {
        string countryName;
        string countryCapital;
    }

    // An enum that shows the players status
    enum PlayerStatus {
        Active,
        Injury,
        Benched,
        Retired
    }

    mapping(uint => PlayersData) playersData;

    /**
     * EVENTS
     */

    event CreatedPlayerData(
        string indexed _playerName,
        uint8 _playerAge,
        string _playerGender,
        uint _playerNetworth,
        string indexed _clubName,
        uint8 _clubRating,
        uint _clubNetworth,
        string indexed _countryName,
        string _countryCapital,
        PlayerStatus _playerStatus
    );

    event PlayerName(string indexed name);
    event PlayerAgeAndGender(uint8 indexed age, string indexed gender);
    event PlayerNetworth(uint256 indexed networth);
    event PlayerClubName(string indexed name);
    event ClubRatingAndNetworth(uint8 indexed rating, uint256 indexed networth);
    event CountryName(string indexed name, string indexed _playerName);
    event CapitalCity(string indexed capital, string indexed playerName);
    event CreatedPlayerStatus(PlayerStatus indexed status);

    /**
     * FUNCTIONS
     */

    function setPlayersData(
        uint wingNumber,
        string memory _playerName,
        uint8 _playerAge,
        string memory _playerGender,
        uint _playerNetworth,
        string memory _clubName,
        uint8 _clubRating,
        uint _clubNetworth,
        string memory _countryName,
        string memory _countryCapital,
        PlayerStatus _playerStatus
    ) external {
        // Creating a new instance of the playersData
        PlayersData storage newPlayersData = playersData[wingNumber];

        // Updating PlayersData
        newPlayersData.playerName = _playerName;
        newPlayersData.playerAge = _playerAge;
        newPlayersData.playerGender = _playerGender;
        newPlayersData.playerNetworth = _playerNetworth;
        newPlayersData.club.clubName = _clubName;
        newPlayersData.club.clubRating = _clubRating;
        newPlayersData.club.clubNetworth = _clubNetworth;
        newPlayersData
            .club
            .playersCountry[_playerName]
            .countryName = _countryName;
        newPlayersData
            .club
            .playersCountry[_playerName]
            .countryCapital = _countryCapital;
        newPlayersData.playerStatus = _playerStatus;

        emit CreatedPlayerData(
            _playerName,
            _playerAge,
            _playerGender,
            _playerNetworth,
            _clubName,
            _clubRating,
            _clubNetworth,
            _countryName,
            _countryCapital,
            _playerStatus
        );
    }

    function setPlayersName(uint8 wingNumber, string memory name) external {
        PlayersData storage newPlayersData = playersData[wingNumber];
        newPlayersData.playerName = name;

        emit PlayerName(name);
    }

    function getPlayersName(
        uint8 wingNumber
    ) external view returns (string memory _playerName) {
        PlayersData storage newPlayersData = playersData[wingNumber];
        _playerName = newPlayersData.playerName;
    }

    function setPlayersAgeAndGender(
        uint8 wingNumber,
        uint8 age,
        string memory gender
    ) external {
        PlayersData storage newPlayersData = playersData[wingNumber];
        newPlayersData.playerAge = age;
        newPlayersData.playerGender = gender;

        emit PlayerAgeAndGender(age, gender);
    }

    function getPlayersAgeAndGender(
        uint8 wingNumber
    ) external view returns (uint8, string memory) {
        PlayersData storage newPlayersData = playersData[wingNumber];

        return (newPlayersData.playerAge, newPlayersData.playerGender);
    }

    function setPlayerNetworth(uint256 networth, uint8 wingNumber) external {
        PlayersData storage newPlayersData = playersData[wingNumber];
        newPlayersData.playerNetworth = networth;

        emit PlayerNetworth(networth);
    }

    function getPlayerNetWorth(
        uint8 wingNumber
    ) external view returns (uint256) {
        PlayersData storage newPlayersData = playersData[wingNumber];
        return newPlayersData.playerNetworth;
    }

    function setPlayerClubName(uint8 wingNumber, string memory name) external {
        PlayersData storage newPlayersData = playersData[wingNumber];
        newPlayersData.club.clubName = name;

        emit PlayerClubName(name);
    }

    function getPlayerClubName(
        uint8 wingNumber
    ) external view returns (string memory) {
        PlayersData storage newPlayersData = playersData[wingNumber];
        return newPlayersData.club.clubName;
    }

    function setClubRatingAndNetworth(
        uint8 wingNumber,
        uint256 networth,
        uint8 rating
    ) external {
        PlayersData storage newPlayersData = playersData[wingNumber];
        newPlayersData.club.clubNetworth = networth;
        newPlayersData.club.clubRating = rating;

        emit ClubRatingAndNetworth(rating, networth);
    }

    function getPlayerClubRatingAndNetworth(
        uint8 wingNumber
    ) external view returns (uint8, uint256) {
        PlayersData storage newPlayersData = playersData[wingNumber];
        return (
            newPlayersData.club.clubRating,
            newPlayersData.club.clubNetworth
        );
    }

    function setCountryName(
        uint8 wingNumber,
        string memory name,
        string memory _playerName
    ) external {
        PlayersData storage newPlayersData = playersData[wingNumber];

        newPlayersData.club.playersCountry[_playerName].countryName = name;

        emit CountryName(name, _playerName);
    }

    function getCountryName(
        uint8 wingNumber,
        string memory _playerName
    ) external view returns (string memory) {
        PlayersData storage newPlayersData = playersData[wingNumber];

        return newPlayersData.club.playersCountry[_playerName].countryName;
    }

    function setCapitalCity(
        uint8 wingNumber,
        string memory capital,
        string memory playerName
    ) external {
        PlayersData storage newPlayersData = playersData[wingNumber];

        newPlayersData.club.playersCountry[playerName].countryCapital = capital;

        emit CapitalCity(capital, playerName);
    }

    function getCapitalCity(
        uint8 wingNumber,
        string memory playerName
    ) external view returns (string memory) {
        PlayersData storage newPlayersData = playersData[wingNumber];

        return newPlayersData.club.playersCountry[playerName].countryCapital;
    }

    function setPlayerStatus(uint8 wingNumber, PlayerStatus status) external {
        PlayersData storage newPlayersData = playersData[wingNumber];

        newPlayersData.playerStatus = status;
    }

    function getPlayerStatus(
        uint8 wingNumber
    ) external view returns (PlayerStatus, string memory) {
        PlayersData storage newPlayersData = playersData[wingNumber];

        if (newPlayersData.playerStatus == PlayerStatus.Injury) {
            return (newPlayersData.playerStatus, "Injury");
        } else if (newPlayersData.playerStatus == PlayerStatus.Benched) {
            return (newPlayersData.playerStatus, "Benched");
        } else if (newPlayersData.playerStatus == PlayerStatus.Retired) {
            return (newPlayersData.playerStatus, "Retired");
        }
        return (newPlayersData.playerStatus, "Active");
    }
}
