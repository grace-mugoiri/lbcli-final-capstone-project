# How many new outputs were created by block 243,825?
BLOCK_HEIGHT=243825
BLOCK_HASH=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblockhash $BLOCK_HEIGHT)
bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblock $BLOCK_HASH | jq '.tx | map(.vout | length) | add'