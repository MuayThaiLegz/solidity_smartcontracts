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
