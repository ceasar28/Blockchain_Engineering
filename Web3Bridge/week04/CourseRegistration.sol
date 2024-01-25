// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/** Custom Errors */
error userDetailsNotUnique(
    string userName,
    string userEmail,
    uint256 phoneNumber
);

contract CourseRegistration {
    /**
 * struct StudentData{
 * }
 * 
 * enum enrollmentStatus{
 * }
 * 
 * struct AvailableCourses{}
 * 
 * struct EnrolledStudent{}
 * EnrolledStudents[] enrolledStudents
 * 
 * bool isEnrolled
 * bool hasCompletedCourse
 * 
 * 
 * 1. Enroll in course
 * 2. Check Enrollment Status
 * 3. Request for certificate (){
 * 
 * check if student is enrolled first and ifCompleted is true
 * }
 * 
 * 

 */
    /** TYPE DECLARATIONS */

    struct StudentProfile {
        string fullName;
        string email;
        string userName;
        uint256 phoneNumber;
        string country;
        EnrolledCourses enrolledCourses;
    }

    mapping(address userAddress => StudentProfile) studentProfile;

    struct EnrolledCourses {
        string courseName;
        string courseCode;
        uint256 dateEnrolled;
        mapping(string courseCode => bool hasCompleted) hasCompletedCourse;
    }

    struct AllCourses {
        string courseName;
        string courseCode;
        uint256 coursePrice;
        CourseCreatorProfile courseCreatorProfile;
    }
    AllCourses[] allCourses;

    struct CourseCreatorProfile {
        string name;
        string areaofSpecialization;
        uint8 numberOfCourseCreated;
        uint8 yearsOfExperience;
    }

    struct EnrolledStudents {
        string name;
        string email;
        string courses;
        CourseProgress courseProgress;
    }

    mapping(address => EnrolledStudents) enrolledStudents;

    enum CourseProgress {
        Active,
        Pending,
        Completed
    }

    struct AlumniStudent {
        string fullName;
        string email;
        string userName;
        uint256 phoneNumber;
        string country;
        string currentCompany;
    }

    bool isAlumni;

    mapping(bool isAnAlumni => mapping(address => AlumniStudent)) addressToAlumniStudent;

    /** STATE VARIABLES */

    bool isEnrolled;
    bool hasCompleted; // false
    bool hasCoupon;
    bool hasGraduated;

    bool isUserNameUnique; // If user name exist then it is not unique. Check this when student is enrolling in course
    bool isEmailUnique; //  check when student is enrolling in course
    bool isPhoneNumberUnique;

    address admin;

    /**EVENTS */
    event CreatedAccount(
        string indexed _fullName,
        string indexed _userName,
        string indexed _email,
        uint256 _phoneNumber,
        string _country
    );
    event EnrolledInCourse(
        string indexed _courseName,
        string indexed _courseCode,
        address indexed user
    );
    event UnEnrolled(string course);

    /** MODIFIERS */

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not Admin");
        _;
    }

    /** FUNCTIONS */

    function createAccount(
        string memory _fullName,
        string calldata _userName,
        string calldata _email,
        uint256 _phoneNumber,
        string memory _country,
        address _user
    ) external {
        // Create an instance of StudentProfile
        StudentProfile storage newStudentProfile = studentProfile[_user];

        // check if userName,userEmail, phoneNumber already exist

        if (!isEmailUnique && !isUserNameUnique && !isPhoneNumberUnique) {
            newStudentProfile.fullName = _fullName;
            newStudentProfile.email = _email;
            newStudentProfile.userName = _userName;
            newStudentProfile.phoneNumber = _phoneNumber;
            newStudentProfile.country = _country;
        } else {
            revert userDetailsNotUnique(_userName, _email, _phoneNumber);
        }

        // emit event after account creation
        emit CreatedAccount(
            _fullName,
            _userName,
            _email,
            _phoneNumber,
            _country
        );
    }

    function getStudentProfile(
        address _user
    )
        external
        view
        returns (
            string memory,
            string memory,
            string memory,
            uint256,
            string memory,
            string memory,
            string memory,
            uint256
        )
    {
        StudentProfile storage newStudentProfile = studentProfile[_user];

        return (
            newStudentProfile.fullName,
            newStudentProfile.userName,
            newStudentProfile.email,
            newStudentProfile.phoneNumber,
            newStudentProfile.country,
            newStudentProfile.enrolledCourses.courseName,
            newStudentProfile.enrolledCourses.courseCode,
            newStudentProfile.enrolledCourses.dateEnrolled
        );
    }

    function enrollInCourse(
        string memory _courseName,
        string memory _courseCode,
        address _user
    ) external {
        StudentProfile storage newStudentProfile = studentProfile[_user];

        newStudentProfile.enrolledCourses.courseName = _courseName;
        newStudentProfile.enrolledCourses.courseCode = _courseCode;
        // Get the date the student enrolled in the course using the block.timestamp
        uint256 _dateEnrolled = block.timestamp;
        newStudentProfile.enrolledCourses.dateEnrolled = _dateEnrolled;
        newStudentProfile.enrolledCourses.hasCompletedCourse[
            _courseCode
        ] = hasCompleted;

        emit EnrolledInCourse(_courseName, _courseCode, _user);
    }

    function getEnrolledCourseData(
        string memory _courseCode,
        address _user
    ) external view returns (string memory, string memory, uint256, bool) {
        StudentProfile storage newStudentProfile = studentProfile[_user];

        return (
            newStudentProfile.enrolledCourses.courseName,
            newStudentProfile.enrolledCourses.courseCode,
            newStudentProfile.enrolledCourses.dateEnrolled,
            newStudentProfile.enrolledCourses.hasCompletedCourse[_courseCode]
        );
    }

    function unEnrollInCourse(address _user) external {
        StudentProfile storage newStudentProfile = studentProfile[_user];

        newStudentProfile.enrolledCourses.courseName = "";
        newStudentProfile.enrolledCourses.courseCode = "";
    }

    function addCourse(
        string memory _courseCode,
        string memory _courseName
    ) external onlyAdmin {}

    function removeCourse(string memory courseCode) external onlyAdmin {}

    function upVoteCourse(
        string memory courseCode,
        string memory courseName
    ) external {}

    function addAlumni() external onlyAdmin {}
}
