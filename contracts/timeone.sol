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
        // logging time
        uint createdTime;
    }
    
    function addPlayer(string memory firstName, string memory lastName) public {
        players[msg.sender] = Player(msg.sender, level.Novice, firstName, lastName, block.timestamp);
        playerCount += 1;
    }
    
    // created a function to grab the player level and can find as well by the address.
    function getPlayerLevel(address playerAddress) public view returns(level){
        Player storage player = players[playerAddress];
        return player.playerLevel;
    }

    // change player level function
    function changePlayerLevel(address playerAddress) public {
        Player storage player = players[playerAddress];
        if(block.timestamp >= player.createdTime + 20){ // if player is created, after 20 secs it then becomes intermediate level
            player.playerLevel = Level.Intermediate;
        }
    }





    
}