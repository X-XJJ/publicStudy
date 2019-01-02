oracle数据库 备份相关  
  
[Oracle备份与恢复](http://blog.51cto.com/982439641/2104212)  
  
# 策略  
## 完全备份  
全库备份，没有用于记录级别的信息;  

## 差异备份differential模式  
0级 全备份（0级需要全备份，全备份不能当0级备份用）;  
1级 if(前一个==1级) 备份从此1级开始; else 备份从最近一次0级开始;  
2级 if(前一个==2级) 备份从此2级开始; else 备份从最近一次小于2的级开始;  
...  
n级 if(最近一次备份==n级) 从此n级开始备份; else 从最近一次小于n的级开始备份;   
  
## 增量备份cumulative模式  
0级 全备份;  
1级 备份从0级开始;  
2级 备份从1级开始; 若之前无1级，则从0级开始;  
...  
n级 if(前面存在n-1级备份) 从n-1级开始备份; else 从最近一次n-2 n-3...开始;  
  
[RMAN 差异增量与累积增量的区别](https://blog.csdn.net/tommany/article/details/52839868)  
  
  
  
# 方式  
## 冷备份-关闭数据库-不可按表or用户恢复  
脱机，彻底关闭数据库（带有normal、immediate、transaction选项的shutdown执行）  
    shutdown normal 关闭语句发出不许重连，所有当前连接的用户断开；  
    shutdown immediate 立即关闭数据库，不许新的连接和事务启动，未提交的事务进行回滚；  
    shutdown transaction   
拷贝相关文件到安全区（数据、日志、控制、参数、口令文件等，包括路径）  
    oracle目录下的admin、oradata(datafile， controlfile，redo)、flash_recovery_area三个文件夹  
    db_1（需要备份的数据库目录）下的database(PWDfile、pfile)、dbs(spfile)、NETWORK/ADMIN(listener.ora、tnsnames.ora)  
  
  
## 热备份-不借助管理器  
数据库必设为归档 archivelog模式（mount状态下才可设置）  
  
冻结SCN（system change number），即设置为热备模式  
物理拷贝相关文件  
解冻SCN  
  
- 备份表空间  
alter tablespace 表名 begin backup;  设置表空间为备份状态  
host cp ... 拷贝数据文件到安全区  
select * from v$backup; 查看备份状态  
alter tablespace 表名 end backup; 设置为非备份状态  
  
- 备份数据库  
alter database begin backup;  
拷贝所有的datafile到备份目录  
alter database end backup;  
  
- 备份控制文件  
alter database backup controlfile to '<dir>' [reuse]; --控制文件的完整备份  
alter database backup controlfile to trace as '<dir>' --用于创建控制文件的语句，丢失了部分信息，可以直接查看  
  
- 备份参数文件  
create pfile from spfile ;  
create pfile = '<dir>' from spfile;  
  
临时表空间的数据文件、日志文件不需要备份  
  
[Oracle的热备份-使用sql命令](https://www.cnblogs.com/zydev/p/6182459.html)  
  
## 热备份-借助RMAN-Oracle Recovery Manager恢复管理器  
啊教程比自己写的有条理多了orz  
  
[RMAN 的优缺点及RMAN 备份及恢复步骤-手动实现](https://blog.csdn.net/shudaqi2010/article/details/75300437)
[Oracle RMAN备份策略](https://www.cnblogs.com/login2012/p/5886108.html)
[Oracle rman 命令总结](https://www.cnblogs.com/john2017/p/6364546.html)

[RMAN多种备份脚本分享](https://blog.csdn.net/haibusuanyun/article/details/11608505)

[expdp/impdp数据泵和RMAN全库备份shell脚本各一则](https://blog.csdn.net/dc666/article/details/51122378)

[oracle rman 定时备份脚本](https://blog.csdn.net/waterxcfg304/article/details/48469455)

[Oracle备份及备份策略](https://www.cnblogs.com/login2012/p/5895987.html)

[Oracle备份与恢复](http://blog.51cto.com/982439641/2104212)
——带具体实例

  
## 添加到系统定时任务-自动备份  
特殊情况手动备份  
  
# OMS向导？Oracle Management Server  
  
  
# 闪回技术-逻辑误操作，恢复行级、事务级变化  
启用闪回恢复区等  
使用sql语句即可  
基于当前正常运行的交互文件恢复  
保留周期默认为一天，以min为单位  
  
  
  
  
## 逻辑备份-更适用于数据迁移  
# 导出Export  
exp   
exp help=y 查看帮助  
exp 用户名/密码@要连接的远程计算机IP/要备份的远程数据库名称 file=导出的文件路径 log=日志文件 其他参数（buffer direct full... 默认完全模式）  
eg：exp hhh/123@teat file=d:\test_bk.dmp log=d:\test_bk.log full=y 用户hhh密码123将数据库test完全导出到d盘test_bk.dmp中  
  
- 完全模式-整个数据库内，容操作时需特殊权限-只有完全的可含增量、累计方式  
exp user/password@database file=BKpath.dmp log=LOGpath.log full=y  
    增量参数-备份上次备份后改变的：inctype=incremental  
    累计参数-备份上次完全备份后变的： inctype=cumulative  
  
- 用户模式-指定用户的所有对象  
exp user/password@database file=BKpath.dmp log=LOGpath.log owner=user  
  
- 表模式-用户的所有表  
exp user/password@database file=BKpath.dmp log=LOGpath.log tables=(t1,t2,..)  
  
  
# 导入Import  
imp   
imp 用户名/密码@要连接的远程计算机IP/要恢复的远程数据库名称 file=使用的恢复文件路径 具体恢复的其他参数  
eg：imp hhh/123@teat file=d:\test_bk.dmp full=y 用户hhh密码123将d盘test_bk.dmp导入到数据库test  
  
# 数据泵导出导入（只用于服务器端）  
expdp/impdp  
  
  
[CentOS7下Oracle的自动备份-脚本-使用数据泵](https://www.cnblogs.com/andy6/p/5986761.html)  
  
  
[ORACLE 数据泵导入导出数据](http://blog.51cto.com/shurk/2063706)  
  
# 恢复  
[RMAN恢复](https://blog.csdn.net/mchdba/article/details/61624015)  
[计划参考](https://wenku.baidu.com/view/f17f1563326c1eb91a37f111f18583d049640f7f.html?rec_flag=default&sxts=1543217031899)  
  
  
# 其他涉及内容  
  
## 修改为归档模式 后续  
热备份，数据库必设为归档模式（mount状态下才可设置）  
  
alter database archivelog; (更改数据库为归档模式)  
alter database open; (打开数据库)  
alter system archive log start; (启用自动归档)  
  
  
    startup mount; 启动数据库到mount状态（oracle启动的三步：startup nomount 根据参数文件启动oracle实例; aler database mount 读取控制文件，连接实例和数据库; alter databaseopen 根据控制文件找数据文件、日志文件，打开数据库）  
    alter database archivelog; 启动归档模式（查看 archive log list; 非归档模式为noarchivelog）  
修改日志文件命名格式  
alter system set log_archive_max_processes = 5;   
alter system set log_archive_format = "archive_%t_%s_%r.log" scope=spfile;  
  
更改日志文件路径  
alter system set log_archive_dest_1='location=/data/archivelog/orcl';   
  
此时 Archive destination的值更改为 /data/archivelog/orcl  
该语句含义是确定归档日志的路径，实际上Oracle 10g以后可以生成多份一样的日志，保存多个位置，以防不测  
例如再添加一个日志位置可使用以下语句   
  SQL>alter system set log_archive_dest_2='location=/bak/orcl/archive_log';  
  
归档当前重做日志  
select name from v$archived_log;  
alter system archive log current;  
  
  可以看出在归档当前重做日志后从v$archived_log中能查到当前被归档的重做日志，由于没有重启数据库，所以归档日志的文件格式仍然是默认的格式。  
注：  
<  
    alter system switch logfile 是强制日志切换，不一定就归档当前的重做日志文件（若自动归档打开，就归档前的重做日志，若自动归档没有打开，就不归档当前重做日志。）  
    alter system archive log current 是归档当前的重做日志文件，不管自动归档有没有打都归档。  
    主要的区别在于:  
    alter system switch logfile 对单实例数据库或RAC中的当前实例执行日志切换;  
    alter system archive log current  会对数据库中的所有实例执行日志切换。  
>  
  
