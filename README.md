# MongoDB Docker Image

This Docker Image runs MongoDB in CentOS 8 and exposes the following ports...

* 27017 - mongod port

# Build and run the Docker image


```bash
docker build -t mongodb .
docker volume create mongo
docker run -tid --mount source=mongo,target=/var/lib/mongo --rm -p 27017:27017 --name mongodb mongodb
docker container ls
```

# Verify ports are open on host

* MacOS

```bash
netstat -anp tcp | grep LISTEN
```

* Linux

```bash
netstat -tulpn | grep LISTEN
```

# Access the MongoDB instance from the host

```bash
mongo
```
The instance is setup with a replset flag so you probably want to....

```
mongo> rs.initiate();
```

# Delete the container volumes

```bash
docker volume rm mongo
```

# TODO

* Add auth?
