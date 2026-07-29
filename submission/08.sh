# what block height was this tx mined ?
# 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb
MINED_TX=49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb
MINED_BLOCK=$(bitcoin-cli -signet getrawtransaction $MINED_TX 1 | jq -r ".blockhash")
bitcoin-cli -signet getblock $MINED_BLOCK | jq -r ".height"