
- 奇偶校验
- 累加校验
- 因特网校验？
- CRC循环冗余校验 Cyclic Redundancy Check
  - 根据根据网络数据包或电脑文件等数据产生简短固定位数校验码的一种散列函数，主要用途：错误侦测，用来检测或校验数据传输或者保存后可能出现的错误。错误侦测的
  - 原理：校验码即余数 = 信息码后添加冗余位 mod 生成多项式码
  - 校验码位数 = 冗余位位数 = 生成多项式码位数 - 1，冗余位全为0，校验码位数算出来不够则在前面补0
  - 此处的除留余数，二进制，使用为异或
  - 发送方：使用原理计算出校验码，信息码后添加校验码，发送
  - 接收方：(信息码+校验码) mod 生成多项式码 = 0
  - 生成多项式

## Servlet原理
- C/B 请求 → server服务端（含tomcat → servlet） → 结果返回C/B
- servlet 线程池
  - 对于tomcat每次的请求都给他分配一个线程，用完将线程返回servlet
  -

## tomcat
### 安装
- /bin：startup.bat/sh开启 shutdown.sh/bat关闭
- webapp/
- config/：service.xml全局配置文件，一般不在这里进行详细配置 各种配置文件.xml catalina/目录配置文件.xml

## URL
URL 统一资源定位符 Uniform Resource Locator

URL是全球资源定位符的英文所写，您平时上网时在IE浏览器中输入的那个地址就是URL。比如：网易 http://www.163.com就是一个URL。
URI是Web上可用的每种资源 - HTML文档、图像、视频片段、程序,由一个通过通用资源标志符(Universal Resource Identifier, 简称"URI")进行定位。 
URL的格式由下列三部分组成: 
第一部分是协议(或称为服务方式);
第二部分是存有该资源的主机IP地址(有时也包括端口号);
第三部分是主机资源的具体地址。

URI一般由三部分组成: 
访问资源的命名机制。
存放资源的主机名。
资源自身的名称，由路径表示。

URI 是从虚拟根路径开始的
URL是整个链接

# TCP
三次握手，四次

# UDP

