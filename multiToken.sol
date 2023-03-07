// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC115/ERC115.sol";

contract multiToken is ERC115("Skull", "SKL") {
    uint256 public constant Fungible = 0;
    uint256 public constant NoFungible = 0;
    uint256 public constant OtroFungible = 0;

    constructor() public ERC115 ("aca una uri"){
        _mint(msg.sender, Fungible, 1000, "");
        _mint(msg.sender, NoFungible, 1, "");
        _mint(msg.sender, OtroFungible, 6000, "");

    }
}
