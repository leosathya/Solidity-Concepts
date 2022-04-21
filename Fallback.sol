// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Fallback{
    // use1 : Receive Ether
    // use2 : fallback
    // only one fallback allowed, no argument can passed ( can pass data using msg.data )
    // always external
    // if want to receive ether fallback will payable

    // transfer() & send() => use 2300 gas

    fallback() external {}
}

contract A{
    // Reject all incoming call
    fallback() external {
        revert("call reverted.");
    }
}

contract B{
    fallback() external {
        if(msg.data.length > 0){
            revert("");
        }
    }
}

// call a function doesnot exists
abstract contract InterfaceC{
    function functionNotPresentUsingInterface() external virtual;
}

contract C{
    function one() external pure returns(string memory){
        return "Hello from contract C.";
    }
}

contract D{
    function foo() external{
       C c = new C();
       //c.functionNotPresent(); 
       InterfaceC(address(c)).functionNotPresentUsingInterface();
    }
}