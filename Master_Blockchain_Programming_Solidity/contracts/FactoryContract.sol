pragma solidity 0.7.0;

contract LoanMaster {
    address[] public loans;
    address public loanFactoryAddress;

    function createLoanRequest(address _token, uint _loanAmount) public {
        address loan = LoanFactory(loanFactoryAddress).createInstance(msg.sender, _token, _loanAmount);
        loans.push(loan);
    }

}

contract LoanFactory {
    function createInstance (address _borrower, address _token,uint _loanAmount) public returns (address) {
        return new Loan(_borrower, _token, _loanAmount);
    }
}

contract Loan {
    address token;
    address borrower;
    uint loanAmount;

    constructor(address _borrower, address _tokem, uint _loanAmount) public 
    {
        borrower = _borrower;
        token = _token;
        loanAmount = _loanAmount;


    }

}