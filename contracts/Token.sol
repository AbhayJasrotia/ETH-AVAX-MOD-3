// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public owner;

    constructor() ERC20("Metacrafters", "ABH") {
        owner = msg.sender;
        // Mint 0 tokens to the contract owner
        _mint(owner, 0);
    }

    // Modifier to restrict access to the function only to the contract owner
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only the contract owner can call this function"
        );
        _;
    }

    // Function to mint new tokens
    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Invalid address");
        _mint(to, amount);
    }

    // Function to burn tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Override the transfer function to include custom logic
    function transfer(
        address to,
        uint256 amount
    ) public override returns (bool) {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        require(to != address(0), "Invalid address");
        _transfer(msg.sender, to, amount);
        return true;
    }
}
