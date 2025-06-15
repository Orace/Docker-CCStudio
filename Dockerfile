# Use official Ubuntu as base
FROM ubuntu:latest

# Install clang-format, git, and other useful tools
RUN apt-get update && \
    apt-get install -y \
        clang-format \
        git \
        unzip \
        wget \
        curl \
        ca-certificates && \
    apt-get clean

RUN mkdir -p /tmp/ccs
RUN cd /tmp/ccs
RUN wget https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-J1VdearkvK/20.2.0/CCS_20.2.0.00012_linux.zip
RUN unzip CCS_20.2.0.00012_linux.zip
RUN cd CCS_20.2.0.00012_linux
RUN ccs_setup_20.2.0.00012.run --prefix /opt/ti --mode unattended --enable-components PF_C28
RUN cd /
RUN rm -rf /tmp/ccs

# Add CCS to PATH (optional)
ENV PATH="/opt/ti/ccs/eclipse:${PATH}"

# Default command
CMD ["/bin/bash"]
