# Only one tx in block 243,821 signals opt-in RBF. What is its txid?
BLOCK_HEIGHT=243821
BLOCK_HASH=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblockhash $BLOCK_HEIGHT)
bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblock $BLOCK_HASH 2 | jq -r '.tx |
    .[] | select(.vin | .[] | .sequence < 4294967294) | .txid'