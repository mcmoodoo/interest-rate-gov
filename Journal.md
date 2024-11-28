## Brainstorming
So, the plan is to build a simple contract with:
 - voting abilities
 - users (token holders) need to hold gov tokens (ERC20) to be able to vote in this protocol!
 - each user's vote is weighted based on how much tokens she has. Her final impact = number_of_tokens/total_number_of_tokens_voted in the time allotted for voting
 - let's create a contract with:
    - interest_rate uint256 and decimals specified
    - set_interest_rate(uint256) to specify interest rate
    - deploy this to anvil!
    - deploy to sepolia
    - write tests to test writing a value 

## Progress
1. Successfully sent 1 ether using `cast send` from Anvil's first account to address 0, effectively burning the ether. Next, deployed the contract to Anvil.
2. Deployed the contract and inspected its storage using `cast storage <contract_address>`.
3. Called contract functions like `getInterestRate()` and `setInterestRate()`. Verified the ability to set and retrieve the interest rate.
4. Planned to restrict function access to specific ERC20 token holders. Reviewed the ERC20 specification and chose to inherit OpenZeppelin's ERC20 implementation.
5. Minted tokens to individual accounts and confirmed that the total supply matches the sum of minted amounts.
6. Investigated Anvil private keys, found they aren't consecutive (via keccak256 or sha256), and implemented `voteForInterestRate(uint256)`, which accepts votes only from GOV token holders.
7. Modified the `GovToken` constructor to accept a memory array of holder addresses, passed from the `run()` function in the script contract.
8. Faced issues sorting contract addresses for testing but skipped tests temporarily to test deployments locally on Anvil.
9. Resolved testing issues and successfully deployed contracts with tests running on a local Anvil instance.
10. Add a gatekeeper scanning for tokenholders! Already done - only tokenholders can vote! Now let's add the arithmetic to consider voting power when calculating the rate.

