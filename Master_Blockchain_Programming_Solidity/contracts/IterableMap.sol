pragma solidity 0.7.0;


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


contract DepositContract is Ownable {
    address[] public holders;

    function deposit() public payable {
        require(msg.value > 0);
        bool exists = balances[msg.sender] != 0;

        if (!exists) {
            holders.push(msg.sender);
        }
        balances[msg.sender] += msg.value;
    }

    function gotHoldersCount() public view returns (uint) {
        return holders.length;
        
    }
} 