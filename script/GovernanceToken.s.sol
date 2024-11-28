// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {GovernanceToken} from "../src/GovernanceToken.sol";

contract DeployGovernanceToken is Script {
    GovernanceToken private govToken;

    function setUp() public {}

    function run() public returns (GovernanceToken) {
        address[] memory holders = new address[](10);
        holders[0] = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
        holders[1] = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
        holders[2] = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;
        holders[3] = 0x90F79bf6EB2c4f870365E785982E1f101E93b906;
        holders[4] = 0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65;
        holders[5] = 0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc;
        holders[6] = 0x976EA74026E726554dB657fA54763abd0C3a0aa9;
        holders[7] = 0x14dC79964da2C08b23698B3D3cc7Ca32193d9955;
        holders[8] = 0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f;
        holders[9] = 0xa0Ee7A142d267C1f36714E4a8F75612F20a79720;

        uint256[] memory amounts = new uint256[](10);
        amounts[0] = 123;
        amounts[1] = 456;
        amounts[2] = 789;
        amounts[3] = 101;
        amounts[4] = 112;
        amounts[5] = 131;
        amounts[6] = 415;
        amounts[7] = 161;
        amounts[8] = 718;
        amounts[9] = 192;

        vm.broadcast();
        govToken = new GovernanceToken(holders, amounts);
        return govToken;
    }
}
