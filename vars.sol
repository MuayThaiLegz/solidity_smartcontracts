pragma solidity 0.7.0;

// Mathematical operations such as addition, multiplicatio, division, exponential, negation, post-increment, and pre-increment
// can be performaed on integers.

contract AllboutsInts {

    uint stateUInt = 20;
    uint stateInt = 20;

    function getUInt(uint incomingValue) public
    {
        uint memoryuint = 256 ;
        uint256 memoryuint256 = 256 ; 
        uint8 memoryuint8 = 8 ;

        // addtion of two uint8 

        uint256 result = memoryuint8 + memoryuint ;

        // assingAfterIncrement = 9 and memoryuint8 = 9
        uint8 assingAfterIncrement = ++memoryuint8 ;

        // assignAfterIncrement = 9 and memoryuint8 = 10
        uint8 assingBeforeIncrement = memoryuint8++;

    }

    function getInt(int incomingValue) public
    {
        int memoryInt = 256 ;
        int256 memoryInt256 = 256 ;
        int8 memoryInt8 = 8 ;

    }


}

// Boolean: SOlidity, like any programming language, provides a boolean data type. the bool data type can be usded to represent scenarios
// that have binary results, such as true or false, 1 or 0. bools in Solidity connot be converted to intergers. Dafault value for bool is false

contract boolContract {
    bool isPaid = true;

    function manageBool() internal returns (bool)
    {
        isPaid = false;
        return isPaid;
    }

    function convertToUint() internal returns (uint8)
    {
        isPaid = false;

        return uint8(isPaid);
    }

}