// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title This is a contract that keeps record of  the students in the university
 * @author Marcellus Ifeanyi
 * @notice A record of student in the university, the contract allow only principal to admit or expel student.
 * @dev This contract will be called or deployed using the Factory contract
 */

contract StudentDetails {
    address principal;
    address public Deployer;

    struct Student {
        string name;
        uint age;
        string gender;
    }

    uint id;

    mapping(uint => Student) iDToStudent;

    event Admitted(
        string indexed _name,
        string indexed _gender,
        uint indexed _age,
        uint id
    );

    constructor(address _principal) {
        principal = _principal; // Hint: Don't use msg.sender here, because you are deploying this contract in another contract
        Deployer = msg.sender;
    }

    modifier onlyPrincipal() {
        require(msg.sender == principal, "Not Principal");
        _;
    }

    function admitStudent(
        string memory _name,
        string memory _gender,
        uint _age
    ) external onlyPrincipal {
        id = id + 1;
        Student storage newStudent = iDToStudent[id];
        newStudent.name = _name;
        newStudent.gender = _gender;
        newStudent.age = _age;

        // Hint: For best practice anytime you made changes on the storage or blockchain state, Please emit an event. The events will be used in the Frontend.
        emit Admitted(_name, _gender, _age, id);
    }

    function expelStudent(uint _id) external onlyPrincipal {
        delete iDToStudent[_id];

        /*
 Another way of the deleting is by Reseting the mapping ie You manually reset all the values to their default one by one and not using the delete keyword as shown below. Hint: This is the best approach especially when you have mapping inside a struct, Using the delete keyword method will not delete the mapping inside the struct. 
  Learn more here: https://kiecodes.medium.com/hidden-pitfall-in-solidity-insecure-data-deletion-4d86e87b6f1c
 
Student storage newStudent = iDToStudent[_id];
newStudent.name="";
newStudent.gender="";
newStudent.age=0;
*/
    }

    function getStudentDetail(
        uint _id
    ) external view returns (Student memory s) {
        s = iDToStudent[_id];
    }
}
