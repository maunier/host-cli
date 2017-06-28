#!/bin/zsh

lines=$1
operationType=$2
hostFile='/etc/hosts'

for line in ${lines[@]}
do
  if [ $operationType = use ]; then
    sudo sed -i '' "${line}s/^#//" $hostFile
  elif [ $operationType = un ]; then
    sudo sed -i '' "${line}s/^/#/" $hostFile
  elif [ $operationType = del ]; then
    sudo sed -i '' "${line}d" $hostFile
  fi
done

cat -n $hostFile;