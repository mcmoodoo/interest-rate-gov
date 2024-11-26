// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Governance} from "../src/InterestRateGovernance.sol";

contract GovernanceTest is Test {
    Governance private governance;
    uint256 private immutable initialInterestRate;

    constructor() {
        initialInterestRate = 333;
    }

    function setUp() public {
        governance = new Governance(initialInterestRate);
    }

    function test_gettingRate() public view {
        assertEq(governance.getInterestRate(), initialInterestRate);
    }

    function test_settingRate() public {
        uint256 new_rate = initialInterestRate + 1;
        assertEq(governance.getInterestRate(), initialInterestRate);
        governance.setInterestRate(new_rate);
        assertEq(governance.getInterestRate(), new_rate);
    }
}
