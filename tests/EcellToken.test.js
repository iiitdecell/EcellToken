const { expect } = require("chai");

describe("EcellToken", () => {
  it("should mint new token", async () => {
    const EcellToken = await ethers.getContractFactory("EcellToken");
    const ecellContract = await EcellToken.deploy("EcellToken");

    await ecellContract.deployed();
    expect(await ecellContract.getSupply()).to.equal(10000);
  });
  it("should mint more tokens when requested", async () => {
    const EcellToken = await ethers.getContractFactory("EcellToken");
    const ecellContract = await EcellToken.deploy("EcellToken");

    await ecellContract.getMoreTokens(20000);
    expect(await ecellContract.getSupply()).to.equal(30000);
  });
});