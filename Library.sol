// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

// Library use for code Re-useability
// Extract Common code, put them in a Library and Use them.

// Deployed vs Embedded Libraries
//  ===> if all functions have public, then on deploy library will have its own Address
//       work as services for other contracts
       
//  ===> all function will internal => both contract and Library present in same Address (Embedded)

library TestLibrary{
    struct Player{
        uint score;
    }
    
    function increaseScore(Player storage _player, uint points) public {
        _player.score += points;
    }

    function adding(uint a, uint b) pure public returns(uint c){
        c = a + b;
    }
}

contract LibraryTest{
    using TestLibrary for TestLibrary.Player;

    mapping(uint => TestLibrary.Player) players;

    function addingNumber() external pure returns(uint){
        return TestLibrary.adding(3, 4);
    }

    function increasePlayersScore(uint _score) external{
        // TestLibrary.increaseScore(players[0], _score); // when using...for sytax not used
        players[0].increaseScore(_score);
    }
}