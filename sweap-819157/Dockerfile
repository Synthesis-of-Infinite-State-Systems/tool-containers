FROM ubuntu:22.04@sha256:33d782143e3a76315de8570db1673fda6d5b17c854190b74e9e890d8e95c85cf

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    wget \
    unzip \
    build-essential \
    python3 \
    python3-pip \
    openjdk-17-jre-headless \
    libgmp-dev \
    python3-dotenv \
    python3-sympy \
    swig \
    m4 \
    openjdk-17-jdk-headless

# Install nuXmv
RUN wget -qO nuXmv.tar.gz https://nuxmv.fbk.eu/theme/download.php?file=nuXmv-2.0.0-linux64.tar.gz && \
    tar xf nuXmv.tar.gz && \
    cp ./nuXmv-2.0.0-Linux/bin/nuXmv /usr/bin/nuxmv && \
    rm -r ./nuXmv-2.0.0-Linux && \
    rm nuXmv.tar.gz

# Install mathsat5j shared library for msat
RUN mkdir build-mathsat && cd build-mathsat && \
    wget -qO mathsat.tar.gz https://mathsat.fbk.eu/download.php?file=mathsat-5.6.11-linux-x86_64.tar.gz && \
    tar xf mathsat.tar.gz && \ 
    wget -qO java-smt.zip https://github.com/sosy-lab/java-smt/archive/693da11aa464881e50a39448f8cd3b8f16462cdd.zip && \
    unzip java-smt.zip && \
    wget -qO gmp.tar.xz https://gmplib.org/download/gmp/gmp-6.3.0.tar.xz && \
    tar xf gmp.tar.xz && \
    cd gmp-6.3.0 && \
    ./configure --enable-cxx --with-pic --disable-shared --enable-fat && make && \
    cd ../java-smt-693da11aa464881e50a39448f8cd3b8f16462cdd/lib/native/source/libmathsat5j && \
    ./compile.sh ../../../../../mathsat-5.6.11-linux-x86_64 ../../../../../gmp-6.3.0 && \
    cp libmathsat5j.so /usr/lib && \
    cd ../../../../../../ && \
    rm -rf build-mathsat 

# Get sweap and remove unnecessary stuff
RUN wget -qO sweap.zip https://github.com/shaunazzopardi/sweap/archive/819157c406006cbcfcfb75e4735edb78ee57b175.zip && \
    unzip sweap.zip && \
    rm sweap.zip && \
    mv sweap-819157c406006cbcfcfb75e4735edb78ee57b175 sweap && \
    cd sweap && \
    rm paper.pdf binaries/coar binaries/rpg* binaries/pestel binaries/muval binaries/temos* && \
    rm -r benchmarks doc tests binaries/config binaries/opt && \
    cd ..

# Setup sweap
WORKDIR sweap
RUN chmod -R +x ./binaries && \
    pip3 install -r requirements.txt && \
    pysmt-install --confirm-agreement --msat && \
    pysmt-install --confirm-agreement --z3 && \
    pysmt-install --confirm-agreement --bdd

# Add wrapper
COPY ./wrapper.sh ./wrapper.sh
RUN chmod +x wrapper.sh
