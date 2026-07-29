# Which public key signed input 0 in this tx: d948454ceab1ad56982b11cf6f7157b91d3c6c5640e05c041cd17db6fff698f7
TX=d948454ceab1ad56982b11cf6f7157b91d3c6c5640e05c041cd17db6fff698f7
RAW_TX=$(bitcoin-cli -signet getrawtransaction $TX)
bitcoin-cli -signet decoderawtransaction $RAW_TX | jq -r ".vin[0].scriptSig.asm" | awk '{print $2}'