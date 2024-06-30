// SPDX-License-Identifier: MIT    

pragma solidity ^0.8.0; 

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract My_crypto is ERC20 {

    address private owner;

    constructor() ERC20("Arp_Coin", "AK")
    {
        owner = msg.sender;
    }

    modifier restriction()
    {
        require(msg.sender == owner, "Only the contract owner can access this function!");
        _;
    }

    function mint_crypto(address to_account, uint256 money) public restriction
    {
        _mint(to_account, money);
    }

    function burn_crypto(uint256 money) public {
        _burn(msg.sender, money);
    }

    function moving_crypto(address to_account, uint256 money) public returns (bool) {

        require(money <= balanceOf(msg.sender), "Insufficient balance to Transfer!");

        _transfer(msg.sender, to_account, money);

        return true;
    }
}
