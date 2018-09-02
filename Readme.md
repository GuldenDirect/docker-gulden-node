# Prepare the docker container
You have to prepare the container before it is ready to get launched.

```
docker build -f Dockerfile -t gulden:node
```
# How to start docker
To start the docker just run:

```
docker run --name node1 -d -p 127.0.0.1:443:443 -v $(pwd)/Gulden.conf:/guldenserver/datadir/Gulden.conf gulden:node
```

the command -p option will publish the nginx so you can interact with the node

Then you can communicate with the gulden node with the Gulden-cli or with HTTP requests like this below:

```
curl -k -i https://127.0.0.1 -u "<username>:<password>" -d '{"method":"help","params":[],"id":1}'
```

# Why does the build take so long?
Because we generate new Diffie-Hellman parameters to mitigate CVE-2015-4000 (LOGJAM attack)