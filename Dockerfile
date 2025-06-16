# Use official Ubuntu as base
FROM ubuntu:latest

# Install clang-format, git, and other useful tools
RUN apt-get update && \
    apt-get install -y \
        clang-format \
        git \
        tar \
        wget \
        curl \
        ca-certificates && \
    apt-get clean

RUN mkdir -p /tmp/ccs && \
    cd /tmp/ccs && \
    wget -q https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-J1VdearkvK/12.8.1/CCS12.8.1.00005_web_linux-x64.tar.gz
    tar xfz CCS12.8.1.00005_web_linux-x64.tar.gz && \
    cd CCS12.8.1.00005_web_linux-x64 && \
    ./ccs_setup_12.8.1.00005.run --mode unattended --enable-components PF_MSP430,PF_MSP432,PF_CC2X,PF_CC3X,PF_CC2538,PF_C28,PF_TM4C,PF_PGA,PF_HERCULES,PF_SITARA,PF_SITARA_MCU,PF_OMAPL,PF_DAVINCI,PF_OMAP,PF_TDA_DRA,PF_C55,PF_C6000SC,PF_C66AK_KEYSTONE,PF_MMWAVE,PF_C64MC,PF_DIGITAL_POWER --install-BlackHawk false --install-Segger false && \
    cd / && \
    rm -rf /tmp/ccs

# Default command
CMD ["/bin/bash"]
