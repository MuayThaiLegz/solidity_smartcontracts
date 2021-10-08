/* Comments: Any prgramming language provides the facility to comment code and so does Solidity.
// single-line comment; /* This is a multiline comment

Apart from pragma, import, and comment, we can define contracts, libraries, and interfaces at the global or top level.*/

// contract.Solidity

pragma solidity 0.7.0;

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
Fucntions are the heart of Eth and Solidity contract. Eth maintains the current state of state variables
and executes transaction to change values in state variables. When a function in a contract is called
or invoked, it results in the creation of a transaction. Functions are the mechanism to read and write
values from/to state variables. Fucntions are a unit of code that cna be opionally return values to the caller
they can be names as wella s anonymous. Only one unamed fucntion per contract usually fallback fucntion

The syntax for declaring functions in Solidity is:*/

fucntion getAge (address _personIdentifier) onlyBy() payable external returns (uint) {

}

/* Fucntions have visibility qualifiers and qualifiers, related to what actions can be executed within
the function. 

Functions has visibility qualifier associated with them similar to state variables.
The visibility of a fucntion can be any of the following:
    
    * public: This visibility makes function access directly from outside.
      They become part of the contracts interface and can be called both internally and externally.

    * internal: By default, state variable has internal qualifier if nothing is specified.
                it means that this fuicntion can only be used within the current contract
                and any contract that inherit;s from it. these fucntions cannot be accessed from the outside
                They are not aprt of the contracts interface.
    
    * private: Private fucntions can only be used in contracts declaring them. they cannot be used even
    within derived contracts. They are not part of the contracts interface.

    * external: This visibility makes fucntions access directly from externally but not internally
                These fucntions become part of the contracts interface.

Funtions can also have the flowwing additonal qualifiers that change their behavior in terms of the
ability to contracat state variables:

    * constant: These functions do not have the ability to modify the state of blockchain.
                They can read that state variables and return back to the caller,
                but they cannot modify any variable, invoke an event, create another contract,
                call other fucntions that can change state, and so on.
                think of constant functions as fucntions that can read and return current state var values.
    
    * view: These functions are aliases of constant functions.

    * pure: Pure fucntions fufther constraints the ability of fucntions. Pure function can neither 
    read and write - in short, they cannot access state variables.
    Function if declared with this qualifier should ensure they will not access current state and transaction vars.

    * payable: Fucntions declared with the payable keyword has ability to accept Eth from the caller.
               The call will fail in case ehter is provided by sender.
               A fucntion can only accept eth if it is marker as payable.

Data types in Solidity 
Solidity data types can broadly be classified in the following two types:
    * Values types
    * Reference types

Values types: Types that do not take more than 32-bytes of memory in size.
Solidity provides the following value types:
    * bool; * uint; * int; * address; * byte; *enum

Refernce types: Do not store their values directly within the variables themselves.
                Instead of the value, they store the address of the location where the value is stored.
                The variable holds the pointer so another memory location that holds thae actual data.
Solidity provides the flowwing reference types:
    * Arrays; * Structs; * String; * Mappings;

# Storage and memory data locations
Each variable declared and used within a contract has a data location.
EVM has four data structures for storing variables:
    * Storage: This is global memory avaliable to all funcitons withijn the contrac.
    This storage is a permanwnt storage that ethstore on evry node within its env.

    * Memory: This is local memory available to every fucntion within a contract.
              This is short lived and fleeting memory that gets torn down when the function completes.
    
    * Calldata: this is where all incoming fucntion exectuion data, including function arguments,
                is stored. This is a non-modifiable moemory location.
    
    * Stack: EVM maintains a stack for loading variables and intermadiate values for working with eth instruciton set.
            This is working set memory for evm. A stack is 1024 levels deep in evm.

Based on the predecing two factors, there are rules that govern and decide the data location of vars.
Data locations also effect the way assignment oprator works. Both assigment and data location are explained
by means of rules that govern them




