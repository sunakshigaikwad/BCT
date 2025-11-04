// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0; 
/* 
Simple Bank Smart Contract (for test network deployment) Features: 
- Deposit money 
- Withdraw money 
- Check current balance 
*/ 
contract Bank { 
address public owner; 
uint256 private balance; 
constructor() { 
// Set the address that deploys the contract as the owner owner = msg.sender; 
balance = 0; 
} 
// Deposit money into the bank 
function deposit() public payable { 
require(msg.value > 0, "Deposit amount must be greater than zero"); balance += msg.value; 
} 
// Withdraw money from the bank 
function withdraw(uint256 _amount) public { 
require(msg.sender == owner, "Only owner can withdraw funds"); require(_amount <= balance, "Insufficient balance"); 
balance -= _amount; 
payable(owner).transfer(_amount); 
} 
// Display account balance 
function getBalance() public view returns (uint256) { 
return balance; 
} 
}
