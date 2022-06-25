// SPDX-License-Identifier: CC-BY-SA-4.0

// Version of Solidity compiler this program was written for
pragma solidity ^0.8.14;

contract Owned {
    address payable owner;

    // Initialize Faucet contract: set owner
    constructor() {
        owner = payable(msg.sender);
    }

    // Access control modifier
    modifier onlyOwner {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }
}

contract Mortal is Owned {
    // Contract destructor
    function destroy() public onlyOwner {
        // self-destruct and send any remaining balance to the owner address
        selfdestruct(owner);
    }
}

// Faucet Contract
contract Faucet is Mortal {
    event Withdrawal(address indexed to, uint amount);
	event Deposit(address indexed from, uint amount);

    // Accept any incoming amount
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    // Give out ether to anyone who asks
    function withdraw(uint withdraw_amount) public {
        // Limit withdrawal amount
        require(withdraw_amount <= 0.1 ether);
        // Check if there is enough ether in the contract to withdraw
        require(address(this).balance >= withdraw_amount,
                "Insufficient balance in faucet for withdrawal request");

        // Send the amount to the address that requested it
        payable(msg.sender).transfer(withdraw_amount);
        emit Withdrawal(msg.sender, withdraw_amount);
    }
}
