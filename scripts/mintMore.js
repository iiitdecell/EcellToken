async function main() {
    const EcellToken = await ethers.getContractFactory("EcellToken");
    const ecellContract = await EcellToken.attach("0xCABB812637fd0d4b7512A552b8f061445Ae180D5");
    await ecellContract.getMoreTokens(500);
    console.log("Total supply: ", await ecellContract.totalSupply());
}

main()
  .then(() => process.exit(0))
  .catch(error => {
	console.error(error);
	process.exit(1);
  });