# Inf8500TP2Container

Contains the `Dockerfile` that sets up a container that is able to run the TP2 of INF8500.

## How to use

### 1) Install Docker

You need to be on a Linux system to start a Linux container, so install Docker on a Linux (e.g. Ubuntu) VM if you aren't on a Linux system.

Follow [these instructions](https://docs.docker.com/install/) to install Docker on your Linux system.

### 2) Get the docker image

You can either make the image

```bash
# Important: you must be in the directory that contains the "tp2-files-original" directory, otherwise the COPY step of the creation of the image will fail.
cd /into/this/repo

# Create the image (takes around 15 minutes).
docker build -t inf8500-crave-fc4sc .
```

### 3) Start the container

The last command, `docker run`, will show a long ID that looks like: `f628502752d0bc7b3ee8d940cf41c9b41d5a79b0fd5310764753769b22f8f3cd`. This is the ID of the container. We will need this ID to be able to get into the container to compile and execute the code of TP2.

```bash
# Create a directory that in which the files of the TP2 will be put on the host system.
dir=~/Desktop # Or any directory you want
mkdir "${dir}"
docker run -t -d --mount type=bind,source="${dir}",target=/root/Git/INF8500-TP2 anthonyd973/inf8500-crave-fc4sc
```

### 4) Get into the container

```bash
containerId=<THE ID THAT WAS PRINTED IN THE LAST STEP>
docker exec -it "${containerId}" /bin/bash
```

### 5) Exiting the container

Either type `exit` or hit `CTRL+D` on an empty line.
