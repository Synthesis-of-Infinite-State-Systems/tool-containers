FROM ubuntu:24.04@sha256:3afff29dffbc200d202546dc6c4f614edc3b109691e7ab4aa23d02b42ba86790

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    g++ \
    wget \
    z3 \
    libblas-dev \
    liblapack-dev \
    libmpfr-dev \
    libgmp-dev \
    libglpk-dev \
    libffi-dev \
    bc \
    opam \
    pkg-config

RUN opam init --disable-sandboxing
RUN opam switch create 5.2.0 
RUN opam install dune 

RUN git clone https://github.com/hiroshi-unno/coar.git coar
WORKDIR coar
RUN git checkout 1d49999975b00f1430b3c9d10b90ab00b561e836 

RUN eval $(opam env) && opam install . --deps-only  --confirm-level=yes
RUN eval $(opam env) && dune build main.exe

COPY wrapper.sh wrapper.sh
RUN chmod +x wrapper.sh
