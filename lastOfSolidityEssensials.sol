pragma solidity 0.7.0;

contract RequireConctract {
    
    function ValidInt8(uint _data) public returns(uint){
        require(_data >= 0);
        require(_data <= 255);
        
        return uint(_data);
    }

    function ShouldbeEven(uint _data) public returns (bool){
        require(_data % 2 == 0 );
        return true;
    }
}

// Assert Statement

contract AssertContract {
    
    function ValidInt8(uint _data) public returns (uint){
        require(_data >= 0);
        require(_data <= 255);
        
        uint value = 20;
        
        assert (value + _data <= 255);
        
        return uint(value + _data);
    }
}

// Revert Statement

contract RevertContract {
    
    function ValidInt(int _data) public returns (uint){
        if(_data < 0 || _data > 255) {
            revert();
        }
    
        return uint(_data);
        
    }
    
}

// Events and logging 

contract eventContract {
    
    event LogFunctionFlow(string);
    
    function ValidInt8(int _data) public returns(uint){
        emit LogFunctionFlow('Within function ValidInt8');
        
        if(_data < 0 || _data > 255) {
            revert();
            
        }
        
        LogFunctionFlow("Value is within expected range");
        LogFunctionFlow("Returing value form function");
        
        return uint8(_data);
    }
}
