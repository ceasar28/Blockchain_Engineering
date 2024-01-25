// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title  This is a classwork to  Understanding of Struct and Mappings In Solidity
 * @author Marcellus Ifeanyi
 * @notice Classwork02
 */

/**  
 * # Task:
 Create a Struct that stores 4 details about a student.
 create a mapping that mapps address to the struct of student details
 Update the struct with input from the user
 get the details of the student.

*/

contract StudentDetails {
    struct StudentDetail {
        string name;
        uint8 age;
        string techStack;
        uint8 yearsOfExperience;
    }

    StudentDetail studentDetail;

    mapping(address => StudentDetail) private addressToStudentDetail;

    // Updating every member once. VIP: This is not really the best approach, as you will need to update all member once. ie you can't just update just one or a specific member.
    function setStudentDetail(
        string calldata _name,
        uint8 _age,
        string calldata _techStack,
        uint8 _yearsOfExperience
    ) external {
        addressToStudentDetail[msg.sender] = StudentDetail({
            name: _name,
            age: _age,
            techStack: _techStack,
            yearsOfExperience: _yearsOfExperience
        });
    }

    function setDetail() public {
        addressToStudentDetail[msg.sender] = StudentDetail(
            "Mars",
            20,
            "Smart Contract Dev",
            5
        );
    }

    // Updating every or specific member of the struct. VIP: This is the best approach
    function setStudentDetail2() public {
        studentDetail.name = "Mars Ifeanyi";
        studentDetail.age = 20;
        studentDetail.techStack = " Frontend | Smart Contract Dev and Auditing";
        studentDetail.yearsOfExperience = 5;
    }

    function setStudentDetail3() public pure returns (StudentDetail memory) {
        StudentDetail memory studentDetail2 = StudentDetail(
            "Mars Ifeanyi",
            20,
            "FrontEnd",
            5
        );
        return studentDetail2;
    }

    function getDetail() external view returns (StudentDetail memory) {
        return addressToStudentDetail[msg.sender];
    }

    function changeName(string memory _name) public {
        studentDetail.name = _name;
    }
}
