// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.26;

contract bank{
    address public  owner;
    uint256 public  balance;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender==owner, "Only owner can perform transactions");
        _;
    }

    function deposit() public payable onlyOwner{
        require(msg.value>0, "Deposit amoutn should be greater than 0");
        balance+=msg.value;
    }

    function withdraw(uint256 amt) public  onlyOwner{
        require(amt>0, "Withdraw amount should be greater than 0");
        require(amt<=balance, "Insufficient balance");
        balance -= amt;
        payable(owner).transfer(amt);
    }

    function getBalance() public view returns (uint256){
        return balance;
    }

}