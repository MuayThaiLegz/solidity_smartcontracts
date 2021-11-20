/*
# Getting started with solidty smart contracts:
    Structure of a contract:
        1. Gloabl state vairables of contract
        2. Enum types
        3. Struct types
        4. Function modifier difinitions
        5. Events definition
        6. Functions
        
*/

// Declaring state variables:  
    // Defining a storeUint variable of the uint type:

pragma solidity 0.7.0;

contract VariableStorage {
    uint storeUint; // uint256 storage variable 
}

// storeUint variable in the preceding code bloack will be accessible
    // from any function-modifier defined in the VariableStorage contract


/* 

# Writing function definitions:
    The solidity functions are executable units of code within a contract.
    These are the only access points for users and the different entities that interact with a contract.
    Functions may use function modifiers; they also have a visibilirt to define the access rights.
    There can be many functions within a contract.

Your contract can receive ether along eith a method call using the payable keyword, as shown below:
*/

contract AcceptEther {
    function deposit() public payable {
        // function example to accept ETH 
    }
}

/*

# Creating a custom modifier using function modifiers

The modifiers are used to check the pre- and post-conditions before calling a method.
Argument validation and corretcess are checked with the modifiers. The function modifiers
are also used to maintain the access and role-based control on the contract.

In the following example code, onlyOwner is an access modifier function used in the withdraw function.
The defintion says that the withdraw fucntion can only be allowed to call from the owner address

*/

contract AccountContract {
    address public owner;

/*
 * Modifier onlyOwner definition
 */

modifier onlyOwner() {
    require(msg.sender == owner, "not owner");
    _; //Rest of the function body execution
}

/*
 * The deployer of the contract would become owner of contract
 */
 constructor() public {
     owner = msg.sender;
}

/*
 * Modifier onlyOwner usedm onlu allow owner to call function
 */
function withdraw() public onlyOwner {
    msg.sender.transfer(address(this).balance);
  }
}

/*

# Using events for logging and callback: COntract emit event logs to let the other paraties know
that some action history. Client applications can listen for the events as a callback and can take
appropriate action when required. Client app;ications can also search for specific event from the event
history contract.

[Deposited] is an event in the following code, which is emited when the deposit function is called:
*/

contract AcceptEtherWithLog {
    /*
     * Event declaration 
     * @param _who Address of the account who deposited ETH.
     * Parameter indexed, to allow it to filter events on client side.
     * @param _amount Amount of Wei depodited to contract.
     */

    event Deposited(address indexed _who, uint256 _amount);

    function deposit() public payable { //function example to accept ETH
        // ...
        // Emits the Deposited event in Logs of transaction data 
        emit Deposited(msg.sender, msg.value);
    }

    // Deposited event logs two parameters, _who and _amount, see , _who is an indexed argument
    // ETH created the topic index for _who values. This enables client applications to quickly
    // Search for specific events with a specific _who address.

    // Custom data types with stuct: Structs are custom-defined data types that can group miltiple
    // variables in a single strcu variable to form a new type.
}

contract LoanStruct {
    // Definition of struct 
    struct LoadData {
        address borrower;
        address lender;
        uint256 loadAmount;
    }
}

// Custom types for constants with enum 
// Enums can be used to create s custom data type with a fixed set of constant values.
// Enums will have used to create a suctom data type with a fised sest of constant values.
// Enums will have int values assigned, starting from 0 and ascending to the number of states defined enum
// Compiler chooses the data type to be used. For example, when having 1-255 number of values defined
// in an enum would use uint8, however, it will use uint16 when a few more then 255 values are used.

contract LoanStruct {

    enum LoanStatus {Pending, Created, Funded, Finished, Defaulted}

    // Definition of struct
    struct LoanData {
        address borrower;
        address lender;
        uint256 loanAmount;
        LoanStatus status; //LoanStatus stored 
    }
}

contract CallExample {
    // ..{
    address otherContract = 0xC4FE5518f0168DA7BbafE375Cd84d30f64CDa491;
    string memory param1 = 'param1=string';
    uint param2 = 10;

    // With multiple parameters 
    require(otherContract.call('methodName', param1, param2));
    require(otherContract.delegatecall('methodName',param1, param2));

    // With signatures

    require(otherConditions.call(bytes4(keccak256('methodName(string, uint256)')), param1, param2));
    require(otherConditions.delegatecall(bytes4(keccak256('methodName(string, uint256)')), param1, param2));

    // Understanding the staticcall function 
    <address>.staticcall(bytes memory) returns (bool, bytes memory)

    otherCOntract.call.values(1 ether)('ethodToCall', 'param1');
}

contract GasExample {
    constructor () public {
        address otherContract = 0xV4FE5518f0168DA7BbafE375Cd84d30f64CDa491;
        /* gas adjustments */ 
        require(otherContract.call.gas(1000000)(
            'methodName', 'param1'));
        require(otherContract.delegatecall.gas(1000000)(
            'methodName' 'param1'));
        // * Wei forwarding using value() 
        require(otherContract.call.value(1 ether)(
            'methodName', 'param1'));
        
        // .value() not supported on delegatecall, Compilation error
        // require(otherCOntracat.delegatecall.value(1 ether)) 
        // 'methodName', 'param1'));

        // Using gas() and value() together 
        require(otherContract.call.gas(10000000).value(1 ether)(
            'methodName', 'param1'));
        
        // This is also valid 
        require(otherContact).call.value(1 ether).gad(1000000) (
            'methodName', 'param1'));
    }
}
