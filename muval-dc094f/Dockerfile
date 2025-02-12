FROM ubuntu:22.04@sha256:33d782143e3a76315de8570db1673fda6d5b17c854190b74e9e890d8e95c85cf

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
    pkg-config \
    python3-distutils

RUN opam init --disable-sandboxing
RUN opam switch create 5.0.0 
RUN opam install dune 

RUN git clone https://github.com/hiroshi-unno/coar.git coar

RUN cd coar && git checkout dc094f04ed4e27ee9edaf5fd5a2433e89440b8ab && cd ..
RUN cd coar && eval $(opam env) && opam install . --deps-only  --confirm-level=yes && cd ..

RUN sed -i 's/Z3enums.UNKNOWN_SORT/_/g' coar/lib/Z3Smt/z3interface.ml
RUN cd coar && eval $(opam env) && dune build main.exe && cd ..

WORKDIR coar
COPY wrapper.sh wrapper.sh
RUN chmod +x wrapper.sh
