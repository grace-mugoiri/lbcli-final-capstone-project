# Which tx in block 216,351 spends the coinbase output of block 216,128?
PARENT_BLOCK=216128
PARENT_HASH=$(bitcoin-cli -signet getblockhash $PARENT_BLOCK)
BASE_TXID=$(bitcoin-cli -signet getblock $PARENT_HASH 2 | jq -r ".tx | .[0] | .txid")
CHILD_BLOCK=216351
CHILD_HASH=$(bitcoin-cli -signet getblockhash $CHILD_BLOCK)
bitcoin-cli -signet getblock $CHILD_HASH 2 | jq -r ".tx | .[] | select(.vin[0].txid == \"$BASE_TXID\") | .txid"
