# CheetSheet 用来帮助记忆一些常用的命令、技巧等


## Vim Operation
* Proj 
    * Project ~/.vimprj/${prjname}.vimprj 快捷键\cp \C来建立project文件
    * Proj $prj_name   add path & vim
    * add project.vim 内容主要是Project ~/.vimprj/${prjname}.vimprj
* SingleCompile
*,ss* for compile, *,sr* for run



## Bash Operation
* `man ascii` : 查看ASCII表
* `watch cmd` : 
* open $file 智能根据文件类型打开文件

## Screen

## Php

## Python

## Mysql
忘记密码怎么办
```
mysqld --skip-grant-tables;
use mysql;
update user set password=password("520") where user="root";`
flush privileges;
```