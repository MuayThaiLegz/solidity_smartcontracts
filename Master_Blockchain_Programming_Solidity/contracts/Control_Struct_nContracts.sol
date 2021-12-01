/* 

Control Structures and Contracts: Solidity provides for and while loops, conditional statements,
and much more. Theen, we will move on to discussing different typs of visibility modifiers
    variables and functions, types of functions you cann create, contract inheritance,
        abstract interfaces, and creating libraries.

The following topics will be convered in this chapter:
    * Control stucture keeywords supported by Solidity.
    * Visibility modifiers applied to variables and fucntions of contracts.
    * Differnt types of fucntions and their behavior.
    * Sol contract inhetitance. * The use of abstract contracts. * Writing and using libraried in Sol.
*/

// Returning multiple values from function: Returning multiple values from a function:

pragma solidity ^0.7.0;

/*contract MultiReturn {
    function sum() public pure returns (uint) {
        // receiving multi return from fucntion
        (uint x, uint y) = geteDataWithoutReturnStatement();
        return x + y;
    }


    //Example to return multipl values without reeturn statement
function geteDataWithoutReturnStatement() internal pure 
    returns(uint, uint) {
        return (1, 2);
        
    }

    //Example to return multiple values without return statmeent

    function geteDataWithReturnStatement() internal pure returns (uint a, uint b){
        a = 1;
        b = 2;
    }
}
*/
// Creating Contracts
    // Contract with constructor 
    contract ConstructorExampl {

        string public tokenName;
        string public symbol;
        address public owner;

        constructor(string tokenName, string symbol) public {
            owner = msg.sender;
            tokenName = tokenName;
            symbol = symbol;
        }
        // ..
    }

    // Contract without constructor 
    contract NoConstructor {

        string public tokenName = "Sample Toke";

        string public symbol = "SYMB";

        address public ownr = msg.sender;
    }
/*

Creating child contract suing the new keyword:
    Solidity contracts also have th capability to create a new child contract of any definiton.

Achieved using th new keyword. Sometims, depending on your application's design,
    youll want to create a child contract and get its add registered in the main contract
*/

contract ChildContract {
    uint public id;
    uint public balance;
    constructor(uint _id) public payable {
        id = _id;
        balance = msg.value;
    }
}

contract MainContract {
    ChildContract[] public register;

    //ChildContract will b created when Main Contract is deployed
    ChildContract public childContract = new ChildContract(100);

    constructor() public  {
        register.push(ChildContract);
    }

    function createChildContract(uint _id) public returns(address) {
        ChildContract newChild = new ChildContract(_id);
        register.push(newChild);
        return newChild;
    }

    // Send ETh along with the ChildCOntract creation 
    function createChildAndPay(uint _id, uint _amount) public payable returns(address){
        require(msg.value == _amount);

        ChildContract newChild = (new ChildContract).value(_amount)(_id);
        register.push(newChild);
        return newChild;
    }
}

// Using variable and function visibility:

contract SuperContract {
    uint internal data;

    function multiply(uint _a) private pure returns (uint){
        return _a * 2;}

    function setData(uint _a) internal { data = _a; } 
    function externalFn() external returns (uint) { /*...*/ } 
    function publicFn() public returns (uint) {/*...*/}
}

contract VisiblityExample is SuperContract {
    function readData() public {
        // Following calls: erroe: not accessible 
        //uint result = multiply(2);
        //externalFn();

        //Following calls: Allowed access
        
        data = data * 5; //variable accessible 
        //uint result = multiply(2);
        setData(10); // function accessible
        
        this.externalFn();
        publicFn();

    }
}
        
// contract accessing VisibilityExample contract

contract EexternalContract {
    VisibilityExample ve = VisibilityExample(0x1);

    function accessOtherConctact() public {
        //Flowwing commented calls: error: not acccessible
        //ve.setData(10);
        //ve.multiply(10);

        //Following calles: allowed access
        ve.externalFn();
        ve.publicFn();
        ve.readData();

    }
}

contract GetterExample {
    uint public data = 25;
    uint[2] public array = [10, 20];
    // Overside getteer fucntion of 'data' state variable, if defined
    function Data() public pure returns (uint) {
        return 15;
    }
    //Oveerrides geetter function of of 'arraay state variable, if defined
    function Array(uint _i) public pure returns (uint) {
        return 60 + _i;
    }
}

contract externalContract {
    GetterExample ge = new GetterExample();
    function getData() public view returns (uint) {
        return ge.data();
    }

    function getArray(uint _index) public vieew returns (uint) {
        return ge.array(_index);
        
    }
}

contract Ownable {
    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    constructor() public {
        owner = msg.sender;
    }
}

contract ModifierExample is Ownable {
    enum Status {INT, PENDING, INPROCESS, PROCESSED}
    Status public status;

    event StatusChnaged(Status status);
    modifier logAtEnd(Status _status) {
        _;
        emit StatusChanged(_status);
    }

    function changeState(Status _status) public onlyOwner
     logAtEnd(_status) {
         status = _status;
     }
}

//Understanding types of  Solifity functions :Syntax used to define a fucntion defnition is as follows

// function functionName(<parameter types>) {internal|external|public|private}
// [pure|view|payable] [returns (<return types>)]

// The following code is getting the current state of the exchange:

contract ViewFuncExample {
    enum ExchangeStatus { Inactive, Active }
    ExchangeStatus status = ExchangeStatus.Active;

    function getCurrentState() public cire returns (ExchangeStatus) {
        return status;
    }
    // Rest of the code


//function withdrawDividend() public {
    //Code here to update dividend paid staus, so that user 
    //cannot clain again
    //send current divident amount 
  //  msg.sender.transfer(calculateDividend())
//}

//function calculateDividend() public view returns (uint) {
  //  return balancaOf[msg.sender] * dividendUintPerToken;
//}
}
}
// The following exmaplew contact shows a pure function

contract PureFuncExample {
    uint c = _a + _b;
    require(c >= _a);
    return c;
}

// Using the default fallback function: In Solidity may only one fallback per contract.
// fallback doesn't have a name, arguments to the function, does not return values.
// fallback sexecute when the sata in the transaction is empty, as well as when no matching function
// identifier present in the contract: fallbacks are defined as follows in the contract

function()  external {
    // function body
}
// a 'payable' fallback function that can accept any amount of ether thats sent to contract address
// with or without data. if not fallback or payable fucntion exists in contract sent ether 
    // will cause the transaction to fail

contract FallbackFunctionExample{
    uint weiReceived;

    function() external payable {
        weiRecaived += msg.value;
    }
}

/* Overloading functions:
Overloading a fucntion meeans that you can create a function that has the same name but different
arguments and/or a different type. For function overloading, you have to ensure that the function
signature is different for each overloaded function. Also applies to inherited functions.


Funciton signature consists of the function name and its argumetns type in the order they are defined.
*/

contract FuncOverload {
    address owner;
    constructor() public {
        owner = msg.sender;
    }

    function transfer(address _to, uint _amount) public returns (bool) {
        return doTransfer(_to, _amount);
    }

    function transfer(address _to) public returns (bool) {
        return doTransfer(_to, 1 ether);    
    }

    function transfer() public returns (bool) {
        return doTransfer(owner, address(this).balance);
    }

    function doTranfer(address _to, uint _amount) internal
    returns (bool) {
        _to.transfer(_amount);
        return true;
    }
}

// Inhetiting contracts 

contract Ownable {
    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }
}

contract ValueStorage1 is ValueStorage {
    function update() public {
        value *= 2;
        ValueStorage.update();
    }
}

contract ValueStorage2 is ValueStorage {
    function update() public {
        value *= 3;
        ValueStorage.update();
    }
}

contract InheritanceExample is ValueStorage1, ValueStorage2 {
}

// Using super keyword:

contract Ownable {
    address public owner;
    modifier onlyOwner() {
        require((msg.sender == owner);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }
}

contract ValueStorage is Ownable {
    uint public value = 2;
    function update() public onlyOwner {
        value += 1;    
    }
    //..
}

contract ValueStorage1 is ValueStorage {
    function update() public  {
        value *= 2;
        super.update();
    }
}

contract  ValueStorage2 is ValueStorage {
    function update() public {
        value *= 3;
        super.update();
    }    
}

contract InheritanceExample2 is ValueStorage1, ValueStorage2 {
}

// REVISIT PAGE 105-106

/* 

Creating interfaces: Define interfaces in SOlidity using the interface keyword. They must not have 
any function definitions. They also have these restrictions:
    
    * All the functionsthat are defined in the interface must have external visibility.
    * No constructor allowed
    * No state vars defined.
    * Cannot inherit from any other contract or interfaces

interface examplee defined in verions 0.5.0:
*/

pragma solidity 0.5.0;

interface ExampleInterface {
    enum Status {Pending, Inprocess, Processed}
    struct Data {
        address requester;
        uint amount;
        Status status;    
    }
    function tranfer(address _to, uint _amount) external;
}

// Creating sutom reusbvale libraries

library ControlledAddressList {
    
    struct Data {
        mapping(address => bool) addresses;
    }

    function enable(Data storage self, address _address) public returns (bool){
        require(_address != address(0));
        require(isDisabled(self, _address));
        self.addresses[_address] = true;
        return true;
    }

    function isEnabled(Data storage self, address _address) public view returns (bool) {
        return self.addresses[_address] == false;
    }
}

// Using libraries with - using.. for directive: To attach a lib to contract,
// we use special directive called: using  X for Y:
// Where X is the library and Y is the data type. Defining this directive we are saying that X is a lib.
// We take all functions from X lib an allow those functions to be called on Y data type.


// Here is an example contract called TokenList contract, which is using ControlledAddressList,

// Waiting to review the intallation of openzeppelin for hardcoding:

import './ControlledAddressList for ControlledAddressList.Data;

// import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';

contract TokenList is Ownable {
    using ControlledAddressList for ControlledAddressList.Data;
    ControlledAddressList.Data data;
    
    function add(address _token) public onlyOwner returns (bool) {
        return data.enable(_token);
    }

    function remove(address _token) public onlyOwner returns (bool) {
        return data.disable(_token);    
    }

    function isPresent(address _token) public view returns (bool) {
        return data.isEnabled(_token);
        
    }
}



