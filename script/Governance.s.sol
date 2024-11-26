// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Governance} from "../src/InterestRateGovernance.sol";

contract DeployGovernance is Script {
    Governance public governanceContract;

    function setUp() public {}

    function run() public {
        vm.broadcast();
        governanceContract = new Governance(3_000);
    }
}
