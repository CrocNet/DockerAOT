# tinyDotNet ARM AOT Builder

ARG SDK=9.0

FROM mcr.microsoft.com/dotnet/sdk:${SDK} AS builder

ENV SDK=${SDK}
ENV ARCH=arm64

ENV PROTOBUF_PROTOC=/usr/bin/protoc
ENV gRPC_PluginFullPath=/usr/bin/grpc_csharp_plugin


# Install necessary tools and the AArch64 cross-compiler
RUN apt update && apt install -y \
    gcc-aarch64-linux-gnu \
    g++-aarch64-linux-gnu \
    binutils-aarch64-linux-gnu \
    git protobuf-compiler libprotobuf-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /src

# Set environment variables for the AArch64 toolchain
ENV CC=aarch64-linux-gnu-gcc
ENV CXX=aarch64-linux-gnu-g++
ENV AR=aarch64-linux-gnu-ar
ENV LD=aarch64-linux-gnu-ld


COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

ENV DOTNET_CLI_HOME=/src

ENTRYPOINT ["/startup.sh"]