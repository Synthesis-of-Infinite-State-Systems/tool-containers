FROM ubuntu:22.04@sha256:33d782143e3a76315de8570db1673fda6d5b17c854190b74e9e890d8e95c85cf

WORKDIR /

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    g++ \
    wget \
    unzip \
    libblas-dev \
    liblapack-dev \
    libmpfr-dev \
    libgmp-dev \
    libglpk-dev \
    libffi-dev \
    bc \
    opam \
    pkg-config \
    python3-distutils

# Install z3 version 13.13.4
RUN wget -qO z3.zip https://github.com/Z3Prover/z3/releases/download/z3-4.13.4/z3-4.13.4-x64-glibc-2.35.zip && \
    unzip z3.zip && \
    cp z3-4.13.4-x64-glibc-2.35/bin/z3 /bin/z3 && \
    rm -rf z3-4.13.4-x64-glibc-2.35 && \
    rm z3.zip

# Install Haskell stack
RUN wget -qO- https://get.haskellstack.org/ | sh

# Download and extract artifact
RUN wget -qO artifact.zip https://zenodo.org/records/13939202/files/popl25-artifact-21.zip?download=1 && \
    unzip artifact.zip && rm artifact.zip && rm artifact.ova && rm README.md && rm LICENSE-INFORMATION && \
    unzip artifact-content.zip && rm artifact-content.zip && rm -rf artifact-content/binaries/ 

# Install Opam
RUN opam init --disable-sandboxing
RUN opam switch create 5.0.0 
RUN opam install dune 

# Build Spot
WORKDIR /artifact-content/src-spot
RUN ./configure --prefix /usr --disable-python && make && make install

# Build tslmt2rpg 
WORKDIR /artifact-content/src-tslmt2rpg
RUN make && cp builds/tslmt2rpg /bin && cp builds/rpgsolve /bin

# Build MuVal
WORKDIR /artifact-content/src-muval
RUN eval $(opam env) && opam install . --deps-only  --confirm-level=yes
RUN eval $(opam env) && dune build main.exe
WORKDIR /
RUN mkdir muval && \
    cp /artifact-content/src-muval/_build/default/main.exe /muval/muval && \
    cp -r /artifact-content/src-muval/config /muval
COPY ./call-muval.sh /muval/call-muval.sh
RUN chmod +x /muval/call-muval.sh 

# Cleanup and add wrapper
RUN rm -rf /artifact-content
COPY ./wrapper.sh /wrapper.sh
RUN chmod +x /wrapper.sh

