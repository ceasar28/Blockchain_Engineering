// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;
import "./StudentDetails.sol";

/**
Ways of crating child contract

1. New
2. Create, Create2 (more gas efficient)
3. EIP-1167 (Minimal proxy code)


Hint: By convention any contract that deploy another contract always have the "Factory" keyword attached to contract name.
*/

contract StudentDetailsFactory {
    // Hint: Is always a good practice to store the factory contract in your storage

    StudentDetails[] studentDetails;

    function createStudentDetails1()
        external
        returns (StudentDetails newstudentDetails)
    {
        // Hint: Anytinme you use the new() to deploy a contract, it returns a contract address for you
        newstudentDetails = new StudentDetails(msg.sender);

        newstudentDetails.admitStudent("Mars", "Male", 20);

        newstudentDetails.getStudentDetail(1);
        // Saving to storage
        studentDetails.push(newstudentDetails);
    }

    function createStudentDetails2(
        address me
    ) external returns (StudentDetails newstudentDetails) {
        newstudentDetails = new StudentDetails(me);

        newstudentDetails.admitStudent("Mars Ifeanyi", "Male", 10);

        newstudentDetails.getStudentDetail(1);

        studentDetails.push(newstudentDetails);
    }
}

// Hint: when you are creating a Factory Contract, don't use msg.sender. Use  the EOA Address you want or you will be using to deploy the child contract

/**
 * A Contract Factory is a design pattern that creates contracts based on a template.
 */
