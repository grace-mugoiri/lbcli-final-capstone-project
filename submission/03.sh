# Which tx in block 216,351 spends the coinbase output of block 216,128?
PARENT_BLOCK=216128
PARENT_HASH=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblockhash $PARENT_BLOCK)
COINBASE_TX=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblock $PARENT_HASH 2 | jq -r ".tx | .[0] | .txid")
CHILD_BLOCK=216351
CHILD_HASH=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblockhash $CHILD_BLOCK)
bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblock $CHILD_HASH 2 | jq -r --arg id "$COINBASE_TX" '.tx[] | select(any(.vin[]; .txid == $id)) | .txid'
