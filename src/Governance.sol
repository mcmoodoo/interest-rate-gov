// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {GovernanceToken} from "./GovernanceToken.sol";

contract Governance {
    uint256 private interestRate;
    GovernanceToken private govToken;

    struct Vote {
        uint256 proposedRate;
        bool voted;
    }

    mapping(address => Vote) votesForInterestRate;
    address[] public voters;

    constructor(uint256 initialRate, address govTokenAddress) {
        interestRate = initialRate;
        govToken = GovernanceToken(govTokenAddress);
    }

    function getInterestRate() public view returns (uint256) {
        return interestRate;
    }

    function getMyProposedRate() external view returns(uint256) {
        return votesForInterestRate[msg.sender].proposedRate;
    }

    function setInterestRate(uint256 newRate) public {
        interestRate = newRate;
    }

    function voteForInterestRate(uint256 proposedRate) external hasNotVotedYet onlyTokenHolders {
        // interestRate = proposedRate;

        _recordTheVote(proposedRate);
    }

    function _recordTheVote(uint256 proposedRate) private {
        // Record the vote
        votesForInterestRate[msg.sender] = Vote({proposedRate: proposedRate, voted: true});
        // Add the voter to the array!
        voters.push(msg.sender);
    }

    function tallyVotes() external view returns (uint256) {
        require(voters.length > 0, "No votes cast yet...");

        uint256 sum = 0;

        for (uint256 index = 0; index < voters.length; index++) {
            sum += votesForInterestRate[voters[index]].proposedRate;
        }

        return sum / voters.length;
    }

    modifier hasNotVotedYet() {
        require(!votesForInterestRate[msg.sender].voted, "You have already voted on this poll, my man");
        _;
    }

    modifier onlyTokenHolders() {
        require(govToken.balanceOf(msg.sender) > 0, "You're not a tokenholder so, get the **** out of here!");
        _;
    }
}
