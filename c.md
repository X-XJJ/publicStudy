[C语言中文网](http://c.biancheng.net/)

## 指针、数组
- 数组：
- 指针：
- 二重指针：
- 指针函数：

### 相关链接
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

pow(x,y) 计算x^y的标准库函数


readfp = fopen(readfile,"r");
if(readfp == NULL)
{
    /*errno为<errno.h>中预定义的外部int变量 表示最近一个函数调用错误与否 0-正确*/
    /*输出错误号对应的信息void perror(错误信息前显示的字符串) 或 char*strerror(int 错误号)*/
    printf("打开查找文件错误:%d-%s\n",errno,strerror(errno));
    //perror("打开查找文件错误:");
    EXEC SQL disconnect all;
    return -1;
}

fopen()
w+ 创建or截断0模式
a+ 创建or追加写模式
fgets()

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

- FILE *filePoint 创建文件句柄

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

# 库函数

include<stdio.h>标准库中的常用函数
- printf()

getenv() 获取参数环境变量的内容

通常为stdio.h stdlib.h 没有的现调找库

来源：source → src
目的：destination → dest
把src所指向的字符串复制到dest

char *time;
错误用法；strcpy(time,"aaa"); sprintf(time,"%s","aaa");
？？需要看一下这俩的函数声明，啥格式

## 字符串相关
### stdio.h


### string.h
- srtncpy() 复制指定长度字符串 是否默认添加\0？ char *strncpy(char *dest, const char *src, int n)

strcpy()  |复制字符串strcpy(s,t) 复制t到s里 以t中\0为止 注意溢出问题 默认添加\0
strlen()  |取到\0为止的字符串长度 不含\0|有取字符串二进制or二进制长度的否？
strcat()  |追加字符串 strcat(s,t) t拼接到s的末尾，若超s长会怎样？
strncat() |追加指定长度字符串？
strcmp()  |比较字符串|返回=0-str1=str2 返回＜0-str1＜str2 返回＞0-str1＞str2
strncmp() |比较字符串前n个字符|int strncmp(const char *str1, const char *str2, size_t n)
strcasecmp()|忽略大小写比较字符串
strchr()  |查找单字符 strrchr() |反向查找单字符
strstr()  |查找子串    |？|返回str2在str1中首次出现的地址 否则NULL
strpbrk() |查找集合内任意字符 其他不常用 strspn strcspn
strsep()  |分割字符串|改变源字符串
strtok()  |分割字符串|改变源字符串
strdupa() |
strdup()  |
memcpy()  |按长度复制 不\0 基于内存 从存储区str2复制n个字符到存储区str1
memmove() |
memcmp()  |
memncmp() |比较两个存储区的前n个字节
sprintf() |赋值 格式化输出到str所指向的字符串 会覆盖 即从str数组的第一个元素开始写入新的内容|√|
sscanf()  |从一个字符串中读进与指定格式相符合的数据，会加\0
----------|------
strtod()  |从字符串中转换double类型？
strtol()  |字符串中传唤long类型？将字符串转换为长整数
atoi()    |字符串→int
atof()    |字符串→double
atol()    |字符串→long
-字符检查-|-
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

- 分割字符串 s-待分解字符串 delim-指定分隔字符串
- char *strtok(char **s, const char *delim); ***
  - 返回值：一次分割后的子串？若不能再分割则返回NULL
  - strtok将找到的首次出现的、且属于delim中的字符替换为NULL，随后再分割则需调用NULL开头的的剩余字符串
  - 第一次调用分割函数strtok(字符串,分隔符)时，入口为待分割字符串源
保留上次分割的地址 返回被切下字符串的首地址 后续调用入口即为NULL
  - strtok会改变源字符串，将包含在分隔符内的字符修改为'\0'或其他
~~~
temp = strtok(srcline,","); 
for(i = 1; i < field-1 && temp != NULL; i++)
{
  temp = strtok(NULL, ",");
}
strcpy(temp,strtok(NULL, ",")); 
~~~


- char *strsep(char **s, const char *delim); ***
  - 分割字符串 改变源字符串，功能类似strtok
  - 如果输入串中有连续的多个字符属于delim，strtok下一个开头为NULL，strsep返回空串""


- strcat()
char *strcat(char *dest, const char *src)
把 src 所指向的字符串追加到 dest 所指向的字符串的结尾

- strstr()
char *strstr(字符串a,字符串b) 返回a中第一次找到b的位置，不包含终止符'\0'即NULL
找不到则返回NULL


## 其他
- 换行 `\n` n为“new line”的缩写


### printf()、sprintf()
- int printf(const char *format, ...);
  - printf("字符串or输出控制符们", 对应的输出参数们);
  - 控制符
    - %d 整型，%ld 长整型，%u 无符号整型，%f 浮点数，%c 字符，%s 字符串
    - %x 十六进制整数，%o 八进制整数
    - 宽度 m 如%3d.g

- int sprintf(char *str, const char *format, 输出参数们...)
- format：%[flags][width][.precision][length]specifier
  - 字符串，包含了要被写入到字符串 str 的文本。它可以包含嵌入的 format 标签，format 标签可被随后的附加参数中指定的值替换，并按需求进行格式化
  - flags 标识
  - width 宽度
  - .precision 精度
    - 对于%s，优先级 精度＞宽度
    - 对于%s，精度.precision = 输出字符的最小数目，宽度width = 要输出的最大字符数
  - length 长度
  - specifier 说明符
  - 附加参数：附参个数 = %个数，每个参数包含一个被插入的值，按序替换format中的各个%标签

[C 库函数 - sprintf()](https://www.runoob.com/cprogramming/c-function-sprintf.html)

malloc 分配空间，不初始化，分配后内容随机
[C语言中手把手教你动态内存分配](https://blog.csdn.net/qq_29924041/article/details/54897204)

[sprintf，你知道多少？](https://blog.csdn.net/sjf331/article/details/339254)
使用%.*s进行输出时，后面对应两个参数a,b，a表输出数据占用位置大小，b表输出内容

[C++：strcmp与strncmp的比较](https://blog.csdn.net/u011028345/article/details/76571569)

[strcpy、strncpy与memcpy的区别与使用方法](https://www.cnblogs.com/houjun/p/4913216.html)

- sscanf()
/*sscanf(a,"",b) 从字符串a中读取与指定格式""相符的字符们到空串b中*/
//本句表示 跳过第一个字符，开始取，取到字符冒号"为止
sscanf(temp,"%*c%[^\"]",company);

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


# 基本
- C语言程序组成：函数 + 变量
- 函数包含：若干语句，指定要执行的计算操作们，用花括号｛｝括起来
- 变量：存储计算过程中使用的值，必须先声明，后使用
- 每个程序都从main函数的起点开始执行

- 变量与算术表达式
- 由基本数据类型组成：数组、结构、联合
- 指向这些类型的：指针，返回这些类型的：函数
- 指向变量的指针 = 存储该变量的地址

- 幻数：？？
- 参数
  - 实参，实际参数，函数调用中与形参对应的值，如 c = power(3,2)的3、2
  - 形参，形式参数，函数定义中()内列表中出现的变量，如int power(int m, int n)的m、n，int getline(char s[], int n)
- 函数定义，函数原型，函数声明-在main之前带分号的

- 定义 define：创建变量，分配存储单元or留出存储空间
  - 定义 #define A B
  - 将符号名字/符号常量(A)定义为一串任意特定的字符序列(B)，末尾无分号
  - 如 #define UPPER 30，#define CHAR 'a'，#define STH "sss33dd"
  - 如 int sp; char s[MAXSIZE]; double val[MAXVAL];
- 声明 declaration：标明变量的性质和属性（主要是类型），不分配存储单元，包括一个类型名和一列变量
  - 变量、数组声明如 int a,b; char a[]; extern double val[]; val大小在其他地方决定
  - 函数声明如 int add(int,int); void dosth();
- 相同形式的语句是定义or声明还需要看语句所处的位置，也可能又是定义，也是声明

- 空语句：只有分号;的语句

- C语言中，注释/**/不允许嵌套
-
- 文本流：被划分为多行的字符序列，每一行包含0到n个字符，行末带换行符
- 标准库所支持的输入输出模型中，文本都被视为字符流


# 类型、运算符、表达式
- 数据类型、变量、常量等等
## 数据类型、大小
- 基本数据类型
  - int：带符号整数
    - 通常16位or32位（具体看机器字长），至少16位，取值 (-2^15) ~ (2^15 - 1)，即 -32768 ~ 32767
  - float：带符号浮点型
    - 通常32位，至少6位有效数字，取值 10^(-38) ~ 10^38
  - char：字符型
    - 通常8位 = 一个字节
  - double：双精度浮点型，位数？
- 用于整型int的限定词，声明中int可省略
  - short：短整型 = short int，至少16位，小于具体int
  - long：长整型 = long int，至少32位，大于具体int
- 用于double的限定词
  - long：指定扩展精度浮点数，浮点对象大小由具体实现定义
- 用于char和任何整数类型的限定词
  - signed：有符号
  - unsigned：无符号
    - 被限定的无符号数必为正数或0，遵循模2^n原则，n = 改数据类型的比特位数
    - 如 若char为8bit，unsigned char值域0~255，signed char值域-128~127（机器采用二进制补码）
  - 没限定的char是否有符号取决于具体机器
  - 可打印字符必为正值
- 综上一般，单个字节为char，双字节单元可当做一个short型整数，连续4字节可构成一个long型整数
- 标准头文件 <limits.h> <float.h>，包含具体及其和编译器相关的所有大小特性的符号常量
## 常量、变量
- 程序处理的基本数据对象：变量，常量
### 变量
- 变量名：字母，数字
  - 传统C的习惯：变量名小写字母，符号常量全大写
  - 内部名字：前31个字符有效；外部名字：前6个字符唯一性且不分大小写
  - 变量在使用前必须声明，一个声明指定一个类型，包含1个or多个由此类型变量组成的列表
  - 未显示初始化的自动变量的值是未定义的，如无用数据
- 内部变量 = 局部变量 = 自动变量
- 外部变量：用extern语句显式声明，默认初始化为0，如 extern int max;
  - 外部变量的存储单元位于各函数的外部，使用外部变量前需知道外部变量的名字
    - 在源文件使用外部变量的函数前，就定义好外部变量
    - 或者，在函数中使用extern声明来建立该变量与其定义之间的联系
    - 或者，所有extern声明都放在单独头文件里，源文件#include包含一下
- 静态变量：默认初始化为0
- 限定符const，限定该变量/数组/数组参数...的值不可改变，产生静态作用，但也有修改途径
### 常量
- 常量表达式：只包含常量的表达式，编译时完成求值，可用于常量能出现的任何位置
- 常量后缀
  - int，double不带后缀
  - float：f 或 F
  - long：l 或 L，如123456789L，int超过存储范围则被当做long处理
  - unsigned：u 或 U
  - unsigned long：ul 或 UL
  - 浮点常量包含小数点or指数or二者皆有
- 进制表示整数值
  - 八进制：0开头，如 八进制037 = 十进制31 = 十六进制0x1f 或 0X1F
  - 十六进制：0x 或 0X 开头，如 十六进制0XFUL = 值为十进制15的unsigned long型常量
- 字符常量
  - 产生一个整数，值 = 具体机器字符集中该字符对应的数值
  - 形式为单引号引上的单个字符，如'A'对应ACSII字符集65，'\n'代表换行符对应10
  - 可以像其他任何整数一样参与数值运算
    - char类型的字符是小整型，算术表达式中char的变量常量 <=> int变量常量
    - 如：int d = c - '0'，c-'0'是一个整型表达式
    - 当'0'~'9'是连续递增的值，且c中存的范围为'0'~'9'时，会得到的d=c字符所对应的数
    - 如 char c = '7'; int d = c - '0'; 得到d值为7
    - 如 ASCII中大写字母对应的小写字母差值固定，int a = 'E'; int b = 'a' - 'A'; int d = a + b; 得到d，printf("%c,%d",d,d); 将得到结果：e,ASCII中e对应的数值
- 字符串常量 = 字符串字面值
  - 双引号引的字符序列，含0~n个字符，"\n"为只有换行符的字符串
  - 技术角度：字符串 = 字符数组
  - 空字符'\0' 标记字符串结束，存字符串的物理空间比""内多1，为安全考虑设置数组大小时需留结束符位置，如char date[8+1];
  - 字符串函数相关标准头文件 <string.h>
- 枚举常量
  - 枚举：由常量整数值组成的列表，不同枚举常量名不可重复
  - 值可给定，可自动生成，可给定数值，默认则从0开始，值依次递增1
  - 如 enum bollean{NO,YES}; enum week{FIS=1,FRI}; enum escapes{BELL='\a',TAB='\t'};
- 指定字节大小的任意位模式
  - 形式：'\ooo' 或 '\xhh'
  - ooo = 1~3个八进制数字（0~7），hh = 1~n个十六进制数字（0~9 a~f A~F）
  - 如 #define BELL '\007' = #define BELL '\x7' 表示定义ASCII响铃符
- 转义序列，表示单个字符，表示无法打印or不可见的字符，转义字符\
  - \a 响铃符
  - \n 换行符；\f 换页符
  - \b 回退符；\r 回车符
  - \t 表式横向制表符；\v 纵向制表符
  - \ooo 八进制数；\xhh 十六进制数
  - \' \" \\ 单引双引反斜杠，用\转义，类似等等语法内特殊字符
  - \0 空字符，数值 = 0
## 运算符
- 二元算术运算符：+ - * / %
  - 从左到右进行结合
  - 整数除法操作执行舍位，舍弃结果中的小数部分
  - % 不能用于浮点数
  - 负数操作中，/的截取方向、%结果的正负取决于具体机器，上溢下溢的处理也是
- 关系运算符：< > <= >=
- 相等运算符：== !=
- 递增递减运算符：++ --
  - 只能作用于变量如++i，不能用于表达式如(i+j)++
  - 做前缀运算符时，先变再用；做后缀运算符时，先用一次再变
  - 利用更紧凑，如
    -  if (s[i] != c) {         s[j] = s[i];         j++;     }
    -  <=>  if (c == ‘\n’) {         s[i] = c;         ++i;     }
- 赋值运算符：= op=
  - op为大多二元运算符，{+ - * / % << >> & ^ |}∈op
  - 使用形式：expr1 op= expr2
    - 如 a /= b + 1 <=> a = a/(b + 1)，理解：将a增加(b+1)，将(b+1)加到a中
  - 赋值表达式类型 = 其左操作数/表达式结果类型，赋值表达式值 = 赋值完成后的值
  - bitcount统计其整数参数中为1的比特位的个数，将参数x声明为unsigned类型保证了x向右位移时空出的比特位会被填充为0，无论程序运行在何种机器上
  ~~~
  int bitcount(unsigned x)
  {//统计整数中为1的比特位个数
    int b;
    for (b = 0; x != 0; x >>= 1)
      if (x & 01) b++;
    return b;}
  ~~~
- 逻辑运算符：&& || !
  - ! 一元，逻辑取反，将非0值转换为0，将0值转换为1（~为位运算符）
  - 从左到右进行逻辑真假求值，一旦得知结果真假，立即终止求值比较
  - 是个很有用的特性，利用好设计条件判断
  - 关系为真时，表达式数值 = 1，为假时 = 0
  ~~~
  #include<iostream>
  using namespace std;
  int main() {
    int a = 10; int b = 0;
    cout << "a:" << a << "，a的逻辑反是：" << !a << endl;
    cout << "b:" << b << "，b的逻辑反是：" << !b << endl;
    cout << "a:" << a << "，a的位反是：" << ~a << endl;
    cout << "b:" << b << "，b的位反是：" << ~b << endl;
    return 0;
  }//from https://blog.csdn.net/liuweiyuxiang/article/details/85853958
  ~~~
- 按位运算符：& | ^ << >> ~
  - 与 或 异或 左移 右移 取反（一元-在数值的二进制表示里-按位01互变）
  - 只能用于整型操作数，即有符号or无符号的char、short、int、long int
  - 看操作数的对应比特位，按位运算得到结果值
  - 与 & 全1得1，其他得0，常用0屏蔽一些位，∵原 & 1 = 原，原 & 0 = 0
    - 如 n = n & 0177; 将n除了低7位之外的比特位设为0，八进制0177=二进制000 001 111 111，低7bit都是1
  - 或 | 有1得1，其他得0，常用1打开某些位，∵原 | 1 = 1，原 | 0 = 原
    - 如 x = x | SET_ON; 按SET_ON中为1的位，将x中对应位为设为1
  - 异或 ^ 不同为1，相同为0，值不同则该位设为1，相同则该位设为0
  - 移位 << >> 按右操作数指定的位数（非负），将左操作数按位左移or右移，空出的位填充0
    - 如 `x << 3` 将x左移三位 <=> x乘2^3
    - 特殊：右移一个有符号数，有机器填充符号位（算术右移），有机器填充0（逻辑右移）
  - 取反 ~ 1变0，0变1，每个比特位依次变换
    - 如 x = x & ~077，将x的最后6位设为0，先将077取反得111 000 000，x与 ~077的字长无关，比直接 x & 0177700等形式可移植性更好，后者假定x为16bit
  - 例 getbits(x,p,n)，返回x中从位置p起往小数n个比特位（已右对齐），假定位置0为右端的比特位，np合理正值，getbit(x,4,3)返回位置为4、3、2的（并经过了右对齐的）比特位
  ~~~
  /* getbits：获取从位置p起始的n个比特位 */
  unsigned getbits(unsigned x, int p, int n)
  { return (x >> (p+1-n)) & ~(~0 << n); }
  ~~~
  - 表达式 x >> (p+1-n) 将所需位段移动到字的右端；~0是比特值全为1的数，然后左移n位，将右边的n个比特位设置为0，后用~取反得到右n个比特位为1的掩码 
- 三元运算符：expr1 ? expr2 : expr3
  - 用于写条件表达式，若expr1和expr2不同类型，则都按宽的转换
  - 若表达式expr1求值为真（非0值），则求expr2的值并作为整个条件表达式的值；若expr1为假，则求expr3并作为最终结果
  - 如 求a与b的最大值 z = (a > b) ? a : b;
  - 打印数组中的 n 个元素， 每10个元素一行，各列用一个空格分开，并且每行（包括后一行）以换行符结束
  ~~~
  for (i = 0; i < n; i++)
  printf(“%6d%c”, a[i], (i%10==9 || i==n-1) ? ‘\n’ : ‘ ’);
  ~~~
- 逗号运算符：,
  - 逗号分开的一对表达式，从左到右求职，结果的类型和值和右操作数相同
  - 常用在for()中设置多个表达式 ≠ 函数参数、声明中的逗号分隔符
  ~~~
  #include <string.h>
  int reverse(char s[])
  {// 颠倒字符串
      char temp;
      int i,j;
      for(i = 0, j = strlen(s) - 1; i < j; i++, j--)
      {
          temp = s[i];
          s[i] = s[j];
          s[j] = temp;
      }
  }
  ~~~
- 取地址运算符：& 一元，只能用于内存中的对象（变量、数组元素），不能用于表达式、常量
- 间接indirection/解引用dereferencing运算符：* 一元，当用于指针时，为访问此指针所指向的对象
- 优先级
  - 从上到下优先级依次降低↓，不标大于默认同级，不标结合律默认从左到右，左→右
    - `() [] -> .`
    - `! ~ ++ -- + - * & (类型) sizeof` 右→左（此处 + - * & 为一元运算符）
    - `* / %` ＞ `+ -` （此处 + - * 为二元运算符）
    - `<< >>`
    - `< <= > >=`
    - `== !=`
    - `&` ＞ `^` ＞ `|` ＞ `&&` ＞ `||`
    - `?:` 从右到左，右→左
    - `= += -= *= /= %= &= ^= |= <<= >>=` 右→左
    - `,`
  - 如 `d = c >= '0' && c <= '9'` <=> `d = ((c >= '0') && (c <= '9'))` 表达式真时d置1
## 类型转换
- 自动转换：一般将“较窄的”转换为“较宽的”，防止丢失信息（可能丢信息的表达式会警告）
  - 如 同时存在int和long，将int转为long
  - 特殊：float不会自动转double，节省大型数组的存储空间
  - 含有unsigned类型的转换更复杂，有符号值和无符号值的比较与机器有关
    - 如 当unsinged int的1U被提升为signed long时，-1L＜1UL；而当-1L被提升为unsigned long后变成一个大正数，-1L＞1UL
- 赋值时的类型转换：右边的被转为左边变量的类型，即结果类型；较长整数转为较短整数or字符时，去掉超出的高位部分
- 传参时的类型转换：
  - 没有函数原型时，char、short转int，float转double
  - 有函数原型进行声明时，函数调用时自动进行参数的强制类型转换
- 显式转换 = 强制转换：(类型名)表达式，强制转换一元运算符为(cast)
- C语言定义保证机器的标准可打印字符集中的所有字符都非负，但任意给定比特模式的字符变量可能在某些机器上为负
- 为可移植性，若要将非字符数据存于char型变量中，最好指定signed或unsigned类型
-
- 标准头文件 <ctype.h> 定义一组独立于字符集的、用于字符测试和转换的函数
  - 如 tolower(c)当c为大写时返回c的小写值，isdigit(c)当c为'0'~'9'时返回对应数字

# 控制流
## 语句&程序块
- 语句 = 表达式 + 分号
- if() else
- if() else if() else
- switch() { case 常量表达式:[case expr:]语句序列 default:语句序列 }
  - 普通case均需以break结束
  - case标签作用，穿透特性允许多个case关联到单个操作
  - 若语句序列中没有显式退出switch的break或return，执行将穿透到后面的代码，如
  ~~~
  case '0':
  case '1':
  case '2':
     i++;
     break;
  ~~~
- for(expr1; expr2; expr3) 顶部测试循环，若无表达式，则穿越；expr2若空，则视为永真
  ~~~
  include <ctype.h>
  int atoi(char s[])
  {//将字符串s转换为整数 ??? 字符串s可能=空白符+正负符号+数字字符+其他字符
      int i,n,sign;
      for(i = 0; isspace(s[i]); i++)	//空白符跳过
              ;
      sign = (s[i] == '-') ? -1 : 1;	//判断符号正负 正的正号可能有可能没有 负数则s[i]会为负号
      if(s[i] == '+' || s[i] == '-')	//如果有符号则跳过
              i++;
      for(n = 0; isdigit(s[i]); i++)	//处理符号后的字符 数字转换 遇到第一个非数字结束
              n = n * 10 + (s[i] - '0');	//顺序求每一位的个位值 在求到下一个数时 前面的数乘10进位
      return sign * n;
  }
  ~~~
- while() 顶部测试循环，先判断再运行
- do 语句 while(); 先运行一次，再判断
  ~~~
  void itoa(int n, char s[])
  {//将整数a转换为字符串放入s
      int i,sign;
      if((sign = n) < 0)	//sign记录符号正负
              n = -n;		//处理负号 用正数进行转换
      i = 0;
      do {
              s[i] = n % 10 + '0';	//反向次序生成数字 得到个位-十位...
              ++i;
      }while((n /= 10) > 0);		//进入下一个进位求数字
      if(sign < 0)
              s[i] = '-';
      s[i+1] = '\0';
      reserve(s);		//反转字符串
      return;
  }
  ~~~
- break和continue
  - break，退出当前for、while、do、switch-case
  ~~~
  int trim(char s[])
  {//删除字符串末尾的空格 制表符 换行符
      int n;
      for(n = strlen(s) -1; n >= 0; n--)
      {
              if(; s[n] != ' ' && s[n] != '\t' && s[n] != '\n'; )
                      break;
      }
      s[n+1] = '\0';
      return n;
  }
  ~~~
  - continue，停止本轮for、while、do，开始下一轮，for注意会正常递增
- goto和标签
  - 标签形式为 `标签名:`，使用 `goto 标签名` 跳转到标签的地方
  - 一般尽量少用，goto总能写为不用goto的形式，适用于一次性跳出深层循环，错误处理代码多，且错误出现在n个地方
  ~~~
  {
    for(...) {
        for(...) {
            ...
            if(a)
                goto error;
                ...
        }}
    error:
        错误处理部分
  }
  ~~~

# 函数与程序结构
- 函数
~~~
返回类型 函数名(参数声明)
{
		声明和语句
}
~~~
- C语言函数，按值传参，没有直接途径可以让被调函数改变调用者函数的变量，可通过指针修改
- 返回类型若省略，默认为int；函数名、()、{}不可省略
- 设计程序：将输入中包含特定“模式”or字符串的各行打印出来（具体P58，容后再敲）
  ~~~
  while（还有未处理的行）		——getline()
      if（该行包含指定模式）	——strindex(s,t) 判断该行是否包含特定模式，并返回特定t在s中的首次出现的起始位置or下标
          打印该行							——printf()
  int strindex(char s[],char t[])
  {
      int i,j;
      for(i = 0; s[i] != '\0'; i++)
      {
          int k;
          for(j = i,k = 0; t[k] == s[j] %% t[k] != '\0'; j++, k++)
              ;
          if(k > 0 && t[k] == '\0')	//想想一半相同的情况 当配对成功 k是从0自增 当然应该满足t[k]=='\0' 且k=strlen(t)
              return i;
      }
      return -1;
  }
  ~~~
- 不同系统对存在多个源文件里的C程序，编译、加载机制互有差别
  - UNIX上用cc命令 `cc 文件名 文件名`，编译这堆存函数的文件.c，分别生成对应.c的.o文件们，再将.o文件们一起加载为一个可执行文件.out
- 函数返回非整数值
  - 声明与定义必须一致，若函数独立编译则这类错误很难检测
  - 必在函数名前声明返回类型，并在main开始前显示声明函数，或是在调用程序中使用之前显示声明函数如声明atof：main(){double sum,atof(char[]);其他语句}
  - 如自写 atof(s) 将字符串s转换成相应的双精度浮点数，而标准库中的 atof 在 <stdlib.h> 中声明
  ~~~
  double atof(char s[])
  {	//val记录去掉小数点的数 power记录小数点位数 最后相除恢复小数位
      double val,power;	
      int i,sign;
      for(i = 0; isspace(s[i]); i++)
              ;	//略过空白符
      sign = （s[i] == '-') ? -1 : 1;	//判断并记录符号正负
      if(s[i] == '+' || s[i] == '-')	//跳过可能存在的+-号
              i++;
      for(val = 0.0; isdigit(s[i]); i++)	//遇到第一个非数字即退出 正常即遇到小数点则退出
              val = 10.0 * val + （s[i] - '0');
      if(s[i] == '.')	//找到小数点
              i++;
      for(power = 1.0; isdigit(s[i]); i++)
      {
              val = 10.0 * val + (s[i] - '0');
              power *= 10.0;
      }
      val = val / power;
      return sign * val;
  }
  ~~~
- 外部变量
  - 逆波兰计算器（即后缀表达式 12-34+* = (1-2)*(3+4)）
  while(获取数字or操作符)
      switch(获取的)
          case 数:
              入栈
          case 运算符:
              操作数出栈，运算，结果入栈
          case 换行符:
              栈顶值出栈并打印
          default:
              其他情况错误
~~~
#include<stdio.h>
#include<stdlib.h>	//使用atof()

#define MAXOP 100		//操作数or运算符的最大长度
#define NUMBER '0'	//标示找到一个数
#define MAXVAL			//栈val的最大长度

int getop(char []);	//获取下一个运算符or数值操作数 根据情况传递下一个输入字符
int getch(void);		//取一个字符
void ungetch(int);	//记录需放回输入中的字符

void push(double);	//入栈
double pop(void);		//弹出栈

int sp = 0;					//外部变量 指向栈的下一个空闲位置 即标示栈顶
double val[MAXVAL];	//存放值的栈

int main()
{
	char s[MAXOP];
	double op2;	//数值操作数
}

int getop(char s[])
{
}

double pop(void)
{
	if
}
~~~
- 作用域规则
    - 名字的作用域scope：程序中可以使用该名字的部分
    - 函数开头声明的自动变量，作用域是声明该变量的函数
    - 外部变量、函数的作用域，从它们在文件中被声明的位置开始，到被编译文件的末尾为止
    - 外部变量若在定义之前就要用，or定义它的源文件和用它的源文件不是同一个，则需用关键词 extern 强制声明
  - 函数、外部变量不用全部一起编译，源代码可按多个文件存放、编译，还可以从库里加载事先编译好的程序
    - 声明的编写，使变量在编译过程中被恰当地声明
    - 声明的安排，让程序各部分在程序加载时正确地关联
    - 声明的组织，如何只存在一份副本
    - 外部变量的初始化
      - 源程序的所有组成文件中，一个外部变量只能有一个定义，变量大小在定义中给出，初始化只在定义时进行
      - 其他文件通过包含该变量的 extern 声明进行访问，包含定义的文件里仍可包含 extern 声明，不冲突
- 头文件、多个源文件
  - 头文件：文件名.h，一般放公共内容，多个源文件之间共享的定义、声明
~~~
#include<stdio.h>
#include "calc.h"
~~~
- 静态变量
  - static 关键字声明，如static int sp;
  - 将声明对象的作用域限制在该源文件的余下部分，其他例程无法访问
  - 同一程序下的其他文件中可以有同名，不会冲突
  - 外部静态声明：多用于变量，也可用于函数。默认条件下，函数名是全局的，函数被 static 后，只有该文件内可见
  - 用于内部变量：一直存在于函数内部，不会跟着函数的调用而产生、释放
- 寄存器变量
  - register 关键字声明，如 register int a;
  - 提示编译器该变量将使用得非常频繁，提示将register变量放入机器的寄存器，使程序更小更快，但编译器可无条件忽略register提示
  - 应用范围：自动变量（内部变量），函数的形参
- 程序块结构
  - 函数内不允许定义函数，允许按块结构的形式定义变量，即各种{}里定义只在{}中存在的内部变量
- 初始化
  - 没有显式初始化时，外部变量、静态变量默认被初始化为0，自动变量、寄存器变量是未定义的无用数据初值
  - 显式初始化
    - `类型 变量名 = 表达式;`，如 int x = 1; char = '\0'; long msday = 1000L * 60L * 24L;
    - extern型、static型：初始化值必为常量表达式，只进行一次，在程序开始执行前完成
    - 内部变量、register型：初始化可为包含任意已定义值、包括函数调用的表达式，每次进入其所在函数or程序块时都会初始化
    - 数组：{}内一系列逗号分隔的初始值，包含n个连续对象的“整块”
      - int days[] = {31,28,31,30,31}; int days[5]; int days[5] = {1,1,2,3,4};
      - char pattern[] = {'o','u','l','d','\0'}; <=> char pattern[] = "ould";（字符数组能""是特例）,数组大小为5
      - 数组大小缺省，则自动统计{}内的个数为数组长度
      - 不能指定单个初始化值对多个数组元素的初始化，也不能跳过前面的对数组中间元素初始化
- 递归：直接or间接地调用它自己
  - 每次调用将得到一个新的全部内部变量的集合，与之前调用获得的变量集合彼此独立
  ~~~
  void printd(int n)
  {	//递归将n按十进制数 以字符格式进行打印 处理最大负数时会有错
      if(n < 0) {
          putchar('-');
          n = -n;
      }
      int a = n / 10;	//n 去掉最低位 往前退一位 234退为23.4 得到23
      if(a != 0)
          printd(a);	//打印 n 去掉最低位后的数 23
      int b = n % 10;	//n 最低位前的数都打印完 获得 n 的最低位 4
      putchar(b + '0');
      return;
  }
  ~~~
- C 预处理器
  - 预处理：编译过程中单独执行的第一个步骤
  - 最常用特性：#include #define
  - 文件包含 #include：在编译过程中包含某个文件的内容
    - 形式：`#include<文件名>` 或 `#include "文件名"`，该行将被替换为由文件名指定的文件内容
    - <> 通常按C语言的具体实现所定义的规则查找文件
    - "" 通常从包含该文件的源程序所存放的位置查找，若没找到，范围扩大到<>
    - 被包含的内容不一定全都以文件的形式存在，头文件的访问方式依赖于具体实现
    - 当某个包含文件发生变化，所有依赖于它的文件都必须重新编译
  - 宏替换 #define：以任意设定的字符序列替代一个标记
    - 形式：`#define 名字 替换文本`，`#undef 名字` 取消名字的宏定义
    - 名字形式和变量名相同，替换文本任意、可带参数、用括号确保求值的既定顺序
      - 如 #define max(A,B) ((A) > (B) ? A : B)，使用时 x=max(p+q.r+s); 将扩为 x = ((p+q) > (r+s) ? (p+q) : (r+s));
    - 替换文本中，带 # 的形参将被扩展为带""的字符串，""中的内容不变
      - 如 #define dprint(expr) printf(#expr "=%g\n",expr)，使用时 dprit(x/y); 将扩为 printf("x/y" "=%g\n",x/y);
        - 且两个字符串是相连的，效果 <=> printf("x/y =%g\n",x/y);
  - 预处理器操作符`##`：拼接实参
    - 与 ## 相邻的形参会被换为对应不变的实参，且##和周边的空白符都会移除
      - 如 #define paste(front,back) front ## back，使用时 paste(name1,2); 将创建出标记 name12
    - 嵌套使用##
  - 条件包含
    - 预处理可通过在预处理过程中求值的条件语句来进行控制，根据编译过程中的条件取值，来选择性地包含代码
    - 整形常量表达式求值：#if ... #else、#elif、#endif，按条件执行包含其中的代码，类似if-else
      - 表达式中不能有sizeof、强制类型转换、枚举常量，如果表达式≠0
      - 常用表达式 defined(名字)，如果名字已经被定义，则表达式 = 1，未定义则表达式 = 0
      - 专用测试名字是否被定义的语句：#ifdef-已定义则， #ifndef-未定义则
      ~~~
      #if SYSTEM == SYSV	//通过检测名字SYSTEM来决定包含的头文件版本
          #define HDR "sysv.h"
      #elif SYSTEM == BSD
          #define HDR "bsd.h"
      #elif SYSTEM == MSDOS
          #define HDR "msdos.h"
      #else
          #define HDR "default.h"
      #endif
      #include HDR
      ~~~
      ~~~
      #if !defined(HDR)	//确保文件hdr.h只会被包含一次 #if !defined(HDR) <=> #ifndef HDR
      #define HDR
      /*这里放hdr.h的内容*/
      #endif
      ~~~

# 指针与数组
- 指针
  - 指针是存放某个变量的地址的变量，通用指针类型 void * 为空指针，可用于保存任意类型指针，但无法解引用自身
  - 声明指针：`类型关键字 *指针变量名` 指针大小为能够存放一个地址的存储单元组（一般2字节或4字节）
  - 取地址运算符 &，如 p = &c; 将c的地址赋给p，即 p指向c，用于内存中变量、数组元素，而如数组名、函数名已表地址，则不需用&符
  - 访问指针所指向的变量：*，如 int d = *p，间接/解引用运算
  - 直接使用指针变量：如 q = p; 将p内容赋给q，即q也指向了p所指向的对象
  ~~~
  int x = 1, y = 2, z[10];
  int *ip;	//ip是指向int型的指针 表达式*ip是一个int型数
  ip = &x;	//ip指向x x的地址赋给ip 变ip之前任何出现x的地方都能用*ip替换
  y = *ip;	//y变1 取ip指向的变量 赋给y
  *ip = 0;	//x变0 将0赋给ip指向的变量
  ip = &z[0];	//ip指向z[0] ip存z[0]的地址值 <=> ip = z;
  ~~~
- 指针与函数参数
  - 调用者传递需要修改的变量的指针
  - 使用时：swap(&a, &b);	//实参是变量的地址 即指向变量的指针的值
  ~~~
  void swap(int *px, int *py)	//互换*px与*py 形参声明为指针类型
  {
      int temp;
      temp = *px; *px = *py; *py = temp; return;
  }
  //转换输入的任意格式字符流 分解为整数 一次调用得到一个整数
  #include<ctype.h>
  int getch(void); void ungetch(int);
  int getint(int *pn)	//getint()获得输入中的整数并放入 *pn 中
  {
      int c, sign;
      while(isspace(c = getch()))	//检查空白符并略过
          ;
      if(isdigit(c) && c != EOF && c!='*' && c!='-')	//检查是否其他非数字字符
      {
          ungetch(c);
          return 0;
      }
      sign = (c == '-') ? -1 : 1;	//记录正负
      if(c == '-' || c == '+')	//去掉可能有的正负号
          c = getch(c);
      for(*pn = 0; isdigit(c); c = getch())
          *pn = (*pn) * 10 + (c - '0');	//从高位到低位 累加到*pn
      *pn *= sign;
      if(c != EOF)
          ungetch(c);
      return c;
  }
  ~~~
- 指针和数组
  - 数组：一组包含了n个连续对象的“整块”，对象们的地址是连续递增的，下标找具体元素
      - 例 int a[10]; int *pa;
      - 数组变量or表达式的值是数组下标为0的元素地址
          - pa = &a[0]; <=> pa = a; int x = *pa; 将a[0]值赋给x
      - 指针的算术运算均表示将指针指向指针的上/下的第i个对象
          - 若 pa 指向数组中某具体元素，则 pa+i 指向其后的第i个元素，pa-i 指向其之前的第i个元素，*(pa±i)为对应元素的值
          - 如 pa = &a[1]; pa+1即为a[2]的地址，*(pa+1)为a[2]的值，而具体地址值增加多少，取决于a[]类型，如int型一次加4字节
      - “数组 + 下标”表达式 <=> “指针 + 偏移”表达式
          - 取值 a[i] <=> *(a+i)
          - 取地址 &a[i] <=> a+i <=> &(*(a+i))
          - 指针+下标 pa[i] <=> *(pa+i) 即将指针当做某个数组的首地址
  - 区别：指针为变量，可以做运算、赋值等，如pa = a; pa++;等，数组名不是变量，不可这样哦
  - 函数参数中，数组名参数 = 一个指针，即一个存放地址的变量，∵将数组名传给函数时，传的也是起始元素的地址
      - 作为函数定义的形参，int f(char s[]){...} <=> int f(char *s){...}
      - 如a[10]，有 f(a[2]) <=> f(a+2) 均为向函数f传递以a[2]作为起始地址的部分数组
      ~~~
      int strlen(char *s)	//返回字符串s的长度
      {
          int n;
          for(n = 0; *s != '\0'; s++)	n++;	//递增指针s 即指针指向下一个元素 对调用者的字符串s无影响
          return n;
      }	//可使用：strlen("dd s!"); strlen(array); strlen(ptr); 其中 char array[100]; char *ptr;
      ~~~
- 地址运算
  - 指针和整数不能互换（即互相赋值），0值除外，零值常用符号常量NULL表示，指针可以和NULL进行赋值和比较
  - 指针和整数可以加减，如 p+1
  - 指向属于同一数组的元素的指针之间可加减比较，如 `p<q`，则 q - p + 1 = 从p到q的元素数量
  ~~~
  size_t strlen(char *s)	//返回字符串s的长度 size_t是由sizeof运算符返回的无符号整数类型 与标准库strlen一致
  {
      char *p = s;
      while(*p != '\0') p++;	//统计p前进步数 与使用int n比较 字符串中数字太大可能n容不下
      return p - s;
  }
  ~~~
  - 没有指向同一个数组的指针之间，比较or运算的行为是未定义的，除了超过数组末尾的第一个元素？？
  - 指针、数组、地址运算整合在一起，如下 初级存储分配器
      - alloc(n) 返回指针p，p指向连续的n个字符空间，该空间可被alloc的调用者用于存放字符
      - afree(p) 释放用alloc申请的存储，使之能被重新申请使用，他们管理的存储为栈，afree必须在和alloc调用顺序相反
      - 标准库提供 malloc 和 free 无限制，在后
      - alloc管理一个较大的字符数组allocbuf[]，指针allocp指向第一个空闲元素，allocbuf可对外隐藏
  ~~~
  #define ALLOCSIZE 10000	//可用空间大小
  static char allocbuf[ALLOCSIZE];	//用于分配的存储
  static char *allocp = allocbuf;	//管理游标初始指向第一个空闲位
  char *alloc(int n)
  {
      int i = allocbuf + ALLOCSIZE - allocp;	//计算当前空闲空间大小
      if(i >= n)
      {
          allocp += n;
          return allocp - n;	//返回指向分配好的整段字符起始位置的指针
      }
      else return 0;	//C语言中 0值绝对不是有效的数据地址 可用于表异常
  }
  void afree(char *p)
  {	//判断是否是已分配过的空间 p是要释放的起始地址
      if(p > allocbuf && p < allocbuf + ALLOCSIZE)
          allocp = p;
      return;
  }
  ~~~
  - 综上，有效的指针运算包括：
      - **同类型的**指针，相互赋值
      - **指针和整数之间**加减（不是指针和指针）
      - **指向同一数组元素的**指针相比较、加减
      - 指针赋零、与零值比较
- 字符指针与函数
  - 字符串常量 = 一个字符数组，如`"hello world!"`，C语言没有将字符串作为一个单元处理的操作
  - 以'\0'结尾，存储长度 = 字符串长度 + 1，strlen()返回存储长度，下标范围 0~字符串长度
  - 一般来说，字符串常量通过其第一个元素的指针访问，如 传入函数时，其实传入了字符串的起始地址
      - 如 char *pmassage; pmessage = "now is"; 将字符串数组的指针赋值给pmessage≠拷贝字符串
      - char message[] = "now is"; 是初始化数组，数组存字符串 char *pmessage = "now is"; 是初始化指针指向字符串
      ~~~
      //简单版复制字符串t到s中
      void strcpy(char *s, char *t)
      {
          //数组下标版
          int i = 0;
          while((s[i] = t[i]) != '\0')	i++;
          
          //指针版
          while((*s = *t) != '\0')	//while()中只判断了表达式是否为零 != 可省略 
          { s++; t++;}
          
          //更简化版
          while(*s++ = *t++)	;	//在*t对*s先赋值后 他俩才进行自增 一元*和++同优先级 且从右到左 但++在后缀位 ∴先计算再自增
          
          return;
      }
      //简单版比较字符串s和t s<t返回负 s=t返回零 s>t返回正 返回值=s和t第一个不同字符的差值
      int strcmp(char *s, char *t)
      {
          int i;
          for(i = 0; s[i] == t[i]; i++)
              if(s[i] == '\0') return 0;
          return s[i] - t[i];
      }
      ~~~
- 指针数组、指向指针的指针
  - 数组里存放的是一堆指针变量，如 int *parray[10]; 其中parray[i]是一个整型指针，*parray[i]是其指向的整数
  - 如 将文本行按字母排序（UNIX程序中sort去掉其他功能的版本）
  - 处理变长文本行，指针数组内，存放每一行的首字符指针（即传入首字符），乱序的行交换时不换文本行，只换数组中的指针顺序
  ~~~
  p86
  #include<stdio.h>
  #include<string.h>
  #define MAXLINES 5000	//能被排序的最大行数
  char *lineptr[MAXLINES];	//声明指向文本行的指针数组 数组名是lineptr char*表示类型是字符型指针 
  int readlines(char *lineptr[], int nlines);	//读入输入的所有文本行：收集和保存每一行字符，并建立指向这些行的指针数组，累计输入行数
  void writelines(char *lineptr[], int nlines);	//按序输出行
  void qsort(char *lineptr[], int low, int high);	//排序 算法选择快排
  void swap(char *v[], int i, int j);
  ...容后补
  输出时 while + printf("%s\n",lineptr[i]); <=> printf("%s\n",*lineptr++);
  ~~~
- 多维数组
  - 矩形多维数组（二维数组），如 char daytab[2][13] = {{0,31,28,31}, {0,31,29,31}}; 表示闰年和平年的月份天数 首位为0天
  - C中二维数组存储的本质其实是一维数组，其每个元素都是一个数组，下标表示为 daytab[i][j]，即[行][列]
      - [行]即传递数组行的指针，[列]指向具体对象
  - 元素按行存放，数组以一列{}的初始值进行初始化，二维数组的各行用对应的子列初始化
  - 二位数组做函数的形参，必须传递列数，行数无所谓
      - 如 f(int daytab[2][13){} <=> f(int daytab[][13]){} <=> f(int (*daytab)[13]){}
      - 参数是指向包含13个int的数组对象的指针，第三个表示参数是指针，该指针指向包含13个整数的数组
      - 而 int *daytab[13] 则为 包含13个整数指针的数组
  - 一般地，只有数组的第一维（下标）可以不指定，其他维度都必须指定大小
  ~~~
  //将月/日month day转换为一年的第几天
  static char daytab[2][13] = {{0, 31, 28, 31},{0, 31, 28, 31}};	//这里略了没写全 就是天数全部显示初始化 外部变量
  int day_of_year(int year, int month, int day)
  {
      int i, leap;	//leap判断闰年 逻辑表达式真-即1闰年 假即0平年
      leap = year%4 == 0 && year%100 != 0 || year%400 == 0;
      for(i = 0; i < month; i++)
          day += daytab[leap][i];
      return day;
  }
  //将一年的第几天yearday转换为月/日
  void month_day(int year, int yearday, int *pmonth, int *pday)
  {
      int i, leap;
      leap = year%4 == 0 && year%100 != 0 || year%400 == 0;
      for(i = 1; yearday > daytab[leap][i]; i++)
          yearday -= daytab[leap][i];
      *pmonth = i;
      *pday = yearday;
      return;
  }
  ~~~
- 指针数组的初始化
  - 如使用字符串初始化字符指针数组，多个字符串，每个字符串被分配到数组中的相应位置
  - 第i个字符串被放在某处，name[i]中存放指向第i个字符串的指针
  ~~~
  char *month_name(int n)	//返回包含第n月的月份名的字符串
  {
      static char *name[] = {"Illegal month", "January", "February", "March"};
      return (n > 1|| n <12) ? name[0] : name[n];
  }
  ~~~
- 指针和多维数组的比较
  - 二维数组≠指针数组
      - 如 int a[10][20]; 和 int *b[10];
      - a 是二位数组，已经分配预留出200个int的空间，使用 20x行+列 得到元素 a[行][列]
      - b 是指针数组，只分配了10个指针的空间大小，且未初始化，每个指针指向的行可以不定长甚至无元素，初始化时分配空间
      - （初始化必须显示完成，通过静态分配or代码进行）
  - 指针数组常用于存放长度各异的字符串
      - 如 static char *name[] = {"Illegal month", "Jan", "Feb", "Mar"}; 只有指针连续存储 具体元素存储地址不一定连续
      - 和 static char *name[][15] = {"Illegal month", "Jan", "Feb", "Mar"}; 整体连续存储 每行空间定长
- 命令行参数
  - 在程序开始执行时，传递命令行参数，由main()传递，main(int argc,char *argv[])
  - 按常规，argv[0] = 被调用程序的名字/命令行参数，后面是可选参数argv[1]~argv[argc-1]，要求argv[argc]=NULL，参数个数 argc≥1
      - 如 echo hello,world 将命令行参数用空格分隔，可选参数回显在一行上（空格分隔echo和后面的）
      - 此时，argc为3，a[0]为`echo\0`，可选参数a[1]为`hello,\0`，a[2]为`world\0`
  - main 相关
    - `int main(int argc,char *argv[])`
       - argc-参数计数/命令行参数的个数，英文？？
       - argv-参数向量/是一个指针，指向包含参数字符串的数组，每个参数对应一个字符串，即参数们的指针数组，末尾指针为NULL
    - int main()     任意多个参数 不处理
    - int main(void) 不接受参数
      - void main()    无返回值 不利于操作系统判断状态
      - main()系统默认为int main()
  ~~~
  //回显命令行参数 空格分隔每个参数 类似echo程序
  main(int argc, char *argv[])
  {
      //argv看成字符指针数组版
      for(int i = 1; i < argc; i++)
          printf("%s%s", argv[i], (i < argc-1) ? " " : "");

      //argv直接操作指针版
      while(--argc > 0)
          printf("%s%s", *++argv, (argv > 1) ? " " : "");	//argv初始指向argv[0] 先++再用 后取* 而*argv为指向对应参数的指针
          //或 printf((argc > 1) ? "%s" : "%s", *++argv); //printf的格式化参数可以是表达式

      printf("\n");
      return 0;
  }
  ~~~
  - *++argv 是一个指向某个参数串的指针
      - argv是指针数组名，也是指针数组首元素地址，++argv指向下一个数组元素，*++argv则取到数组元素值，即指向参数串的指针
  - (*++argv)[0] <=> **++argv 是该参数串的第一个字符，优先级[]大于*
  - *++argv[0] <=> *++(argv[0]) 增加的是指针数组中首元素的值，即 argv[0] 的值，即 第一个参数串的地址自增了1，再取这个值
      ~~~
      //p92 4.1的模式查找的加强 以grep为范本 通过命令行的第一个参数来指定待匹配的模式
      太长了容后
      ~~~
- 函数指针
  - 函数本身不是变量，但可以有定义函数的指针，函数名类似数组名，表示函数的地址
  - 如 void qsort(void *lineptr[], int left, int right, int (*comp)(void *, void *));
      - qsort的参数包括：一个指针数组，两个整数，一个有2个指针参数的函数
          - void* 用于这堆指针型参数，∵任何指针可被强制转换void、也可以再转回去，且不丢失信息
      - 函数指针 int (*comp)(void *, void *) 可作为qsort的形参
          - 表示：comp是一个函数，返回一个int值，含两个void*参数，comp也是函数名，也是指向函数的指针，即函数所在的地址
          - 使用：*comp 是该函数，即取comp指向的内容，可调用该函数
              - 在qsort中：if((*comp)(v[i], v[left]) < 0)
          - 比较：int *comp(void *, void *) 表示comp是一个函数，返回一个int型指针，含两个void*参数
      - 调用 qsort((void **)lineptr, 0, nlines -1, (int (*)(void*, void*))(numeric ? numcmp : strcmp));
          - (void **)lineptr，？？？
          - (int (*)(void*, void*))(numeric ? numcmp : strcmp)，？？？
  ***
  ~~~
  //修改排序程序，传递不同的比较和交换程序给排序算法程序，以便安排不同的准则进行排序，可处理任意数据类型
  //比较部分 确定任意两个对象次序
  //交换部分 倒转任意两个对象次序
  //排序算法部分 进行比较和交换直到所有对象已经有序，独立于比较和交换操作
  #include<stdio.h>
  #include<string.h>
  #define MAXLINES 5000	//可被排序的最大行数
  char *lineptr[MAXLINES];	//指向文本行的指针
  int readlines(char *lineptr[], int *nlines);
  void writelines(char *lineptr[], int *nlines);
  void qsort(void *lineptr[], int left, int right, int (*comp)(void *, void *));
  int numcmp(char *, char *);	//基于数值比较两行 并返回与strcmp相同类别的比较结果标志
  
  main(int argc, int *argv[])
  {
      int nlines;	//记录输入的行数
      int numeric = 0;	//排序准则标志 按字母排序-0 按数值排序-1
      if(argc > 1 && strcmp(argv[1], "-n") == 0)	//用户输入 -n 选择数值排序
          numeric = 1;
      if((nlines = readlines(lineprt, MAXLINES)) >= 0)
      {
          qsort((void **) lineptr, 0, nlines - 1, (int (*)(void*, void*))(numeric ? numcmp : strcmp));
          writelines(lineptr, nlines);
          return 0;
      }
      else
      {
          printf("input too big to sort\n");
          reutrn 1;
      }
  }
  // qsort 将v[left]~v[right]按递增次序排列
  void qsort(void *v[], int left, int right, int (*comp)(void *, void *))
  {
      int i, last;
      void swap(void *v[], int, int);
      if(left > right)	return;
      swap(v, left, (left + right)/2);
      last = left;
      for(i = left + 1; i <= right; i++)
          if((*comp)(v[i], v[left]) < 0)	swap(v, ++last, i);
      swap(v, left, last);
      qsort(v, left, last - 1, comp);
      qsort(v, left, last - 1, comp);
  }
  // 按数值比较s1和s2
  {
      double v1, v2;
      v1 = atof(s1); v2 = atof(s2);
      if(v1 < v2)	return -1;
      else if(v1 > v2) return 1;
      else return 0;
  }
  ~~~
- 复杂声明
- 声明不能按从左到右的顺序理解，前缀运算符 * 的优先级＜括号们，且同级也是 从右到左 结合
- char **argv
  - 表示 argv 是一个指针（*从右到左结合argv，声明了argv为指针名），它指向一个字符指针（char*），即argv存了字符指针的地址
- int (*daytab)[13]
  - 表示 daytab 是一个指针（*daytab声明了daytab为指针名），它指向一个包含13个元素的int型数组（int ...[13]）
- int *daytab[13]
  - 表示 daytab 是一个数组（daytab与[13]先结合），它包含13个元素，元素类型为 int型指针
- void *comp()
  - 表示 comp 是一个函数（comp与()先结合），它的返回值为 void型指针
- void (*comp)()
  - 表示 comp 是一个指针（*comp），一个函数指针，它指向一个函数（这个函数理解为 void ()），该函数的返回值为 void型
- int (*pf)();
  - 表示 pf 是一个指针，一个函数指针，它指向一个函数（这个函数理解为 int ()），该函数的返回值为 int型
- char (*(*x())[])()
  - x 是一个函数，它的返回值为 指向数组的指针，该数组的元素是 指向返回char的函数 的指针
  - x 是一个函数，它的返回值为一个指针 *x()，该指针指向一个数组 ( *x() )[]，该数组的元素是指针，该指针指向一个函数，该函数的返回值为char
  - 拆为两部分，char ...() 和 (*(*x())[])，
  - (*(*x())[]) 即 强制结合的 *(*x())[]，令其 = A
      - 从内向外看，B = *x()，x是一个函数，函数的返回值是指针
      - B = *( *x() )[] = *(...)[]，A指向一个数组，数组的元素是指针
      - C = char ( *(*x())[] )() = char (...)()，B指向一个函数，函数返回值是char
- char (*(*x[3])())[5]
  - x 是包含3个元素的数组，该数组元素是 指向一个函数的指针，该函数返回值为 指向包含5个char元素的数组的指针
  - x 是一个数组，包含3个元素，该数组的元素是指针，指针指向函数，函数的返回值是指针，该指针指向一个数组，该数组包含5个元素
    - 拆为两部分，char ...[5] 和 (*(*x[3])())
    - (*(*x[3])()) 即 强制结合的 *(*x[3])()，x是一个数组，含3个元素，元素是指针 *x(3)，指针指向一个函数 (*x(3))()，该函数的返回值为指针型 *(...)()
    - 该函数返回的指针，指向数组，含5个元素 (...)[5]，数组的元素类型是char，char (...)[5]
- 总结？复杂函数声明
  - 指针是啥，就是存着别人地址的变量，而指针自己的地址又是另一个故事了
  - 若没有强制类型结合，先看开头的类型和最后的括号，判断是个啥函数
    - 如 char ...(参数们) 这个是最终要调到的函数（看起来括号+参数才是本体啊orz）
  - 从内向外看，一层一层结合
***

# 结构
- 结构：一个or多个变啦ing的集合，可以被复制、赋值、传给函数、被函数返回
  - 以结构为单位进行复制or赋值，用&获取结构地址，访问结构成员
  - 结构不可以进行比较，不可以包含自己的实例，但可包含指针，可用成员常值列表初始化，
  - 关键字：struct
  - 定义：`struct 结构标记/可选名字{定义的成员变量;};`
  ~~~
  sturct point{ int x; int y;};
  sturct point{...} x, y, z;  //为x y z声明所命名的类型，并预留存储空间
  sturct point pt;  //定义一个struct point类型的结构变量pt
  sturct point maxpt = {320, 200};  //定义并初始化
  ~~~
  - 结构标记即可选名字，命名了该类型的结构，可以在之后作为声明中{}部分的缩写使用
  - 成员：在结构内命名的变量，结构成员、标记、普通变量可同名
  - 不带变量列表的结构声明不预留存储空间，只描述结构模版
  - 引用结构成员：`结构名称.成员`，“.”此处作为结构成员运算符
- 结构和函数
- 结构数组
- 结构指针 struct point *pp;
  - 引用成员：`(*pp).x` 或者 `pp->x`，`.`和`->`从左到右结合，优先级 = 括号
  - 如 struct rect r, *rp = &r; *
  - r.pt1.x <=> rp->pt1.x <=> (r.pt1).x <=> (rp->pt1).x
- 自引用结构
- 表查询
- 类型定义 `typedef 类型 新类型名;`
- 联合 union
- 位域 Bit-fields
-
- 暂略，容后补

# 输入、输出
- printf()
  - %[n]d 按十进制整型打印，至少n个字符宽
  - %ld 按long整型
  - %[[n].m]f 按浮点数打印，至少n个字符宽，小数点后有m位小数
  - %o 八进制数
  - %x 十六进制数
  - %c 字符
  - %s 字符串
  - %% 百分号本身
  -
- getchar() 从文本流中一次读一个字符
- putchar() 一次写一个字符
- 没有输入时，返回特殊整型数EOF（end of file，文件结束），EOF定义在<stdio.h>内

- getline()

# UNIX系统接口




# test
- 1.20 函数detab，将输入中的制表符换为恰当数目的空格，使间隔达到下个制表符停止位
- 1.19 (1)函数reverse(s)，翻转字符串s；(2)所有输入行进行翻转，每次翻转一行
- 1.18 去掉没行末尾的所有空格和制表符，删除全空白行
- 1.17 打印所有长度超过80个字符的输入行
- 1.16 打印一组文本行中最长的一行，允许任意长度的输入行，可尽可能多的输入文本
- 1.14 打印输入中不同字符出现频度的直方图
- 1.13 打印输入中单词长度的直方图，分水平方向和垂直方向
1-21. 编写一个程序 entab，它将一连串空格替换为相同间隔的小数目的制表符和空 格。使用与detab相同的制表符停止位。当单个制表符或者单个空格都能达到制表符停止位时， 选用哪一种更好？ 练习 1-22. 编写一个程序，其将一个长输入行“折”为较短的几行，折行的位置为输入的第n 列之前的后一个非空白符之后。确保你的程序能够智能地处理很长的输入行，以及在指定列 之前没有空格或制表符的情况。 练习 1-23. 编写一个程序，用于去掉 C 程序的所有注释。注意正确地处理带引号的字符串和 字符常量。C语言的注释不允许嵌套。 练习 1-24. 编写一个程序，其用于检查 C 程序的基本语法错误，例如不配对的圆括号、方括 号和花括号。别忘了对单引号、双引号、转义序列以及注释的处理。（如果读者想把它写成完全 通用的程序，难度会比较大。
2-1. 编写一个程序来确定char、short、int和long 型变量的取值范围，包括signed 及unsigned类型。通过打印标准头文件中的相应值以及直接计算两种方法来完成。如果通过 计算方式，确定各种浮点类型的取值范围会更困难
2-3. 编写函数htoi(s)，其将一个表示16进制数的字符串（包括可选的0x或0X）转 换为对应的整数值。允许出现的数字包括0~9、a~f以及A~F。
2-4. 编写squeeze函数的另一版本squeeze(s1,s2)，其从字符串s1中删除掉那些 但凡出现在字符串s2中的字符。 练习 2-5. 编写函数 any(s1,s2)，其返回 s1 中首次出现字符串 s2 中任何字符的位置；如 果 s1 中不包含 s2 中的任何字符，则返回 -1 。（标准库函数 strpbrk 完成同样的工作，但它返回一个指向该位置的指针。）
2-6. 编写一个函数setbits(x,p,n,y)，其将x从位置p起始的n个比特位设置为y 的右n个比特位，x的其余位不变；返回x。 练习 2-7. 编写一个函数invert(x,p,n)，其将 x从位置p起始的n个比特位取反（即1变 为0，0变为1），x的其余位不变；返回x。 练习 2-8. 编写一个函数right(x,n)，其返回整数x向右循环移动n位所得到的值。
2-9. 在采用二进制补码的系统中，x &= (x-1) 将 x 中右边为 1 的比特位去掉（即 置为0）。请解释原因。利用这一经验编写一个速度更快的bitcount版本。
2-10. 重写 lower 函数，它将大写字母转换为小写字母，使用一个条件表达式来替代 if-else
3-1. 我们的二分查找程序在循环内部进行了两次测试，其实一次测试就足够了（代价是 在循环之外要有更多的测试）。编写在循环内只有一次测试的版本，并比较两者运行时间的差别。
3-2. 编写一个函数escape(s,t)，其将字符串t复制到字符串s中，并在复制过程中 将换行符和制表符之类的字符转换为可见的转义字符序列，如 \n 与 \t。请使用一个switch 语句。再编写一个反向转换函数，其将转义字符序列转换为实际的字符。
3-3. 编写一个expand(s1,s2)，它将字符串s1中类似a-z的速记符在s2中扩展为等价的完全列表abc...xyz，函数支持大小写字符和数字，并可处理a-b-c、a-z0-9、-a-z之类的用例，开头结尾的-字符按普通字符处理。
3-4,3-5,3-6
4-1 函数strrindex(s,t)，返回字符串t在s中最右边出现的位置，如果s不含t，返回-1。
4-2 扩充atof，处理科学计数法，如 123.45e-6，即一个浮点数，后面可能紧跟e或E以及一个（可能带正负号的）整数
4-3 ... 4-10
4-11 修改getop()，使他不用ungetch()函数，使用一个内部静态变量
4-12 用printd的思想编写一个递归版itoa函数，将一个整数转换为字符串形式
4-13 递归版本reverse()，将字符串s颠倒
4-14 定义一个宏 swap(t,x,y)，将类型为t的两个参数x，y彼此互换（建议：使用程序块结构）
5-1 改进getint()，将气候未带数字的+或-按非有效表达式0处理，一并压回输入中
5-2 编写getint的浮点数辩题 getfloat
5-3~5-6
5-7 重写readline，将文本行放在由main提供的数组中，而不是调用alloc，以及这样会比原来快多少？
5-8 在day_of_year和month_day中添加错误检测
5-9 重写day_of_year，用指针代替下标
5-4~5-13
5-14~5-17

- 1.12 打印输入的单词，每行一个
~~~
/* 标志位判断 遇字符打印 遇space等即一个单词打印结束 开始为结束状态 */
#include<stdio.h>
#define IN 1
#define OUT 0
int main()
{
    int c, state;
    state = OUT;
    while((c = getchar()) != EOF)
    {
        if((c == ' ') || (c == '\t') || (c == '\n'))
        { /* 结束一个单词 考虑连续空格类似情况*/
            if(state == IN)
            {
                printf("\n");
                state = OUT;
            }
        }
        else
        {
            putchar(c);
            state = IN;
        }
    }
    return 0;
}
~~~

- 1.9 输入拷贝到输出，输入中连续的多个空格替换为单个空格，默认C-z结束输入
~~~
/* 输入1~n个连续space都只输出1个space ∴遇到首个space先输出了 之后都好说 */
/* 善用 != 啊 */
#include<stdio.h>
int main()
{
    char c, lastc;
    lastc = 'a';
    while((c = getchar()) != EOF)
    {
        /* 简化版 */
        if((c != ' ') || (lastc != ' ')
            putchar();
        lastc = c;

        /* 稍简化版 */
        if(c != ' ')
            putchar();
        else if(lastc != ' ')
            putchar();
        lastc = c;

        /* 复杂版易读 */
        if(c != ' ')
            putchar();
        else if(c == ' ')
        {
            if(lastc != ' ')
                putchar();
        }
        lastc = c;
    }
    return 0;
}
~~~

