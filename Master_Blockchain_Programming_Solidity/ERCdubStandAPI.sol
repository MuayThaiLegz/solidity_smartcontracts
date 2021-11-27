pragma solidity 0.7.0;

interface ERC20FullInterface {
    // Below are the Optinal functions of API
    function name() external view returns (string);
        
    function symbol() external view returns (string); 

    function decimals() external view returns (uint8);

    // Below are the functions an implementation MUST have 
    function transfer(address to, uint256 value) external returns (bool);
        
    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(address from, address to, uint256 value) external returns (bool);

    function totalSumply() external view returns (uint256);

    function balnaceOf(address who) external view returns (uint256);

    function allowance(address owner, address spender) external view returns (uint256);

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value
        );
    }

/*
Difference between the ether and tokan transfer functions: 
Developers must know that are two types of transfer() functions
One is used on the address data types to tranfer the ether to that
address form the contract


The second type is the function defined by the ERC20 standard. This function should be
called on hte contract with the ERC20 standard API 

*/
contract work {
    uint8 amount = 1 ether ; // Could be any amount to transfer
    address(toAddress).tranfer(amount);
}

ERC20(TKNContractAddress).transfer(toAddress, amount);


// The approve function: The ERC20 standard API is as follows

function approve(address spender, uint256 value) external returns (bool success);

// We have two parameters in the above function
//address -to whom the approval will be given and who will be allowed to spend the funds
//value - number of tokens the spander is allowed to fetch from the senders balance.

function approve(address spender, uint256 value) external returns (bool success) {
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
}

/* 
It is recommended to enclose the call with require() to ensure that the token approval
executed succefully. In the case of failure, the transaction should revert it.
*/

require(ERC.approve(spender, value));

// Preventing a front-running attack: To prevent a front-attack.

function approve(address _spender, uint256 _value) public returns (bool) {
    // prevent front-running attack
    require(_value == 0 || allowed[msg.sender][_spender] == 0);

    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
}

/* 
TransferFrom Function:
transfers the tokens form an owners account to the receiver account.
Only id the transaction initiator has sufficient alloeance that has been previosly
approve by the owner to the transaction initiator.
To tranfer the tokens using the transferFrom() function, approver must have called the
approve() fucntion prior. As per the standard, the transferFrom() function must fire the
Transfer event upon the successful execution and trasnfer of tokens. 
*/

function transferFrom(address from, address to, uint256 value) external returns (bool success);

// The above function takes 3 parameters.
    
    // from: an address type argumetn to deduct the tokens from the from Ether account

    // to: an address type argumetns to tranfer tokens to Ether account.

    // value: a uint256 type argument to define the number of tokens to deduct from 
    //  from account and send to to account

function transferFrom(
    address _from,
    address _to,
    uint256 _value 
)
public returns (bool)

{
    require(_value <= balances[_from]);

    require(_value <= allowed[_from][msg.sender]);

    require(_to != address(0));

    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    emit Transfer(_from, _to, _value);
    return true;
}

/* 
Advanced functions not part of erc20 api
By using the increaseApproval() & decreaseApproval() functions to increase or decrease 
the approval for the number of tokens, the attacks can eb eliminated.

EX:
After calling the approve() fucntions ocne,
to change it to not being attacked by front-run.
*/

function increaseApproval(
    address _spender,
    uint256 _addedValue
)
    public returns (bool)
{
    allowed[msg.sender][_spender] = (
    allowed[msg.sender][_spender].add(_addedValue));
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
}

function decreaseApproval(
    address _spender,
    uint256 _subtractedValue
)
    public returns (bool)
{
    uint256 oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue >= oldValue) {
        allowed[msg.sender][_spender] = 0;
    } else {
        allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
    }
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
}






