#!/bin/bash

docker build --tag docker-bench-cpp:latest -f Dockerfile .

echo "running on host system"
g++ -O0 -o docker-bench docker-bench.cpp
hyperfine --min-runs 10 --warmup 2 ./docker-bench

docker run -it --rm docker-bench-cpp:latest
