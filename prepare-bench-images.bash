#!/bin/bash

docker build --tag ruby-bench:ruby-2.5.5 -f Dockerfile255 .
docker build --tag ruby-bench:ruby-2.6.3 -f Dockerfile263 .
docker build --tag ruby-bench:ruby-debian -f Dockerfile-Debian .
docker build --tag ruby-bench:ruby-2.5.5-compiled -f Dockerfile-ruby255-compiled .
