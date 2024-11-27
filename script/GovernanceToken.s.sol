// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {GovernanceToken} from "../src/GovernanceToken.sol";

contract DeployGovernanceToken is Script {

  GovernanceToken private govToken;

  function setUp() public {}

  function run() public {
    vm.broadcast();
    govToken = new GovernanceToken();
  }
}
