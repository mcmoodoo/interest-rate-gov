// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Governance} from "../src/Governance.sol";
import {GovernanceToken} from "../src/GovernanceToken.sol";
import {DeployGovernance} from "../script/Governance.s.sol";
import {DeployGovernanceToken} from "../script/GovernanceToken.s.sol";

contract GovernanceTest is Test {
    Governance private governance;
    GovernanceToken private govToken;
    DeployGovernance private deployGovernance;
    address private constant ANVIL_ACCOUNT_1_ADDRESS = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;

    uint256 private constant INITIAL_INTEREST_RATE = 333;

    function setUp() public {
        deployGovernance = new DeployGovernance();
        (governance, govToken) = deployGovernance.run();
        governance.setInterestRate(INITIAL_INTEREST_RATE);
    }

    function test_gettingRate() public view {
        assertEq(governance.getInterestRate(), INITIAL_INTEREST_RATE);
    }

    function test_settingRate() public {
        uint256 new_rate = INITIAL_INTEREST_RATE + 1;
        assertEq(governance.getInterestRate(), INITIAL_INTEREST_RATE);
        governance.setInterestRate(new_rate);
        assertEq(governance.getInterestRate(), new_rate);
    }

    function test_balance() public {
        assertEq(govToken.balanceOf(ANVIL_ACCOUNT_1_ADDRESS), 743);
    }

    function test_voteForInterestRate() public {
        uint256 proposed_rate = INITIAL_INTEREST_RATE + 7;
        vm.prank(ANVIL_ACCOUNT_1_ADDRESS);
        governance.voteForInterestRate(proposed_rate);
        assertEq(governance.getInterestRate(), proposed_rate);
    }

    function test_nonHolderTryingToVote() public {
        uint256 proposed_rate = INITIAL_INTEREST_RATE + 7;
        vm.expectRevert();
        governance.voteForInterestRate(proposed_rate);
    }
}
