# What is the hash of block 243,833?
BLOCK_HEIGHT=243833
BLOCK_HASH=$(bitcoin-cli -signet getblockhash $BLOCK_HEIGHT)
printf '%s' "$BLOCK_HASH"