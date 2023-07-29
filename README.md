## ETH+AVAX Assignment 3 : Create and Mint Tokens

This repository contains a Solidity smart contract developed using Hardhat and Remix IDE. The contract allows users to mint, burn, and transfer tokens on the Avalanche-Ethereum (Avax-Eth) network. The project aims to demonstrate the deployment of a custom token contract on the Hardhat network and interact with it using Remix IDE for Module 3 Project - Types of Functions.

### Contract Details

The contract, named "MyToken," is an ERC20-compliant token with additional functionalities for minting, burning, and transferring tokens. The contract owner can mint new tokens, users can burn their tokens, and anyone can transfer tokens between accounts.

### Contract Functions

The "MyToken" contract exposes the following functions:

1. `mint(address to, uint256 amount)`: Allows me to mint new tokens and assign them to the specified address.

2. `burn(uint256 amount)`: Allows users to destroy a specific amount of their tokens.

3. `transfer(address to, uint256 amount)`: Allows users to transfer tokens to another address.

### Getting Started

Follow these steps to set up and interact with the contract:

1. **Initialize Project**: Run `npx hardhat init` and select the JavaScript setup to create the project structure.

2. **Contract Development**: Write your custom token contract (MyToken.sol) in the `contracts` folder.

3. **Compile Contract**: Compile the contract using the command `npx hardhat compile`.

4. **Start Hardhat Network**: Deploy the local Hardhat network by running `npx hardhat node --network vm-merge` in a terminal.

5. **Connect Remix to Local Hardhat Network**: Open Remix IDE and switch to the "Deploy & Run Transactions" tab. Choose "Web3 Provider" as the environment, and set the Web3 provider to `http://localhost:8545` (or the appropriate URL for your Hardhat network).

6. **Deploy Contract**: Deploy the "MyToken" contract using Remix IDE. Make sure to copy the contract ABI and use it in the deployment process.

7. **Interact with Functions**: After the contract is deployed, use the provided functions (mint, burn, and transfer) in Remix IDE to test the token functionality.

### Example Deployment Script

You can use the following script (`deploy.js`) to deploy the contract via Hardhat:

```javascript
const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deployment initiated by:", deployer.address);

  console.log("Account balance of deployer:", (await deployer.getBalance()).toString());

  const Token = await ethers.getContractFactory("MyToken");
  const token = await Token.deploy();

  await token.deployed();

  console.log("MyToken contract deployed at address:", token.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("Error during deployment:", error);
    process.exit(1);
  });
```

### Resources

- *[Hardhat Documentation](https://hardhat.org/)*
- *[Remix IDE](https://remix.ethereum.org/)*
- *[OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)*
- *[Avalanche-Ethereum (Avax-Eth) Network](https://avax.network/)*

### Owner

This project is developed by **Abhay Jasrotia** as part of the **Metacrafters** Assessment for the ETH + AVAX Intermediate Course Module 3.