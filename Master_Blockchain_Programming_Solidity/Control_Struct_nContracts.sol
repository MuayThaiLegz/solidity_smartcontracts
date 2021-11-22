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

pragma solidity 0.7.0;

contract MultiReturn {
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
    GetterExample ge = new GetterExample():
    function getData() public view returns (uint) {
        return ge.data();
    }

    function getArray(uint _index) public vieew returns (uint) {
        return ge.array(_index);
        
    }
}
