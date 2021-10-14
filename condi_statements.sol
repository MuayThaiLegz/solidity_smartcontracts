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

contract DowhileLoop {
    mapping (uint => uint) blockNumber;
    uint counter;
    event uintNumber(uint);
    bytes aa;
    
    function setNumbers() public {
        blockNumber[counter++] = block.number;
        
    }
    
    
    function getNumbers() public {
        uint i = 0;
        do {
            uintNumber(blockNumber[i] );
            i = i + 1;
            
        } while ( i < counter);
    }
}


contract ForLoopExampleBreak {
    mapping (uint => uint) blockNumber;
    uint counter;
    
    event uintNumber(uint);
    
    function setNumber() public {
        
        blockNumber[counter++] = block.number;
        
    }
    
    function getNumbers() public {
        
        for (uint i=0; i < counter; i++){
            if (i ==1)
                break;
            uintNumber( blockNumber[i] );
        }
        
    }
}


contract ForLoopExampleContinue { 
    mapping (uint => uint) blockNumber;
    uint counter;
    
    event uintNumber(uint);
    
    function setNumber() public {
        
        blockNumber[counter++] = block.number;
    }
    
    function getNumbers() public {
        for (uint i=0; i< counter; i++){
            if ((i > 5))
                { continue;}
            uintNumber( blockNumber[i] );
        
        }
    }
}

contract ReturnValues {
    
    uint counter;
    
    function setNumber() public {
        
        counter = block.number;
        
    }
    
    function getBlockNumber() public returns (uint) {
        
        return counter;
    }
    
    function getBlockNumber1() private returns (uint result) {
        
        result = counter;
    }
    
}
