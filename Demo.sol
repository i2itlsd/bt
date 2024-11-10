// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Demo {
    uint private newbal = 3500;

    // Deposit function to increase the balance
    function deposit(uint x) public {
        newbal += x;
    }

    // Withdraw function to decrease the balance
    function withdraw(uint x) public {
        // Check for sufficient balance
        if (newbal < x) {
            revert("Insufficient balance");
        }
        newbal -= x;
    }

    // Show the balance
    function show() public view returns (uint) {
        return newbal;
    }

    // Optionally, you could make 'newbal' public for direct access
    // If you want to make 'newbal' directly accessible, you can do so like this:
    // uint public newbal = 3500;
}


/*
newbal: Holds the current balance of the contract.
deposit(uint x): Allows the user to deposit money into the contract by increasing the balance.
withdraw(uint x): Allows the user to withdraw money, ensuring there's enough balance before proceeding.
show(): Displays the current balance.
*/
