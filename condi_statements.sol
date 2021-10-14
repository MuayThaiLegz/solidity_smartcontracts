pragma solidity 0.7.0;

contract whileLoop {
    
    mapping (uint => uint) blockNumber;
    uint counter;
    
    event uintNumber(uint);
    bytes aa;
    
    function setNumber() public {
        blockNumber[counter++] = block.number;
    }
    
    function getNumber() public {
        uint i = 0;
        while (i < counter) {
            emit uintNumber( blockNumber[i] );
            i = i + 1;
            
        }
    }
    
}


contract ForLoopExample {
    mapping (uint => uint) blockNumber;
    uint counter;
    
    event uintNumber(uint);
    
    function setNumber() public {
        blockNumber[counter++] = block.number;
    }
    
    function getNumber() internal {
        
        for (uint i=0; i < counter; i++){
            uintNumber (blockNumber[i]);
        }
        
        
    }
    
}


contract Down
