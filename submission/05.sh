# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
TXID="b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb"
RAW_TX=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getrawtransaction $TXID)

TOTAL_OUTPUTS_AMOUNT=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 decoderawtransaction $RAW_TX | jq -r ".vout | .[] | .value" | awk '{s+=$1} END {printf "%.0f\n", s*100000000}')

PREV_INPUT_TX=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 decoderawtransaction $RAW_TX | jq -r ".vin | .[0] | .txid")
PREV_INPUT_VOUT=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 decoderawtransaction $RAW_TX | jq -r ".vin | .[0] | .vout")
PREV_INPUT_RAW_TX=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getrawtransaction $PREV_INPUT_TX)
PREV_INPUT_AMOUNT=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 decoderawtransaction $PREV_INPUT_RAW_TX | jq -r ".vout[$PREV_INPUT_VOUT].value" | awk '{printf "%.0f\n", $1*100000000}')

echo $( echo "$PREV_INPUT_AMOUNT-$TOTAL_OUTPUTS_AMOUNT" | bc)