# 基本设置
- 虚拟机
SUSE Linux Enterprise 11(SLES-11-SP4-DVD1)  
用户名:suse11(系统root,密码suse11)  
密码:suse11  

- 网络配置
 - NAT模式
虚拟内网gateway: 192.168.8.2
主机VM8卡  
IP: 192.168.8.1 netmask: 255.255.255.0 
VM下VM8卡  
NAT网段：192.168.8.0 DHCP范围.128 ~ .254 广播地址.255
suse11  
IP: 192.168.8.3/24
DNS: 192.168.8.2
端口转发：需要再说
- 桥接模式
先DHCP吧，需要再说

- 共享文件夹
虚拟机位于 /mnt/hgfs   
主机设置为 D:\VMshare  

# xshell连接相关
- 启动ssh服务
2. 修改sshd_config文件，命令为：vi /etc/ssh/sshd_config 注释去掉
2. 将#PasswordAuthentication
no的注释去掉，并且将NO修改为YES 即将使用key登陆修改为使用密码登陆  
将#PermitRootLogin yes的注释去掉 允许root用户远程登陆
3. 重新启动SSH服务，命令为：/etc/init.d/sshd restart 
4. 验证SSH服务状态，命令为：/etc/init.d/sshd status
--------------------- 

# oracle安装相关
## 检查相关依赖组件、包
rpm -q binutils gcc gcc-c++ glibc glibc-devel ksh libaio libaio-devel libcap1 libstdc++33 libstdc++43-devel libstdc++46 libgcc46 make sysstat xorg-x11-libs xorg-x11-libX11 xorg-x11-libXau xorg-x11-libxcb xorg-x11-libXext 

--------------------- 
[oracle 12c database安装时各版本linux所需要安装包](https://blog.csdn.net/jiuyun1986/article/details/53813037)
[虚拟机中openSUSE安装软件问题的解决](https://blog.csdn.net/u011350541/article/details/52956961)
错误信息如下：
> Failed to mount cd:///?devices=/dev/sr1,/dev/sr0 on /var/adm/mount/AP_0x44r4NM: Mounting media failed (mount: no medium found on /dev/sr0)
Please insert medium [SUSE-Linux-Enterprise-Server-11-SP4 11.4.4-1.109] #1 and type 'y' to continue or 'n' to cancel the operation. [yes/no] (no):
需要我们插入DVD，进vm的setting，在CD/DVD(IDE)标签选项中，指定openSUSE的iso镜像，选connected

--------------以下重来重来

## 3.创建用户和组

linux-wwri:~ # groupadd oinstall-创建oracle用户组
linux-wwri:~ # groupadd dba
linux-wwri:~ # mkdir -p /opt/oracle 作为用户主目录
linux-wwri:~ # useradd -g oinstall -G dba -d /opt/oracle oracle-installtest
  用户oracle-installtest属于oinstall组，附加dba组，用户主目录
linux-wwri:~ # passwd oracle-installtest
  为用户oracle-installtest设置密码，此处密码设为oracle
linux-wwri:~ # mkdir -p /usr/oracle
  作为oracle安装目录
linux-wwri:~ # chown -R oracle-installtest:oinstall /usr/oracle
linux-wwri:~ # chmod -R 775 /usr/oracle
  775 777 等 表不同权限 具体再查

Oracle默认路径 类似 /u01/app/oracle/product/11.2.0/db_1
是一种推荐的习惯和规范，，Oracle称之为OFA(Oracle优化灵活结构)，并不是必需的,
但是如果你有多个Oracle的软件需要部署时，使用Oracle推荐的习惯会带来很多方便
OMF
[Oracle的OFA架构](https://www.cnblogs.com/timlong/p/6240376.html)


## 设置内核参数、文件限制
- 内核参数文件/etc/sysctl.conf
linux-wwri:~ # vi /etc/sysctl.conf 
  具体参见文件
linux-wwri:~ # sysctl -p 使之生效

- 文件限制 /etc/security/limits.conf
  具体参见文件
- 添加进登陆配置
vi /etc/pam.d/login
在文件末尾添加: session required pam_limits.so

具体参数意思再查

## 配置环境变量 全局的？用户的？
export ORACLE_BASE=/usr/oracle
linux-wwri:~ # export ORACLE_HOME=$ORACLE_BASE/product/12.1.0/db_1
linux-wwri:~ # export ORACLE_SID=oracle
linux-wwri:~ # export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib
  每个是啥意思？
  ORACLE_BASE：
  ORACLE_HOME：
  https://blog.csdn.net/m0_37814112/article/details/77373863
  https://blog.csdn.net/linfanhehe/article/details/77838788

## 解压安装包
> unzip linuxamd64_12102_database_1of2.zip -d /opt/oracle
> unzip linuxamd64_12102_database_2of2.zip -d /opt/oracle

--------以上重来重来


--------按https://blog.csdn.net/jiaoziup/article/details/78716961的来
用户oracle-xue，用户主目录home/oracle-xue，密码oracle
配置文件.bash_profile
oracle安装目录 usr/oracle
权限777
在oracle-xue用户下进行安装
/usr/oracle/database/runInstaller -silent -ignoreSysPrereqs -ignorePrereq -showProgress -responseFile /usr/oracle/database/response/db_install.rsp
./runInstaller -silent -ignoreSysPrereqs -ignorePrereq -showPregross -responseFile /usr/oracle/database/response/db_install.rsp

问题们：
- [WARNING] - My Oracle Support Username/Email Address Not Specified
解决：配置文件database/response/db_install.rsp
DECLINE_SECURITY_UPDATES=true 留空系统会假设为false
[.rsp详解](http://blog.chinaunix.net/uid-23886490-id-3565908.html)

- DISPLAY not set. Please set the DISPLAY and try again.
display是一个图形界面的设置参数，oracle安装程序也给出了解决方式
root下设置oracle-xue用户的配置文件.bash_profile
export DISPLAY=localhost:1
再执行xhost +
出现access control disabled, clients can connect from any host即为成功
引出问题：Invalid MIT-MAGIC-COOKIE-1 keyxhost:  unable to open display
使用vncserver

(https://blog.csdn.net/qq_32786873/article/details/82355911)
(https://blog.csdn.net/qq_26963433/article/details/79468308)

- [FATAL] [INS-32021] Insufficient disk space on this volume for the selected Oracle home.
CAUSE: The selected Oracle home was on a volume without enough disk space
ACTION: Choose a location for Oracle home that has enough space (minimum of 6,553MB) or free up space on the existing volume.
安装目录磁盘空间不足？查看磁盘情况 df -h
创建虚拟机时分配硬盘大小-默认suse为20G，删除快照，设置内扩展磁盘容量，改为256G？
解决1：直接扩展根目录的磁盘分区大小，非LVM  https://blog.csdn.net/qq_32425503/article/details/83784068
解决2：将安装目录重新挂载到新分区，/usr，之后安软件全安这儿了，https://blog.csdn.net/qq_32425503/article/details/83784068，https://blog.csdn.net/u010521366/article/details/72900476
suse11内重新添加/分配分区
fdisk /dev/sda

-----此处快照1213-----

- The Oracle base location is empty.

- 暂停下，去配置db_install.rsp文件
(http://blog.chinaunix.net/uid-23886490-id-3565908.html)

[CentOS7静默安装oracle12c](https://www.cnblogs.com/Jace06/p/8423189.html)
[Oracle 12c 静默安装（带注释）](http://blog.51cto.com/12790274/2062955)
[Oracle 11gR2静默安装 & 命令行安装](https://www.cnblogs.com/ivictor/p/4384583.html)


INVENTORY_LOCATION=/home/oracle-xue/oraInventory
inventory目录需要和安装目录？ORACLE_HOME不一致？

[oracle_base与oracle_home目录区别](https://blog.csdn.net/m0_37814112/article/details/77373863)


- Unable to create directory

linux-wwri:/usr/oracle # mkdir produce
linux-wwri:/usr/oracle # ls
database  produce
linux-wwri:/usr/oracle # chmod -R 777 /usr/oracle
linux-wwri:/usr/oracle # chown -R oracle-xue:oinstall /usr/oracle
linux-wwri:/usr/oracle # chown -R oracle-xue:oinstall /home/oracle-xue
..................................................   95% Done.
As a root user, execute the following script(s):
	1. /home/oracle-xue/oraInventory/orainstRoot.sh
	2. /usr/oracle/produce/root.sh
..................................................   100% Done.
Successfully Setup Software.
As install user, execute the following script to complete the configuration.
	1. /usr/oracle/produce/cfgtoollogs/configToolAllCommands RESPONSE_FILE=<response_file>
 	Note:
	1. This script must be run on the same host from where installer was run. 
	2. This script needs a small password properties file for configuration assistants that require passwords (refer to install guide documentation).

root和安装用户分别运行不同的文件/配置脚本

-----------快照1217-----------

# 配置监听natca.rsp
 netca -silent -responsefile /usr/oracle/database/response/netca.rsp

netca是oracle net configuration assistance的简称，主要作用是配置监听程序、命名方法配置、本地net服务吗配置、目录使用配置。
简单说一下，就是可以配置一个监听程序和服务名，从而可以使oracle client连接至数据库进行相关操作。
监听的文件存放位置在：$ORACLE_HOME\NETWORK\ADMIN\listener.ora
服务名的文件存放位置在：$ORACLE_HOME\NETWORK\ADMIN\tnsnames.ora

[oracle 监听启动、停止、查看命令](https://www.cnblogs.com/autumnlj/p/4300718.html)


# 配置建库dbca.rsp
dbca是指数据库配置工具，主要功能有创建数据库，配置现有数据库选项，删除数据库和管理数据库模板
SYSPASSWORD = "password"
SYSTEMPASSWORD = "password"
SERVICEUSERPASSWORD = "password"

[OracleDB12cR1 dbca.rsp(CREATE DATABASE)](https://blog.csdn.net/Belialacheron/article/details/80515905)

dbca -silent -responseFile /usr/oracle/database/response/dbca.rsp
dbca -silent -createDatabase -templateName General_Purpose.dbc -gdbName test -sysPassword oracle -systemPassword oracle

PS：无意发现的问题，当.rsp在vi中打开修改时，运行命令，命令行光标会快速回退
- ORA-00821: Specified value of sga_target 292M is too small, needs to be at least 364M
  ORA-01078: failure in processing system parameters
sga_target 空间不够的问题
SGA系统全局区的英文简称，SGA （System Global Area）是Oracle Instance的 基本组成部分，在实例启动时分配。是一组包含一个Oracle实例的数据和控制信息的共享内存结构
---这个问题暂弃疗，找不到正在没有库的时候在哪儿改sga_target
算了还是不弃疗……

“手动配置pfile启动nomount,再构造控制文件mount, 及resetlogs后拉起来”(https://bbs.csdn.net/topics/392458929)
使用sqlplus
sqlplus / as sysdba
startup nomount 或 startup pfile=ora文件路径 nomount
问题：
ORA-48108: invalid value given for the diagnostic_dest init.ora parameter
ORA-48140: the specified ADR Base directory does not exist [/usr/oracle/produce/dbs/<ORACLE_BASE>]
ORA-48187: specified directory does not exist
Linux-x86_64 Error: 2: No such file or directory
Additional information: 1
解决：
复制init.ora命名为initorcl.ora（SID=orcl），修改
[Oracle启动过程中碰到的一些问题](https://blog.csdn.net/roofwei/article/details/25343919)

- ORA-00845: MEMORY_TARGET not supported on this system
解决：修改/dev/shm挂载大小
linux-wwri:~ # mount -o remount,size=3072M /dev/shm
上为单次修改
修改文件/etc/fstab（持续性修改，每次启动都这么配置）
tmpfs /dev/shm tmpfs  defaults,size=3072M      0 0
（select memory_target from system）

[Oracle的memory_max_target和memory_target修改和ORA-00845: MEMORY_TARGET not supported on this system错误解决](https://blog.csdn.net/sunny05296/article/details/56495599)

- 问题
ORA-09925: Unable to create audit trail file
Linux-x86_64 Error: 2: No such file or directory
Additional information: 9925
解决：
没解决，上面修改/dev/shm之后，刚好就把sga的问题解决了，建库吧建库吧

oracle-xue@linux-wwri:~> dbca -silent -createDatabase -templateName General_Purpose.dbc -gdbName test -sysPassword oracle -systemPassword oracle
Cleaning up failed steps
5% complete Copying database files 7% complete ...省略省略 41% complete Creating and starting Oracle instance 43% complete ...  64% complete Completing Database Creation 68% complete ...  100% complete
Look at the log file "/usr/oracle/cfgtoollogs/dbca/test/test2.log" for further details.
- "/usr/oracle/cfgtoollogs/dbca/test/test2.log"
Cleaning up failed steps
DBCA_PROGRESS : 5% Copying database files DBCA_PROGRESS : 7% ...  DBCA_PROGRESS : 41% Creating and starting Oracle instance DBCA_PROGRESS : 43% ...  DBCA_PROGRESS : 64% Completing Database Creation DBCA_PROGRESS : 68% ...  DBCA_PROGRESS : 100%
Database creation complete. For details check the logfiles at:
 /usr/oracle/cfgtoollogs/dbca/test.
Database Information:
Global Database Name:test
System Identifier(SID):test

---建库完成，快照1218---

## 连接
启动监听 lsnrctl start (status stop)
启动数据库
sqlplus / as sysdba
startup
- 问题
ORA-09925: Unable to create audit trail file
Linux-x86_64 Error: 2: No such file or directory
Additional information: 9925
解决：
啊啊改了权限还是没起效啊为毛啊啊啊
[ORA-09925: Unable to create audit trail file汇总](https://blog.csdn.net/haibusuanyun/article/details/24398117)
——因为默认启动的OracleSID和环境变量里的不一致吧……

删除多余的先
dbca -silent -deleteDatabase -sourcedb test -sysDBAUserName test -sysDBAPassword oracle

重建，按默认的来
dbca -silent -createdatabase -responseFile /usr/oracle/database/response/dbca.rsp
建立库名叫orcl12c，密码password？--好像不是？是sys、sysdba、sys啥啥密码为password
启动这个库的时候，环境变量里的ORACLE_SID要和dbca.rsp里的SID一致，
成功了……

- 再试试建库，使用Oracle自带的模板.dbc，
dbca -silent -createDatabase -templateName $ORACLE_HOME/assistants/dbca/templates/General_Purpose.dbc -gdbName test -sid test -sysPassword test -systemPassword test
成功

静默建库两种方法，一种使用响应模板文件.rsp，一种使用Oracle自身的数据库模板.dbc或者.？？

- 使用test库测试

[oracle学习（dbca命令参数）](https://blog.csdn.net/bob_tthp/article/details/77622014)


参考们：


[Oracle 11gR2静默安装 & 命令行安装](https://www.cnblogs.com/ivictor/p/4384583.html)
[安装Oracle 11g R2静默安装安装](https://blog.csdn.net/sbtmbj2010/article/details/48654467)

[Oracle 12c 静默安装（带注释）](http://blog.51cto.com/12790274/2062955)


[suseLinux下安装oracle12c](https://blog.csdn.net/jiaoziup/article/details/78716961)

[安装SUSE11+oracle12c](https://blog.csdn.net/u010680713/article/details/72917870?utm_source=blogxgwz4)

荣鹏过程：https://blog.csdn.net/xiaopeng_csdn/article/details/83781221

