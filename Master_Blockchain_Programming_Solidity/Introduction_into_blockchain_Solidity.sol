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
/*

contract CallExample {
    // ..{
    address otherContract = 0xC4FE5518f0168DA7BbafE375Cd84d30f64CDa491;
    string[] memory param1 = new string[]('param1=string');
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
            gas adjustments
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
*/
/* Passing fucntions using function types 
These are called function types. The variables of function types will be addigned
when you pass a function as an argument to another function that receives a function type atgument.

syntax to define function types as follows:

    function (<parameter types>) {internal|external}
    [pure|constant|view|payable] [returns (<return types>)]
*/

contract SelectorExample {
    // returns first 4 nytes of method signature 0x2c383a9f
    function method() public pure returns (bytes4) {
        return this.method.selector;
    }
}

// Using internal function types 

library ArrayIteratorLib {
    function interate(function(uint) pure returns (uint) _skipFn)
    internal pure returns (uint[] tempArr){
        tempArr = new uint[](10);
        for (uint i = 0; i < 10; i++) {
            tempArr[i] = _skipFn(i + 1);
        }
    }
}
 contract SkipContract {
    function skip1(uint _i) internal pure returns(uint) {
        return _i * 1;
    }

    function skip2(uint _i) internal pure returns(uint) {
        return _i * 2;
    }

    function getSkipFunction(uint _fnNumber) internal pure returns 
    (function(uint) pure returns(uint) ) { 
        if(_fnNumber == 1)
            return skip1;
        else if(_fnNumber == 2)
            return skip2;
    }

    //Returns Array[1,2,3,4,5,6,7,8,9,10]

    function getFirst10WithSkip1() public pure returns (uint[]){
        return ArrayIteratorLib.iterate(getSkipFunction(1))
    }

    function getFirst10WithSkip2() public pure returns (uint[]){
        return ArrayIteratorLib.iterate(getSkipFunction(2))
    }
}

// External function types:

contract OraclizeService {
    address authorized = 0xefd8eD39D00D98bf43787ad0cef9afee2B5DB34F;
    modifier onlyAuthorized() {
        require(msg.sender == authorized);
        _;
    }

    QueryData[] queries;
    struct QueryData {
        bytes currency;
        function (uint, bytes memory)
        external returns (bool) calolbackFunction;
    }

    event NewRequestEvent(uint requestID);

    function query (
        bytes _currency,
        function(uint, bytes memory) external returns(bool) _callbacksFn) public {
            // Registering callback
            queries.push (QueryData(_currency, _callbackFn));
            emit NewRequestEvent(queries.length - 1);
        }
    function reply(uint requestID, bytes response) public onlyAuthorized {
        require(queries[requestID].callbackFunction(requestID, response));
        delete queries[requestID]; // release storage     
    }
}

contract OracleUser {
    modifier onlyOracle {
        require(msg.sender == address(oraclizeService),
            "Only oracle can call this." );
        _;
    }
    // Known Contract address of Oraclize Service
    OraclizeService constant oraclizeService = 
        OraclizeService(0x611B947ec990Ba4e1655BF1A375866467144A2D65);
    event ResponceReceived(uint requestID, bytes response);

    function getUSDRate() public {
        oraclizeService.query("USD", this.queryResponse);
    }
    
    function queryResponse(uint _requestID, bytes _response)
    public onlyOracle returns (bools) {
        // Use the response data 
        //...
        emit ResponseReceived(_requestID, _response);
        return true;
    }
}

// Using arrays in Solidity

/* 

In solidity, arrays can be fixed or dynamic size. We have already seen in the previous sections.
    Fixed size byte arrays and Dynamiccally sized byte,
    arrays of this chapter that bytes and string are special types of array.

    creating arrays using new - fyou can create variable length, in memory arrays using new.

*/

address[] memory owners = new address[](10)

// The following members functions are avaliable on an array:
// * push: this appends a new element at athe last oisition in an array.

contract ArraysExample {
    // Dynamic Array 
    address[] public owners;
    constructor(address[] _owners) public {
        for(uint i = 0; i < _owners.length ; i++) {
            uint newLength = owners.push(_owners[i]);
        }
    }

    function removeLast() public {
        // Check to ensure that array has elemnt
        // Without this check, .length will have integer underflow
        require(owners.length > 0);
        // Removes tha lst elements from dynamic array
        owners.length--;
        
    }
}

/* 
// Creating a key value map using mapping- Declare a mapping in Solidity using:
    
mapping(KEY_TYPE => VALUE_TYPE)

The KEY_TYPE cannot b mapping, a dynamically sized arrays, a contract, enum, or struct. 
The reemaining data types can be useed for KEY_TYPE.
The VALUE_TYPE can be any type; even a mapping is allowed.

The data used for KEY_TYPE is not stored in mapping -- its keccak256 hash is generated and persisted,
which in turn used to look up the value. Mapping do not have length member to know their current size.
hence, you cannot iterate a mapping.

*/

contract MappingExample {
    mapping(address => uint) public balances;

    function update(uint newBalance) public {
        // Adds a new mapping if not present
        // Updates the new value if entry already present.
        balances[msg.sender] = newBalance;

    }

    // Increases balance by _increaseBy numbers
    function increaseeBalance(uint _increaseBy) public {
        update(balanceOf(msg.sender) + _increaseBy);
    }

    function balanceOf(address _user) public view returns (uint) {
        //Gets the entry from mapping
        return balances[_user];    
    }

}
