#!/bin/zsh

IFS=,
content=$1
hostFile='/etc/hosts'

for param in ${content[@]}
do
  addStr="$addStr $param"
done

sudo sed -i '.bac' "
  \$a\\
  $addStr
  " $hostFile;

cat -n $hostFile;
