sql相关

（基于笔记，慢慢补充）

# 其他
sql命令内：
sp_help

不同数据库内置工具不同？

[Select count(*)、Count(1)、Count(0)的区别和执行效率比较](https://www.cnblogs.com/sueri/p/6650301.html)
[Select count(*)和Count（1）的区别和执行方式](https://www.cnblogs.com/CareySon/p/DifferenceBetweenCountStarAndCount1.html)

## 数据类型
- mysql

- Oracle
number 等价于c语言double

## 


语法约定
关键字大小写问题--默认设置中可以不分大小写，编译执行时关键字会先转为大写再执行，大写可以省略编译时间

元组：一行
字符串使用单引号`'` '字符串'

|    单语法选项，只可选择其中一项
[]   可选语法选项
--   单行注释
/**/ 多行注释

# 关系数据库标准语言SQL
- 数据定义DDL
  操作      CREATE--创建  DROP--删除    ALTER--修改
  操作对象  database--数据库  table--表  view--视图  index--索引
- 数据操纵DML（数据）
  操作      INSERT--插入  UPDATE--更新  DELETE--删除（行）
  操作对象  表中的若干行数据
- 数据查询DQL      
  操作      SELECT
  操作对象  表and数据们？
- 数据控制DCL（安全）
  操作      GRANT--授权   REVOKE--收回授权
  操作对象  数据对象（表、列、视图...），数据库系统


# 数据查询
## 一般格式
select [all|distinct] 目标列表达式1 as 别名 ,表达式2 ...
from   表名or视图名 ,表名2... | (select语句) [as] 语句结果别名
[where 条件表达式] 
[group by 列名1 [having [聚函][条件表达式]] [,列名2...]]  --？存疑，能多个吗
[order by 列名 [ASC | DESC]]
？limit a,b  从select结果的第a+1行开始，返回b条记录，显示id从a+1开始——居然没写么……翻笔记去
返回指定的记录数（行数）,前一个参数表示偏移，后一个表示最多查出的数据条数
SELECT * FROM table
使用LIMIT约束后，变成：
SELECT * FROM table LIMIT 0，-1
LIMIT后的第一个参数0限定偏移量，后面的-1表示数据库表中最后一条数据，因为SQL中id是从1开始，所以返回了全部数据行

- "distinct" 消除列中重复行;  all 不取消重复，all为默认值;
- "as 别名"  --取该查询结果列的别名，可省略，别名为空字符串即按默认;
- "目标列表达式" 可选格式：
  *       --查all列;
  表名.*  --查该表的all列;
  count ([all | distinct] *)  --查含NULL的元组个数; *
  [表名.]属性列名表达式1 ,表达式2...
  - 属性列、作用于列的聚集函数、常量，及他们的任意运算表达式
  - "聚集函数" 
    使用：select 函数关键字([all|distinct]列名) 或者 having 函数关键字([all|distinct]列名)，除了select count(*) 是直接使用;
    函数名：
      - count() 统计列中非NULL值的个数;  count(*) 统计含NULL元组个数;
      - sum() 计算一列值总和;  avg() 计算一列平均值;  此二列需为数值型;
 - max() min() 求一列值中的最大、最小值;
- "where 条件表达式" 条件表达式可选格式："having"和where作用相同;
  列名 比较运算符 常量|列名| [any | all](select语句)  --比较;
     [NOT] between 常量|列名| [any|all](select语句) AND 常量|列名| [any|all](select语句)                            --确定范围，between上限and下限;
     [NOT] IN (值1 ,值2...) | (select语句)          --确定集合;
     IS [NOT] NULL                                  --判断空值;
    [NOT] exists (select语句)                           --是否存在;
    条件表达式1 [AND | OR 条件表达式2 AND|OR ...]       --优先级AND > OR;
- "group by ... having ..."
  将查询结果按某列or多列的值分组，值相等的为一组;
  条件中where与group by不共存；连接查询中，where后可以有group by;
- "order by"
  ASC 升序，默认的; DESC 降序;
  order by只可对最终结果排序，嵌套查询的子查询中order by必与top n连用;
  eg：... IN (select top 3 name from A order by age)

## 单表查询
- from子句中只涉及一个表;
- 增加属性标志，即产生常量列
  select name,'生于',year ...  --查询结果最终在该位置多一列，内容均为'生于';
- 常用短语
  select，运算符，order by，where，group by，聚集函数，like，having
- 属性列名 [NOT] like '匹配串' [escape '换码字符']  --模糊查询，字符匹配
  匹配串：字符串，可含通配符（% 任意长度字符串;  _ 任意单个字符; eg: a%b）;
  换码字符：即可自定义的转义字符;
  eg：select name as '姓名',year from A where year like '1_\_20%' escape '\'
      从表A中选择姓名、年份，条件是年份为1开头，第345位为_20，结尾不限的;
- 若在一个查询块中同时含有where，group by，having，其使用顺序为where选出行，group by在行里分出组，having作为group by的子句;

## 连接查询
- 连接：将多表的元组按序组合
- 内连接 
  形式：from 表1名,表2名 where 连接条件
        from 表1 inner join 表2或(select语句)选的条件 where 连接条件
  若无条件的查询则为笛卡儿积匹配（类似排列组合，数据超大啊）;
  - [非]等值连接
    where子句中，将两表的可比较的连接字段进行比较，再据此为条件进行连接;
    <eg：select B.a,b,c from A,B where A.a=B.a and B.d>3  --先连再查
        表A字段{a,b}，表B字段{a,c,d}，属性列在表们中唯一，即可省略表名前缀;
	按连接条件A.a=B.a连接表A和B的元组，并查询满足d > 3的查询内容;
	<==>
	select C.a,b,c from A,(select * from B where d>3) as C where A.a=C.a
    （自身连接：给自己的表名or列名取别名进行连接;）
- 外连接
  形式：from 表1名 left|right|full [outer] join 表2名 on (连接条件)
  显示含NULL情况的查询，即被舍弃的元组也保留在结果关系中;
  - 左外连接 left，列出左边（左表）的全部关系;
  - 右外连接 right，列出右边（右表）的全部关系;
  - 全外连接 = 左右都列出;

## 嵌套查询
- 一个查询块嵌套在另一个查询块的where子句或having短语中的查询;
- 一个查询块：一个select-from-where子句;
- 引出子查询的谓词：
  [not] in;  比较运算符;  比较运算符 some|all;  [not] exists;
  - IN()     <==> exists()     <==> =some();
  - NOT in() <==> NOT exists() <==> !=all();
- 不相关嵌套：每层只执行一次，结果用于父查询;
  eg：select a from A where b<some (select b from A where c=3)
      在表A中查询，*比*在c=3条件下的b小 的b 对应的a们的值; >
- 相关嵌套：子查询的where查询条件依赖于父查询
  eg：select a from A where b<(select b from B where A.c=B.c)
      子查询每次执行都从外层查询中取出表A的一个元组，外层将c的值传送给子查询，子查询执行次数 = 父查询元组数; >

## 集合查询
- 操作对象：多个select语句的查询结果，列数必相同，对应项数据类型必相同;
- 形式：select语句1 集合操作 select语句2
- 集合操作：
  union     并，自动默认去重，union all则保留重复;
  intersect 交;
  except    差;


# 数据操纵
## 修改数据 
update 表名 set 列名=表达式 [,列名=表达式...] [where 条件]
## 插入数据 
- 插入行数据（原组）
insert into 表名 [(属性列1 [,属性列2...])] values (常量1 [,常量2 ...]) [,(常量1 [常量2 ...]) ...]
- 插入子查询结果
insert into 表名 [(属性列们)] 子查询
  - 复制表数据  select * into 新表名 from 原表名
  - 复制表结构  select * into 新表名 from 原表名 where 一个不存在的条件
## 删除数据 
delete from 表名 [where 条件] 


# 数据定义
- 关系的模式结构
  外模式--视图  模式--基本表  内模式--索引、数字字典
## 数据库 database
create database 数据库名 
  [ON 数据库信息如name,size...]
  [LOG ON 日志信息同上]
## 表 table
- 创建基本表
create table 表名(
  列名1 数据类型 [列级完整性约束条件], 列名2 数据类型 [列完整性约束], 
  ...,
  [表级完整性约束条件]
)
  - 数据类型
    字符类型--如char(n)，数值类型--如int，日期时间型--如date time datetime
  - 表级完整性约束 
    - primary key(主键列名) 只有一个，标识数据库记录唯一性，该列不允许重复且不为空
    - unique (列名) 可有多个，非主键列，不允许重复，允许空，
  - 列级完整性约束
- 修改基本表
alter table 表名
  [add 新列名 数据类型 [完整性约束名]]
等等

联合约束


- 删除基本表
drop table 表明 [restrict|cascade]

## 索引 index
- 聚集索引，非聚集索引
- 创建索引
create [] [|] index 索引名 ON 表名 (列名1 [次序][,列名2 [次序]...])
- 修改索引名
alter index 旧名 rename to 新索引名
- 删除索引
drop index 表名 索引名

## 视图
- 由1个or多个基本表到处的虚表，只有定义没有数据，以基表为标准
- 创建视图
create view 视图名 [(列名1 [,列名2 ...])] 
  AS 子查询 [with check option]
- 删除视图
drop view 视图名 [cascade]

# 数据控制DCL（安全）
## 用户
- 创建用户
  create user 用户名 identified by 密码
	default tablespace USERS--表空间名
	temporary tablespace temp --临时表空间名
    profile DEFAULT    --数据文件（默认数据文件）
	account unlock; -- 账户是否解锁（lock:锁定、unlock解锁）
- 删除用户
  drop user


## 权限
不同数据库的角色、权限、有所不同？？
grant
--GRANT 对象权限 on 对象 TO 用户    
grant select, insert, update, delete on JSQUSER to STUDENT;
 
--GRANT 系统权限 to 用户
 grant select any table to STUDENT;
  
--GRANT 角色 TO 用户
 grant connect to STUDENT;--授权connect角色
 grant resource to STUDENT;--授予resource角色

revoke
deny
用的更少，暂放

# 触发器 trigger
暂放

# 事务和事务级别

事务：数据库事务，一系列有限的数据库操作序列，是数据库管理系统执行过程中的一个逻辑单位，

AIDC？原子性 一致性 隔离性 啥啥性

啥啥读
不可重复读（多or少or再查不一致）
脏读（不再查，但不一致）

transaction isdation
- 级别区分：关系型数据库的一堆标准 数据库选用不一，如oracle只支持2 4
    - 1 未提交读 uncommitted read 没提交就可以读出
    - 2 已提交读 commited read 
    - 3 可重复读 repeatable read 
    - 4 串行化读 serializable 

数据库中有相同事务进行多线程运作时，对数据库增删查改等的控制，
多个线程接入同一个事务，对多方操作进行控制

- #查看事务隔离级别.
- mysql> select @@global.tx_isolation;
- mysql> select @@session.tx_isolation;
- #设置事务隔离级别.
- mysql> set global transaction isolation level $level;
- mysql> set session transaction isolation level $level;
- #可选事务隔离级别.
- READ-UNCOMMITTED
- READ-COMMITTED
- REPEATABLE-READ
- SERIALIZABLE
- #查看是否自动提交.
- mysql> select @@autocommit;
- #设置是否自动提交.
- mysql> set autocommit=0;
- #开始事务.
- mysql> start transaction;
- #提交事务.
- mysql> commit;
- #回滚事务.
- mysql> rollback;

[](https://www.jianshu.com/p/aa35c8703d61)
[](https://www.cnblogs.com/fjdingsd/p/5273008.html)


# 封锁、并发处理
## 读写锁
- 读锁，即共享锁，S锁 share啥啥
-
- 写锁，即排它锁，X锁 except啥啥
-

## 多级封锁策略？
- 一级
S
- 二级
X
- 三级
S

- 两段锁协议


## 死锁、活锁

