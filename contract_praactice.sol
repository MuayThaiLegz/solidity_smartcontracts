pragma solidity 0.7.0;

contract generalStructure {
    int public stateIntVariable;
    string stateStringVar;
    address personID;
    myStruct human;
  //  bool constant hasIncome;
    
    struct myStruct {
        string name;
        uint myAge;
        bool isMarried;
        uint[] bankAccountNumbers;
    }
    
    modifier onlyBy(){
        if (msg.sender == personID) {
            _;
        }
    }
    
    event ageRead(address, int);
    
    enum gender {male, female}
    
    
    function getAge (address _personID) onlyBy() payable external returns (uint) {
        
        human = myStruct('Javier', 30, true, new uint[](3));
        
        gender _gender = gender.male;
        
        emit ageRead(personID, stateIntVariable);
        
    }
}

contract HelloWorld {
    uint private simpleInt;
    
    function getValue( ) public view returns (uint) {
        return simpleInt;
    }
    
    function setValue(uint _value) public {
        
        simpleInt = _value;
    }
    
}


contract client {
    
    function useNetKeyword() public returns (uint) {
        
        HelloWorld myObj = new HelloWorld();
        
        myObj.setValue(10);
        
        return myObj.getValue();
    }
}


contract HelloWorld2 {
    
    uint private simpleInt;
    
    function getValue() public view returns (uint) {
        return simpleInt;
    }
    
    function setValue(uint _value) public {
        simpleInt = _value;
    }
}
 
 
 
 
contract client2 {
    
    address obj ;
    
    function setObject(address _obj) external {
        obj = _obj;
    }
    
    
    function UseExistingAdress() public returns (uint) {
        HelloWorld2 myObj2 = HelloWorld2(obj);
        myObj2.setValue(10);
        return myObj2.getValue();
    }
        
    
}

// constructor
contract HelloWOrld3 {
    
    
    uint private simpleInt;
    
    function HelloWorld3() public {
        
        simpleInt = 5;
    }
    
    function getValue3() public view returns (uint) {
        
        return simpleInt;
    }
    
    
    function setValue(uint _value) public {
        
        simpleInt = _value;
    }
}








