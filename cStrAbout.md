# 高低位存储

INTER使用的低位存储，其他处理器一般使用高位存储
低位存储：小端，内存中的高位存储的是数字的低位，内存低位存储的是数字的高位。
高位存储：大端，内存高位存储的是数字的高位，内存低位存储的是数字的低位。
比如说0Xabcd，在低位存储中就是0xcd，0xab，而在高位存储中则是0xab，0xcd

linux使用高位存储？




# 字符编码
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


[C语言字符串操作总结大全(超详细)](https://www.cnblogs.com/lidabo/p/5225868.html)

# 库函数
stdio.h 有
stdlib.h 有

字符串赋值
复制
追加
切割
末尾\0
比较

strcpy 复制字符串 连结束符一起复制
char *strcpy(char *dest, const char *src) 把 src 所指向的字符串复制到 dest
srtncpy 按长度复制，不加\0

strcat

strcmp 比较字符串
strncmp 比较指定长度的字符

strstr(str1,str2) 判断字符串str2是否是str1的子串。如果是，则该函数返回str2在str1中首次出现的地址；否则，返回NULL

memcpy 按长度复制，不理会结束符，基于内存
void *memcpy(void *str1, const void *str2, size_t n) 从存储区 str2 复制 n 个字符到存储区 str1
memmove

sprintf 发送格式化输出到str所指向的字符串，已有则覆盖，即从str数组的第一个元素开始写入新的内容，会加结束符'\0'

sscanf 从一个字符串中读进与指定格式相符合的数据，会加\0

malloc 分配空间，不初始化，分配后内容随机
[C语言中手把手教你动态内存分配](https://blog.csdn.net/qq_29924041/article/details/54897204)

[sprintf，你知道多少？](https://blog.csdn.net/sjf331/article/details/339254)

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
