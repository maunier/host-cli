#!/bin/zsh

lines=$1
isUse=$2
hostFile='/etc/hosts'

for line in ${lines[@]}
do
  if [ $isUse = 'true' ]; then
    echo istrue:$isUse
    sudo sed -i '' "${line}s/^#//" $hostFile
  else
    echo isfalse:$isUse
    sudo sed -i '' "${line}s/^/#/" $hostFile
  fi
done

cat -n $hostFile;