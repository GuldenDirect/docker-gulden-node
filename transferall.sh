#/bin/bash
SENDER=$1
RECEIVER=$2
BALANCE=$(docker exec -it $SENDER guldenserver/Gulden-cli -rpcuser=santa -rpcpassword=secret -rpcconnect=127.0.0.1 -rpcport=9231 getbalance | cut -f1 -d".")
NEWADRESS=$(docker exec -it $RECEIVER guldenserver/Gulden-cli -rpcuser=santa -rpcpassword=secret -rpcconnect=127.0.0.1 -rpcport=9231 getnewaddress test)
docker exec -it $SENDER guldenserver/Gulden-cli -rpcuser=santa -rpcpassword=secret -rpcconnect=127.0.0.1 -rpcport=9231 sendtoaddress $NEWADRESS $BALANCE "trxid" "GuldenDirect" true