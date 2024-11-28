// https://eips.ethereum.org/EIPS/eip-20
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GovernanceToken is ERC20 {
    constructor(address[] memory holders) ERC20("Governance", "GOV") {
        for (uint256 index = 0; index < holders.length; index++) {
            _mint(holders[index], 743);
        }
        _mint(_msgSender(), 1993);
        _mint(address(this), 93);
    }
}
