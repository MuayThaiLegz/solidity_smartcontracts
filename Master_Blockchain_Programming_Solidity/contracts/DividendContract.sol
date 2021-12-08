pragma solidity ^0.7.0;


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

    modifier onlyOwner (){
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


contract DividendContract is Ownable {
    address[] public investors;
    function registerInvesto(address _investor) payable public onlyOwner {
        require(_investor != address(0));
        investors.push(_investor);
}

// Good Practice = Pull ether

    function claimDividend() public {
        uint amount = balances[msg.sender];
        require(amount > 0);
    //Ensure to update balance before transfer
    //to avoid reeentrancy attack
        balances[msg.sender] = 0;
        msg.sender.transfer(amount);
    }
}





/* Bad Practice
function distributeDividend() public onlyOwner {
    for(uint i = 0; i < investors.length; i++) {
        uint amount = calculateDividend(investors[i]);
        //investors[i].transfer(amount); // Push ether to user
    }
}

function calculateDividend(address _investor) internal returns(uint) {
    // Dividend calculation here 
    }
}
*/