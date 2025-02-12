FROM ubuntu:22.04@sha256:33d782143e3a76315de8570db1673fda6d5b17c854190b74e9e890d8e95c85cf

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
RUN unzip artifact.zip && rm artifact.zip && rm rpg-stela-docker.tar && rm .dockerignore && rm -rf muval 

# Build Pestel
RUN cd pestel && make && cd ../
RUN cp pestel/pestel /bin && rm -rf pestel

# Build rpg-stela
RUN cd rpg-stela && make && cd ../
RUN cp rpg-stela/builds/rpg-stela /bin && rm -rf rpg-stela && rm -rf .stack
