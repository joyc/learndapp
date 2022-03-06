//  SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {
    address public owner;

    mapping(address => uint) public balances;

    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw(uint256 amount) external onlyOwner {
        require(balances[msg.sender] > 0);
        payable(msg.sender).transfer(amount);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "only owner can execute this function");
        _;
    }

    receive() external payable {
        balances[msg.sender] += msg.value;
    }
    
    fallback() external payable {
        balances[msg.sender] += msg.value;
    }
}