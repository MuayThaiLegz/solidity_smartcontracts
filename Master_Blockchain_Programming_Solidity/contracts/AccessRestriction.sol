pragma solidity ^0.7.0;

contract AccessControl {
    
    address public owner;

    address public admin;

    bool public paused;
    
    modifier whenNotPaused() {
        require(!paused);
        _;
    }

    modifier OnlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier OnlyAdmin() {
        require(msg.sender == admin);
        _;
    }

    modifier onlyAuthorized() {
        require(msg.sender == owner || msg.sender == admin);
        _;
    }

    function changeAdmin(address _newAdmin) internal OnlyOwner {
        require(_newAdmin != address(0));
        admin = _newAdmin;
    }

    function pause() public onlyAuthorized whenNotPaused {
        paused = true;
    }        
}
