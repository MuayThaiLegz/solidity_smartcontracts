pragma solidity 0.7.0;


contract parameters {
    
    function singleIncomeingParameter(int _data) public returns (int _output) {
        return _data * 2;
    }
    
    function multipleIncomingParameter(int _data, int _data2) public returns (int _output) {
        return _data * _data2;
    }
    
    function multipleOutgoingParameter(int _data) public returns (int square, int half) {
        square = _data * _data;
        half = _data / 2;
    }
    
    function multipleOutgoingTuple(int _data) public returns (int square, int half) {
        (square, half) = (_data * _data,_data /2);
    }
}

contract ContractWithoutModifier {
    
    address owner;
    int public mydata;
    
    function ContractWithoutModifier1() public {
        owner = msg.sender;
    }
    
    function AssignDoubleValue(int _data3) public {
        if(msg.sender == owner){
            mydata = _data3 * 2;
        }
    }
    
    function AssignTenerVal(int _data4) public {
        if(msg.sender == owner) {
            mydata = _data4 * 10;
        }
    }
}
    
contract ContractWithModifier {
    address owner;
    int public mydataFin;
    
    function ContractWithModifier1() internal{
        owner = msg.sender;
    }
    
    modifier isOwner {
        
        if(msg.sender == owner) {
            _;
        }
    }
    
    function AssignDoubleValue2(int _data5) public isOwner {
        mydataFin = _data5 * 2;
        
    }
    
    function AssignTenerVal1(int _data5) public {
        mydataFin = _data5 * 10;
    }
}


// view, constant, and pure functions
contract viewfunction {
    function grabsomething(int _data) public view returns (int) {
        return _data * 10;
    }
}

contract purefu {
    function getanother(int _data) public returns (int) {
        return _data * 10;
    }

}

contract paymentMethods {

mapping (address => uint) balance;

function simplesendtoacct(uint amount) public returns (bool) {
    if (balance[msg.sender] >= amount) {
        balance[msg.sender] -= amount;
        if (msg.sender.send(amount) == true) {
            return true;
        }
        else {
            balance[msg.sender] += amount;
            return false;
        }
    }
}
    

function simtranstoac() public {
    msg.sender.transfer(1);
    
    }

}
contract EtherBox {
    uint balance;
    event logme(string);
    
    
    function SetBalance() public {
        balance = balance + 10;
    }
    
    function GetBalance() public payable returns(uint) {
        return balance;
    }

    fallback () external payable {
        emit logme("fallback called");
    }
}
    
    
    
contract UsingCall {
    function UsingCalls() public payable {
    }
    
    function SimpleCall() public returns (uint) {
        bool status = true;
        EtherBox eb = new EtherBox();
        address myaddr = address(eb);
       // status = myaddr.call(keccak256('SetBalance()'));
    }
    
    function SimpleCallwithGas() public returns (bool) {
        bool status = true;
        EtherBox eb = new EtherBox();
        address myaddr = address(eb);
        //status = myaddr.call(1)(bytes4(keccak256("GetBalance()")));
        return status;
    }
    
    /*function SimpleCallwithGasandValue() public returns (bool) {
        bool status = true;
        EtherBox ev = new EtherBox();
        address myaddr = address(eb);
        return status = ,myaddr.call.gas(2000000).value(1)(bytes4(sha3('getBalance()')));
    }*/
    
}
