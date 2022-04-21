// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract ErrorHandling{
    // revert()
    // require()
    // assert()
    // error in the other contract
    // gas always consume

    function one() public {
        if(true){
            revert("Function reverted.");
        } 
    }

    function two() public {
        require(true, "Show error");
        assert(false); // Generally use check the errors that usually not occures
                       // No error msg is taken, only condition.
    }
}

contract a{
    function callB() external {
        b B = new b();
        B.showError();
    }

    function handlingErrorFromContractB() external returns(bool){
        b B = new b();
        (bool sent, ) = address(B).call(abi.encodePacked("showError()"));
        return sent;
    }
}

contract b{
    function showError() external {
        revert("Show Error form Contract B");
    }
}