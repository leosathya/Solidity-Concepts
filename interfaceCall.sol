// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

// Interface Use to define function Signature
// 2 ways
//  -- interface (interface keyword does not support Multiple inheritance)
//  -- contract Interface (thats why we developer use this)

//contract InterfaceD{
//    function greet() external pure returns(string memory);
//    function a() external;
//    function b(uint a) external returns(uint _a);
//}

interface InterfaceD{
    function greet() external pure returns(string memory);
    function a() external;
    function b(uint a) external returns(uint _a);
}

// Making Abstract a contract means it will be used by other contracts Somewhere-else
// Making Functions virtuals means these function can be Override by Child contracts.

contract D{
    function greet() external pure virtual returns(string memory){
        return "Hello world from other file";
    }
    function a() external virtual{}
    function b(uint _a) external virtual pure returns(uint _num){
        _num = _a;
    }
} 

