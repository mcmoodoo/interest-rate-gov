// https://eips.ethereum.org/EIPS/eip-20
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GovernanceToken is ERC20 {
  constructor() ERC20("Governance", "GOV") {
    _mint(address(this), 100);
    _mint(_msgSender(), 19);
  }
}
