FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    gcc \
    curl \
    software-properties-common \
    tzdata \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN add-apt-repository -y ppa:brightbox/ruby-ng \
    && apt-get update \
    && apt-get install -y --no-install-recommends ruby2.6 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable
ENV PATH $PATH:$HOME/.cargo/bin
