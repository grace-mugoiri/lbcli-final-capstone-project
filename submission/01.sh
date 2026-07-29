# What is the hash of block 243,833?
BLOCK_HEIGHT=243833
BLOCK_HASH=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 getblockhash $BLOCK_HEIGHT)
printf '%s' "$BLOCK_HASH"