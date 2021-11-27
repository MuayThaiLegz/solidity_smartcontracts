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

    modifier onlyOwner () public view returns (bool) {
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

}

// C