FROM ubuntu:24.04@sha256:3afff29dffbc200d202546dc6c4f614edc3b109691e7ab4aa23d02b42ba86790 AS build

# Install necessary packages
RUN apt-get update
RUN apt-get install -y \
        build-essential \
        g++ \
        wget \
        z3 \
        unzip \
        libgmp-dev \
        libffi-dev \
        git

# Install Haskell stack
RUN wget -qO- https://get.haskellstack.org/ | sh

# Download and extract artifact, remove unneeded stuff
RUN wget -q -O artifact.zip https://zenodo.org/records/10939871/files/artifact.zip?download=1 
RUN unzip artifact.zip && rm artifact.zip && rm rpg-stela-docker.tar && rm .dockerignore && rm -rf muval && rm -rf pestel

# Build rpgsolve
RUN cd rpgsolve && make && cd ../
RUN cp rpgsolve/builds/rpgsolve /bin && rm -rf rpgsolve && rm -rf .stack

#
# Create running version for less memory usage
#
FROM ubuntu:24.04@sha256:3afff29dffbc200d202546dc6c4f614edc3b109691e7ab4aa23d02b42ba86790

RUN apt-get update
RUN apt-get install -y \
        build-essential \
        z3 \
        libgmp-dev \
        libffi-dev 

WORKDIR /
COPY --from=build /bin/rpgsolve /bin/rpgsolve

