// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {GovernanceToken} from "./GovernanceToken.sol";

contract Governance {
    uint256 private interestRate;
    GovernanceToken private govToken;

    constructor(uint256 initialRate, address govTokenAddress) {
        interestRate = initialRate;
        govToken = GovernanceToken(govTokenAddress);
    }

    function getInterestRate() public view returns (uint256) {
        return interestRate;
    }

    function setInterestRate(uint256 newRate) public {
        interestRate = newRate;
    }

    function voteForInterestRate(uint256 proposedRate) external onlyTokenHolders {
        interestRate = proposedRate;
    }

    modifier onlyTokenHolders() {
        require(govToken.balanceOf(msg.sender) > 0, "You're not a tokenholder so, get the **** out of here!");
        _;
    }
}
