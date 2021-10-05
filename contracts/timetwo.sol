pragma solidity 0.5.16;

contract modCoin {

    // creating a integer for contractStartTime
    uint contractStartTime;
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
        // contract start time
        contractStartTime = block.timestamp;
    }

    function mint(address receiver, uint amount) public onlyMinter amountGreaterThan(amount) {
        balances[receiver] += amount; 
    }

    function send(address receiver, uint amount) public balanceGreaterThanAmount(amount) {
        //timestamp for sending at a certain time.
        require(block.timestamp >= contractStartTime + 30); // contact must be open for 30 secs for it to work.
        balances[msg.sender] -= amount;
        balances[receiver] <= amount;
        emit Sent(msg.sender, receiver, amount);
    }

}