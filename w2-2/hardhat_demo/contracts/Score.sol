//  SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Score {
    uint8 public score;
    address public teacher;

    constructor(address _teacher) {
        teacher = _teacher;
    }
    
    modifier onlyTeacher {
        require(msg.sender == teacher);
        _;
    }

    function Score() {
        score = 0;
    }

    function set(uint8 _score) {
        require(_score<=100,"must <= 100");
        score = _score;
    }

    function get() constant returns (uint8) {
        return score;
    }
}

interface IScore {
    function setScore(address _student, uint8 _score) external;
}

contract Teacher {
    address public teacher;
    address public student;
    address public contract;
    uint8 public score;

    function Teacher(address _teacher, address _student, address _contract, uint8 _score) {
        teacher = _teacher;
        student = _student;
        contract = _contract;
        score = _score;
    }

    IScore scoreContract;

    constructor (address addr){
        scoreContract=IScore(addr);
    }

    function setScore(address student , uint score) public{
        return scoreContract.setScore(student, score);

    }
}