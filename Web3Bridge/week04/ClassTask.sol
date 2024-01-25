// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/**
 * Task: 
 * Create a smart contract that showcases various exemplary scenarios by utilizing nested structs and mappings within a primary struct. Within the main struct, integrate a secondary struct, and within this secondary struct, establish a mapping that links it to another struct. Moreover, incorporate an enumeration declaration within the main struct. Conclude by implementing a function that allows for the retrieval of information from the deepest nested struct."

In the above task  there are  total of 3 structs you are working with. 
 */

/** 
 * PSUEDOCODE:

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

contract Schools {
    // Main Struct
    struct School {
        string name;
        SchoolType schoolType; // enum
        Department dept; // secondary struct
    }

    // enum for main struct
    enum SchoolType {
        Federal,
        State,
        Private
    }

    // Secondary struct
    struct Department {
        string nameD;
        uint matric;
        mapping(uint => LecturerDetails) lecturers; // mapping of  uint  to third struct
    }

    // 3rd/Another struct
    struct LecturerDetails {
        string nameL;
        string subject;
    }

    // Mapping of uint to School (Main Struct)
    mapping(uint => School) school;
    mapping(address => School) _school2; // Another way of doing it ie if you want to use address as your key.

    uint schoolCount = 1;

    function setSchool(
        string memory _nameS,
        SchoolType _type,
        string memory _nameD,
        uint _matric,
        string memory _nameL,
        string memory _subject
    ) external {
        // create a new instance of the Main struct (School) and assign it to the mapping
        School storage newSchool = school[schoolCount]; // newSchool becomes of of the type "mapping"

        // Update the Data stored in the School struct (Main struct)

        newSchool.name = _nameS;
        newSchool.schoolType = _type;
        newSchool.dept.nameD = _nameD;
        newSchool.dept.matric = _matric;
        newSchool.dept.lecturers[1].nameL = _nameL;
        newSchool.dept.lecturers[1].subject = _subject;
        schoolCount++;
    }

    function returnSchool(
        uint id,
        uint countNumber
    ) external view returns (string memory _subject) {
        School storage newSchool = school[countNumber];

        _subject = newSchool.dept.lecturers[id].subject;
    }

    /**
     * @param id:  The unique Id of the lecturer
     * @param countNumber: The count number for a particular school
     * @dev This function returns the subject that the lecturer teaches.
     */
    function getLecturersSubject(
        uint id,
        uint countNumber
    ) external view returns (string memory subject) {
        School storage newSchool = school[countNumber];
        subject = newSchool.dept.lecturers[id].subject;
    }

    /**
     * @param id:  The unique Id of the lecturer
     * @param countNumber: The count number for a particular school
     * @dev This function returns the lecturers Name.
     */
    function getLecturersName(
        uint id,
        uint countNumber
    ) external view returns (string memory lecturersName) {
        School storage newSchool = school[countNumber];
        lecturersName = newSchool.dept.lecturers[id].nameL;
    }

    /**
     * @param countNumber: The count number for a particular school
     * @dev This functions returns the student matric number
     */
    function getMatricNumber(
        uint countNumber
    ) external view returns (uint matricNumber) {
        School storage newSchool = school[countNumber];

        matricNumber = newSchool.dept.matric;
    }

    /**
     * @param countNumber: The count number for a particular school
     * @dev This functions returns the name of the department
     */
    function getDepartmentName(
        uint countNumber
    ) external view returns (string memory nameOfDepartment) {
        School storage newSchool = school[countNumber];
        nameOfDepartment = newSchool.dept.nameD;
    }

    /**
     * @param countNumber: The count number for a particular school
     * @dev This functions returns the type of the school as specified in the enum
     */
    function getSchoolType(
        uint countNumber
    ) external view returns (SchoolType, string memory) {
        School storage newSchool = school[countNumber];

        if (newSchool.schoolType == SchoolType.State) {
            return (newSchool.schoolType, "State");
        } else if (newSchool.schoolType == SchoolType.Private) {
            return (newSchool.schoolType, "Private");
        }
        return (newSchool.schoolType, "Federal");
    }

    /**
     * @param countNumber: The count number for a particular school
     * @dev This function returns the name of the school
     */
    function getSchoolName(
        uint countNumber
    ) external view returns (string memory nameOfSchool) {
        School storage newSchool = school[countNumber];
        nameOfSchool = newSchool.name;
    }
}
