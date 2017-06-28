#!/bin/zsh

host=$2
ip=$1
hostFile='/etc/hosts'

if [ ! -n $host -o ! -n $ip ]
then
  exit 2
fi

sudo sed -i "" "
  1i\\
  $ip $host
  " $hostFile;

cat -n $hostFile;
