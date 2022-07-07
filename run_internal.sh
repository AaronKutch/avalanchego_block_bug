
avalanchego \
    --genesis="/test_folder/ETHGenesis.json" \
    --network-id=15 \
    --build-dir="/avalanchego/build/" \
    --public-ip=127.0.0.1 \
    --http-port=8545 \
    --db-type=memdb \
    --staking-enabled=false &> /test_folder/avalanchego.log &

sleep 10

curl -s --header "content-type: application/json" --data "{\"id\":0,\"jsonrpc\":\"2.0\",\"method\":\"eth_gasPrice\",\"params\":[]}" http://localhost:8545/ext/bc/C/rpc

curl -s --header "content-type: application/json" --data "{\"id\":0,\"jsonrpc\":\"2.0\",\"method\":\"eth_sendRawTransaction\",\"params\":[\"0xf86480854abd174a00825dc094798d4ba9baf0064ec19eb4f0a1a45785ae9d6dfc018041a0c6431389b47c22e22c7fafacd2f387643be587f3f147b314f6c15fd287868350a0153e20d10c482f80fa35ff3f631864730e475a04c509c412ee18a04b99251500\"]}" http://localhost:8545/ext/bc/C/rpc

sleep 2

curl -s --header "content-type: application/json" --data "{\"id\":0,\"jsonrpc\":\"2.0\",\"method\":\"eth_gasPrice\",\"params\":[]}" http://localhost:8545/ext/bc/C/rpc

curl -s --header "content-type: application/json" --data "{\"id\":0,\"jsonrpc\":\"2.0\",\"method\":\"eth_sendRawTransaction\",\"params\":[\"0xf86401854abd174a00825dc094798d4ba9baf0064ec19eb4f0a1a45785ae9d6dfc018041a0b73c2e801dc4f48c5018290642acd88317191b85c033a2adf329260e9ee638faa055cc345bc16b1a7432b27eb33230af58a5611f8eaa2a9087bc02b0ee3deadcbd\"]}" http://localhost:8545/ext/bc/C/rpc

sleep 2

curl -s --header "content-type: application/json" --data "{\"id\":0,\"jsonrpc\":\"2.0\",\"method\":\"eth_gasPrice\",\"params\":[]}" http://localhost:8545/ext/bc/C/rpc

sleep 2

curl -s --header "content-type: application/json" --data "{\"id\":0,\"jsonrpc\":\"2.0\",\"method\":\"eth_sendRawTransaction\",\"params\":[\"0xf86402854abd174a00825dc094798d4ba9baf0064ec19eb4f0a1a45785ae9d6dfc018041a0061883a180026dc4aee6937bcc08a644bc6f3e64331c5ae97f7956432bdd4503a0722c121ed84074f86d854f67060abe69fadb2e2328bb3815b875a6ac9c09063e\"]}" http://localhost:8545/ext/bc/C/rpc

sleep 2

curl -s --header "content-type: application/json" --data "{\"id\":0,\"jsonrpc\":\"2.0\",\"method\":\"eth_gasPrice\",\"params\":[]}" http://localhost:8545/ext/bc/C/rpc
