#!/bin/zsh

lines=$1
hostFile='/etc/hosts'

for line in ${lines[@]}
do
  sudo sed -i '' "${line}s/^#/ /" $hostFile
done

cat -n $hostFile;