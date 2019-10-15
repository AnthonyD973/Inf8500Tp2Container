FROM ubuntu:18.04

# Dockerfile argument: directory where the cloned git repos will be placed.
ARG GIT_REPOS_DEST_DIR

# Install packages
RUN mkdir -p /etc/bash_completion.d && apt-get update && apt-get install -y bash-completion && apt-get upgrade -y && apt-get install -y apt-file bzip2 libbz2-dev wget cmake make gzip perl git nano g++-7 g++-4.8 zip unzip zlib1g-dev htop && apt-file update

# Make 'g++' refer to the g++-4.8 executable, but keep g++-7 as an option in update-alternatives.
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 1 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 2 && echo 1 | update-alternatives --config g++

# Clone and build crave and FC4SC (nothing to build for FC4SC).
RUN mkdir -p "${GIT_REPOS_DEST_DIR}" && \
    cd "${GIT_REPOS_DEST_DIR}" && git clone --recurse-submodules https://github.com/agra-uni-bremen/crave && \
    cd crave && make -j8 && make install && \
    cd "${GIT_REPOS_DEST_DIR}" && git clone https://github.com/amiq-consulting/fc4sc
