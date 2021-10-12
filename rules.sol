

/*Based on the predecing two factors, there are rules that govern and decide the data location of vars.
Data locations also effect the way assignment oprator works. Both assigment and data location are explained
by means of rules that govern them

Rule 1 
Variables declred as state variables are always stored in the storage data location.

Rule 2 
Variables declared as functions, by default, are stored in the memory data location.

Rule 3
Variables declared within functions, by default are stored in memory data locatio. However, there are the following few caveats:
    * The location for value type variables is memory within a fumction while the default for a reference type variable is storage.
            NOTE storage is the dafault for referrence type variable declared within a function. This can be overrideenm.
    
    * By overriding the default location, reference types variables can be located at the memory data location.
            The reference types referred are arrays, stucts,and strings.
    
    * Reference types declared within a function without being overridden and cannot be stored at the storage location.

    * Mappings type variables declared at storage location. This means that they cannot be declared within a fucntion.
            They canot be declared as memory types. However, mappings in a function can refer to mappings declared as state variables.

Rule 4
Arguaments supplied by callers to function parameters are always in a calldata data location.

Rules 5
Assignments to state variable from another state variable alays createes a new copy.
*/

pragma solidity 0.7.0;


contract DemoStorageToStorageValueTypeAssignment {
    uint stateVar1 = 20;
    uint  stateVar2 = 40;

    function getUint() public returns (uint)

    {
        stateVar1 = stateVar2;

        stateVar2 = 50;

        return stateVar1;
    }

}

// illustating that each variable maintains its own independent value 
contract DemoStorageToStorageReferenceTypeAssignment {
    uint[2] stateArray1 = [uint(1), 2];
    uint[2] stateArray2 = [uint(3), 4];

    function getUInt() internal returns (uint)
    {
        stateArray1 = stateArray2;

        stateArray2[1] = 5;

        return stateArray1[1];
    }
}

// Rule 6; Assignments to storage variables from another memory veriable always create a new copy.
// illustrating that each variable maintains its own independent value as shown in the floowing screenshot:

contract DemoMemoryToStorageReferenceTypeAssignment {
    uint[2] stateArray ;
    function getUInt() internal returns (uint)
    {
        uint[2] memory localArray = [uint(1), 2];
        stateArray = localArray;
        localArray[1] = 10;
        return stateArray[1];
    }
}

// illustrating thtat each variable maintains its own independent value as shown in the following scrennshot

contract DemoMemoryToStorageValueTypeAssignment {
    uint stateVar = 20;
    function getUInt() internal returns (uint)
    {
        uint localVar = 40;

        stateVar = localVar;

        localVar = 50;

        return stateVar;

    }
}

// Rule 7 

contract DemoStorageToMemoryValueTypeAssignment {
    uint stateVar = 20;
    function getUInt() internal returns (uint)
    {
        uint localVar = 40;

        localVar = stateVar;

        stateVar = 50;

        return localVar;



    } 

}

// Rule 8 

contract DemoMemoryToMemoryValueTypeAssignment {

    function getUInt() internal returns (uint)
    {
        uint localVar1 = 40;

        uint localVar2 = 80;

        localVar1 = localVar2;

        localVar2 = 100;

        return localVar1;
    }

}