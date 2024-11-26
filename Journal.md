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
