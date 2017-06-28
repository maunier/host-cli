#!/bin/zsh

ip=$1
host=$2
comment=$3
hostFile='/etc/hosts'

if [ "$host" = 'undefined' -o "$ip" = 'undefined' ]; then
  echo need ip and host
  exit 2
fi

addStr="$ip $host"
if [ "$comment" != 'undefined' ]; then
  echo 111
  addStr="$addStr# $comment"
fi

# $ip $host # $comment
sudo sed -i '.bac' "
  1i\\
  $addStr
  " $hostFile;

cat -n $hostFile;
