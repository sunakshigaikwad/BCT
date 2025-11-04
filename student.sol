// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/*
Student Data Contract
Features:
- Structure to store student details
- Dynamic array to hold list of students
- Fallback function to handle plain ether transfers
*/
contract StudentData {
// Structure to hold student information
struct Student {
uint256 id;
string name;
uint8 age;
}
// Dynamic array of students
Student[] public students;
// Add a new student
function addStudent(uint256 _id, string memory _name, uint8 _age) public {
students.push(Student(_id, _name, _age));
}
// Get a student by index
function getStudent(uint256 _index) public view returns (uint256, string memory, uint8) {
require(_index < students.length, "Student does not exist.");
Student memory s = students[_index];
return (s.id, s.name, s.age);
}
// Fallback function - triggered when ether is sent or when a non-existing function is called
fallback() external payable {
// For demonstration, ether received will not perform any action.
}
// Also include receive if you want to accept ETH transfers explicitly
receive() external payable {}
}
