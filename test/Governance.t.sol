// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Governance} from "../src/InterestRateGovernance.sol";

contract GovernanceTest is Test {
  Governance public governance;

  function setUp() public {
    governance = new Governance(333);
  }

  function test_gettingRate() public view {
    assertEq(governance.getInterestRate(), 33);
  }

}

