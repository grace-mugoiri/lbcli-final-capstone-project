# what is the coinbase tx in this block 243,834
BLOCK_HEIGHT=243834
BLOCK_HASH=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblockhash $BLOCK_HEIGHT)
bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblock $BLOCK_HASH 2 | jq -r ".tx[0].txid"