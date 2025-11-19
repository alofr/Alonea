// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

/**
 * @title Alonea Token
 * @dev Kontrak token ERC20 yang dapat di-upgrade.
 * Menggunakan pola proxy dari OpenZeppelin.
 */
contract MyToken is Initializable, ERC20Upgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        // Mencegah kontrak ini diinisialisasi secara langsung
        _disableInitializers();
    }

    /**
     * @dev Fungsi initializer, menggantikan constructor untuk kontrak upgradeable.
     * Hanya bisa dipanggil sekali.
     * @param initialOwner Alamat yang akan menerima total supply awal.
     */
    function initialize(address initialOwner) public initializer {
        __ERC20_init("Alonea", "ALA");
        // Total supply adalah 222.222.222 token dengan 18 desimal
        _mint(initialOwner, 222222222 * (10**18));
    }
}
