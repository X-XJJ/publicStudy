Linux相关 暂存

命令参数和选项在标题中不单独列出位置
参数选项不列全

-a = --all 短选项和长选项，-为连字符
-at 多个短选项如a和t串联使用，短选项顺序无要求

<Esc> 进入vi模式，可直接运行vi命令 如/word 查找缓冲区命令中出现的含word命令

expr

# shell相关
- shell是一个程序，接受键盘/输入的命令，传递给操作系统来执行
sh csh bash ksh等shell的区别与联系
[linux几种常见的Shell：sh、bash、csh、tcsh、ash](https://blog.csdn.net/whatday/article/details/78929247)

## 一些命令和使用？
命令种类：可执行程序、shell内置命令、shell函数、alias命令
date 时间日期;  cal 当月日历;  ntpdate立即同步时间，生产慎用 ntpd平滑同步，客户端与标准时间服务器同步 
tzselect 设置时区
hwclock 硬件时间相关
 -r = --show 显示当前硬件时间
 --set --date="2017-02-03 08:09:04" 设置当前硬件时间
 -s = --hctosys 同步硬件时间到系统时间
 -w = --systohc 同步系统时间到硬件时间

whereis
-b binary
-m manual
-s source

watch -n 2 ls

strings /lib64/libc.so.6 | grep GLIBC

mkfs -t ext4 /dev/sda5
mkfs.ext4 -O ^has_journal /dev/sda5
tune2fs -O has_journal /dev/sda5
tune2fs -O ^has_journal /dev/sda5

ulimit
```
core file size          (blocks, -c) 0
data seg size           (kbytes, -d) unlimited
scheduling priority             (-e) 0
file size               (blocks, -f) unlimited
pending signals                 (-i) 15400
max locked memory       (kbytes, -l) 64
max memory size         (kbytes, -m) unlimited
open files                      (-n) 1024
pipe size            (512 bytes, -p) 8
POSIX message queues     (bytes, -q) 819200
real-time priority              (-r) 0
stack size              (kbytes, -s) 8192
cpu time               (seconds, -t) unlimited
max user processes              (-u) 15400
virtual memory          (kbytes, -v) unlimited
file locks                      (-x) unlimited

S 设置软限制
H 设置硬限制
```

# 帮助型命令
- `type 命令名` 显示命令类型
- `which 命令名` 显示可执行程序的路径位置
- help 显示shell内置命令帮助文档; help 命令名 获得该命令帮助文档
 - 命令参数 --help
 - 版本参数 --version
- `man 命令名` 显示程序的分页手册页
 - `man 部分的序号 命令名` 查看手册文档的具体部分
 - 部分序号：1-用户命令，2-内核系统调用的程序接口，3-C库函数程序接口，4-特殊文件 如设备节点和驱动程序，5-文件格式，6-游戏和娱乐 如屏幕保护程序，7-其他杂项，8-系统管理命令
- apropos 显示合适的命令 显示手册页+该部分的内容
- whatis 显示命令的简要描述 关键字的手册页的名字+一行描述
- info 显示程序的info条目 超链接 树形结构
 - 可使用的控制阅读器命令
 - ? 显示命令帮助；PgUp或Backscape退格 上一页；PgDn或Spacebar 下一页；n 显示下一个节点next；p 显示上一个节点previous；u 显示当前节点的父节点up；Enter 进入超链接；q 退出；

# 当前屏快捷键
上下：选择之前输入过的命令
shift+上下：滚屏
Esc 进入缓存区 可用vim的/寻找命令


# 查看目录、文件
## 少的
- pwd 输出当前工作目录 print working directory;
- file 确定文件类型;

- cd 改变目录：
. 工作目录;  .. 工作目录的父目录;  若目标文件夹前无指定路径名，默认为./
~ 当前用户的宿主目录; ~username 跳到username主目录;  - 跳回先前工作目录;  无后缀 跳回用户主目录;

- less filename 浏览文本文件内容：
q 退出;  h 帮助;  
PgUp 后翻页PageUp;  PgDn 前翻页;  上箭头 向上一行;  下箭头 向下一行;
g = 1G 跳开头;  G 跳结尾;  /abc 查找字符串abc;  n 查找下一个abc;

## ls 查看目录内容
- --help 帮助文档
 - /folderPath 如/usr/a列出usr下a文件夹的内容;  
- -a = -all 列出包括隐藏文件的所有文件; &本级上级目录
- -A ？ 显示所有文件包括隐藏文件~本级上级目录
- -d = --directory 列出目录条目而不是内容信息，并且不取消对符号链接的引用;
- -l 以长格式显示结果;
  -dl 查看目录自己的详细信息，而不是内容;
- -L 显示链接所指的信息而非自己的信息
- -F = --classify 文件名拼接类型符号？加类型指示符，
 - / 目录名;   @ 链接;  * 程序;  = 套接;  | 管道
- -h = --human-readable 显示文件大小时，以KMGTPEZY为单位，人可读的方式显示而非字节数，如43M;
  -hl 长格式显示可读结果;
- -s 显示文件大小，以块为单位
- -S 按文件大小排序;
  -hlS 长格式大小排序且可读结果;
- -r = --reverse 倒序显示结果，通常为按字母降序;
- -R ？递归
- -X 按后缀排序
- -t 按修改时间排序;
- -c 显示change time
- -u 显示access time
- -i 显示文件系统节点号
 
常用 ls -lrt

### 长列表格式
项            |表示内容
--------------|----------------
"drwxr-xr-x"  |d  第一个字符，表示文件类型，d为目录;
              |rwx 第234个字符，表文件所有者的访问权限;
              |r-x 第567个字符，表文件所属组中成员的访问权限;
              |r-x 第8910个字符，表其他所有人的访问权限;
"2"           |文件硬链接数目;
"oracle-xue"  |文件所有者的用户名;
"oinstall"    |文件所属用户组的名称;
"4.0K"        |以可读显示的文件大小;
"Dec 16 21:49"|上次修改文件的日期时间
".skel"       |名称;
```
-rw------- 1 oracle-xue oinstall 4.7K Dec 18 05:16 .bash_history
drwx------ 2 oracle-xue oinstall 4.0K Dec 16 21:49 .gconf
drwxr-xr-x 2 oracle-xue oinstall 4.0K Dec 16 21:49 .skel
```
- r 读;  w 写;  x 执行execute;  - 无权限;
- 显示文件&文件夹的各种不同字段信息;



# 操作文件、目录？

## 通配符（依据字符模式选择文件名）
- * 匹配任意多个字符（包括0、1个）
 - eg：* 所有文件;  g* 以g开头的任一文件;  g*.txt g开头的txt文件;
- ? 匹配任一单个字符（不包括0个）
 - eg：ggg??? 以ggg开头，后有3个字符的任一文件
- [字符集] 匹配任意一个属于字符集中的字符; [!字符集] 不在字符集;
 - eg：[abc]* 以abc中的任意一个开头的任一文件
- [字符类] 匹配任意一个属于指定字符类中的字符; [!字符类] 不属于;
 - 字符类 `[:类名:]`
   - [:alnum:] 任意一个字母or数字
   - [:alpha:] 任意一个字母;  [:digit:] 任意一个数字
   - [:lower:] 任意一个小写字母;  [:upper:] 任意一个大写字母
 - eg：`*[![:digit:]]` 不以数字结尾的任一文件;
       `[[:lower:]123]*` 以小写字母或数字1、2、3中的任一一个开头的任一文件;

## cp mv
- cp 复制
 - cp item1 item2 将单个文件or目录item1复制到文件or目录item2中
 - cp item1 item2 item3 item... directory 将多个项目复制进一个目录中
 - 参数
   -a = --archive 复制文件和目录、所有属性
   -i = --interactive 覆盖前询问，缺省为默认直接覆盖
   -r = --recursive 递归赋值目录、内容
   -u = --update 文件从目录1到目录2的复制，只会复制不存在or有变化的文件
   -v = --verbose 复制文件时显示信息性消息
 
- mv 移动（剪切）、重命名
mv item1 item2 将文件or目录item1移动or重命名为item2
mv item1 item2 ... directory 将多个item移动到directory目录下
参数：
 -i 覆盖前询问
 -u 只移动目标目录中不存在的or更新的
 -v 移动文件时显示信息性消息

- rm 删除
rm item ...
参数：
 -i 删除前询问，缺省默认直接删除？
 -r 递归删除目录
 -f = --force 忽略不存在的文件，直接删除
 -v 显示信息性消息
 ？？不可恢复的删除，慎用

- ln 创建硬链接、符号链接（软连接）
    ln file link 创建硬链接
    ln -s item link 创建软连接，item=文件or目录
 - 硬链接：直接指向自身文件系统内的引用文件，不能用于目录
 - 软连接：特殊类型的文件，该文件包含指向引用文件or目录的文本指针（≈快捷方式），显示中含有"->"

mkdir 目录1 [目录2 ...] 创建目录
iconv 改文件编码

# 重定向
## 相关概念
- 标准输入：默认为键盘
- 标准输出：程序运行结果、生成数据，默认链接到屏幕
- 标准错误：程序运行状态、错误信息，默认链接到屏幕
- 文件描述符：shell内部索引，以上分别为输入-0 输出-1 错误-2

## 标准输出、错误重定向
- `执行的命令 重定向符 文件名`
- `>` 标准输出重定向到文件中，不显示于屏幕
 - ls -a /usr/app/ > ls-test.txt 将命令执行结果输出到文件ls-test.txt中
 - > test.txt 删除test.txt的内容，或创建一个空文件test.txt
- `>>` 标准输出重定向**追加**到文件尾部，若无文件则创建
- `2>` 标准错误重定向，使用描述符编号
- `&>` = `命令 > 文件1 2>&1` 标准输出、错误重定向到同一个文件
 - >和2>&1 顺序不可变，错误必在输出后，先把输出定到文件1，再把错误定到文件1

## 标准输入
- cat 显示文件，即读取一个or多个文件，并复制到标准输出中

管道，过滤器

- sort 文本行排序
 -f 忽略大小写
 -b 忽略行首空格
 -M 按月份排序
 -r 反向排序
 -u 去除重复行
 -t 指定分隔符
 -k 按某列排序

- uniq 报告or省略文件中的重复行
 -i 忽略大小写
 -c 统计重复行数
 -d 显示重复行数
 -u 仅显示不重复的行


wc 打印文件中换行符、字、字节的个数
grep 打印匹配行
head 输出文件的第一部分内容
tail 输出文件的最后一部分内容

# 文本处理--切割
cat 连接文件并打印到标准输出


cut 从每一行中移除文本区域
-d 指定分隔符
-f 显示某列


paste 合并文件文本行

join 基于某个共享字段来联合两个文件的文本行

comm 逐行比较两个已排序文件
diff 逐行比较文件
patch 对原文件打补丁
tr 转换or删除字符
sed 用于过滤&转换文本的流编辑器
aspell 交互式拼写检查器

# 格式化输出--文本打印到屏幕
nl 对行进行标号
fold 设定文本行长度
fmt 简单的文本格式化工具
pr 格式化打印文本
printf 格式化并打印数据
groff 文档格式化系统


# 扩展和引用
使用echo为示例，echo 将文本参数内容打印到标准输出;
字符序列在被shell执行前，将被扩展为能扩展成的其他内容;
## 扩展
通配符，波浪线，算术，花括号{}，参数，命令替换
## 引用
双引号，单引号，转义字符


clear 清屏
history 查看历史列表的记录

# 权限
## 系统安全
- 所有者，组成员，其他所有用户
  一个用户可拥有
- 文件类型 d l c b -
  d 目录;  - 普通文件;  l 软连接;  c 字符设备文件;  b 块设备文件;
权限属性 r w x
此三权限可用八进制数字表示，r=4，w=2，x=1;
    eg：-rw-r--r--即644，rw-=6，r--=4;
其实首先是使用二进制表示文件模式，再将对应二进制表示为八进制，
八进制|二进制|文件模式
------|------|--------
0|000|---
1|001|--x 
2|-10|-w-

## 权限相关
- id 显示用户身份标识
 - -g = --group 用户所属群组的ID;
 - -G = --groups 用户所属附属群组的ID;
 - 输出含义：
   uid 用户ID，与用户名一一映射;
   gid 有效组ID即用户所属群组的ID，用户同时也可归属于其他组;
   groups 用户所属附加群组的ID;

- chmod 更改文件模式
 - -R

linux 下执行.sh文件总是提示permission denied
如果你是root登陆的话（不是的话，切换到root用户，对*.sh赋可执行的权限） 
`chmod 777 *.sh`   or   `chmod +x  *.sh`，然后运行就OK了

- chown 更改文件所有者

- chgrp 更改文件所属群组

umask 设置文件默认权限

passwd 修改用户密码

- su 以另一个用户身份运行shell
`su [usrname]`: 只切换用户身份，shell环境仍为原用户的，环境变量不切换
`su - [usrname]`: 连用户和shell一起切换，环境变量也切换

sudo 以另一个用户身份执行命令


# 进程
- ps 显示当前所有进程的运行情况
 -e
 -f
 -L
```
RSS 常驻内存集
VSZ 虚拟内存集

STAT
R 运行
S 睡眠(可以中断)
D 睡眠(不可中断)
T 停止
Z 僵死

+ 前台
| 线程
N 低优先级
< 高优先级
s 领导

-e 显示全部进程
-t 终端
-o 项目
	pid
	ppid
	tty
	state
	args
	wchan 睡眠等待条件
		wait_for_connect:accept/connect
		tcp_data_wait:read/write socket
		read_chan:read/write terminal
	time
	comm
```

- top 实时显示当前所有任务的资源占用情况
-l 开启或关闭第一部分第一行
-t 开启或关闭第一部分第二行和第三行
-m 开启或关闭第一部分第四行和第五行
-M 排序按:内存使用
-P 排序按:CPU使用
-T 排序按:运行时间
-c 显示完整命令
-s 更新刷新时间

jobs 列出所有活动作业的状态信息
bg 设置在后台中运行作业
fg 设置在前台中运行作业
kill 发送信号给某个进程
killall 杀死指定名字的进程

- shutdown 关机or重启
-r 重启
-h 关机
-r +10 10秒后重启
-h +10 10秒后关机
-r HH:MM 指定时分重启
-c 取消计划


# 环境
环境变量，启动文件，
printenv 打印部分or全部环境信息
set 设置shell选项
export 将环境导出到随后要运行的程序中
alias 为命令创建一个别名

source filepath/name <==> . filepath/name，使当前shell读入路径为filepath的shell文件并依次执行文件中的所有语句，通常用于重新执行刚修改的初始化文件，使之立即生效，而不必注销并重新登录

echo $SP1 输出PS1的值，PS1即提示符的环境变量

# 软件包管理
Debian的.deb技术：Debian，Ubuntu，Xandros，Linspire ...
Red Hat的.rpm技术：CentOS，Fedora，Red Hat，openSUSE ...

.deb类工具：低级dpkg，高级apt-get、aptitude
.rpm类工具：低级rpm，高级yum
-l 显示软件包中的文件列表
-c 显示配置文件列表
-ql 包名 查看具体安装路径

Directory |Contents of Directory
----------|---------------------
/etc |一些配置文件的目录，例如/etc/init.d/mysql
/usr/bin |一些可执行文件
/usr/lib |一些程序使用的动态函数库
/usr/share/doc |一些基本的软件使用手册与帮助文档
/usr/share/man |一些man page文件

查找
安装
删除
更新
判断安装
列出已装列表
显示已装软件包信息
查看某文件安装的来源软件包

安装软件 
zypper install

rpm RPM软件包管理器 


# 存储介质
- mount 挂载文件系统;  unmount 卸载文件系统

fdisk 硬盘分区命令;
fsck  检查修复文件系统
mkf   创建文件系统
fdformat 格式化软盘
dd 向设备直接写入面向块数据
md5sum 计算MD5校验码
genisoimage（mkisofs） 创建一个ISO 9600映像文件
wodim（cdrecord） 向光存储介质写入数据

df 磁盘驱动器;  free 可用内存;

磁盘、分区、挂载等相关内容，LVM与非LVM

linux下查看磁盘分区的文件系统格式 https://www.cnblogs.com/youbiyoufang/p/7607174.html

# 网络
ip []
ifconfig
ping 向网络主机发送ICMP ECHO_REQUEST数据包
traceroute 显示数据包到网络主机的路由路径（Windows为tracert）

- netstat 显示网络连接、路由表、网络接口数据、伪连接、多点传送成员等信息
 - netstat -nape|grep 端口号
-a 显示所有(否则不显示LISTEN状态)
-l 仅显示LISTEN状态
-n 显示数字(否则显示别名)
-t 仅显示TCP套接字
-u 仅显示UDP套接字
-x 仅显示UNIX套接字
-p 显示进程信息
-e 显示扩展信息
-r 显示路由信息
-i 显示接口信息
-s 按协议统计
-c 持续显示
如：
tcp  0  0  192.168.100.61:11003  10.10.10.1:32849  ESTABLISHED 1000  3760904  25506/linker 


ftp 文件传输命令


lftp 改善后的文件传输命令
wget 非交互式网络下载器
ssh 远程系统登陆命令，OpenSSH版的ssh客户端
scp 远程复制文件，secure copy
sftp 安全的文件传输


## curl 
命令行综合传输工具工具，基于URL规则进行数据or文件的传输
支持HTTP HTTPS FTP等等众多协议
选项<参数>    |功能
--------------|----
-X <command>  |= --request 指定什么命令 如-X POST 
-d <data>     |HTTP POST方式传送数据 如-d "cat 1" 传送文件1输出的内容
-H <头部信息> |添加一个或多个HTTP头部信息 如-H "TD-Charset:utf-8" -H "33"


# 文件搜索
locate 通过文件名查找
find 在文件系统目录框架中查找

xargs 从标准输入中建立、执行命令行
touch 更改文件的日期时间
stat 显示文件or文件系统的状态

# 归档和备份，管理文件集合
gzip 压缩解压文件工具
bzip2 块排序文件压缩工具

## tar 磁带归档工具
- tar [-cxtzjvfpPN] 文件与目录 ...
- tar zcvf 打包后生成的文件名全路径.tar 要打包的目录
    `tar zcvf Z07-develop.tgz Z07/*`
- tar zxvf XXX.tar.gz  解压文件到当前
 -c ：打包create
 -x ：解包
 -t ：查看包里的文件
 -u ：更新包
 -v ：过程中显示进度过程
 -f ：制定文件？使用档名，f之后立即接档名，不要再加参数
 -z ：调用gzip，即同时具有gzip的压缩属性
 -j ：调用bzip2
 -r ：增加文件
 tvf 查看压缩包内文件列表

zip 打包和压缩文件

rsync 远程文件和目录的同步


# 编译程序
make 维护程序工具

## gcc C的编译器
 
gdb命令 zoe程序 core生成的文件
gdb zoe core  段错误查看
where

编译参数 gcc -g  ——与makefile文件内配置

ulimit -c

linker 链接器


# shell脚本
编写--脚本文件权限为允许执行--脚本放置位置最好在没指定路径时shell能自动发现的地方(如PATH环境变量中包含的目录)

"#!" 字符序列为特殊结构，名shebang，告知操作系统应使用哪个解释器执行该脚本;应该放在每个shell脚本的第一行;
  eg: #!/bin/bash 

- sh filepath 或 ./filepath
 - 建立新的子shell来执行脚本中的语句

- source filepath 或 ./filepath
 - 使当前shell读入路径为filepath 的shell文件并依次执行文件中的所有语句
 - 常用于重新执行刚修改的初始化文件，立即生效，如source /etc/profile

其他的估计暂时用不到，再看再看



-------------------------------

# 文件系统？
常用目录|内容         |备注
--------|-------------|----
/       |根目录       |/etc /bin /dev /lib /sbin应和根目录放在一个分区
/boot   |启动装载核心 |系统内核文件&引导装载程序文件 建议单独分区100M左右
        |./vmlinuz Linux内核文件；./grub/ 启动配置文件们
/bin    |可执行程序   |系统启动&运行必须的二进制文件 Linux基本操作命令
/sbin   |可执行命令   |系统管理相关 管理员有权 同理/usr/sbin usr/local/sbin
/etc    |系统配置文件 |主机、系统、网络等等的系统层面配置文件
/lib    |系统重要库   |类似Windows的dll 同理/usr/lib，/usr/local/lib
/dev    |设备目录     |虚拟文件系统 存放所有能识别的设备对应的信息文件
/media  |媒体挂载点   |可移除媒体设备 自动挂载 如USB CD-ROM等
/mnt    |临时挂载点   |文件系统/可移除设备挂载 可手动挂载 
/opt    |主机额外软件 |在主机安装其他可选的软件
/var    |变化的文件   |系统执行过程中经常变化的 如日志、邮件、各种数据库等
/srv    |数据目录     |若Linux作为服务器 在服务启动后访问的数据目录
/tmp    |临时文件     |重启清空
/proc   |虚拟文件系统 |内存中建立的虚拟目录 提供系统实时信息
/home   |用户主目录   |非root用户的宿主目录
        |./用户名/    |默认宿主用户有创建文件权限 目录下含用户独有配置 
/root   |root主目录   |
/usr    |应用程序     |普通用户使用的所有程序和相关文件
        |./share/doc 程序说明文件 ./local 系统本地使用的程序的安装目录
/lost+found |系统恢复分区 |系统崩溃后自动修复救回的文件存放地
...     |...

具体配置等见linuxConfig.md

Linux   只有一个文件系统树（Windows 每个存储设备都有一个独立的系统树）
每个用户账号有一个主目录，唯一允许该普通账号写文件？--授权啥的怎么算？

[Linux目录详解](https://www.cnblogs.com/itcui/p/5632311.html)
[Linux目录结构及详细介绍](https://blog.csdn.net/m0_38044196/article/details/72844025)

/dev/shm文件夹 [/dev/shm（转）](https://www.cnblogs.com/softidea/p/5196858.html)

runlevel 查看系统当前运行级别

执行脚本 shell名称 脚本名？ bash a.sh

在linux中安装软件通常要用root身份，软件安装到/usr里，可以为系统的所有用户使用； 如果是用户自己安装自己的软件通常安放到/home/$user/..里，不会影响其它用户；

查找 find

[Linux软件安装，RPM与YUM](http://www.cnblogs.com/shijiaqi1066/p/3843955.html)

一、Linux 的五个重启命令
　　1、shutdown 　　2、poweroff 　　3、init 　　4、reboot 　　5、halt

# 拓展
[各种缩写的含义们](https://blog.csdn.net/u013258415/article/details/78852770)

# [用户和用户组](https://www.cnblogs.com/xd502djj/archive/2011/11/23/2260094.html)
Linux添加/删除用户和用户组
adduser phpq                             //新建phpq用户
passwd phpq                               //给phpq用户设置密码
groupadd test                          //新建test工作组

查看组 group
