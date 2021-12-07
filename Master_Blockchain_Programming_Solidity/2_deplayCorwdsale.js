const MSTToken = artifacts.require('MSTTOKEN');
const MSTCrowdsale = artifacts.require('MSTCrowdsale');

var BigNumber = require('Big-number');

module.exports = async function(deployer, network, accounts){
    var owner = accounts[0];
    var wallet = accounts[9];

    //1. Deply MSTToken 
    await deployer.deploy(MSTToken, 'Mastering Solidity Token', 'MST', 18);
    
    //2. Deply MSTCrowdsale 

    var milliseconds = (new Date).getTime(); // Today time
    var currentTimeInSeconds = parseInt(milliseconds / 1000);
    var oneDayInSeconds = 86400;
    var openingTime = currentTimeInSeconds + 60; // opeingTime after // a minute
    var closingTime = openingTime + (oneDayInSeconds * 90); // closingTime //after 90 days 
    var rate = 1000; // 1000mst tokens per aet
    var cap = BigNumber(10000).pow(18); // 10000 ** 18 = 10000 ether 

    await deployer.deploy(
        MSTCrowdsale, rate, cap,
        wallet, MSTToken.address,
        openingTime, closingTime,
    );

    //3. Owner Adds MinterRole for MStCrowdsale
    var mstToken = await MSTToken.deploy();
    mstToken.addMinter(MSTCrowdsale.address);

    //4. Owner Renounce Minter 
    mstToken.renounceMinter();
};