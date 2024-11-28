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
    address private constant ANVIL_ACCOUNT_2_ADDRESS = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
    address private constant ANVIL_ACCOUNT_3_ADDRESS = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;
    address private constant ANVIL_ACCOUNT_4_ADDRESS = 0x90F79bf6EB2c4f870365E785982E1f101E93b906;
    address private constant ANVIL_ACCOUNT_5_ADDRESS = 0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65;
    address private constant ANVIL_ACCOUNT_6_ADDRESS = 0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc;
    address private constant ANVIL_ACCOUNT_7_ADDRESS = 0x976EA74026E726554dB657fA54763abd0C3a0aa9;
    address private constant ANVIL_ACCOUNT_8_ADDRESS = 0x14dC79964da2C08b23698B3D3cc7Ca32193d9955;
    address private constant ANVIL_ACCOUNT_9_ADDRESS = 0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f;
    address private constant ANVIL_ACCOUNT_10_ADDRESS = 0xa0Ee7A142d267C1f36714E4a8F75612F20a79720;

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

    function test_voteRecorded() public {
        uint256 proposed_rate = INITIAL_INTEREST_RATE + 19;
        vm.prank(ANVIL_ACCOUNT_1_ADDRESS);
        governance.voteForInterestRate(proposed_rate);
        vm.prank(ANVIL_ACCOUNT_1_ADDRESS);
        assertEq(governance.getMyProposedRate(), proposed_rate);
    }

    function test_multipleVotesRecorded() public {
        vm.prank(ANVIL_ACCOUNT_1_ADDRESS);
        governance.voteForInterestRate(INITIAL_INTEREST_RATE + 19);
        vm.prank(ANVIL_ACCOUNT_2_ADDRESS);
        governance.voteForInterestRate(INITIAL_INTEREST_RATE + 18);
        vm.prank(ANVIL_ACCOUNT_3_ADDRESS);
        governance.voteForInterestRate(INITIAL_INTEREST_RATE + 17);
        vm.prank(ANVIL_ACCOUNT_4_ADDRESS);
        governance.voteForInterestRate(INITIAL_INTEREST_RATE + 16);
        vm.prank(ANVIL_ACCOUNT_5_ADDRESS);
        governance.voteForInterestRate(INITIAL_INTEREST_RATE + 15);
        
        assertEq(governance.tallyVotes(), INITIAL_INTEREST_RATE + 17);
    }

    function test_nonHolderTryingToVote() public {
        uint256 proposed_rate = INITIAL_INTEREST_RATE + 7;
        vm.expectRevert("You're not a tokenholder so, get the **** out of here!");
        governance.voteForInterestRate(proposed_rate);
    }

    function test_doubleVote() public {
        uint256 proposed_rate = INITIAL_INTEREST_RATE + 7;
        vm.prank(ANVIL_ACCOUNT_1_ADDRESS);
        governance.voteForInterestRate(proposed_rate);
        vm.prank(ANVIL_ACCOUNT_1_ADDRESS);
        vm.expectRevert("You have already voted on this poll, my man");
        governance.voteForInterestRate(proposed_rate + 11);
    }
}
