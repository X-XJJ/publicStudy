# 环境
- 常用IDE：pycharm
  - python解释器环境，可配置。settings - project Interpreter - 



# Anaconda 使用


- python程序需要运行环境，anaconda可以管理、切换不同的运行环境

[Anaconda介绍、安装及使用教程](https://zhuanlan.zhihu.com/p/32925500)

Anaconda，中文大蟒蛇，是一个开源的Python发行版本，其包含了conda、Python等180多个科学包及其依赖项。
Anaconda包括Conda、Python以及一大堆安装好的工具包，比如：numpy、pandas等
Miniconda包括Conda、Python
conda是一个开源的包、环境管理器，可以用于在同一个机器上安装不同版本的软件包及其依赖，并能够在不同的环境之间切换

- 使用用户界面



- 使用conda命令


- 创建
conda create -n 虚拟环境名称 python=3.6

conda install -n your_env_name [package] #在虚拟环境中安装额外的包

conda activate 环境名   #激活、切换到环境
conda deactivate 环境名  #退出环境
conda env list 或 conda info -e     #查看当前存在哪些虚拟环境

- 删除
conda remove -n your_env_name(虚拟环境名称) --all  
conda remove --name your_env_name  package_name  # 删除环境中的某个包


conda clean
conda config
conda create
conda help
conda info
conda install 包名：安装包or库
conda list #罗列出所有已安装的科学包及其依赖项
conda package
conda remove
conda search
conda uninstall
conda update
conda upgrade

conda update conda                  #检查更新当前conda



- 虚拟环境：搭建独立的python运行环境, 使得单个项目的运行环境与其它项目互不影响.如使用一个包的不同版本。
- 


- 可以先在anaconda中创建新的虚拟环境
- 也可以在pycharm中新建项目时，跟着新建对应的环境
- 虚拟环境路径一般默认为，anaconda安装路径/envs/项目对应环境的文件夹

- 在自建虚拟环境中，包or库的安装路径一般为：anaconda安装路径/envs/项目对应环境的文件夹/Lib/site-packages
- 在base环境中，包or库的安装路径一般为：anaconda安装路径/Lib/site-packages


windows下，conda环境在 PowerShell 中不能进入和切换，可能是系统和兼容的问题，暂未解决。在cmd中可正常运行。
pycharm中“终端”可选择是powerShell或cmd


- 环境变量
D:\ProgramData\Anaconda3
D:\ProgramData\Anaconda3\Scripts
D:\ProgramData\Anaconda3\Library\bin


- 在pycharm中创建conda环境解释器时报错：conda error unable to create prefix directory check that you have sufficient permissions
- pycharm启动文件 属性 兼容性 更改所有用户的设置，管理员权限运行
最好 conda.exe 也加个管理员权限


## python2？3

- cmd中：pip install sympy
- pycharm中不会自动识别cmd的安装？，setting→Project：untitiled→Python Interpreter→+号，搜索&install
  - 包的安装路径：…\PycharmProjects\untitled\venv\Lib\site-packages

- pip install 包名

cplex、docplex两个包，conda中默认配置没有源，用pip



- 安装 opencv、cv2、sklearn，图像识别、计算机视觉等领域需要


## Pytorch
[面向Windows的Pytorch完整安装教程](https://blog.csdn.net/qianbin3200896/article/details/104244538)




# 基本语法

- Python 中，万物皆为对象（object），整型也不例外。只要是对象，就有相应的属性（attributes）和方法（methods）

- 使用 缩进 来表示代码块的边界，不用大括号{}

- 命名
  - 变量名：不能以数字开头，无法区分变量名和数字类型
  - 被调用的py文件：不能以数字开头；不能含有“-”？？

- 关于main函数
  - C/C++、java、C#等是编译型语言，必须有且只有一个main函数作为程序的唯一入口
  - python是解释型语言、脚本语言，main不是强制入口函数，主要是模块化的思维+习惯，使用main或者叫其他名字的主函数，更加清晰可读
  - 语句从上到下顺序执行，可以直接当脚本写？？

[Python 为什么没有 main 函数？为什么我不推荐写 main 函数？](https://zhuanlan.zhihu.com/p/145684478)

- 语句结束符：回车换行
  - 分号：python不推荐用，有回车时可省略，但同一行中分割语句要用分号
- 单行注释：#
- 多行注释：'''or"""
- 元组下标从0开始

- 条件判断：if XX:代码块 elif XX:代码块 else:代码块（elif 即 else if）
- 循环（python没有do while）
  - while XX: 代码块
  - while XX: 代码块 else: 代码块
    - 正常执行完while后执行else，跳出while则不执行else（如break）
  - for XX in 序列:代码块 else:代码块
    - for i in range(0,4): <=> C的 for(int i=0;i<4;i++){} <=> C的 for(int i=0;i<=3;i++){}
    - range[) 左闭右开
    - 正常执行完for后执行else，跳出for则不执行else（如break）
  - while 后写入0、长度为0的任意序列 时视为FALSE，写入非0整数、长度非0的任意序列 时视为TRUE

- 运算符
  - ^ 按位异或
  - ** 幂次，eg：a ** b 为 a^b（ ** 有好几种含义，幂次是其中之一？）
  - python无 ++、-- 符号
  = and、or、not，逻辑运算符
  - in、not in，是否存在，eg：if 'b' not in ['A','a','B']: print('b')
  - is、not is，对比两个变量的内存地址
  - ==、!= 对比两个变量的值
  - >、<、<=、>=，还可以直接连起来写，eg：a>1 && a<5 可以写成 5>a>1

  - 三元操作符，条件表达式，eg：small = x if x < y else y，small为x和y中小的那个
 

- import
  - import 库名包名
  - from 库名 import 函数or变量名？？
  - import a.py
    - a.py 与主程序文件同目录
    - 自定义包（文件夹）下：需要一个 __init__.py 文件 为啥来着？？文件内容可以为空
    - sys.path：sys.path 为一个list变量 存储package module的路径，可以print看内容
    - sys.path.append？？？
[建立自己的package包，直接导入自建py模块](https://blog.csdn.net/txh3093/article/details/106374412)
[python 引用（import）文件夹下的py文件](https://www.cnblogs.com/kongbursi-2292702937/p/12149925.html)


- 相对路径：./ 代表当前所在的目录，../ 代表上一层目录， / 代表根目录？
- 相对路径：.\ 代表当前所在的目录，..\ 代表上一层目录， \ 代表根目录？

- 全数据输出，科学记数法输出，如1000！

- temp = input("str") ，接收一个输入（全默认为字符串类型）的同时给出提示信息str

- sum() 对序列进行求和计算

- 保留浮点型的小数点后n位，可以用 decimal包 里的 Decimal对象 和 getcontext()方法 来实现

## Python 数据类型
- 基本类型：整型 0、浮点型 0.0、布尔型
- 容器类型：字符串、元组、列表、字典、集合

<class 'int'>
<class 'float'>
<class 'bool'>

[python怎么保留两位小数?几种方法总结！](https://m.w3cschool.cn/article/89475330.html)

- 获取数据类型信息 type(object)
  - type()不会认为子类是一种父类类型，不考虑继承关系
  - isinstance(）会认为子类是一种父类类型，考虑继承关系。
  - 如果要判断两个类型是否相同推荐使用isinstance() .
  - eg：dicTest={'a':1,'b':2}; print(type(dicTest)) 将输出“<class 'dict'>”

- 字符串，<class 'str'>，''或""，序列类型

### 元组，<class 'tuple'>，()，序列类型
- 元组被创建后不能修改


### 列表，<class 'list'>，[]，序列类型
- 创建列表
  - 直接赋值
  - range()
  - 推导式


[ppython_*x, = p的python语法](https://blog.csdn.net/weixin_39552538/article/details/111805082)
x,y=p 相当于 x=p[0]; y=p[1]??

[Python学习-将list列表写入文件](https://blog.csdn.net/DL_Iris/article/details/118603626)


### 字典，<class 'dict'>，{a:b} 映射类型
- 创建字典
  - dicTest = {:, :, :}
  - 构造函数 dict()
- 无序的 键:值 对 的集合（key:value），一个字典内的键不可重复
- 以“关键字-键”为索引，，格式类似json
- eg：dicTest={'a':1,'b':2, 3:'c'}; items = dicTest.items(); for key in items:.....
- 'a' 为字典的一个键，1 为该键对应的值
- 取字典的键 keys = dicTest.keys()，取字典的值 values = dicTest.values()
- 字典类型 不能放在for循环中直接遍历，必须转化为dict items之后才能遍历

- 一个键key对应多个值
[python中defaultdict用法详解](https://blog.csdn.net/weixin_44799217/article/details/124380270) 

[python字典排序方法](https://blog.csdn.net/LHJCSDNYL/article/details/122525942)
- sorted()



### 集合，<class 'set'>，{}


### 数据类型转换
  - 转换为整型int(x, base=10)，base进制默认为10进制
  - 转换为字符串str(object='')
  - 转换为浮点型float(x)



- python递归深度默认1000以内，修改递归深度值为x
import sys
sys.setrecursioonlimit(x)


- 断言 assert 关键词
  - 当 assert 后边的条件为False时，程序自动崩溃并抛出AssertionError的异常
  - 在进行单元测试时，可以用来在程序中置入检查点，只有条件为True才能让程序正常工作。
    - eg：assert len(test_list) > 0



strip()  去除头尾字符、空白符(包括n、r、t、' '，即：换行、回车、制表符、空格)
lstrip() 去除开头字符、空白符(包括n、r、t、' '，即：换行、回车、制表符、空格)
rstrip() 去除结尾字符、空白符(包括n、r、t、' '，即：换行、回车、制表符、空格)
strip('xx') 去除头尾的xx字符

读txt文件
read()：一次性读取整个文件内容。推荐使用read(size)方法，size越大运行时间越长
readline()：每次读取一行内容，内存不够时使用，一般不太用
readlines()：一次性读取整个文件内容，并按行返回到list，方便我们遍历
[python如何读取txt文件内容](https://www.php.cn/python-tutorials-479676.html)


# 常用函数（ref：菜鸟教程）
- print()
  - 将对象 以字符串表示的方式、按str()方式转为字符串 进行格式化输出，可输出到控制台、文件对象等
  - 参数格式化输出
    - print(j, '%.9f' %In1[j-1], '%.8f' %In2[j-1])，输出j、In1[j-1]、In2[j-1]的值
  - python中print默认输出后自动换行，不换行print(i,end='')
  - 不换行 末尾加逗号 print i,

```
print(*objects, sep=' ', end=' in" , file=sys.stdout，flush=False)
```
·将对象 以字符串表示的方式 格式化输出到流文件对象file里。其中所有非关键字参数都按str()方式进行转换为字符串输出;
·关键字参数sep是实现分隔符,比如多个参数输出时想要输出中间的分隔字符;
·关键字参数end是输出结束时的字符,默认是换行符\n ;
·关键字参数file是定义流输出的文件，可以是标准的系统输出sys.stdout 也可以重定义为别的文件;
·关键字参数flush是立即把内容输出到流文件，不作缓存。




- range()，创建一个整数列表，左闭右开，一般用于for循环
  - range([a,] b [,c])：从a开始计数（包括a，默认为0），到b结束（不包括b），步长为c（即数字间间隔，默认为1）
  - Python的一个内置函数（BIF,Built-in functions）
    - range(3)：0到2，[0, 1, 2]
    - range(1, 3)：1到2，[1, 2]
    - range(0, 10, 3)：0到9，步长3，[0, 3, 6, 9]
    - range(0, -3, -1)：0到-2，[0, -1, -2]
    - range(0) 和 range(1, 0)：都是[]

- symbols()

[Python中lambda表达式学习](https://blog.csdn.net/imzoer/article/details/8667176)
- lambda表达式：函数速写，封装有限的逻辑，嵌入一个函数的定义
  - lambda 参数1,参数2,... : 函数表达式, 
  - f = lambda x,y,z : x+y+z 如 f(1,2,3) 输出6
[细说Python的lambda函数用法](https://zhuanlan.zhihu.com/p/80960485)


- reduce() 对参数序列中的元素进行累积

- enumerate() 相当于添加下标，返回枚举对象
  - enumerate(sequence, [start=0])，下标默认从0开始

- round(x [,n]) 返回浮点数 x 取小数点后n位 的四舍五入值




# 模块们（库？）


## numpy
- NumPy(Numerical Python) 是 Python 语言的一个扩展程序库,支持大量的维度数组与矩阵运算,此外也针对数组运算提供大量的数学函数库。

一般 import numpy as np

np.array() 用于生成多维数组


## pandas
- pandas是基于numpy库的一种工具，纳入了大量库和一些标准的数据模型。
- DataFrame：pandas下的一种数据结构，表格型
  - 它含有一组有序的列，每列可以是不同的值类型（数值、字符串、布尔型值）。DataFrame 既有行索引也有列索引，它可以被看做由 Series 组成的字典（共同用一个索引）

[Python pandas.DataFrame.from_dict函数方法的使用](https://www.cjavapy.com/article/472/)




## 模块 math：数学运算
- 圆周率 π：变量 math.pi，3.141592653……
- 自然数 e：变量 math.e，2.71828……
- math.exp(x)：返回e^x，x为e的指数
- math.pow(x, y)：返回 x^y，这是math模块中的方法，参数将转换为float，范围？
  - 内置的方法：pow(x, y [,z])：返回 (x^y) % z，内置方法中把参数作为整型
- math.sqrt(x)：返回x的平方根 <=> pow(x,0.5) <=> x ** 0.5

- 注：库cmath：复数运算


## 库 functools：用于高阶函数
- reduce() 与python内置的reduce()函数一样

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

[python中scipy.optimize.leastsq（最小二乘拟合）用法](https://blog.csdn.net/weixin_44359479/article/details/115535622)

[python如何拟合二元一次方程？](https://www.zhihu.com/question/370744594)



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

