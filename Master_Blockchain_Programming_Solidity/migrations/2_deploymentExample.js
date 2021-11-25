
// Sample migration script

var DepositContract = artifacts.require('DepositContract');

module.exports = function(deployer) {
    deployer.deploy(DepositContract);
};

// When you run the truffle migrate command,
// this script will deply the DepostContract contact instance on the local blockchain.