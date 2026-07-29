# How many new outputs were created by block 243,825?
BLOCK_HEIGHT=243825
BLOCK_HASH=$(bitcoin-cli -signet rpcuser=btrustbuildersrpc -rpcpassword=btrustbuildersrpcgetblockhash $BLOCK_HEIGHT)
bitcoin-cli -signet getblock $BLOCK_HASH | jq '.tx | map(.vout | length) | add'