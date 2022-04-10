let { ethers } = require("hardhat");
let { writeAddr } = require('./artifact_log.js');

async function main() {
    // await run('compile');
    const [owner, second] = await ethers.getSigners();
    let CallOption = await ethers.getContractFactory("CallOption", owner);
    let callOption = await CallOption.deploy("0xD2E140D132b5f46d1e910DebcD129B2aBdc6e03B", 500);

    await callOption.deployed();
    await writeAddr(callOption.address, "callOption", hre.network.name);
    console.log("CallOption:" + callOption.address);
    let ax = await callOption.mint({value: ethers.utils.parseEther("0.1")});
    console.log(ax);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
