// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

library UpgradeableProxyStorage {
    struct Layout {
        address implementation;
    }

    bytes32 internal constant STORAGE_SLOT =
        keccak256('solidstate.contracts.storage.UpgradeableProxy');

    function layout() internal pure returns (Layout storage l) {
        bytes32 slot = STORAGE_SLOT;
        assembly {
            l.slot := slot
        }
    }

    function setImplementation(
        Layout storage l,
        address implementation
    ) internal {
        l.implementation = implementation;
    }
}
