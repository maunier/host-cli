#!/bin/zsh

IFS=, # 定义了for循环时，字符串的分割方法
lines=$1 # [1, 3, 5 ...]
operationType=$2
hostFile='/etc/hosts'
delStr=''

# lines被解析成了字符串=> [1, 3]
# 如果不定义IFS变量，则line将会是lines变量的值，不会被分割
for line in ${lines[@]}
do
  if [ $operationType = use ]; then
    # fix maybe many whitespace and '#' at head of the line
    # example: 3    # # 123.23.4.2 www.a.b.c #comment
    # use zhost use 3 => 123.23.4.2 www.a.b.c #comment
    sudo sed -i '.bac' "${line}s/^[ *#]*//" $hostFile
  elif [ $operationType = un ]; then
    sudo sed -i '.bac' "${line}s/^/#/" $hostFile
  elif [ $operationType = del ]; then
    delStr="$delStr${line}d;"
  fi
done

if [ $operationType = del ]; then
  sudo sed -i '.bac' "$delStr" $hostFile
fi

cat -n $hostFile;