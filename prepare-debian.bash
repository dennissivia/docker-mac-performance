#!/bin/bash

apt update -y; apt upgrade -y; apt install wget lsb-utils gnupg2 git software-properties-common make docker.io
wget https://github.com/sharkdp/hyperfine/releases/download/v1.10.0/hyperfine_1.10.0_amd64.deb && dpkg -i hyperfine_1.10.0_amd64.deb
