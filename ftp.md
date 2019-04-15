
# Windows 7 32bit自带
版本cn_windows_7_enterprise_x86_dvd_x15-70737.iso
## FTP服务器环境配置
详见《win7企业版搭建FTP服务器.doc》

本机通 局域网cmd通（主动模式port） 局域网chrome浏览器通
局域网IE通（被动模式pasv），edge不通（Error Code: INET_E_OBJECT_NOT_FOUND）
外网未测试

被动连接配置未解决，IIS管理器 - FTP防火墙支持
？？netsh advfirewall firewall add rule name=”FTP Service” action=allow service=ftpsvc protocol=TCP dir=in 最后，禁用有状态 FTP 筛选，以使防火墙不会阻止任何 FTP 通信。 netsh advfirewall set global StatefulFTP disable 
[windows FTP被动模式设置](https://blog.csdn.net/wuxingpu5/article/details/52457544)

win7 IIS中 FTP防火墙支持，主机主页里的“支持”可配置，网站下网点主页里的“支持”不可配置



# 工具类
- FileZilla  
 - 安装软件，FileZillaServer和FileZillaClient
 - 开源免费，方便高效。Windows自带的用起来真滴麻烦…防火墙配置，主动模式，被动模式……

- FtpUtil  
 - java编程
...



# Windows server 2008自带
虚拟机环境，版本cn_windows_server_2008_datacenter_enterprise_standard_x64_dvd_x14-26746.iso
## 一、设置用户组和用户
- 创建ftp管理用户ftpadmin，密码ftp+2008，添加ftpadmin进管理组，/add之后/expires:never可选择，表示账户？密码？永不过期
  ```
  net user ftpadmin ftp+2008 /add
  net localgroup Administrator ftpadmin /add
  ```
- 创建ftp用户组ftpUsers，测试用户ftptest，密码ftp+2008
  ```
  net localgroup ftpUsers /add
  net user ftptest ftp+2008 /add
  ```
- 添加ftptest进ftp用户组，从Users组中移除ftptest用户
  ```
  net localgroup ftpUsers ftptest /add
  net localgroup Users ftptest /delete
  ```
- 用户界面
  - 控制面板 - 管理工具 - 服务器管理 - 配置 - 本地用户和组
  - 管理工具 - 计算机管理 - 系统工具 - 本地用户和组

## 二、创建ftp站点目录并授权
  `mkdir c:\ftp`  
  添加ftpUsers组对文件夹的“读取执行、列出内容、读取”权限


## 三、搭建ftp服务器
- 图形界面，IIS控制台没有提供启动ftp站点服务？（ftp控制由web服务器IIS实现）  
  [命令提示符 启动ftp站点服务](https://zhidao.baidu.com/question/210697420.html)
- 安装ftp服务
 - 服务器管理器 - 角色 - Web服务器（IIS）- 角色服务ftp服务器 - 安装
- 配置ftp服务器
 - Web服务器 - Internet信息服务（IIS）管理器 - <主机名> - ftp站点
 - 新建ftp站点配置 
   1. ip为本机ip，TCP端口21
   2. ftp用户隔离选项？创建之后不能更改：不隔离
   3. ftp站点主目录 c:\ftp
   4. 站点访问权限：读取，写入
   5. SSL设置呢？？没找到orz
   6. 身份验证：匿名，基本
   7. 传输模式？在客户端配置？
   8. ...
- 本地浏览器测试ftp服务：ftp://ip地址
- 局域网cmd测试ftp服务（虚拟机只在初始基础上手动开放了ICMPv4文件和打印机共享-回显请求）

# cmd、ftp命令
- ftp命令：`ftp ipAddress`连接到ip为ipAddress的ftp服务器，`ftp`调起ftp程序
- ftp模式内部命令
  - [windows：常用ftp命令](https://blog.csdn.net/kaever/article/details/68941845)
  - open IP 连接远程
  - user [username][password] 用户登陆 user user用户名都可行
  - ? = help 查看命令帮助
  - lcd 切换本地下载目录，lcd /切回根目录，默认为c:\User\yourAccount\，Linux为当前登陆目录
  - get 远程目录要下载的文件名 [下载到本地当前目录的文件名]  下载单个文件
  - put 本地目录要上传的文件名 [上传到远程当前目录的文件名]  上传单个文件
  - mget mput 可使用通配符，支持批量多个文件，如 mget *.txt
  - delete 删除远程文件
  - rm 删除本地文件
  - bin 以二进制传输文件
  - quit = bye 离开ftp
  - !   从远程ftp服务器暂时进入本地shell
  - exit 从本地shell返回远程ftp
  - 其他远程服务器操作和Linux操作差不多 如dir cd pwd mkdir ls cp等
  - ...
  -
- cmd中切换用户 `runas /user:username cmd`

- Linux下命令一致？

## 参考
- [windows server2008 R2搭建ftp服务器](https://blog.csdn.net/qq_28189423/article/details/82221018)
- [用IIS搭建安全的ftp服务](http://www.cppblog.com/huyutian/articles/212273.html)
- [FTP,FTPS,FTPS与防火墙](http://blog.51c.com/netside/1359387)
- [FTP的连接方式（防火墙的配置）](https://blog.csdn.net/zonghua521/article/details/78197986)
- [浅谈防火墙对FTP的影响及故障排除](https://www.cnblogs.com/emanlee/archive/2013/01/07/2849680.html)
- 


---

# Windows server 2008 R2自带
版本cn_windows_server_2008_r2_standard_enterprise_datacenter_web_x64_dvd_x15-50360.iso



