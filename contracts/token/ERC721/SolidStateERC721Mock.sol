// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import { IERC165 } from '../../interfaces/IERC165.sol';
import { IERC721 } from '../../interfaces/IERC721.sol';
import { ERC165Storage } from '../../introspection/ERC165Storage.sol';
import { ERC721MetadataStorage } from './metadata/ERC721MetadataStorage.sol';
import { SolidStateERC721 } from './SolidStateERC721.sol';

contract SolidStateERC721Mock is SolidStateERC721 {
    using ERC165Storage for ERC165Storage.Layout;

    constructor(
        string memory name,
        string memory symbol,
        string memory baseURI
    ) {
        ERC721MetadataStorage.Layout storage l = ERC721MetadataStorage.layout();
        l.name = name;
        l.symbol = symbol;
        l.baseURI = baseURI;

        ERC165Storage.layout().setSupportedInterface(
            type(IERC165).interfaceId,
            true
        );
        ERC165Storage.layout().setSupportedInterface(
            type(IERC721).interfaceId,
            true
        );
    }

    function mint(address account, uint256 tokenId) external {
        _mint(account, tokenId);
    }

    function burn(uint256 tokenId) external {
        _burn(tokenId);
    }
}
