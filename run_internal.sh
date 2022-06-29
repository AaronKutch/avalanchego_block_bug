
avalanchego \
    --genesis="/test_folder/ETHGenesis.json" \
    --build-dir="/avalanchego/build/" \
    --network-id=15 \
    --public-ip=127.0.0.1 \
    --http-port=8545 \
    --db-type=memdb \
    --staking-enabled=false &> /test_folder/avalanchego.log &

sleep 10

# check balances that the genesis file worked correctly
curl -s --header "content-type: application/json" --data "{\"id\":2,\"jsonrpc\":\"2.0\",\"method\":\"eth_getBalance\",\"params\":[\"0xBf660843528035a5A4921534E156a27e64B231fE\",\"latest\"]}" http://localhost:8545/ext/bc/C/rpc
curl -s --header "content-type: application/json" --data "{\"id\":4,\"jsonrpc\":\"2.0\",\"method\":\"eth_getBalance\",\"params\":[\"0xb3d82b1367D362DE99aB59A658165AFf520CBd4d\",\"latest\"]}" http://localhost:8545/ext/bc/C/rpc
curl -s --header "content-type: application/json" --data "{\"id\":7,\"jsonrpc\":\"2.0\",\"method\":\"eth_getTransactionCount\",\"params\":[\"0xBf660843528035a5A4921534E156a27e64B231fE\",\"latest\"]}" http://localhost:8545/ext/bc/C/rpc

# transaction for sending from the 0xBf... address to 0xb3...
curl -s --header "content-type: application/json" --data "{\"id\":8,\"jsonrpc\":\"2.0\",\"method\":\"eth_sendRawTransaction\",\"params\":[\"0xf872808506fc23ac00825dc094b3d82b1367d362de99ab59a658165aff520cbd4d8b084595161401484a00000080830150f4a03dedf66bb8140cbbdb10dae14f3016711683906bd0e98d538417c429c930149ea003d7802d60260fc12ba470dc4a578084bfbef62b9aa960ad9a96827471af9844\"]}" http://localhost:8545/ext/bc/C/rpc

sleep 20

# check for changes
curl -s --header "content-type: application/json" --data "{\"id\":2,\"jsonrpc\":\"2.0\",\"method\":\"eth_getBalance\",\"params\":[\"0xBf660843528035a5A4921534E156a27e64B231fE\",\"latest\"]}" http://localhost:8545/ext/bc/C/rpc
curl -s --header "content-type: application/json" --data "{\"id\":4,\"jsonrpc\":\"2.0\",\"method\":\"eth_getBalance\",\"params\":[\"0xb3d82b1367D362DE99aB59A658165AFf520CBd4d\",\"latest\"]}" http://localhost:8545/ext/bc/C/rpc
curl -s --header "content-type: application/json" --data "{\"id\":7,\"jsonrpc\":\"2.0\",\"method\":\"eth_getTransactionCount\",\"params\":[\"0xBf660843528035a5A4921534E156a27e64B231fE\",\"latest\"]}" http://localhost:8545/ext/bc/C/rpc

# blocks are not being produced, the avalanche logs also attest to this
curl -s --header "content-type: application/json" --data "{\"id\":15082,\"jsonrpc\":\"2.0\",\"method\":\"eth_blockNumber\",\"params\":[]}" http://localhost:8545/ext/bc/C/rpc
