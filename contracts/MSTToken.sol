pragma solidity >=0.5.0;

import "node_modules/openzeppelin-solidity/contracts/token/ERC20/extensions/ERC20Pausable.sol";

//import "node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20/ERC20Detailed.sol";

import "node_modules/openzeppelin-solidity/contracts/token/ERC20/extensions/ERC20Burnable.sol";

// import "node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20/ERC20Mintable.sol";

contract MSTToken is ERC20Burnable, ERC20Pausable { /*ERC20Mintable, ERC20Detailed */
    
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    )
        ERC20Pausable(_name, _symbol, _demicals)
        public
    {
        // solium-disable-previous-line no-empty-blocks
    }

    )

} 
