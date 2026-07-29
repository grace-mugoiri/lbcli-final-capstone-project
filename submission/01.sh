# What is the hash of block 243,833?
BLOCK_HEeIGHT=243833
BLOCK_HASH=$(bitcoin-cli -signet getblockhash $BLOCK_HEeIGHT)
printf '%s' "$BLOCK_HASH"