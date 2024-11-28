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
1. I was able to send 1 ether with `cast send` from the anvil's first account to address 0, effectively burning the ether. So, now I can try to deploy the contract to anvil!
2. I deployed the contract and looked into its storage with `cast storage <contract_address>`
3. Now, let me call the individual functions of that contract. For instance `getInterestRate()` and `setInterestRate()`
4. Done that. I can set the rate with `setInterestRate()` and then retrieve/get the value by calling `getInterestRate()`
5. Now, I need to scan for token holders, so only allow access to the function call to those who hold this specific ERC20 token! Let's look into the specification of ERC20!
6. Either way, I will need OpenZeppelin's or Solmate's ERC20 implementation from which to inherit, right? Let's try to import one of those into the project!
7. I ended up using OpenZeppelin's ERC20. I was able to set the supply by minting to individual accounts, right? Let's check... Confirmed! The total supply adds up all the individually-minted amounts
8. Now, let's check if anvil private keys are consecutive and then let's create a function `voteForInterestRate(uint256)` that will accept an interest rate from an address only if the address is a GOV token holder! That's getting a bit more interesting. Seems like anvil keys are not consecutive if using keccak256 with +1 to the previous key! Actually let's check sha256 once again! No!
9. I diverted slightly and ended up modifying the GovToken's constructor to accept a memory array of holder addresses which are now passed from the script contract in the `run()` function.
10. Can't get the addresses of contracts properly sorted out to run tests. So skipping test for now. Will try to deploy and test locally on anvil in real time :)
11. 
