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
    swig

# Get sweap and remove unecessary stuff
RUN wget -qO sweap.zip https://github.com/shaunazzopardi/sweap/archive/72d11859353022759d451fcecea0d5f7281a5c61.zip && \
    unzip sweap.zip && \
    rm sweap.zip && \
    mv sweap-72d11859353022759d451fcecea0d5f7281a5c61 sweap && \
    cd sweap && \
    rm paper.pdf && \
    rm -r benchmarks && \
    rm -r doc && \
    rm -r tests && \
    rm -r binaries/config && \
    rm -r binaries/opt && \
    rm binaries/coar && \
    rm binaries/rpg* && \
    rm binaries/pestel && \
    rm binaries/temos* && \
    cd ..

# Install nuXmv
RUN wget -qO nuXmv.tar.gz https://nuxmv.fbk.eu/theme/download.php?file=nuXmv-2.0.0-linux64.tar.gz && \
    tar xf nuXmv.tar.gz && \
    cp ./nuXmv-2.0.0-Linux/bin/nuXmv /usr/bin/nuxmv && \
    rm -r ./nuXmv-2.0.0-Linux && \
    rm nuXmv.tar.gz

# Setup sweap
WORKDIR sweap

RUN chmod -R +x ./binaries && \
    sed -i 's/pysmt-install/pysmt-install --confirm-agreement/' ./setup.sh && \
    chmod +x ./setup.sh && \
    ./setup.sh

# Install wrapper
COPY ./wrapper.sh ./wrapper.sh
RUN chmod +x wrapper.sh
