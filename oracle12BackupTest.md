
# 创建测试用户、表、数据
使用数据库实例test

- 创建测试用户testbak，口令testbak，并授权
create user testbak identified by testbak;
grant dba to testbak;

select * from user_role_privs; 查看当前用户or角色所拥有的角色


- 创建测试表test，并插入测试数据
create table test(name char(4), age number(2));

insert into test(name,age) values ('aa',1);
insert into test(name,age) values ('bb',2);
insert into test(name,age) values ('cc',3);
insert into test(name,age) values ('dd',4);
insert into test(name,age) values ('ee',5);

- 查看 select * from test;

# spool导出导入
## sqlplus中
- 默认的导入，带所有操作+操作结果
```
spool /home/oracle-xue/testSpoDefault.txt
select * from test;
spool off
```
- 若文件重名，会完全覆盖原内容

- 导出前参数or格式设置


## 脚本






