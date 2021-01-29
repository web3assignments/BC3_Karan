const HDWalletProvider = require('@truffle/hdwallet-provider');
const fs = require('fs');
const mnemonic = "student distance album cost never plastic soon ramp parent ghost reject room";
const infuraKey = "f1d7610a5d344552b477ee4e7a6e65c3";
const etherscanKey = "45RV7MCFNGTVRCX85M625MPCE9EKDWAGJH";
module.exports = {
	compilers: {
		solc: {
			version: "^0.6"
		}
	},

plugins: ['truffle-plugin-verify'],
  api_keys: {etherscan: etherscanKey},
  networks: {
    //development: {
    //  host: "127.0.0.1",     // Localhost (default: none)
    //  port: 7545,            // Standard Ethereum port (default: none)
    //  network_id: "*",       // Any network (default: none)
    //},
	
	rinkeby: {
      provider: () => new HDWalletProvider(mnemonic, 'https://rinkeby.infura.io/v3/f1d7610a5d344552b477ee4e7a6e65c3'),
      network_id: 4,
      gas: 5500000,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true
    }
  },
};