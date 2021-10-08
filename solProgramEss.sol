/* Comments: Any prgramming language provides the facility to comment code and so does Solidity.
// single-line comment; /* This is a multiline comment

Apart from pragma, import, and comment, we can define contracts, libraries, and interfaces at the global or top level.*/

// contract.Solidity

pragma solidity 0.5.0;

contract firstContract {
    
}

contract secondContract{
    
}

library stringLibrary {
    
}

library mathLibrary {
    
}

interface IBank{
    
}

interface IAccount {
    
}

/* Technically, smart contracts are composed of two contructs- variables and fucntions. There are multiple facets to both
variables and fucntions and that is again something that will be discussed throuhgtout this book.

A contract consists of the follwong multiple comnstrucsts:
* State variables
* Structure definitions
* Modifier definitions
* Event definitions
* enum definitions
* fucntion definitions

A typical contracat consisst of all the preceding comnstrucsts.*/

// contract definition 
contract generalStructure {
    //state variables
    int public stateIntVariable; //variable of integer type
    string stateStringVariable; //variable of string type
    address personIdentifier; //variable of address type
    myStruct human; // variable of structure type 
    bool constant hasIncome = true; // variable of constant nature
    
    //structure definition
    struct myStruct {
        string name; //variable of string type
        uint myAge; // variable of unsingned interger type
        bool isMarried; // variable of boolean type
        uint[] bankAccountsNumber; //variable - dynamic array of unsingned interger
        
    }
    
    //modifier declaration
    modifier onlyBy(){
        if (msg.sender == personIdentifier){
            _;
        }
    }
    
    // event declaration
    event ageRead(address, int);
    
    // enumeration declaration
    enum gender {male, female}
    
    
    // function definition
    function getAge (address _personIdentifier) onlyBy() payable external returns (uint) {
       
        human = myStruct('Name',10,true,new uint[](3)); // using struct myStruct
        
        gender _gender = gender.male; // using enumeration
        
        emit ageRead(personIdentifier, stateIntVariable);
    }
    
}

// State variables
/* Variables in programming refer to storage location that cna contain values. These values can be changes suring runtime. 
The variable can be stored within it. Solidity provides two types of variable - state and memory variables. It is the state variables 
that are storeed to the blockchain. State variables store the current values of the contract. The allocated memory for a state variable is statically assinged
it cannot change suring the lifetime of the contracat. State variables aslo have additional qualifiers associated with them. They can be any of the following:

* internal: Be default, the state variable has the internal qualifier if nothing is spcified. Meaaning that this variable can only be used wihtin current contract
functions and any contract that inherits from them. These variables cnaoot be accessed from outside for modification: however, they can be viewed.
inter state example:

int internal StateVariable ;

* private: This qualifier is like internal with additional constraints. Private state variables can only be used in contracats declaeing them.
They cannot be used even within derived contracts. private state example:

int private privateStateVariable ;

* public: This qualifier makes state variables access directly. the sol compiler generates a getter fucntion for each public state variable.
public state example

int public stateIntVariable ;

* constant: This qualifier makes atate variables immutablle. The value must be assinged to the variable at declaration time itself.
The sol compiler will replace references of this variable everywhere in code with the assigned value. constant state example 

bool constant hasIncome = true;*/

// Solidity provides the following multiple out-of-box data types: bool; uint/int; bytes; address; mapping; enum; struct; bytes/String
// Using enum and struct, one can create custom user-defined data types. 

struct myStruct {
    string name;
    uint myAge;
    bool isMarried;
    uint[] bankAccountsNumbers;
}

// To create an instance of a structure, the following syntax is used

human = myStruct("Javier", 10, true, uint[](3))

// Multiple instance of struct canbe created in fucntions. Structs can contain array and the mapping variables,
// while mappings and arrays cnastore values  of type struct`

// Modifiers  ; _ means: execute the target fucntion

modifer onlyBy(){
    if (msg.sender == personIdentifier)
    _;
}


function getAge (address _personIdentifier) onlyBy() payable external returns (uint){

    human = myStruct('Javier", 30, true, new uint[](3));
    gender _gender = gender.male;
}

// getAge can only be executed by an account that has the same address as that stored in the contracts 
// _personIdentifier state variablle

// Events: in Solidity are used primarily for informaing the calling application about the current state
// of the contract by means of the lopgging facility of EVM. Used to notify apps about changhes in contracts
// allowing to use them to execute their dependent logic.

event ageRead(address, int );

// An event can invoked from any fucntion by its name and by passing the required parameters,
// as shown in the following screenshot

fucntion getAge(address _personIdentifier) onlyBy() payable external returns(uint){
    human = myStruct('Javier', 29, true, new, uint[](3));
    gender _gender = gender.male;
    ageRead(personIdentifier,stateIntVariable);

}

// Enumeration 
/*  The enum keyword is used to declare anumerations. Enumerations help in declaring a custom user-defined
data type in solidity.Emun cocsists of an enumeration list. a predetermined set of named constants.
Constant value gets an interger value, with the first one having a value of 0 and the value of each 
successive item is increased by 1.

An enum declation uses the enum keyword followed by enumeration declaration does not have a semicolon as
its terminator and that there should be atkest ine member declared in the list

An example of enum is a s follows */
gender _gender = gender.male;

/* It is not mandatory to define enum is a solidity contract. enum should be defined id theresis a constant list
of items that do not change like tha example shown previously. These become good example for  an enum declaration. they help make your code more readable.

# Funtions 
