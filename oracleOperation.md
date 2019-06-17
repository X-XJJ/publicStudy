
# sqlplus
- 登陆sqlplus
  - sqlplus / as sysdba
  - sqlplus 用户名/密码
  - ...

- 登录/切换用户
  conn 用户名/密码

- 启动数据库（按当前环境变量里的ORACLE_SID寻找实例名启动）
  - startup
  - shutdown

- 执行.sql脚本
  - @脚本全路径

sqlpuls 退格、方向键问题
(https://www.cnblogs.com/mengfanrong/p/4680281.html)
(https://www.cnblogs.com/jinshoucai/archive/2011/11/16/2251245.html)


# 其他
## 各种“名”
- 数据库名：
  - 一个数据库的唯一标识，创建时需指定？
  - 在数据库创建后被写入参数文件，文件内参数为db_name，
  - 数据库名使用场景：安装数据库，创建新库，创建数据库控制文件，修改数据结构，备份&恢复数据库；
- 数据库实例名：
 - 即dbca时候的SID配置，用于数据库和操作系统之间的交互，实际是系统分配的一块内存？
 - 文件内参数为instance_name，一般数据库名和实例名为一对一，集群中存在一个数据库名对多个实例名，多个实例可以用一个实例名（一个实例down掉后，自动分配另一个实例上）；
- Oracle实例：内存结构（SGA）+ 一系列后台进程；
- ORACLE_SID：
 - 操作系统配置文件里配置的环境变量，从操作系统去访问数实例名必须通过ORACLE_SID，用于生产进程名、寻找数据库相应参数；
 - Windows中使用set ORACLE_SID=可以指定当前要交互的数据库实例名，仅在当前shell生效；linux下用export ORACLE_SID=SERVICE_NAME；
- 数据库域名：主要用于分布式环境中的复制，参数为db_domain；
- 服务器名：一个数据库可对外公布多个服务器名service_names


## 角色 = 权限的集合，可将角色授予用户
类似 用户组？：
- Oracle默认角色
 - connect
 - resource
 - dba

- 创建角色，删除角色
- 角色赋予权限


- 查看所有？用户 select * from dba_users/all_users/user_users;
-
- select distinct table_name from user_tab_columns; （查看当前user模式下所有表名）
-
- select name from v$tempfile;查询临时表空间文件的绝对路径
- select name from v$datafile;查询用户表空间文件的绝对路径

[Oracle用户创建及权限设置](https://www.cnblogs.com/buxingzhelyd/p/7865194.html)

[Oracle创建用户、角色、授权、建表](https://www.cnblogs.com/roger112/p/7685307.html)
[如何查询oracle用户、权限、及角色](https://blog.csdn.net/lx870576109/article/details/79081621)

[SQL*Plus用法指南](https://www.cnblogs.com/itcui/p/5626565.html)

[查看Oracle数据库及表信息](https://blog.csdn.net/gavinli2588/article/details/78343157)

[【Oracle数据库】Oracle SQL*Plus环境下的简单操作](https://blog.csdn.net/qq_33591903/article/details/81053842)

[oracle创建数据库和用户](https://www.cnblogs.com/0201zcr/p/4669548.html)
[Linux新建Oracle用户和数据库](https://blog.csdn.net/dongyuxu342719/article/details/81670837)

[linux下 oracle常用命令](https://www.cnblogs.com/ldybky/p/5176996.html)



## 系统用户
- sys：超级账户，权限最大，可以完成数据库的所有管理任务
- system：创建一些用于产看管理信息的表&视图
   登陆Oracle工具（如sql*plus）时，sys只能以sysdba（系统管理员）或者sysoper（系统操作员）权限登陆，system可以直接登陆（normal）

[用系统用户登录Oracle](https://blog.csdn.net/s___lei/article/details/78474837)
PS：scott用户，密码默认tiger，初始状态为锁定的；scott为Oracle创始人之一；

- sysdba:数据库管理员身份。权限：打开（关闭）数据库服务器、备份（恢复）数据库、日志功能、会话限制、数据库管理功能等。
    例如：sys用户必须用sysdba才能登陆，system用户用普通用户就可以登陆。
- sysoper:数据库操作员身份 。权限：打开（关闭）数据库服务器、备份（恢复）数据库、日志功能、会话限制。
- normal:普通用户。权限：操作该用户下的数据对象和数据查询，默认的身份是normal用户。


一个Oracle数据库系统中可以同时创建n个数据库，每个数据库对应一个唯一的实例，OPS系统除外；
一个操作系统上可以装多个版本的Oracle数据库系统；

[创建Oracle数据库、数据库名与实例名与SID之间的关系(图文详解)](https://blog.csdn.net/Jmilk/article/details/51569290) --这篇看后半部分

[Oracle数据库系统中实例名（即instance_name）和ORACLE_SID的区别](https://blog.csdn.net/haiross/article/details/13614041)

[oracle查询数据库名、实例名、ORACLE_SID](https://blog.csdn.net/u013080248/article/details/17199259)

[oracle 数据库、实例、服务名、SID](https://www.cnblogs.com/ahudyan-forever/p/6016784.html)

- 
（2）登陆数据库，通过SQL语句查看（查看当前使用的数据库所对应的实例名称）：
     SQL>show parameter instance;
	 SQL>show parameter instance_name;
     SQL>select * from v$instance;
- sqlplus中，命令加不加分号";"都可以，SQL语句必须加;

oracle 自增序列号id 用法
[create sequence 用法](https://www.cnblogs.com/jhtchina/articles/1334955.html)

