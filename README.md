# Build Docker Image

```
docker build -t p4dev .
```

# Run docker image

```
docker run -it p4dev
```

# Run docker image and mount a host directory to the container

```
docker run -it -v /Users/bob/p4app:/p4app --cap-add=NET_ADMIN p4dev
```

# Open a new terminal to existing container

```
docker exec -i -t aad73f287512 /bin/bash
```

`aad73f287512` is the container-ID.
Run `docker ps` to find the container-ID