Linux相关 暂存

命令参数和选项在标题中不单独列出位置
参数选项只列书上and常用的，其他有需再找

-a = --all 短选项和长选项，-为连字符
-at 两个短选项a和t串联使用，短选项顺序无要求

# suse
- suse真机环境中，在图形界面和文本界面间切换  
1. 图形界面切换到文本界面   
Ctrl+Alt+F(n) , 其中F(n)为F1-F6，为6个控制台；  
2. 文本界面切换到图形界面   
Ctrl+ALT+F7



# shell相关
- shell是一个程序，接受键盘输入的命令，传递给操作系统来执行
sh csh bash ksh等shell的区别与联系
[linux几种常见的Shell：sh、bash、csh、tcsh、ash](https://blog.csdn.net/whatday/article/details/78929247)

- 一些命令和使用？
命令种类：可执行程序、shell内置命令、shell函数、alias命令
date 时间日期;  cal 当月日历;  
type 显示命令类型
which 显示可执行程序的路径位置
help 显示shell内置命令帮助文档
命令参数 --help
版本参数 --version
man 显示程序的手册页
apropos 显示合适的命令
whatis 显示命令的简要描述
info 显示程序的info条目

上下：选择之前输入过的命令
shift+上下：滚屏


# 查看目录、文件
## 少的
pwd 输出当前工作目录 print working directory;
file filename 打印文件内容的简短说明;

cd 改变目录：
. 工作目录;  .. 工作目录的父目录;  若目标文件夹前无指定路径名，默认为./
~username 跳到username主目录;  - 跳回先前工作目录;  无后缀 跳回用户主目录;

less 浏览文本文件内容：
filename 打开;  q 退出;  h 帮助;  
PgUp 后翻页PageUp;  PgDn 前翻页;  上箭头 向上一行;  下箭头 向下一行;
g = 1G 跳开头;  G 跳结尾;  /abc 查找字符串abc;  n 查找下一个abc;

## ls 查看目录内容
--help 帮助文档
/folderPath 如/usr/a列出usr下a文件夹的内容;  
-a = -all 列出包括隐藏文件的所有文件;  
-d = --directory 列出目录条目而不是内容，并且不取消对符号链接的引用;
-l 以长格式显示结果;
  -dl 查看目录自己的详细信息，而不是内容;
-F = --classify 加类型指示符，/表该名字是目录名;
-h = --human-readable 显示文件大小时，以人可读的方式而非字节数;
  -hl 长格式显示可读结果;
-r = --reverse 以倒序显示结果，通常为按字母降序;
-S 按文件大小对结果排序;
  -hlS 长格式大小排序且可读结果;
-t 按修改时间排序;

## 长列表格式
显示文件&文件夹的各种不同字段信息;
r 读;  w 写;  x 执行execute;  - 无权限;
eg:
-rw------- 1 oracle-xue oinstall 4.7K Dec 18 05:16 .bash_history
drwx------ 2 oracle-xue oinstall 4.0K Dec 16 21:49 .gconf
drwxr-xr-x 2 oracle-xue oinstall 4.0K Dec 16 21:49 .skel
"drwxr-xr-x"   d  第一个字符，表示文件类型，d为目录;
               rwx 第234个字符，表文件所有者的访问权限;  
               r-x 第567个字符，表文件所属组中成员的访问权限;
               r-x 第8910个字符，表其他所有人的访问权限;
"2"            文件硬链接数目;
"oracle-xue"   文件所有者的用户名;
"oinstall"     文件所属用户组的名称;
"4.0K"         以可读显示的文件大小;
"Dec 16 21:49" 上次修改文件的日期时间
".skel"        名称;       


# 操作文件、目录？

## 通配符（依据字符模式选择文件名）
* 匹配任意多个字符（包括0、1个）
? 匹配任一单个字符（不包括0个）
[]

cp 复制
mv 移动、重命名
mkdir 创建目录
rm 移除
in 创建硬链接、符号链接（软连接）



# 重定向
">" 重定向符
标准输入、标准输出、标准错误
管道，过滤器

cat 合并文件
cat 查看文本输出

sort 文本行排序
uniq 报告or删除文件中的重复行
wc 打印文件中换行符、字、字节的个数
grep 打印匹配行
head 输出文件的第一部分内容
tail 输出文件的最后一部分内容

# 文本处理--切割
cat 连接文件并打印到标准输出
sort 文本行排序
uniq 报告并省略重复行
cut 从每一行中移除文本区域
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


# 
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

##
- id 显示用户身份标识
  参数：-g = --group 用户所属群组的ID;  -G = --groups 用户所属附属群组的ID;
  输出含义：uid 用户ID，与用户名一一映射;  gid 有效组ID即用户所属群组的ID，用户同时也可归属于其他组;  groups 用户所属附加群组的ID;
- chmod 更改文件模式
  参数：

chown 更改文件所有者
chgrp 更改文件所属群组
umask 设置文件默认权限
passwd 修改用户密码

su 以另一个用户身份运行shell
su 和 su - 的区别与联系
su [usrname]: 只切换用户身份，shell环境仍为原用户的，环境变量不切换
su - [usrname]: 连用户和shell一起切换，环境变量也切换

sudo 以另一个用户身份执行命令


# 进程
ps 显示当前所有进程的运行情况
top 实时显示当前所有任务的资源占用情况
jobs 列出所有活动作业的状态信息
bg 设置在后台中运行作业
fg 设置在前台中运行作业
kill 发送信号给某个进程
killall 杀死指定名字的进程
shutdown 关机or重启


# 环境
环境变量，启动文件，
printenv 打印部分or全部环境信息
set 设置shell选项
export 将环境导出到随后要运行的程序中
alias 为命令创建一个别名

source filepath/name = . filepath/name，使当前shell读入路径为filepath的shell文件并依次执行文件中的所有语句，通常用于重新执行刚修改的初始化文件，使之立即生效，而不必注销并重新登录

echo $SP1 输出PS1的值，PS1即提示符的环境变量

# 软件包管理
Debian的.deb技术：Debian，Ubuntu，Xandros，Linspire ...
Red Hat的.rpm技术：CentOS，Fedora，Red Hat，openSUSE ...

.deb类工具：低级dpkg，高级apt-get、aptitude
.rpm类工具：低级rpm，高级yum

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
mount 挂载文件系统;  unmount 卸载文件系统
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
ping 向网络主机发送ICMP ECHO_REQUEST数据包
traceroute 显示数据包到网络主机的路由路径（Windows为tracert）
netstat 显示网络连接、路由表、网络接口数据、伪连接、多点传送成员等信息
ftp 文件传输命令
lftp 改善后的文件传输命令
wget 非交互式网络下载器
ssh 远程系统登陆命令，OpenSSH版的ssh客户端
scp 远程复制文件，secure copy
sftp 安全的文件传输


# 文件搜索
locate 通过文件名查找
find 在文件系统目录框架中查找

xargs 从标准输入中建立、执行命令行
touch 更改文件的日期时间
stat 显示文件or文件系统的状态

# 归档和备份，管理文件集合
gzip 压缩解压文件工具
bzip2 块排序文件压缩工具

tar 磁带归档工具
zip 打包和压缩文件

rsync 远程文件和目录的同步



# 编译程序
make 维护程序工具

gcc C的编译器

linker 链接器


# shell脚本
编写--脚本文件权限为允许执行--脚本放置位置最好在没指定路径时shell能自动发现的地方(如PATH环境变量中包含的目录)

"#!" 字符序列为特殊结构，名shebang，告知操作系统应使用哪个解释器执行该脚本;应该放在每个shell脚本的第一行;
  eg: #!/bin/bash 

其他的估计暂时用不到，再看再看

      


-------------------------------

# 文件系统？
Linux   只有一个文件系统树（Windows 每个存储设备都有一个独立的系统树）
每个用户账号有一个主目录，唯一允许该普通账号写文件？--授权啥的怎么算？

[Linux目录详解](https://www.cnblogs.com/itcui/p/5632311.html)
[Linux目录结构及详细介绍](https://blog.csdn.net/m0_38044196/article/details/72844025)

/dev/shm文件夹 [/dev/shm（转）](https://www.cnblogs.com/softidea/p/5196858.html)

runlevel 查看系统当前运行级别

执行脚本 shell名称 脚本名？ bash a.sh

在linux中安装软件通常要用root身份，软件安装到/usr里，可以为系统的所有用户使用； 如果是用户自己安装自己的软件通常安放到/home/$user/..里，不会影响其它用户；

# xshell连接相关
- suse防火墙 初始设置都是空的  
`vim /etc/sysconfig/SuSEfirewall2`  
FW_SERVICES_EXT_TCP="ssh"可以定义基于TCP的开放ssh的服务
（服务们的名字和各自的默认端口可在 /etc/services中查看）

- 启动ssh服务
2. 修改sshd_config文件，命令为：vi /etc/ssh/sshd_config 注释去掉
Port 22
AddressFamily any
ListenAddress 0.0.0.0
ListenAddress ::
2. 将#PasswordAuthentication
no的注释去掉，并且将NO修改为YES 即将使用key登陆修改为使用密码登陆  
将#PermitRootLogin yes的注释去掉 允许root用户远程登陆
3. 重新启动SSH服务，命令为：/etc/init.d/sshd restart 或service sshd start/restart
4. 验证SSH服务状态，命令为：/etc/init.d/sshd status
--------------------- 
参考：[SUSE开启ssh服务](https://blog.csdn.net/clj198606061111/article/details/22983357)  
[解决xshell无法远程连接suse虚拟机的问题](https://my.oschina.net/dkvirus/blog/1814904)

扩展：[Linux系统中ssh与sshd服务](https://blog.csdn.net/qq_42036824/article/details/82943088)
>openssh
在主机中开启了openssh服务，那么就对外开放了远程连接的接口
openssh的服务端：sshd
openssh的客户端：ssh
ssh————————————>sshd
client 　　　　 server
ssh= secure shell
可以让远程主机通过网络访问sshd服务，开始一个安全shell,并对其进行操控
sshd
可以通过网络在主机中开启shell的服务


## 网络配置
/etc/sysconfig/network/ifcfg-eth0 （suse9为network下的routes文件？）
BOOTPROTO='static' ? #静态IP 'dhcp'则为DHCP模式
BROADCAST='' ? #广播地址
IPADDR='192.168.168.129' ? #IP地址（此处为suse11的设置）
NETMASK='255.255.255.0' ? #子网掩码
NETWORK='192.168.21.0' ? #网段地址
STARTMODE='auto' ? ?#开机启动网络
--------------------- 
将IPADDR修改为对应的网址ip
将NETMASK修改为对应的子网掩码
将NETWORK修改为对应的网口段
将BROADCAST修改为最高网段

虚拟机连主机 网段设置问题？？
网段如何设置

2、设置默认网关
vi /etc/sysconfig/network/routes #编辑文件
default 192.168.21.2

3、设置DNS
vi /etc/resolv.conf   #编辑文件
nameserver=8.8.8.8
nameserver=8.8.4.4

配置生效：source ifcfg-eth0

rcnetwork restart   #重启网络
service network restart #重启网络
/etc/init.d/network restart #重启网络

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

3、新建用户同时增加工作组
useradd -g test phpq                      //新建phpq用户并增加到test工作组

注：-g 所属组 -d 家目录 -s 所用的SHELL

4、给已有的用户增加工作组
usermod -G groupname username  （这个会把用户从其他组中去掉）
usermod -a groupname username

或者：gpasswd -a user group

如果添加了用户，添加了组，然后使这个组里的人都可以sudo 到公共账号下
可以/etc/sudoers.d 下面建立一个文件内容如下 ，就可以是etl组的所有用户都可以无密码的切到etl用户下。

%etl ALL=(ALL) NOPASSWD: /bin/su etl
%etl ALL=(ALL) NOPASSWD: /bin/su - etl

sudo 具体参考 http://www.cnblogs.com/xd502djj/p/6641475.html

5、临时关闭：在/etc/shadow文件中属于该用户的行的第二个字段（密码）前面加上*就可以了。想恢复该用户，去掉*即可。

或者使用如下命令关闭用户账号： passwd peter –l
重新释放： passwd peter –u

6、永久性删除用户账号
userdel peter
groupdel peter
usermod –G peter peter   （强制删除该用户的主目录和主目录下的所有文件和子目录）

7、从组中删除用户
编辑/etc/group 找到GROUP1那一行，删除 A
或者用命令 gpasswd -d A GROUP

8、显示用户信息
id user
cat /etc/passwd

Linux 用户和用户组详细解说
主要讲述在Linux 系统中用户(user)和用户组(group)管理相应的概念；用户(user)和用户组(group)相关命令的列举；其中也对单用户多任务，多用户多任务也做以解说。
本篇文章来源于 PHP资讯 原文链接：http://www.phpq.net/linux/linux-add-delete-user-group.html

Linux 用户（user）和用户组（group）管理概述 Linux 是一个多用户、多任务的操作系统；我们应该了解单用户多任务和多用户多任务的概念；

1、Linux 的单用户多任务；
单用户多任务；比如我们以beinan 登录系统，进入系统后，我要打开gedit 来写文档，但在写文档的过程中，我感觉少点音乐，所以又打开xmms 来点音乐；当然听点音乐还不行，MSN 还得打开，想知道几个弟兄现在正在做什么，这样一样，我在用beinan 用户登录时，执行了gedit 、xmms以及msn等，当然还有输入法fcitx ；这样说来就有点简单了，一个beinan用户，为了完成工作，执行了几个任务；当然beinan这个用户，其它的人还能以远程登录过来，也能做其它的工作。

2、Linux 的多用户、多任务；
有时可能是很多用户同时用同一个系统，但并不所有的用户都一定都要做同一件事，所以这就有多用户多任务之说；
举个例子，比如LinuxSir.Org 服务器，上面有FTP 用户、系统管理员、web 用户、常规普通用户等，在同一时刻，可能有的弟兄正在访问论坛；有的可能在上传软件包管理子站，比如luma 或Yuking 兄在管理他们的主页系统和FTP ；在与此同时，可能还会有系统管理员在维护系统；浏览主页的用的是nobody 用户，大家都用同一个，而上传软件包用的是FTP用户；管理员的对系统的维护或查看，可能用的是普通帐号或超级权限root帐号；不同用户所具有的权限也不同，要完成不同的任务得需要不同的用户，也可以说不同的用户，可能完成的工作也不一样；

值得注意的是：多用户多任务并不是大家同时挤到一接在一台机器的的键盘和显示器前来操作机器，多用户可能通过远程登录来进行，比如对服务器的远程控制，只要有用户权限任何人都是可以上去操作或访问的；

3、用户的角色区分；
用户在系统中是分角色的，在Linux 系统中，由于角色不同，权限和所完成的任务也不同；值得注意的是用户的角色是通过UID和识别的，特别是UID；在系统管理中，系统管理员一定要坚守UID 唯一的特性；

root 用户：系统唯一，是真实的，可以登录系统，可以操作系统任何文件和命令，拥有最高权限；
虚拟用户：这类用户也被称之为伪用户或假用户，与真实用户区分开来，这类用户不具有登录系统的能力，但却是系统运行不可缺少的用户，比如bin、daemon、adm、ftp、mail等；这类用户都系统自身拥有的，而非后来添加的，当然我们也可以添加虚拟用户；
普通真实用户：这类用户能登录系统，但只能操作自己家目录的内容；权限有限；这类用户都是系统管理员自行添加的；

4、多用户操作系统的安全；
多用户系统从事实来说对系统管理更为方便。从安全角度来说，多用户管理的系统更为安全，比如beinan用户下的某个文件不想让其它用户看到，只是设置一下文件的权限，只有beinan一个用户可读可写可编辑就行了，这样一来只有beinan一个用户可以对其私有文件进行操作，Linux 在多用户下表现最佳，Linux能很好的保护每个用户的安全，但我们也得学会Linux 才是，再安全的系统，如果没有安全意识的管理员或管理技术，这样的系统也不是安全的。

从服务器角度来说，多用户的下的系统安全性也是最为重要的，我们常用的Windows 操作系统，它在系纺权限管理的能力只能说是一般般，根本没有没有办法和Linux或Unix 类系统相比；

二、用户(user）和用户组（group）概念；
1、用户（user）的概念；
通过前面对Linux 多用户的理解，我们明白Linux 是真正意义上的多用户操作系统，所以我们能在Linux系统中建若干用户（user）。比如我们的同事想用我的计算机，但我不想让他用我的用户名登录，因为我的用户名下有不想让别人看到的资料和信息（也就是隐私内容）这时我就可以给他建一个新的用户名，让他用我所开的用户名去折腾，这从计算机安全角度来说是符合操作规则的；

当然用户（user）的概念理解还不仅仅于此，在Linux系统中还有一些用户是用来完成特定任务的，比如nobody和ftp 等，我们访问LinuxSir.Org 的网页程序，就是nobody用户；我们匿名访问ftp 时，会用到用户ftp或nobody ；如果您想了解Linux系统的一些帐号，请查看 /etc/passwd ；


2、用户组（group）的概念；
用户组（group）就是具有相同特征的用户（user）的集合体；比如有时我们要让多个用户具有相同的权限，比如查看、修改某一文件或执行某个命令，这时我们需要用户组，我们把用户都定义到同一用户组，我们通过修改文件或目录的权限，让用户组具有一定的操作权限，这样用户组下的用户对该文件或目录都具有相同的权限，这是我们通过定义组和修改文件的权限来实现的；

举例：我们为了让一些用户有权限查看某一文档，比如是一个时间表，而编写时间表的人要具有读写执行的权限，我们想让一些用户知道这个时间表的内容，而不让他们修改，所以我们可以把这些用户都划到一个组，然后来修改这个文件的权限，让用户组可读，这样用户组下面的每个用户都是可读的；

用户和用户组的对应关系是：一对一、多对一、一对多或多对多；

一对一：某个用户可以是某个组的唯一成员；
多对一：多个用户可以是某个唯一的组的成员，不归属其它用户组；比如beinan和linuxsir两个用户只归属于beinan用户组；
一对多：某个用户可以是多个用户组的成员；比如beinan可以是root组成员，也可以是linuxsir用户组成员，还可以是adm用户组成员；
多对多：多个用户对应多个用户组，并且几个用户可以是归属相同的组；其实多对多的关系是前面三条的扩展；理解了上面的三条，这条也能理解；

三、用户（user）和用户组（group）相关的配置文件、命令或目录；
1、与用户（user）和用户组（group）相关的配置文件；
1）与用户（user）相关的配置文件；
/etc/passwd 注：用户（user）的配置文件；
/etc/shadow 注：用户（user）影子口令文件；

2）与用户组（group）相关的配置文件；
/etc/group 注：用户组（group）配置文件；
/etc/gshadow 注：用户组（group）的影子文件；

2、管理用户（user）和用户组（group）的相关工具或命令；
1）管理用户（user）的工具或命令；
useradd    注：添加用户 
adduser    注：添加用户
passwd     注：为用户设置密码
usermod  注：修改用户命令，可以通过usermod 来修改登录名、用户的家目录等等；
pwcov       注：同步用户从/etc/passwd 到/etc/shadow 
pwck         注：pwck是校验用户配置文件/etc/passwd 和/etc/shadow 文件内容是否合法或完整；
pwunconv  注：是pwcov 的立逆向操作，是从/etc/shadow和 /etc/passwd 创建/etc/passwd ，然后会删除 /etc/shadow 文件；
finger        注：查看用户信息工具
id              注：查看用户的UID、GID及所归属的用户组
chfn          注：更改用户信息工具
su             注：用户切换工具
sudo         注：sudo 是通过另一个用户来执行命令（execute a command as another user），su 是用来切换用户，然后通过切换到的用户来完成相应的任务，但sudo 能后面直接执行命令，比如sudo 不需要root 密码就可以执行root 赋与的执行只有root才能执行相应的命令；但得通过visudo 来编辑/etc/sudoers来实现；
visudo      注：visodo 是编辑 /etc/sudoers 的命令；也可以不用这个命令，直接用vi 来编辑 /etc/sudoers 的效果是一样的；
sudoedit  注：和sudo 功能差不多；


2）管理用户组（group）的工具或命令；
groupadd  注：添加用户组；
groupdel         注：删除用户组；
groupmod        注：修改用户组信息
groups     注：显示用户所属的用户组
grpck
grpconv   注：通过/etc/group和/etc/gshadow 的文件内容来同步或创建/etc/gshadow ，如果/etc/gshadow 不存在则创建；
grpunconv   注：通过/etc/group 和/etc/gshadow 文件内容来同步或创建/etc/group ，然后删除gshadow文件；

3、/etc/skel 目录；
/etc/skel目录一般是存放用户启动文件的目录，这个目录是由root权限控制，当我们添加用户时，这个目录下的文件自动复制到新添加的用户的家目录下；/etc/skel 目录下的文件都是隐藏文件，也就是类似.file格式的；我们可通过修改、添加、删除/etc/skel目录下的文件，来为用户提供一个统一、标准的、默认的用户环境；

[root@localhost beinan]# ls -la /etc/skel/
总用量 92
drwxr-xr-x    3 root root  4096  8月 11 23:32 .
drwxr-xr-x  115 root root 12288 10月 14 13:44 ..
-rw-r--r--    1 root root    24  5月 11 00:15 .bash_logout
-rw-r--r--    1 root root   191  5月 11 00:15 .bash_profile
-rw-r--r--    1 root root   124  5月 11 00:15 .bashrc
-rw-r--r--    1 root root  5619 2005-03-08  .canna
-rw-r--r--    1 root root   438  5月 18 15:23 .emacs
-rw-r--r--    1 root root   120  5月 23 05:18 .gtkrc
drwxr-xr-x    3 root root  4096  8月 11 23:16 .kde
-rw-r--r--    1 root root   658 2005-01-17  .zshrc
 
/etc/skel 目录下的文件，一般是我们用useradd 和adduser 命令添加用户（user）时，系统自动复制到新添加用户（user）的家目录下；如果我们通过修改 /etc/passwd 来添加用户时，我们可以自己创建用户的家目录，然后把/etc/skel 下的文件复制到用户的家目录下，然后要用chown 来改变新用户家目录的属主；

4、/etc/login.defs 配置文件；
/etc/login.defs 文件是当创建用户时的一些规划，比如创建用户时，是否需要家目录，UID和GID的范围；用户的期限等等，这个文件是可以通过root来定义的；
比如Fedora 的 /etc/logins.defs 文件内容；

# *REQUIRED*
# #   Directory where mailboxes reside, _or_ name of file, relative to the
# #   home directory.  If you _do_ define both, MAIL_DIR takes precedence.
# #   QMAIL_DIR is for Qmail
# #
# #QMAIL_DIR      Maildir
# MAIL_DIR        /var/spool/mail  注：创建用户时，要在目录/var/spool/mail中创建一个用户mail文件；
# #MAIL_FILE      .mail
#
# # Password aging controls:
# #
# #       PASS_MAX_DAYS   Maximum number of days a password may be used.
# #       PASS_MIN_DAYS   Minimum number of days allowed between password changes.
# #       PASS_MIN_LEN    Minimum acceptable password length.
# #       PASS_WARN_AGE   Number of days warning given before a password expires.
# #
# PASS_MAX_DAYS   99999   注：用户的密码不过期最多的天数；
# PASS_MIN_DAYS   0       注：密码修改之间最小的天数；
# PASS_MIN_LEN    5       注：密码最小长度；
# PASS_WARN_AGE   7       注：
#
# #
# # Min/max values for automatic uid selection in useradd
# #
# UID_MIN                   500  注：最小UID为500 ，也就是说添加用户时，UID 是从500开始的；
# UID_MAX                 60000   注：最大UID为60000；
#
# #
# # Min/max values for automatic gid selection in groupadd
# #
# GID_MIN                   500   注：GID 是从500开始；
# GID_MAX                 60000
#
# #
# # If defined, this command is run when removing a user.
# # It should remove any at/cron/print jobs etc. owned by
# # the user to be removed (passed as the first argument).
# #
# #USERDEL_CMD    /usr/sbin/userdel_local
#
# #
# # If useradd should create home directories for users by default
# # On RH systems, we do. This option is ORed with the -m flag on
# # useradd command line.
# #
# CREATE_HOME     yes   注：是否创用户家目录，要求创建；
#  
#
#
#  5、/etc/default/useradd 文件；
#
#  通过useradd 添加用户时的规则文件；
#
#  # useradd defaults file
#  GROUP=100
#  HOME=/home  注：把用户的家目录建在/home中；
#  INACTIVE=-1  注：是否启用帐号过期停权，-1表示不启用；
#  EXPIRE=   注：帐号终止日期，不设置表示不启用；
#  SHELL=/bin/bash  注：所用SHELL的类型；
#  SKEL=/etc/skel   注： 默认添加用户的目录默认文件存放位置；也就是说，当我们用adduser添加用户时，用户家目录下的文件，都是从这个目录中复制过去的；
#   
#
#
#   后记：
#
#   关于用户（user）和用户组（group）管理内容大约就是这么多；只要把上面所说的内容了解和掌握，用户（user）和用户组（group）管理就差不多了；由于用户（user）和用户组（group）是和文件及目录权限联系在一起的，所以文件及目录权限的操作也会独立成文来给大家介绍；
#
#   摘自 http://fedora.linuxsir.org/main/?q=node/91
查看组 group
