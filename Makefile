RPC_URL := http://127.0.0.1:8545
RPC_URL_SEPOLIA := TODO:add it
ACCOUNT := anvil
SCRIPT  := script/GovernanceToken.s.sol

# ----------- forging ----------
deploy:
	forge script $(SCRIPT) --broadcast --rpc-url $(RPC_URL) --account $(ACCOUNT)

# ----------- casting ----------
TOTAL_SUPPLY_FUNCTION_SIG := "totalSupply()(uint256)"
check_supply:
	cast call $(GOV_TOKEN) $(TOTAL_SUPPLY_FUNCTION_SIG)


