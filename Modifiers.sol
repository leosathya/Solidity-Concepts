// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Modifiers{

    modifier normal(){
        require(false, "a not equal to 1");
        _;
    }
    modifier gettingArgument(uint a){
        require(a==1, "a not equal to 1");
        _;
    }
    modifier passingArgument(uint a){
        require(a>1, "a smaller than 1");
        _;
    }

    function modi() external normal{}

    function modi2() external gettingArgument(2){}

    function modi3(uint a) external passingArgument(a){}

}