const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Token contract", function () {
    it("Deployment should assign the total supply of tokens to the owner", async function () {
      const [owner] = await ethers.getSigners();
      const Counter = await ethers.getContractFactory("Counter");
  
      const counter = await Counter.deploy();
  
      const setTest = await counter.set(1);
      expect(await counter.count()).to.equal(setTest);
    });
  });
