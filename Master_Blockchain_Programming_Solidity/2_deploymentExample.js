
// Sample migration script

var DepositContract = artifacts.require('DepositContract');

module.exports = function(deployer) {
    deployer.deploy(DepositContract);
};

// When you run the truffle migrate command,
// this script will deply the DepostContract contact instance on the local blockchain.

/*

Using artifactss.require() to get the contract instance.

At the start of the migration scripts,
we need to define which contract instances we woulf like to interact with. 

Get an abstraction instace of a contract as an object using the following example syntax;

*/

var contractVariable = artifacts.require("<ContractName>");

// The following example command to get the instance of DepositContract:

var DepositContract = artifacts.require("DepositContract");

// The contract name you define here should match the contract nane defined in the multiple contact 
// files present under the contract folder. You should not provide a .sol contract filename,
// because a contract file could contain contain multiple contracts

/* 

Deployer:

Your contract migration file will use the deplyer objecct to stage the deployemnt tasks for contract.
Write deployment task sybcgonously, as shown in the following example,
and they'll be executed in the conrrect ordr in which theu are specified:

*/

deployer.deploy(Contract1);
deployer.deploy(Contract2);

/* Order of deployment will be {Contract1} followed by {Contract2}
Other than deployer obj, there are other optiomal can also be used, such as network and accounts.

Here we are taking a look at the network object

Network considerations 
The module.exports funciton also initializes the network object with the network name being used
while deplou=ying the contract usiung mogration scripts:
*/

module.exports = function(deployer, network) {
    if (network == 'development') {
        // Script to be executed for network named 'development'.
    } else if (netwok == 'rinkeby') {
        // Script to be executed for network named 'rinkeby'
    } else {
        // If nwtrok name not matched, execute this script
    }    
}

/*

Avaliable accounts:

You can also get the list of Ethereum accounts provided by the Ethereum client or web3 provider
connected to truffle while running the migrattion.accounts in an array object, and one can access
accounts using the index. You can also get the same list of accountss using the web3.eth.getAccounts()

*/

var TestContract = artifacts.require("TestContract");

module.exports = function(deployer, network, accounts){
    deployer.deploy(TestContract, accounts[0]);

// This deploys a contract named TestContract and passed accounts[0]
// (first of eth accounts) as an argument to the constructor of TestContract
}

// Writing test cases: As a developer you must ensure that test cases are written to cover at almost
    // 100% code coverage

// To run the test suotem you nedd to use the following command: $ truffle test 

// Specify the single test files to run using the following: $ truffle test ./path/to/test/file.js


// Writing test cases in JavaScript using Mocha

/* 

The following is the code snippet taken from the JavaScript test case file,
DepositContract.test.js. As you can see, the accounts object is an array of eth accounts:

*/

const DepositContract = artifacts.require("DepositContract");
let depositContract;

DepositContract('DepositContract', function (accounts) {
    beforeEach(async function () {
        // For ownable behavior
        this.ownable = await DepositContract.new();
        depositContract = this.ownable;

        //accounts
        owner = accounts[0];
        user1 = accounts[1];
        user2 = accounts[2];
        other = accounts[3];
    });

    describe('As DepositContract', function () {
        it('should fail when deopit 0 ether using depositEther()',
            async function () {
                await expectThrow(depositContract.depositEther({ from: user1 }), EVMRevert);
                const balance = await web3.eth.getBalance(depositContract.address);
                AssertPlus.equal(balance, 0);
            });

        it('should deposit 1 ether using depositether()', async function () {
            await depositContract.depositEther(
                { from: user1, value: web3.utils.toWei("1", 'ether') });
            const balance = await web3.eth.getBalance(depositContract.address);
            AssertPlus.equal(balance, 0);
        });
    }




