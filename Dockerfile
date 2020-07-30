FROM debian:buster

RUN apt update -y
RUN apt install -y wget g++ time
RUN wget https://github.com/sharkdp/hyperfine/releases/download/v1.10.0/hyperfine_1.10.0_amd64.deb && dpkg -i hyperfine_1.10.0_amd64.deb
ADD docker-bench.cpp .
RUN g++ -O0 -o docker-bench docker-bench.cpp

CMD hyperfine --min-runs 10 --warmup 2 ./docker-bench
