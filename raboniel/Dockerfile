FROM ubuntu:22.04@sha256:33d782143e3a76315de8570db1673fda6d5b17c854190b74e9e890d8e95c85cf

# Install necessary packages
RUN apt-get update
RUN apt update && apt install -y \
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

# Get artifact
RUN wget -q -O artifact.zip https://zenodo.org/records/7602503/files/artifact.zip?download=1
RUN unzip artifact.zip && rm artifact.zip


# Install z3 stuff
RUN apt-get install -y sudo libz3-dev
RUN cd artifact/opt/Z3 && chmod +x install.sh && ./install.sh && cd ../../../

# Build stack.yaml
RUN cd artifact/raboniel \
    && echo "resolver: lts-18.6" > stack.yaml \
    && echo "flags: {}"  >> stack.yaml \
    && echo "extra-deps:" >> stack.yaml \
    && echo " - z3-408.2@sha256:1f8b6ccbcc6d06a6701900a09fcfcbaf86ed8a8495615710bef4da5cdb073a3f,4226" >> stack.yaml \
    && cd ../../

RUN cd artifact/raboniel && stack build && cd ../../
RUN cd artifact/raboniel \
    && STACKPATH=$(stack path | grep local-install-root | sed 's/local-install-root: //') && cp $STACKPATH/bin/* ./ \
    && cd ../../

RUN cd artifact/opt/strix && sed -i 's/~\/opt/..\/opt/' strix_tlsf.sh && cd ../../

WORKDIR artifact/raboniel
COPY wrapper.sh wrapper.sh
RUN chmod +x wrapper.sh
