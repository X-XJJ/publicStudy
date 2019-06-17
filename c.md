# C语言编程 相关链接
[ORACLE的ProC用法讲解](http://blog.sina.com.cn/s/blog_9b0604b40101kueq.html)
[C语言采用嵌入式方式操作数据库exec_sql](https://wenku.baidu.com/view/ba16df3210a6f524cdbf8522.html)

[Linux下的段错误(Segmentation fault) ](https://www.cnblogs.com/zl-graduate/p/5735288.html)

[项目经验之谈--栈破坏 -- 案例二](https://blog.csdn.net/LMmcu_2012/article/details/59035730)

[用gdb调试程序笔记: 以段错误(Segmental fault)为例](https://www.cnblogs.com/lidabo/p/4234360.html)

Segmentation fault(Core Dump) https://www.cnblogs.com/foreverW/p/7295201.html

C语言负数转正数的隐藏缺陷https://blog.csdn.net/u010603292/article/details/9451365
即char int 等的取值范围，精度and溢出问题

mkdir()
[c 使用mkdir()函数创建路径](https://blog.csdn.net/freesonWANG/article/details/80792697)
[mkdir()提示No such file or directory错误的解决方法](www.02405.com/program/php/1692.html)


## 系统类？
函数名  |作用  |成功返回|否则返回|备注
--------|------|--------|--------|----
system()|执行shell命令
popen() |执行shell命令，读取命令的返回值，并通过管道和shell命令进行通信

对应使用pclose() 结束进程，关闭标准I/O流，等待命令执行结束，返回shell的终止状态
[system()、popen()](https://blog.csdn.net/sweetfather/article/details/79988819)


ferror() 测试给定流stream的错误标识符
feof()   检测流文件是否结束
[feof和ferror函数，C语言feof和ferror函数详解](http://c.biancheng.net/view/382.html)

strerror() 从内部数组中搜索参数传入的错误号，返回指向错误消息字符串的指针


- 函数定义
FILE *popen(const char *command, const char *type);
int pclose(FILE *stream);



# 文件相关
函数名|作用  |成功返回|否则返回|备注
------|------|--------|--------|----
fgets |读一行 到n-1个字符or换行符|相同的str参数|空指针，str不变|常用语

FILE *filePoint 创建文件句柄

- 函数声明
char *fgets(char *str, int n, FILE *stream)


# 字符串相关
## 高低位存储
INTER使用的低位存储，其他处理器一般使用高位存储
低位存储：小端，内存中的高位存储的是数字的低位，内存低位存储的是数字的高位。
高位存储：大端，内存高位存储的是数字的高位，内存低位存储的是数字的低位。
比如说0Xabcd，在低位存储中就是0xcd，0xab，而在高位存储中则是0xab，0xcd

linux使用高位存储？

## 编程？
&& 逻辑与，即and
& 按位与，通常使用0x0f来与一个整数进行&运算，来获取该整数的最低4个bit位
|| 逻辑或，即or
| 按位或，

[C/C++ &与&& |与|| 的区别](https://www.cnblogs.com/kuihuayou/p/7365075.html)
[C的|、||、&、&&、异或、~、！运算 位运算](https://www.cnblogs.com/luyi14/p/4117393.html)


## 字符编码
ACSII 
American Standard Code for Information Interchange:美国信息交换标准代码
是基于拉丁字母的一套电脑编码系统，主要用于显示现代英语和其他西欧语言
GBK 中文字符编码
ANSI

Unicode 编码表 通常为十六进制编码方式
存储方式：utf-8常用，还有 utf-16 utf-32
utf-8 一个中文字符存3位？

中文存储片区：4E00-9FA5

---

字符编码:ASCII UNICODE GBK ANSI

ASCII:美国的编码标准

UNICODE:万国码，能涵盖所有国家的编码语言

GBK:中文字符编码

ANSI:扩展的ASCII->前8位用来表示ascii的编码,后面的是根据不同地区的ANSI语言进行扩展的
    比如后续的编码值就是GBK一一映射上去的。
    所以中文系统的ANSI后续的扩展就是GBK编码

unicode:
    目前unidode分为17组编排,0x0000-0x10FFFF,其中的话,0x0000-0xffff就属于第一组
    每平面拥有65536个码位置,一共1114112个。

    中文的片区是4E00-9FA5;
    UTF-BOM->文件前缀会多一个EFBB,这个用来标识他是UTF-8的编码
    UTF-8:->web基本使用这个
    0X00-0X7F->这部分与ascii编码一致，一共127个，完全对应。(最低一字节,最多四字节)

    UTF-8的表示编码存储方式
    Unicode编码(十六进制)   UTF-8字节流(二进制)
    其中:需要看每个字节的字节首部
    如果字符存储需要一个字节
    那么第一位就是0

    依次:第二位是11,表示着一共有两字节,后面会再读取一个字节,并且会读取xxxxx的值来解析它的字符值
    000000-00007F           0xxxxxxx
    000080-0007FF           110xxxxx 10xxxxxx
    000800-00FFFF           1110xxxx 10xxxxxx 10xxxxxx
    010000-10FFFF           11110xxx10xxxxxx10xxxxxx10xxxxxx

    UTF-16:

    UTF-16的编码存储方式
    对于UTF-16 每个字符被编成一至两个码元,每个码元16位,但其实实际占用的为10bit,前6位用于标识使用

    如果字符的编码大于0x10000,那就会使用U'=U-0x10000,由于unicode的最大值为0x10FFFF

    那么使用最大的unicode值来做存储的方式0x10FFFF,将0X10FFFF-0x10000=0xFFFFF(20bit)
    存储的方式为:110110yyyyyyyyyy 110111xxxxxxxxxx

    其中,y为高10位，x为低10位
    
    0x10FFFF的二进制存储为:1101101111111111 1101111111111111
    后面跟110111的个人理解，如果为110111的话，那么将取出它的后10位与上一个读取的前10位来组合成一个20bit的unicode值

    UTF-32:
    其4字节的值就代表了它的unicode值，每个字符都要4字节，基本用不到


---

在线工具：[查看字符编码（简体中文）-----GBK内码查询](http://www.mytju.com/classcode/tools/encode_gb2312.asp)

---

- 回调函数：
- 回调函数就是一个通过函数指针调用的函数。如果你把函数的指针（地址）作为参数传递给另一个函数，当这个指针被用来调用其所指向的函数时，我们就说这是回调函数
- 使用者自己定义一个函数，实现这个函数的程序内容，然后把这个函数（入口地址）作为参数传入别人（或系统）的函数中，由别人（或系统）的函数在运行时来调用的函数
- 简单来说，就是由别人的函数运行期间来回调你实现的函数



---
[[参考]ASCII对照表 及 字符与二进制、十进制、16进制之间的转化（C/C++）](https://www.cnblogs.com/stxs/p/8846545.html)

[聊聊gbk与utf8互转的乱码问题](https://blog.csdn.net/csdn_ds/article/details/79077483)
[UTF-8和GBK等中文字符编码格式介绍及相互转换](https://blog.csdn.net/Qsir/article/details/78425199)

[彻底搞懂编码 GBK 和 UTF8](https://www.cnblogs.com/hehheai/p/6510879.html)

[【字符编码系列】常用的几种字符编码(GBK，UTF-8，UTF-16)](https://segmentfault.com/a/1190000012470400)

[字符编码笔记：ASCII，Unicode 和 UTF-8](http://www.ruanyifeng.com/blog/2007/10/ascii_unicode_and_utf-8.html)


字符范围表
[Unicode汉字字符符号全角符号特殊字符的范围](https://blog.csdn.net/weixin_43189735/article/details/85628799)
[Unicode中文和特殊字符的编码范围](https://blog.csdn.net/lb521200200/article/details/53606864)
[unicode汉字编码](https://www.cnblogs.com/yuanke/p/7889899.html)
如 http://www.unicode.org/charts/PDF/UFF00.pdf

[各种编码UNICODE、UTF-8、ANSI、ASCII、GB2312、GBK详解](https://blog.csdn.net/lvxiangan/article/details/8151670) 含URL和各种前端错误情况示例

---



## 库函数

getenv() 获取参数环境变量的内容

通常为stdio.h stdlib.h 没有的现调找库

来源：source → src
目的：destination → dest
把src所指向的字符串复制到dest

函数名    |作用               |\0 |函数返回
----------|-------------------|---|--------
strlen()  |取字符串长度       |有取字符串二进制or二进制长度的否？
strcpy()  |复制字符串         |√ |
srtncpy() |复制指定长度字符串 |？ |
strcat()  |追加字符串？
strncat() |追加指定长度字符串？
strcmp()  |比较字符串
strncmp() |比较指定长度字符串
strcasecmp()|忽略大小写比较字符串
strchr()  |查找单字符 strrchr() |反向查找单字符
strstr()  |查找子串    |？|返回str2在str1中首次出现的地址 否则NULL
strpbrk() |查找集合内任意字符 其他不常用 strspn strcspn
memcpy()  |按长度复制 不理结束符 基于内存 从存储区str2复制n个字符到存储区str1
memmove() |
sprintf() |赋值 格式化输出到str所指向的字符串 会覆盖 即从str数组的第一个元素开始写入新的内容|√|
sscanf()  |从一个字符串中读进与指定格式相符合的数据，会加\0
---|
strtod()  |从字符串中转换double类型？
strtol()  |字符串中传唤long类型？
atoi()    |字符串→int
atof()    |字符串→double
atol()    |字符串→long
---|字符检查
isalpha() |是否字母 isupper大写字母 islower小写字母
isdigit() |是否数字 isxdigit十六进制数字表示的有效字符
isalnum() |是否字母和数字
isspace() |是否空格
iscntrl() |是否控制字符
ispunct() |是否标点
isprint() |是否可打印字符
isgraph() |是否图形字符 = isalnum | ispunct

- 函数原型（且用且补充）
char *strcpy(char *dest, const char *src)
void *memcpy(void *str1, const void *str2, size_t n)

字符串赋值
复制
追加
切割
比较


malloc 分配空间，不初始化，分配后内容随机
[C语言中手把手教你动态内存分配](https://blog.csdn.net/qq_29924041/article/details/54897204)

[sprintf，你知道多少？](https://blog.csdn.net/sjf331/article/details/339254)
使用%.*s进行输出时，后面对应两个参数a,b，a表输出数据占用位置大小，b表输出内容

[C++：strcmp与strncmp的比较](https://blog.csdn.net/u011028345/article/details/76571569)

[strcpy、strncpy与memcpy的区别与使用方法](https://www.cnblogs.com/houjun/p/4913216.html)

[sscanf非常的重要](https://www.cnblogs.com/lanjianhappy/p/6861728.html)会自动加\0

[C语言的字符串查找函数](https://blog.csdn.net/haiross/article/details/45746083)

[C/C++ memmove与memcpy的区别及实现](https://www.cnblogs.com/lyl-312/p/5514988.html)

[sprintf函数详解](https://blog.csdn.net/jobsss/article/details/8131744)

[C语言中时间的处理（一、字符串和时间戳的相互转换）](https://blog.csdn.net/sinat_34357675/article/details/78195615)

[时间格式化函数strftime和strptime使用](https://blog.csdn.net/hittata/article/details/8090228)

[Linux 下c获取当前时间（精确到秒和毫秒或者微秒）](https://blog.csdn.net/deyuzhi/article/details/51814934)

[C语言如何获得精确到毫秒的时间](https://blog.csdn.net/witxjp/article/details/8079751)
[C语言获取时间的相关函数，包括如果获取微妙、毫秒级时间](https://blog.csdn.net/code_robot/article/details/33305375)

[linux C 获取日期时间](https://blog.csdn.net/rookie_zhu/article/details/8610219)

atoi() 把参数str指向的字符串转换为一个整数，字符串343，转整型343；字符串abs，整型值0

time_t类型 和 time()系列 10位秒级时间戳
timeval类型 和 gettimeofday()系列 毫秒级时间戳，几位？

[C语言中time函数和localtime获取系统时间和日期](https://blog.csdn.net/qq_22122811/article/details/52741483)
时间戳 字符串 转换

[c语言中的移位运算符](https://blog.csdn.net/qq_38181018/article/details/78236147)


