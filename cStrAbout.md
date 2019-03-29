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
