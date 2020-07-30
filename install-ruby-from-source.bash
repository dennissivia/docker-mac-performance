
apt remove -y clang ruby gcc

apt install -y wget software-properties-common make lsb-release gnupg2
bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

apt update -y
apt upgrade -y

apt install -y clang-10

wget https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.5.tar.gz
tar -xvf ruby-2.5.5.tar.gz
cd ruby-2.5.5 && CC=/usr/bin/clang-10 ./configure && make install
