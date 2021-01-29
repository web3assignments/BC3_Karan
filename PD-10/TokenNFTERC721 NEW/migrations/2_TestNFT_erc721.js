const TestNFT = artifacts.require("TestNFT");

module.exports = async function(deployer) {
await deployer.deploy(TestNFT);
const TestNFTx= await TestNFT.deployed();
TestNFTx.CreateTestNFT('0xb9bBc08c3906624f3FCfD324abe29671F0fF5f24', 'https://jsonkeeper.com/b/3CLM');
};