// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

// Assembly is a low label language that allow you to directly manipulate the storage of EVM

contract AssemblyTest{
    // 100 opcodes
    // using assembly you can manipulate them
    // assembly always declare inside the solidity function in a Assembly block

    function add() external returns(bool){
        uint a;
        uint b;
        uint c;
        c = a + b;

        // detect if address is a SmartContract Address or not
        uint size;
        address addre;

        // Cast bytes to bytes32
        bytes memory data = new bytes(10);
        //bytes32 data2 = bytes32(data) // throw error as bytes32 is smaller than bytes 
        bytes32 data3;

        assembly{
            // using assembly you can manipulate above value storage
            c := add(1, 2)
            //if, for, function are aslo usuable in solidity

            // Loading some Data from specific memory slot (mload)
            let x := mload(0x40)
            mstore(a, 2) // storing data (temporary memory manipulation)
            sstore(a, 10) // storing to stateVariable

            // detecting address 
            size := extcodesize(addre)

            // TypeCasting
            data3 := mload(add(data, 32))
        }

        if(size > 0){
            return true;
        }else{
            return false;
        }
    }
}