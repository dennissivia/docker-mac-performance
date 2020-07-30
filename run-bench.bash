#!/bin/bash -l

PAUSE_TIME=30

echo "Starting docker run ruby-2.5.5"
docker run -it --rm  --mount type=tmpfs,destination=/tmp ruby-bench:ruby-2.5.5
sleep $PAUSE_TIME

echo "Starting docker run ruby-2.6.3"
docker run -it --rm  --mount type=tmpfs,destination=/tmp ruby-bench:ruby-2.6.3
sleep $PAUSE_TIME

echo "Starting docker run debian with installed ruby-2.5.5"
docker run -it --rm  --mount type=tmpfs,destination=/tmp ruby-bench:ruby-debian
sleep $PAUSE_TIME

echo "Starting docker run debian with compiled ruby-2.5.5 (clang)"
docker run -it --rm  --mount type=tmpfs,destination=/tmp ruby-bench:ruby-2.5.5-compiled
sleep $PAUSE_TIME

os=$( uname -s )
if [ "${os}" = "Linux" ]; then
echo "Linux: with manual compiled 2.5.5 (clang)"
  hyperfine --min-runs 10 --warmup 2 '/ruby -e "GC.disable; 300_000_000.times{1+1}"'
else
  rvm use 2.5.5
  echo "native with ruby 2.5.5 (RVM)"
  hyperfine --min-runs 10 --warmup 2 'ruby -e "GC.disable; 300_000_000.times{1+1}"'
  sleep $PAUSE_TIME

  echo "native with ruby 2.6.5 (RVM)"
  rvm use 2.6.5
  hyperfine --min-runs 10 --warmup 2 'ruby -e "GC.disable; 300_000_000.times{1+1}"'
  sleep $PAUSE_TIME

  echo "with manual compiled 2.5.5 (clang)"
  cd ~/dev/private/docker-mac-performance/ruby-src/ruby-2.5.5
  hyperfine --min-runs 10 --warmup 2 './ruby -I $PWD/lib -I $PWD -I $PWD/ext -I .ext/x86_64-darwin19 -e "GC.disable; 300_000_000.times{1+1}"'

  echo "done."
fi
