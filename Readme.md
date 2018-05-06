# How to start docker
To start the docker just run:

docker run -p 443:443/tcp -it gulden:node

the command -p option will publish the nginx so you can interact with the node

Then you can communicate with the gulden node with HTTP requests like this below:

```
curl -i https://node-ip-or-fqdn -u "santa:secret" -d '{"method":"help","params":[],"id":1}'
```

# Important to change the following
Be sure the change the RPC user and password in /guldenserver/datadir/Gulden.conf for security reasons

#Why does the build take so long?

Because we generate new Diffie-Hellman parameters to mitigate CVE-2015-4000 (LOGJAM attack)