//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * A simple ERC20 token contract
 * @author Scaffold-ETH 2
 */
contract MyERC20 is ERC20, Ownable {
    constructor(address _owner) ERC20("My Token", "MTK") Ownable(_owner) {
        // Mint 1000 tokens to the owner
        _mint(_owner, 1000 * 10**decimals());
    }

    /**
     * Mint new tokens (only owner can call)
     * @param to - address to mint tokens to
     * @param amount - amount of tokens to mint
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
