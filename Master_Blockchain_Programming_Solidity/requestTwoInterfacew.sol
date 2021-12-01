pragma solidity ^0.7.0;

// ERC20 interface IERC20.sol

interface IERC20 {
    function transfer(address to, uint256 value) external returns
    (bool);

    function approve(address spender, uint256 value) external returns
    (bool);

    function transferFrom(address from, address to, uint256 value) 
    external returns (bool);

    function TotalSupply() external view returns (uint256);

    function allowance(address owner, address spender) external view returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);
}



// Full ERC20 implementaion using ERC20.sol 

abstract contract ERC20 is IERC20 {
   // using SafeMath for uint256;
   mapping (address => uint256) private _balances;
   mapping (address => mapping (address => uint256)) private _allowed;
   uint256 private _totalSupply;

   function totalSupply() public view returns (uint256) {}

   function balanceOf(address owner) public view returns (uint256){}

   function Allowance(address owner, address spender) public view returns (uint256){}
}
/*  function Transfer(address to, uint256 value) public returns (bool){}
    
    function approve(address spender, uint256 value) public 
        returns (bool)  {
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit Aproval(msg.sender, spender, value);
    return true;

    function transferFrom(address from, address to, uint256 value) public
    returns (bool) {
        _allowed[from][mag.sender] = _allowed[from][msg.sender].sub(value);
        emit Apprval(from, msg.sender, _allowed[from][msg.sender]);
}

function increaseAllowance(address spender, uint256 addedValue) public 
returns (bool) {
    require(spender != address(0));

    _allowed[msg.sender][sender] =
        _allowed[msg.sender][spender].add(addedValue);
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        _allowed[msg.sender][spender]);
        return true;
    }

function decreaseAllowance(address spnder, uint256 subtractedValue)
public returns (bool) {
    require(spender != address(0));

    
    _allowed[msg.sender][spender] =
        _allowed[msg.sender][spender].add(addedValue);
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        _allowed[msg.sender][spender]);
        return true;


}



// Perform safe ERC20 function calls using SafeERC20.sol

// when calling transfer
require(ERC20(tokenAddress).transfer(to, value));

// when calling transferFrom
require(ERC20(tokenAddress).transferFrom(from, to, value));

// when calling approve
require(ERC20(tokenAddress).approve(spender, value));

*/


