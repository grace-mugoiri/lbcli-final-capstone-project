# Which public key signed input 0 in this tx: d948454ceab1ad56982b11cf6f7157b91d3c6c5640e05c041cd17db6fff698f7
TX_ID=d948454ceab1ad56982b11cf6f7157b91d3c6c5640e05c041cd17db6fff698f7
RAW_TX=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getrawtransaction $TX_ID)
bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 decoderawtransaction $RAW_TX | jq -r '.vin[0].txinwitness[1]'