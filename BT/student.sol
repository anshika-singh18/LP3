// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    // Define a structure to store student information
    struct Student {
        string name;
        uint256 age;
    }

    // Array to store a list of Student structures
    Student[] public students;

    // Event emitted whenever a new student is added
    event StudentAdded(string name, uint256 age);

    // Fallback function to accept Ether, though it's not directly used here
    receive() external payable {}

    // Function to add a new student to the array
    function addStudent(string memory _name, uint256 _age) public {
        // Create a new Student instance and add it to the students array
        Student memory newStudent = Student(_name, _age);
        students.push(newStudent);
        
        // Emit an event for the added student
        emit StudentAdded(_name, _age);
    }

    // Function to retrieve the total number of students
    function getStudentCount() public view returns (uint256) {
        return students.length;
    }

    // Function to get student details by index
    function getStudent(uint256 index) public view returns (string memory, uint256) {
        // Ensure the index is within the array bounds
        require(index < students.length, "Student does not exist");
        
        // Retrieve student data at the specified index
        Student memory currentStudent = students[index]; // Renamed variable to avoid shadowing
        return (currentStudent.name, currentStudent.age);
    }
}