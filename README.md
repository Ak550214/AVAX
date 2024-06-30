# Owner only smart contract for minting

Solidity code, which implements an ERC20 token contract with minting, burning, and transfer functionalities.

## Description

This application comprises a simple contract known as My_crypto, which contains a mint_crypto function to send ethers to the specified address, burn_crypto function to deduct that amount from the wallet and transfer_crypto function to send amount to the provided address.

These transactions are conducted after connecting Remix IDE from MetaMask wallet using separate account addresses imported from Ganache.


## Getting Started

### Executing program

To run this program, I have utilised online Remix Solidity IDE. You may visit the Remix webpage at https://remix.ethereum.org/ .
Extension used for generating a new file is .sol , example: fileName.sol

SMART CONTRACT CODE:

```solidity

// SPDX-License-Identifier: MIT

```

This is a comment that specifies the license under which the code is released. In this case, it is the MIT license.

```solidity

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

```

This line imports the ERC20.sol file from the OpenZeppelin library. The ERC20.sol file contains the implementation of the ERC20 token standard, which this contract will extend.

```solidity

contract My_crypto is ERC20 { ... }  
  
```

This declares a new contract named My_crypto which extends the ERC20 contract from the OpenZeppelin library. In other words, Myether is a custom token contract that inherits the functionality of the ERC20 token.

```solidity

address private owner;
  
```

This declares a private state variable owner of type address. It will be used to store the address of the contract owner.

```solidity

constructor() ERC20("Arp_Coin", "AK") {
        owner = msg.sender;
    }
  
```

This is the constructor function that is invoked when the contract is deployed. It sets the starting state of the contract. In this example, it changes the name of the token to "Arp_Coin" and the symbol to "AK". It also initializes the owner variable with the address of the contract deployer (msg.sender).

```solidity

modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner has rights over this function!");
        _;
    }
  
```

This is a custom modifier named restriction. Modifiers are used to change the behavior of functions in Solidity. In this scenario, the modification is used to restrict access to particular functions solely to the contract owner. It verifies if the caller of the function (msg.sender) is the same as the owner variable. If not, it throws an error and stops the execution of the function. The underscore (_) specifies the position where the changed function will be run.


```solidity

function mint_crypto(address to_account, uint256 money) public restriction {
        _mint(to_account, money);
    }
  
```

This function allows the contract owner to mint fresh tokens. It requires two parameters: to (the address to which the new tokens will be created) and amount (the number of tokens to mint). The onlyOwner qualifier assures that only the contract owner may call this function. Inside the function, the _mint function from the ERC20 contract is called to produce and allocate the new tokens to the supplied address.


```solidity

function burn_crypto(uint256 money) public {
        _burn(msg.sender, money);
    }
  
```

This method allows any token holder to burn (destroy) their tokens. It requires one parameter: amount (the number of tokens to burn). Inside the function, the _burn function from the ERC20 contract is called to subtract the requested quantity of tokens from the caller's balance.


```solidity

 function transfer_crypto(address to_account, uint256 money) public override returns (bool) {
        require(money <= balanceOf(msg.sender), "Not enough balance to Transfer!");
        _transfer(msg.sender, to_account, money);
        return true;
    }
  
```

This method allows token holders to move their tokens to another address. It accepts two parameters: to (the address to which the tokens will be sent) and amount (the quantity of tokens to transfer). It overrides the transfer function from the ERC20 contract. It initially verifies if the caller has a sufficient balance to perform the transfer. If not, it gives an error. If the balance is adequate, it runs the _transfer function from the ERC20 contract to effectuate the transfer.


## Authors

Arpan Kumar 
[ironextreme5@gmail.com]

## License

This project is licensed under the MIT License - see the License.md file for details.
