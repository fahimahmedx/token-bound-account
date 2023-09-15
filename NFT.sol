// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import "https://github.com/erc6551/reference/blob/v0.2.0-deployment/src/interfaces/IERC6551Registry.sol";
import "https://github.com/erc6551/reference/blob/v0.2.0-deployment/src/lib/ERC6551AccountLib.sol";


contract NFT is ERC721, Ownable {
        /*//////////////////////////////////////////////////////////////
                            STATE VARIABLES
    //////////////////////////////////////////////////////////////*/
    uint256 public totalSupply; // The total number of tokens minted on this contract
    address public immutable tokenContract = address(this); // The address of this contract

    // Explain below
    address public immutable implementation; // The SimpleERC6551Account address
    IERC6551Registry public immutable registry; // The 6551 registry address
    uint public immutable chainId = block.chainid; // The chainId of the network this contract is deployed on

    /*//////////////////////////////////////////////////////////////
                              CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/
    constructor(
        // Fill Parameters
    ) ERC721("HackTheNorthNFT", "HTNNFT") {
        // Fill
    }

    /*//////////////////////////////////////////////////////////////
                               FUNCTIONS
    //////////////////////////////////////////////////////////////*/


    function getAccount(uint tokenId) public view returns (address) {
        // Fill
    }

    function createAccount(uint tokenId) public returns (address) {
        // Fill
    }

    function addEth(uint tokenId) external payable {
        // Fill
    }

    function safeMint() public onlyOwner {
        _safeMint(msg.sender, ++totalSupply);
    }
}
