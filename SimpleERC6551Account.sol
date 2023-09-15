// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";
//6551 references
import "https://github.com/erc6551/reference/blob/v0.2.0-deployment/src/interfaces/IERC6551Account.sol";
import "https://github.com/erc6551/reference/blob/v0.2.0-deployment/src/lib/ERC6551AccountLib.sol";
import "https://github.com/erc6551/reference/blob/v0.2.0-deployment/src/ERC6551Registry.sol";

contract SimpleERC6551Account is IERC165, IERC1271, IERC6551Account {
    uint256 public nonce;

    receive() external payable {}

    function executeCall(
        address to,
        uint256 value,
        bytes calldata data
    ) external payable returns (bytes memory result) {
       // Fill: Check if person making the call for this account has control of the account.

        ++nonce;

        emit TransactionExecuted(to, value, data);

        // Fill

        if (!success) {
            assembly {
                revert(add(result, 32), mload(result))
            }
        }
    }
    
    // Explain
    function token()
        external
        view
        returns (
            uint256,
            address,
            uint256
        )
    {
        return ERC6551AccountLib.token();
    }

    function owner() public view returns (address) {
        // Fill
    }

    // IERC165
    function supportsInterface(bytes4 interfaceId) public pure returns (bool) {
        return (interfaceId == type(IERC165).interfaceId ||
            interfaceId == type(IERC6551Account).interfaceId);
    }

    // IERC1271
    function isValidSignature(bytes32 hash, bytes memory signature)
        external
        view
        returns (bytes4 magicValue)
    {
        bool isValid = SignatureChecker.isValidSignatureNow(owner(), hash, signature);

        if (isValid) {
            return IERC1271.isValidSignature.selector;
        }

        return "";
    }
}