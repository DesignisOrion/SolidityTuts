pragma solidity 0.5.16;

contract gldnfMeta {
    uint public playerCount = 0;
    mapping (address => Player) public players;

    enum level {Novice, Intermediate, Advanced}

    // creating the object player
    // can search the player by address once created
    struct Player{
        address playerAddress;
        level playerLevel;
        string firstName;
        string lastName;
    }
    
    function addPlayer(string memory firstName, string memory lastName) public {
        players[msg.sender] = Player(msg.sender, level.Novice, firstName, lastName);
        playerCount += 1;
    }
    
    // created a function to grab the player level and can find as well by the address.
    function getPlayerLevel(address playerAddress) public view returns(level){
        return players[playerAddress].playerLevel;
    }





    
}