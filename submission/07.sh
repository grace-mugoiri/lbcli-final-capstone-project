# what is the coinbase tx in this block 243,834
BLOCK_HEIGHT=243834
BLOCK_HASH=$(bitcoin-cli -signet getblockhash $BLOCK_HEIGHT)
bitcoin-cli -signet getblock $BLOCK_HASH 2 | jq -r ".tx | .[0]'