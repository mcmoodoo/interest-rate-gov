// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Governance {
    uint256 private interestRate;

    constructor(uint256 initialRate) {
        interestRate = initialRate;
    }

    function getInterestRate() public view returns (uint256) {
        return interestRate;
    }

    function setInterestRate(uint256 newRate) public {
        interestRate = newRate;
    }
}
