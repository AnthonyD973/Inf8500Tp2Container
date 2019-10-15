# Inf8500TP2Container

Contains the `Dockerfile` that sets up a container that is able to run the TP2 of INF8500.

## How to use

### 1) Install Docker

You need to be on a Linux system to start a Linux container, so install Docker on a Linux (e.g. Ubuntu) VM if you aren't on a Linux system.

Follow [these instructions](https://docs.docker.com/install/) to install Docker on your Linux system.

### 2) Build the docker image and run the container

**Important**: The code of the TP2 will be inside a shared directory on your host machine. This allows you to modify the code with your usual editor (e.g., VSCode) on your host machine and then just run `make` inside the conatiner without having to copy the files from your host to the container every time you change it. You might want the code of the TP2 to be in a specific directory on your host (e.g., inside your team's Git repository). In that case, run: `export SHARED_DIR_HOST_LOCATION="<the directory>"` before running the `Inf8500Tp2Container` script.

To build and start the container (takes about 15 minutes to build), run:

```bash
./Inf8500Tp2Container
```

### Interacting with the container

#### Getting into a container

If everything happened correctly, the last line printed by the `Inf8500Tp2Container` script will be a rather long ID ; something like `78ef1ba64dc359faef3402bf9a8507fe367dc7f71096178c619a19bbb1202df5`. This is the running container's ID.

The code of the TP2 will be in `/root/Git/INF8500-TP2/work` inside the container. There also is an example crave/FC4SC project in `root/Git/INF8500-TP2/bruleurs`. Don't forget to execute the `systemC_setup` and/or the `my_path` and `my_setup` scripts before running `make`.

```bash
containerId="<THE CONTAINER'S ID>"
docker exec -it "${containerId}" /bin/bash
```

#### Leaving the container

Type `exit` to leave the container and return to your host.

#### Listing existing containers

```bash
docker container ls
```

#### Starting a container

Starts a container that is stopped.

```bash
docker container start "${containerId}"
```

#### Stopping a container

```bash
docker container stop "${containerId}"
```

#### Removing a stopped container

```bash
docker container rm "${containerId}"
```
