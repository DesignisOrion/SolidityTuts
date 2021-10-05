pragma solidity 0.5.16;

contract culturecoin {
    // address: keyword for the wallet account
    address public minter;
    //mapping: data type - store associations of two values
    mapping (address => uint) public balances;


    //Events allow the transaction to be recorded and logged on the blockchain. 
    //Here I am logging the address from, to, and also the amount.
    event Sent(address from, address to, uint amount);

    //constructor: a function that runs directly when the contract is created.
    constructor() public {
        //msg: a keyword that allows us to call the contact
        minter = msg.sender;
    }

    // The Owner who can mint coins function 
    //be sure ONLY THE ONWER / MINTER
    //
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter); // whoever is calling the contract is the minter
        require(amount < 1e60); // amount of the transaction is smaller than a certain value. The value can be anything desired.
        balances[receiver] += amount; //find the value of the reciever and add to their balance.
    }

    // The sending of coins function
    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insuffient Balance"); // amount must be smaller than the owner balance or get message.
        balances[msg.sender] -= amount;
        balances[receiver] <= amount;

        //trigger the event to log and record all actions
        emit Sent(msg.sender, receiver, amount);
    }

}