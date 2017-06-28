# host-cli
a cli to modify host file on osx

这个库定义了一个zhost cli,该cli可以展示、修改osx系统下的host文件（/etc/hosts）。以此来学习如何开发基于node 的cli。

## zhost

展示目前的hosts配置

zhost add ip host -m “comment”

在host文件首行插入ip host的绑定, 后面会加上注释“comment”，并输出修改后的host文件内容 
zhost add 127.0.0.0 localhost -m "本地host" 
输出127.0.0.0 localhost # 本地host

## zhost use <linenumber...>:

有时需要使用被注释掉的host绑定

zhost use 2 3 22 11 
这样会去掉第2，3，22，11行的行首的第一个‘#’ ，并输出修改后的host文件内容

## zhost un <linenumber...>

不需要用某个host绑定的时候就给这些行加上注释

zhost un 2 5 8 
这样会给第2，5，8行的开头加上‘#’，并输出修改后的host文件内容

## zhost del <linenumber...>

删除指定的行 
zhost del 1 2 3 10 33 
删除第1 2 3 10 33行，并输出修改后的host文件内容

## 备份

以上所有的修改操作，都会将修改前的文件存放到/etc/hosts.bac文件中
