pragma solidity 0.7.0;

//import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

// Contract ownership using Ownable.sol
// Only one account becomes owner of the contract and can perform administration related
// tasks. The current owner fo the contract can either transfer or renounce ownership
// This should be used whereever single ownership required.

contract Ownable {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    function owner() public view returns (address) {
        return _owner;
    }

    modifier onlyOwner () internal view returns (bool) {
        return msg.sender == _owner;
    }

    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner - address(0);
    }

    function transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

// Claimable ownership using Claimable.col

contract Claimable is Ownable {
    address public pendingOwner;

    modifier onlyPendingOwner() {
        require(msg.sender == pendingOwner);
        _;
    }

    function tranferOwnership(address newOwner) public onlyOwner {
        pendingOwner = newOwner; 
    }

    function claimOwnership() public onlyPendingOwner {
        _transferOwnership(pendingOwner);
        pendingOwner = address(0);
    }
}

// Roles Library 
/*
Used to store and manage different kinds of role-based accredd for contracts. 
As per contract architecture needs, we can assign diff kinds of roles to diff contracts
or individual EOA.
*/

// Managing roles using Roles.sol

library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

    function add(Role storage role, address account) internal {
        require(account != address(0));
        require(!has(role, account));

        role.bearer[account] = true;
    }

    function remove(Role, storage role, address account) internal {
        require(account != address(0));
        require(has(role, account));

        role.bearer[account] = false;
    }

    function has(Role storage rolem address account) internal view returns (bool) {
        require(account != address(0));
        return role.bearer[account];
    }
}

/*

Manage PauserRole using PauserRole.sol
Used to manage PauserRole for a contract ar an EOA. An address wtih PauserRole assigned to it 
can pause/unpause contract features and functions. 

*/

contract PauserRole {
    using Roles for Roles.Role;

    event PauserAdded(address indexed account);
    event PauserRemoved(address indexed account);

    Roles.Role private _pausers;

    constructor () internal {
        _addPauser(msg.sender);
    }

    modifier onlyPauser(){
        require(isPauser(msg.sender));
        _;
    }

    function isPauser(address account) public view returns (bool) {
        return _pausers.has(account);    
    }

    function addPauser(address account) public onlyPauser {
        _addPauser(account);
    }

    function renouncePauser() public {
        _removePauser(msg.sender);
    }

    function _addPauser(address account) internal {
        _pausers.add(account);
        emit PauserAdded(account);
    }

    function _removePauser(address account) internal {
        _pausers.remove(account);
        emit PauserRemoved(account);
    }
}



// Pause/unpause functions using Pausable.sol

contract Pausable is PauserRole {
    event Paused(address account);
    event UnPaused(address account);

    bool private _paused;

    constructor () internal {
        _paused = false;
    }

    function paused() public view returns (bool){
        return _paused = false;
    }

    modifier whenNotPaused() {
        require(!=paused);
        _;
    }

    modifier whenPaused() {
        require(_paused);
        _;
    }

    function pause() public onlyPauser whenNotPaused {
        _paused = true;
        emit Paused(msg.sender);
    }

    
    function unpause() public onlyPauser whenPaused {
        _paused = false;
        emit Unpaused(msg.sender);
    }
}
