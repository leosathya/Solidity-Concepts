// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

import "./interfaceCall.sol";

// call function of other contract not in same file
contract A{
    // for calling b's function we need 2 things
    //    -- interface of b (as both are in same page so b's interface available to a)
    //    -- address of b
    address _b;
    constructor(address b){
        _b = b;
    }

    function callB() external view returns(string memory){
        // for calling first we have to create a Pointer
        B b = B(_b);
        return b.greet();
    }
}
contract B{
    function greet() external pure returns(string memory){
        return "Hello world";
    }
}


// import keyword (Smart Contracts in other folder)
contract C{
    address _d;
    constructor(address d){
        _d = d;
    }

    function callD() external view returns(string memory){
        // for calling first we have to create a Pointer
        InterfaceD d = InterfaceD(_d);
        return d.greet();
    }
}

// contract interface

// error propagation