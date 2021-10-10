# 环境
## python2？3

- cmd中：pip install sympy
- pycharm中不会自动识别cmd的安装？，setting→Project：untitiled→Python Interpreter→+号，搜索&install
  - 包的安装路径：…\PycharmProjects\untitled\venv\Lib\site-packages



## IDE


# 基本语法
- 语句结束符：回车换行
  - 分号：python不推荐用，有回车时可省略，但同一行中分割语句要用分号
- 单行注释：#
- 多行注释：'''or"""
- 条件判断：if xx:语句 elif xx:语句 else:语句
- 循环
  - while XX: 语句（# 注：python没有do while）
  - while XX: 语句 else: 语句
  - for XX in 序列:语句 else:语句。
    - for i in range(0,4): <=> C-for(int i=0;i<4;i++){} <=> C-for(int i=0;i<=3;i++){}

- 运算符
  - ^ 按位异或
  - ** 幂次，eg：a ** b 为 a^b（ ** 有好几种含义，幂次是其中之一？）
  - python无++和--

- import 库名
- from 库名 import 函数or变量名？？

- import a.py
  - a.py同目录？下需要一个 __init__.py 文件 ？？文件内容可以为空

- 全数据输出，科学记数法输出，如1000！


- 递归深度默认1000以内，修改递归深度值为x
import sys
sys.setrecursioonlimit(x)

# 常用函数（ref：菜鸟教程）
- print()
  - 输出字符串、直接输出数字
  - 参数格式化输出
    - print(j, '%.9f' %In1[j-1], '%.8f' %In2[j-1])，输出j、In1[j-1]、In2[j-1]的值
  - python中print默认输出后自动换行，不换行print(i,end='')
  - 不换行 末尾加逗号 print i,


- range()：创建一个整数列表，一般用于for循环
  - range(a, b [,c])：从a开始计数-默认0，到b结束-不包括b，步长为c-数字间间隔-默认1
    - range(3)：0到2，[0, 1, 2]
    - range(1, 3)：1到2，[1, 2]
    - range(0, 10, 3)：0到9，步长3，[0, 3, 6, 9]
    - range(0, -3, -1)：0到-2，[0, -1, -2]
    - range(0) 和 range(1, 0)：都是[]

- symbols()

[Python中lambda表达式学习](https://blog.csdn.net/imzoer/article/details/8667176)
- lambda表达式：函数速写，封装有限的逻辑，嵌入一个函数的定义
  - lambda 参数1,参数2,... : 函数表达式
    - f = lambda x,y,z : x+y+z 如 f(1,2,3) 输出6



# 模块们（库？）
## 模块 math：数学运算
- 圆周率 π：变量 math.pi，3.141592653……
- 自然数 e：变量 math.e，2.71828……
- math.exp(x)：返回e^x，x为e的指数
- math.pow(x, y)：返回 x^y，这是math模块中的方法，参数将转换为float，范围？
  - 内置的方法：pow(x, y [,z])：返回 (x^y) % z，内置方法中把参数作为整型
- math.sqrt(x)：返回x的平方根 <=> pow(x,0.5) <=> x ** 0.5

- 注：库cmath：复数运算


## 库 functools，
- reduce()

## 库 sympy：科学计算库


[Python科学计算利器——SymPy库](https://www.jianshu.com/p/339c91ae9f41)


- sympy.integrate()

ref：[Python 中的Sympy详细使用](https://www.jb51.net/article/219044.htm)

- 求a的n次方根：sympy.root(a,n)
- 求n的阶乘：sympy.factorial(n)
- 虚数单位i：sympy.I

- 表达式、表达式求值

- 函数方程求解

- 求和

- 求极限

- 求导

- 求定积分

- sympy难的容易罢工

- 多重积分

- 不定积分

- 公式展开与折叠

- 公式分离与合并

- 表达式简化



## 库 scipy：
- scipy.integrate 模块
一维积分 scipy.integrate.quad
二维积分 dblquad


# 一些总结？
## 计算积分
- eg：在1~2上对x^2的定积分
- numpy
- sympy
- scipy
[python计算积分](https://www.cnblogs.com/picassooo/p/12586191.html)

计算数的位数太大，数据溢出：数学范围错误 python math range error
- 算次方的，利用根号 sympy.root()

- python2有两种整数，int long
- python3有一种内置整数，表示为int，形式上是 Python2 的短整数，但实际上它能表示的范围无限，行为上更像是长整数，不需要字母L来作区分

## 求阶乘
[python 求阶乘的四种方法](https://www.jianshu.com/p/1c92a970baf1)

