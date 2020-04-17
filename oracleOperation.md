# 其他
[oracle insert 将一张表数据插入另外表中](https://blog.csdn.net/momoko0314/article/details/78144175)

# sqlplus
- 登陆sqlplus
  - sqlplus / as sysdba（远程登录则需用户名密码）
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

## 字符集
- 查看数据库字符集
  - select userenv('language') from dual
  - select * from v$nls_parameters 查询nls参数+字符编码们
- nls_characterset 数据库字符集，char varchar2 按数据库字符集存储，如ZHS16GBK AL32UTF8
- nls_nchar_characterset 国家字符集，nchar nvarchar2 按国家字符集存储

- 路径

- grep -r "tnsnames.ora" 找Oracle路径，路径组成为$ORACLE_HOME/networks/admin/

# ODBC 连接 oracle
- odbcinst -j 检查安装状态
- odbcinst -q -s 查看配置
- isql Z0P.0 连进库
- strace -v isql Z0P.0 strace命令跟踪进程的所有系统调用
- isql -v Z0P.0 查看odbc报错
-
- make时存在leaving directory问题，属正常打印，未报错

- 配置两个文件在路径 $ORACLE_HOME/network/admin/ 下
  - listener.ora oracle监听文件
    - SID_NAME为数据库实例名 select * from v$instance，GLOBAL_DBNAME全局数据库名
    - 需要配置的监听 LISTENER 和 SID_LIST_LISTENER 成对出现，可有多个监听
  - tnsnames.ora
  -
- ODBC 配置文件 .odbc.ini
  - ServerName 和 tnsnames.ora 中 啥名？最开始的标识这个配置的名字？配置一致
-
- 文件Can't open lib 在路径下但打不开问题
  - 思路：文件存在无法使用的可能问题
  - 权限，路径，依赖（思路真的很重要啊！！还有网断了的思路等等）
  - ldd libsqora.so.11.1 查看可执行程序or包的依赖关系
    - not found 的条目为缺失，系统内寻找 find / -name "组件名"，cp入目标路径，或找到程序找依赖的环境变量路径，或系统外拷贝缺失包
    - 注：配置时候依赖项libodbcinst.so.1缺失且环境中找不到，然而各版本的unixODBC包内，都有相应版本的各种包，软件一般向下兼容，直接cp so.2 为 so.1 可用
    - [求libodbc.so.1和libodbcinst.so.1这两个库文件](https://zhidao.baidu.com/question/171015833.html)
- [使用odbc连接数据库,报错Can't open lib 'libsqora.so.12.1':file not found,但是该包存在](https://www.jianshu.com/p/0460db4ea35f)


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
- select distinct table_name from user_tab_columns; （查看当前user下所有表名）
-
- select name from v$tempfile;查询临时表空间文件的绝对路径
- select name from v$datafile;查询用户表空间文件的绝对路径

create tablespace 库名 logging datafile '路径如/opt/oracle/app/oradata/库名.dbf' size 1024M;
create temporary tablespace 库名_TEMP tempfile '路径如/opt/oracle/app/oradata/库名_TEMP.dbf' size 128M;

大小看情况定

[Oracle用户创建及权限设置](https://www.cnblogs.com/buxingzhelyd/p/7865194.html)

create user 用户名 identified by 密码 default tablespace 用户默认表空间/库表名 temporary tablespace 库名_TEMP;
grant all privileges to 库名;

[Oracle创建用户、角色、授权、建表](https://www.cnblogs.com/roger112/p/7685307.html)
[如何查询oracle用户、权限、及角色](https://blog.csdn.net/lx870576109/article/details/79081621)

- 修改用户密码（是否需要sys权限？）
  - password 用户名 ——修改该用户密码

- 查看表所在表空间 InsuredLevyDetail
- select * from user_tables where table_name='INSUREDLEVYDETAIL';

- 查看表空间剩余 R07
- select * from user_free_space where tablespace_name='R07';

- 查看表的索引
- select * from user_indexes where table_name='INSUREDLEVYDETAIL' order by index_name;
- 字段 LAST_ANALYZED 为索引的最近统计时间

- 查看索引名和列名对照
- select * from user_ind_colunms where table_name='INSUREDLEVYDETAIL';

- 查看全库索引 all_indexes表

- 创建索引
- create index idx_verifyDate on InsuredLevyDetail(verifyDate) [online];
- 加 online参数可以做在线索引，不锁表，不需要阻塞所有的DML语句，建完索引后关闭并发，否则影响性能？
  - create过程中index 保持online状态，Oracle还会在create index之前等待所有DML操作结束，然后得到DDL锁，开始create
- 在Oracle 10g后有个隐含参数“_OPTIMIZER_COMPUTE_INDEX_STATS”，意思是是否对新建索引收集统计信息，该参数默认是TRUE，表示默认收集新建索引的统计信息
[【DB笔试面试641】在Oracle中，新建索引后统计信息是否自动收集？](https://cloud.tencent.com/developer/article/1516035)

- 手动对索引分析信息
- analyze table
[对于Oracle analyze table的使用总结](https://blog.csdn.net/victory_xing126/article/details/44948521)

- 注：表名table_name字段在这几个表里都是大写存储，查的时候要where table_name='INSUREDLEVYDETAIL'
- 索引创建时，索引名、表名小写大写都可，但存进去存的都是大写

[使用索引的注意事项及常见场景、案例](https://www.cnblogs.com/zhaoguan_wang/p/4604025)

[Oracle收集统计信息和重建索引](http://www.360doc.com/content/17/0415/13/7662927_645792043.shtml)



## 口令失效问题 ORA-28001
- 创建用户时缺省密码过期限制为180天
- SELECT * FROM dba_profiles WHERE profile='DEFAULT' AND resource_name='PASSWORD_LIFE_TIME'，查询密码的有效期设置，结果中limit字段为有效天数
- ALTER USER 用户名 IDENTIFIED BY 密码，修改用户密码，即下一个180天的密码
- ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED，关闭180天限制

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

- [用系统用户登录Oracle](https://blog.csdn.net/s___lei/article/details/78474837)
PS：scott用户，密码默认tiger，初始状态为锁定的；scott为Oracle创始人之一；

- sysdba:数据库管理员身份。权限：打开（关闭）数据库服务器、备份（恢复）数据库、日志功能、会话限制、数据库管理功能等。 例如：sys用户必须用sysdba才能登陆，system用户用普通用户就可以登陆。
- sysoper:数据库操作员身份 。权限：打开（关闭）数据库服务器、备份（恢复）数据库、日志功能、会话限制。
- normal:普通用户。权限：操作该用户下的数据对象和数据查询，默认的身份是normal用户。

一个Oracle数据库系统中可以同时创建n个数据库，每个数据库对应一个唯一的实例，OPS系统除外；
一个操作系统上可以装多个版本的Oracle数据库系统；

[创建Oracle数据库、数据库名与实例名与SID之间的关系(图文详解)](https://blog.csdn.net/Jmilk/article/details/51569290) --这篇看后半部分

[Oracle数据库系统中实例名（即instance_name）和ORACLE_SID的区别](https://blog.csdn.net/haiross/article/details/13614041)

[oracle查询数据库名、实例名、ORACLE_SID](https://blog.csdn.net/u013080248/article/details/17199259)

[oracle 数据库、实例、服务名、SID](https://www.cnblogs.com/ahudyan-forever/p/6016784.html)

（2）登陆数据库，通过SQL语句查看（查看当前使用的数据库所对应的实例名称）：
SQL>show parameter instance;
SQL>show parameter instance_name;
SQL>select * from v$instance;
- sqlplus中，命令加不加分号";"都可以，SQL语句必须加;

oracle 自增序列号id 用法
[create sequence 用法](https://www.cnblogs.com/jhtchina/articles/1334955.html)
如create sequence sqnJournal;


# 各种报错
- ORA-24550
-
-
-
