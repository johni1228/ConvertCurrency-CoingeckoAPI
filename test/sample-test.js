const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Convert", function () {
  it("Should return the new greeting once it's changed", async function () {
    const Convert = await ethers.getContractFactory("Convert");
    const convert = await Convert.deploy();
    await convert.deployed();

  });
});
