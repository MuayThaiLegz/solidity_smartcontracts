pragma solidity >=0.5.0;

//import "node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20/ERC20Detailed.sol";

import "node_modules/openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";

// import "node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20/ERC20Mintable.sol";

contract MSTCrowdsale is
    CappedCrowdSale, TimedCrowdsale, MintedCrowdsale {

        constructor(
            uint256 _rate,
            address payable _wallet,
            IERC20 _token,
            uint256 _openingTime,
            uint256 _closingTime,
            uint256 _cap
        )

        Crowdsale(_rate, _wallet, _token)
        TimedCrowdsale(_openingTime, _closingTime)
        CappedCrowdsale(_cap)
        public
    {
        // solium-disable-previous-line no-empty-blocks
    }

}

 
