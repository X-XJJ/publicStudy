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

- 

# 模块们（库？）
## 模块 math：数学运算
- 圆周率 π：变量 math.pi，3.141592653……
- 自然数 e：变量 math.e，2.71828……
- math.exp(x)：返回e^x，x为e的指数
- math.pow(x, y)：返回 x^y，这是math模块中的方法，参数将转换为float，范围？
  - 内置的方法：pow(x, y [,z])：返回 (x^y) % z，内置方法中把参数作为整型
- math.sqrt(x)：返回x的平方根 <=> pow(x,0.5) <=> x ** 0.5


## 库 cmath：复数运算

## 库 functools，
- reduce()

## 库 sympy

# 一些总结？
## 计算积分
- numpy
- sympy
- scipy



