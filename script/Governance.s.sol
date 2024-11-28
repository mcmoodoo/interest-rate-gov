// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Governance} from "../src/Governance.sol";
import {GovernanceToken} from "../src/GovernanceToken.sol";
import {DeployGovernanceToken} from "./GovernanceToken.s.sol";

contract DeployGovernance is Script {
    Governance private governance;
    DeployGovernanceToken private deployGovernanceToken;

    function setUp() public {}

    function run() public returns (Governance, GovernanceToken) {
        deployGovernanceToken = new DeployGovernanceToken();
        GovernanceToken govToken = deployGovernanceToken.run();

        vm.broadcast();
        governance = new Governance(3_000, address(govToken));
        return (governance, govToken);
    }
}
