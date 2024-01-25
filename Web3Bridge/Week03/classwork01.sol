// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

/**
 * @title This is a classwork to test Understanding of State Variables and Visiblity modifiers in solidity
 * @author Marcellus Ifeanyi
 * @notice
 */

/**
 *  # Task:
 * 1: Declare 7 variables and  set two of the variables defined as parameter in the  constructor, the variables you decalred should have atleast one constant
 2: Return two of the variables
 */

contract variablesPractice {
    string public studentName;
    string public courseOfStudy;
    uint256 private yearsOfExperience = 5;
    string private techStack;
    uint8 internal age;
    uint8 constant HOUROFSLEEP = 4;
    uint8 public immutable yourHeight;

    constructor(string memory _studentName, string memory _courseOfStudy) {
        studentName = _studentName;
        courseOfStudy = _courseOfStudy;
        yourHeight = 10;
    }

    function getStudentNameAndCourse()
        public
        view
        returns (string memory, string memory)
    {
        return (studentName, courseOfStudy);
    }

    function getYearOfExperience() public view returns (uint256) {
        return yearsOfExperience;
    }

    function getHourOfSleep() public pure returns (uint256) {
        return HOUROFSLEEP;
    }

    function getTechStack() public view returns (string memory) {
        return techStack;
    }
}
