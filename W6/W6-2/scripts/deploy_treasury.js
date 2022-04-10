let { ethers } = require("hardhat");
let { writeAddr } = require('./artifact_log.js');

async function main() {
    const [owner, second] = await ethers.getSigners();
    let MultiSigWallet = await ethers.getContractFactory("MultiSigWallet", owner);
    let multiSigWallet = await MultiSigWallet.deploy(["0xe8c81H4d16Be31Eb1c915e45a92B45f60FD592C1", "0xD2E140D132b5f46d1e910DebcD129B2aBdc6e03B", "0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266"], 1);

    await multiSigWallet.deployed();
    console.log("MultiSigWallet:" + multiSigWallet.address);

    await writeAddr(multiSigWallet.address, "multiSigWallet", hre.network.name);

    let Treasury = await ethers.getContractFactory("Treasury", owner);

    let treasury = await Treasury.deploy(multiSigWallet.address);

    await treasury.deployed();
    console.log("Treasury:" + treasury.address);
    
    await writeAddr(treasury.address, "Treasury", hre.network.name);
    const tx = await owner.sendTransaction({
        to: treasury.address,
        value: ethers.utils.parseEther("0.01")
    });
    await tx.wait();
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
