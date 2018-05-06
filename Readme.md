# How to start docker
To start the docker just run:

```
nohup docker run -p 127.0.0.1:443:443 gulden:node &
```

the command -p option will publish the nginx so you can interact with the node

Then you can communicate with the gulden node with the Gulden-cli or with HTTP requests like this below:

```
curl -k -i https://127.0.0.1 -u "santa:secret" -d '{"method":"help","params":[],"id":1}'
```

# Important to change the following
Be sure the change the RPC user and password in /guldenserver/datadir/Gulden.conf for security reasons

If the container is already running you can use the following commands:

```
docker exec <container id> printf "disablewallet=0 \nmaxconnections=20 \nrpcuser=<user> \nrpcpassword=***<password>***" > /guldenserver/datadir/Gulden.conf
curl -k -i https://127.0.0.1 -u "santa:secret" -d '{"method":"stop","params":[],"id":1}'
docker restart <container id>
```

# Why does the build take so long?

Because we generate new Diffie-Hellman parameters to mitigate CVE-2015-4000 (LOGJAM attack)