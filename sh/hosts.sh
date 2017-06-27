#!/bin/zsh

host=$1
ip=$2

sudo sed -i "" "
1i\\
$host $ip
" '/etc/hosts'