
# 编译调试
gcc
- [Makefile 使用总结](https://www.cnblogs.com/wang_yb/p/3990952.html)
 - 只有行注释#

# 一些通用的

/etc/profile
/etc/bashrc
~/.bashrc
~/.bash_profile
...
[Linux中profile、bashrc、bash_profile之间的区别和联系](https://blog.csdn.net/chenchong08/article/details/7833242)


# centos7 minimal最小安装
单行注释 #
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



## 无ifconfig命令
最小安装下 值安装了命令为ip

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



