//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * A simple ERC721 NFT contract
 * @author Scaffold-ETH 2
 */
contract MyERC721 is ERC721URIStorage, Ownable {
    uint256 private _tokenIds;

    constructor(address _owner) ERC721("My NFT", "MNFT") Ownable(_owner) {
        _tokenIds = 0;
    }

    /**
     * Mint a new NFT
     * @param to - address to mint NFT to
     * @param tokenURI - metadata URI for the NFT
     * @return tokenId - the ID of the newly minted token
     */
    function mint(address to, string memory tokenURI) public onlyOwner returns (uint256) {
        _tokenIds++;
        uint256 newTokenId = _tokenIds;
        _mint(to, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        return newTokenId;
    }

    /**
     * Get the current token count
     * @return count - total number of tokens minted
     */
    function totalSupply() public view returns (uint256) {
        return _tokenIds;
    }
}
