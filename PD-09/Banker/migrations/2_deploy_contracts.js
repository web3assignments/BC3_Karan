const { deployProxy } = require('@openzeppelin/truffle-upgrades');
var SmartContractBank = artifacts.require("SmartContractBank");

module.exports = async function(deployer) {
    const BankContract = await deployProxy(SmartContractBank, {deployer});
    console.log(`Address of BankContract: ${BankContract.address}`)
};