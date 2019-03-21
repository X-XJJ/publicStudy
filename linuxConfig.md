
终端分屏工具 tmux

# shell脚本
[Linux脚本中利用sed修改文件内容的多种技巧](https://blog.csdn.net/sunny05296/article/details/71173467)

# 编译调试
gcc
- [Makefile 使用总结](https://www.cnblogs.com/wang_yb/p/3990952.html)
 - 只有行注释#

make 维护程序工具

## gcc C的编译器
 
编译参数 gcc -g  ——与makefile文件内配置

ulimit -c 查看段错误文件大小 0即没有
ulimit -c unlimited 

gdb工具需安装yum install -y gdb
程序运行后，生成core.XXX文件
gdb zoe core文件名  段错误查看，zoe为程序名
进入后输入where，显示段错误出现的层次路径位置


linker 链接器




# 一些通用的

单行注释 #

复合命令 IF then

/etc/profile
/etc/bashrc
~/.bashrc
~/.bash_profile
...
[Linux中profile、bashrc、bash_profile之间的区别和联系](https://blog.csdn.net/chenchong08/article/details/7833242)


# 定制shell提示符
提示符由环境变量PS1决定，prompt string 1，
包含 转义字符，可添加颜色，等等，具体的可随时查，
常用的：
提示符设为用户和完整路径的设置：
如：
（找个实例）







# centos7 minimal最小安装

## 网卡默认禁用
- 完事重启网络服务 service network restart
- 使用UI界面设置
 - nmcli 查看网卡状态 简单信息 nmcli d
 - nmtui 打开网络管理其界面
   - 编辑网卡，[X] Automatically connect选项，空格进行选项选择
   - [CentOS 7 minimal 版本安装后网络配置](https://www.cnblogs.com/hfyfpga/p/6262057.html)
- 直接编辑配置文件
  - 位置：/etc/sysconfig/network-scripts/ifcfg-网卡名
  -

TYPE=Ethernet    #以太网
BOOTPROTO=dhcp    #地址获取方式 dhcp static none 
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=ens33    #网卡名
UUID=fcb01ff5-8c4c-476e-9085-030ca20b86f3    #物理地址
DEVICE=ens33
ONBOOT=yes    #开机自动启用网络连接 yes no
IPADDR=192.168.8.5    #静态IP地址
PREFIX=24    #前缀 即掩码位 192.168.8.5/24 METMASK=255.255.255.0
GATEWAY=192.168.8.2    #网关
DNS1=192.168.8.2    #还可以有DNS2 DNS3 ...
IPV6_PEERDNS=yes
IPV6_PEERROUTES=yes



## 无ifconfig netstat等一系列命令
最小安装下 值安装了命令为ip
yum -y install net-tools

## 修改bash当前路径显示为全路径
 - /etc/bashrc
 - 默认：[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "
 - 修改W → w：[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \w]\\$ "


- 传文件，centos作为服务器 
 - [CentOS7.3安装rz、sz命令](https://blog.csdn.net/fireblue1990/article/details/74147190)
 - rz取Windows的文件

# suse
- suse真机环境中，在图形界面和文本界面间切换  
1. 图形界面切换到文本界面   
Ctrl+Alt+F(n) , 其中F(n)为F1-F6，为6个控制台；  
2. 文本界面切换到图形界面   
Ctrl+ALT+F7


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






