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

strcat

strcmp 比较字符串
strncmp 比较指定长度的字符

strstr

memcpy 按长度复制，不理会结束符，基于内存
memmove


sprintf 会加结束符'\0'
sscanf 会加\0

malloc 分配空间，不初始化，分配后内容随机
[C语言中手把手教你动态内存分配](https://blog.csdn.net/qq_29924041/article/details/54897204)

atoi() 把参数str指向的字符串转换为一个整数，字符串343，转整型343；字符串abs，整型值0

时间戳 字符串 转换
