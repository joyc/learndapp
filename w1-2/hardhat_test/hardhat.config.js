require("@nomiclabs/hardhat-waffle");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
// Go to https://www.alchemyapi.io, sign up, create
// a new App in its dashboard, and replace "KEY" with its key

// Replace this private key with your Ropsten account private key
// To export your private key from Metamask, open Metamask and
// go to Account Details > Export Private Key
// Be aware of NEVER putting real Ether into testing accounts
module.exports = {
  solidity: "0.8.4",
  networks: {
    ropsten: {
      url: "https://ropsten.infura.io/v3/2c6185485d394da99fe9204bdabee1e4", //Infura url with projectId
      accounts: ["ba57dd54156385ca2a815abe1cade2bc269f603a9ea9f3f6410e36a921b5baaa"] // add the account that will deploy the contract (private key)
     },
  }
};
