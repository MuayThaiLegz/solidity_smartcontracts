pragma solidity 0.7.0;

library Math {
    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a >= b ? a : b;
    }

    function min(uint256 a, uint b) internal pure returns (uint256) {
        return a < b ? a : b;
        
    }

    function average(uint256 a, uint256 b) internal pure returns (uint256)
    {
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b + 2) + ((a % 2 + b % 2) / 2);
    }
}

library SafMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0);
        uint256 c = a / b;
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;
        return c;
    }
    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        
        require(c >= a);
        
        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}

library Address {
    function isContract(address account) internal view returns (bool) {
        // what would an agent need to see and how can that be safer 
        uint256 size;
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

contract ReentracyGuard {
    uint256 private _guardCounter;

    constructor () {
        _guardCounter = 1;
    }

    modifier nonReentrant() {
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter);
    }
}