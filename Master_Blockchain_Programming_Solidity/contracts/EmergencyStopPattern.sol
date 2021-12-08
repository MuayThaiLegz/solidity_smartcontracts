pragma solidity 0.7.0;

contract Deposit {

    address public owner;
    bool paused = false;

    modifer onlyOwner {
        require(msg.sender == owner);
        _;
    }
    

    modifier whenPaused() {
        require(paused);
        _;
    }

    modifier whenNotPaused() {
        require(! paused);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function pause() public onlyOwner whenNotPaused {
        paused = true;    
    }

    function unpause() public onlyOwner whenPaused {
        paused = false;    
    }

    function deposit() public payable  whenNotPaused {
        // Ether deposit logic here
    }

    function emergencyWithdraw() public onlyOwner whenPaused {
        owner.tranfer(address(this).balance);    
    }
}
