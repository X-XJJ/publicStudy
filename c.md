[C语言中文网](http://c.biancheng.net/)

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
  - 实际参数，实参，函数调用中与形参对应的值，如 c = power(3,2)的3、2
  - 形式参数，形参，函数定义中()内列表中出现的变量，如int power(int m, int n)的m、n，int getline(char s[], int n)
- 函数定义，函数原型，函数声明-在main之前带分号的

- 定义 define：创建变量 or 分配存储单元
  - 定义 #define A B
  - 将符号名字/符号常量(A)定义为一串任意特定的字符序列(B)，末尾无分号
  - 如 #define UPPER 30，#define CHAR 'a'，#define STH "sss33dd"
- 声明 declaration：说明变量的性质和属性，不分配存储单元，包括一个类型名和一列变量
  - 变量、数组声明如 int a,b; char a[2];
  - 函数声明如 int add(int a,int b); void dosth();

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
    - 通常16位or32位（具体看机器字长），取值 (-2^15) ~ (2^15 - 1)，即 -32768 ~ 32767
    - 至少16位
  - float：带符号浮点型
    - 通常32位，至少6位有效数字，取值 10^(-38) ~ 10^38
  - char：字符型
    - 一个字节=8位
  - double：双精度浮点型
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
      int bitcount(unsigned x) {
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
    int main(){
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
- while()
- do while()
- for(expr1; expr2; expr3) 若无表达式，则穿越；expr2若空，则视为永真

# 函数与程序结构

# 指针与数组

# 结构

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

- main 相关
  - `int main(int argc,char *argv[])`
  - argc-命令行参数的个数 argv-指向参数们的指针数组 末尾指针为NULL
  - int main()     任意多个参数 不处理
  - int main(void) 不接受参数
  - void main()    无返回值 不利于操作系统判断状态
  - main()系统默认为int main()


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




# 库函数

include<stdio.h>标准库中的常用函数
- printf()

getenv() 获取参数环境变量的内容

通常为stdio.h stdlib.h 没有的现调找库

来源：source → src
目的：destination → dest
把src所指向的字符串复制到dest

## 字符串相关
函数名    |作用               |\0 |函数返回
----------|-------------------|---|--------
strlen()  |取不含\0的字符串长度|有取字符串二进制or二进制长度的否？
strcpy()  |复制字符串         |√ |
srtncpy() |复制指定长度字符串 |？ |
strcat()  |追加字符串 strcat(s,t) t拼接到s的末尾，若超s长会怎样？
strncat() |追加指定长度字符串？
strcmp()  |比较字符串
strncmp() |比较指定长度字符串
strcasecmp()|忽略大小写比较字符串
strchr()  |查找单字符 strrchr() |反向查找单字符
strstr()  |查找子串    |？|返回str2在str1中首次出现的地址 否则NULL
strpbrk() |查找集合内任意字符 其他不常用 strspn strcspn
strsep()  |分割字符串|改变源字符串
strtok()  |分割字符串|改变源字符串
strdupa() |
strdup()  |
memcpy()  |按长度复制 不理结束符 基于内存 从存储区str2复制n个字符到存储区str1
memmove() |
memcmp()  |
memncmp？ |
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

- strtok()
第一次调用分割函数strtok(字符串,分隔符)时，入口为待分割字符串源
保留上次分割的地址 返回被切下字符串的首地址 后续调用入口即为NULL
strtok会改变源字符串，将包含在分隔符内的字符修改为'\0'或其他

- strcat()
char *strcat(char *dest, const char *src)
把 src 所指向的字符串追加到 dest 所指向的字符串的结尾

- strstr()
char *strstr(字符串a,字符串b) 返回a中第一次找到b的位置，不包含终止符'\0'即NULL
找不到则返回NULL


### printf()、sprintf()
- format：%[flags][width][.precision][length]specifier
- 对于%s，优先级 精度＞宽度
- 对于%s，精度.precision = 输出字符的最小数目，宽度width = 要输出的最大字符数
- 文档参考：菜鸟教程

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


