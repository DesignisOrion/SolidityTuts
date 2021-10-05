pragma solidity 0.5.16; // version of solidity compiler

// create contract and name it.
contract SimpleStorage {
    //unsigned integer ( a int higher than 0)
    uint storeData;

    // declare a function
    // set: will change the state of the variable
    // public: keyword allowing function to be accessible outside the contract
    function set(uint x) public {
        storeData = x;
    }

    // getting the values of the function
    // create a function to do so.
    // view: keyword that declares the function data to only be viewed
    function get() public view returns (uint) {
        return storeData;
    }
}