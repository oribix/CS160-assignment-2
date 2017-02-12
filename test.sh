#! /bin/bash

make || exit
mkdir -p results
rm -f ./results/*

echo -e Beginning Tests!\\n
test=""
for i in {1..16}
do
  
  if [ $i -lt 10 ]
  then
    test="test0$i"
  else
    test="test$i"
  fi
  echo ---------- $test ----------
  make $test >> results/$test && echo >> results/$test
  make r$test >> results/r$test && echo >> results/r$test
  diff results/$test results/r$test
  echo -e \\n
done
