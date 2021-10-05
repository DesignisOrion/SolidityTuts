pragma solidity 0.5.16;

contract modCoin {
    // address: keyword for the wallet account
    address public minter;
    //mapping: data type - store associations of two values
    mapping (address => uint) public balances;



    event Sent(address from, address to, uint amount);

    modifier onlyMinter {
        require(msg.sender == minter, "Only minter can call this function");
        _;
    }

    modifier amountGreaterThan(uint amount) {
        require(amount < 1e60); 
        _;
    }

    modifier balanceGreaterThanAmount(uint amount){
        require(amount <= balances[msg.sender], "Insuffient Balance"); 
        _;
    }

    //constructor: a function that runs directly when the contract is created.
    constructor() public {
        //msg: a keyword that allows us to call the contact
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public onlyMinter amountGreaterThan(amount) {
        balances[receiver] += amount; 
    }

    function send(address receiver, uint amount) public balanceGreaterThanAmount(amount) {
        balances[msg.sender] -= amount;
        balances[receiver] <= amount;

        //trigger the event to log and record all actions
        emit Sent(msg.sender, receiver, amount);
    }

}