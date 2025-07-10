
Python中，万物皆对象，所有的操作都是针对对象的，那什么是对象，5是一个int对象，‘oblong’是一个str对象，异常也是一个对象，抽象一点是，人，猫，够也是一个对象

那对于一个对象，它就有包括两方面的特征： 


属性：去描述它的特征 


方法： 它所具有的行为 


所以，对象=属性+方法 （其实方法也是一种属性，一种区别于数据属性的可调用属性

把具有相同属性和方法的对象就可以归为一类，即Class。类就好比是一张蓝图，使用一个类可以创建多个对象实例 
即人，猫，狗都属于哺乳动物类

类是对象的抽象化，对象是类的实例化。类不代表具体的事物，而对象表示具体的事物

类也是有属性和方法的。

数据类型也是对象。


# 环境
- 常用IDE：pycharm
  - python解释器环境，可配置。settings - project Interpreter - 
  - 自动调整代码格式：ctrl + alt + L

- 有关一些Windows下的执行权限问题：将conda.exe、或python.exe等需要的可执行文件，“属性-兼容性”设为“以管理员身份运行”，



# Anaconda 使用

[官网下载](https://www.anaconda.com/download/success)

- python程序需要运行环境，anaconda用于管理、切换不同的运行环境

[Anaconda介绍、安装及使用教程](https://zhuanlan.zhihu.com/p/32925500)

Anaconda，中文大蟒蛇，是一个开源的Python发行版本，其包含了conda、Python等180多个科学包及其依赖项。
Anaconda包括Conda、Python以及一大堆安装好的工具包，比如：numpy、pandas等
Miniconda包括Conda、Python
conda是一个开源的包、环境管理器，可以用于在同一个机器上安装不同版本的软件包及其依赖，并能够在不同的环境之间切换

- 使用用户界面

- 使用conda命令
  - -n为--name的简写

- 创建
conda create -n 虚拟环境名称 python=3.6
conda create --prefix=/[绝对路径]/[环境名称] python=[python版本号]
conda install -n your_env_name [package] #在虚拟环境中安装额外的包
conda uninstall

- 复制
conda create -n 新环境名 --clone 旧环境名

- 激活环境
conda activate 环境名
conda deactivate 环境名  # 关闭环境
conda env list 或 conda info -e     # 查看当前存在哪些虚拟环境


- 删除
conda remove -n your_env_name(虚拟环境名称) --all  
conda remove --name your_env_name  package_name  # 删除环境中的某个包

- 配置
conda info
conda config --show
conda list  # 罗列出所有已安装的科学包及其依赖项
conda help

修改配置语法：

conda config --add key value #添加语法
conda config --remove key value #删除语法
其中，key为 envs_dirs、pkgs_dirs等         value为key对应的值

添加、删除envs_dirs:

conda config --add envs_dirs dir
conda config --remove envs_dirs dir
例如：

conda config --add envs_dirs E:/File/Anaconda3/envs
conda config --remove envs_dirs /Users/Lsz/.conda/envs
这里记住要用 ” / “

如果想调整envs_dirs安装顺序， 也是采用conda config --add envs_dirs dir语法， 直接把顺序贴过去就行

[Anaconda更改虚拟环境安装位置](https://www.cnblogs.com/djma/p/16491631.html)
[Anaconda 修改默认虚拟环境安装位置](https://blog.csdn.net/weixin_44768070/article/details/126682896)



conda clean
conda package
conda search
conda update
conda update -n base -c defaults conda  # 更新conda
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

使用conda时，报错，列的那个文件缺写入权限
解决方法：找到后面列的那个文件夹（我的是D:\Anaconda）——右键——属性——安全——编辑——完全控制（或者只把写入勾上也行，我是懒人，想一劳永逸）——等一会儿开把游戏——解决

[Pycharm配置conda环境(解决新版本无法识别可执行文件问题)](https://blog.csdn.net/2401_84495872/article/details/139919853)
新建项目->选择自定义环境->选择现有->类型为conda->选择路径:注意，这里的路径指的是你的虚拟环境所在的存储位置，并且一定要注意，新版本的pycharm不是选择python.exe或者conda.exe这两个可执行文件，而是选择conda.bat这个可执行文件(一般在bin文件夹下)->选择环境:选择你为项目创建的虚拟环境就行



- C:\User\xxx\.condarc 一些配置
~~~
channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  - defaults
show_channel_urls: true
envs_dirs:
  - D:\ProgramData\anaconda3\envs
pkgs_dirs:
  - D:\ProgramData\anaconda3\pkgs
  - D:\ProgramData\anaconda3\.conda
~~~

- 一些源
default_channels:
  - defaults
 - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
 - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
custom_channels:
  - conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  - msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  - bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  - menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  - pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  - simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud


- 显式进度条的库 tqdm
- 


## python2？3

- cmd中：pip install sympy
- pycharm中不会自动识别cmd的安装？，setting→Project：untitiled→Python Interpreter→+号，搜索&install
  - 包的安装路径：…\PycharmProjects\untitled\venv\Lib\site-packages

- pip install 包名

cplex、docplex两个包，conda中默认配置没有源，用pip——此方法安装的是cplex社区版



- 安装 opencv、cv2、sklearn，图像识别、计算机视觉等领域需要


# 基本语法

[python运行或调用另一个py文件或参数方式](https://www.jb51.net/article/260818.htm)


- python没有do while、switch case，可以在for等循环后 直接加 else，会顺序执行


- Python 中，万物皆为对象（object），整型也不例外。只要是对象，就有相应的属性（attributes）和方法（methods）
- 脚本语言？

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
  - >、<、<=、>=，大于小于等于也可以直接连起来写，eg：a>1 && a<5 可以写成 5>a>1

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

- temp = input("请输入str") ，对话框给出提示信息“请输入str”，接收用户的一个完整输入语句（默认全为字符串类型），用户回车为止，将接受到的输入存入temp。当调用输入函数时，它会停止程序并等待用户输入。当用户按下回车键时，程序恢复并返回用户输入的内容。
  - 默认接收到一个字符串 tmp = input()，输入“1 2 ab”后，得到tmp为字符串“1 2 ab”
  - 调用字符串处理函数，进行输入后处理，如tmp = input().split(' ')，输入“1 2 ab”后，得到tmp为列表['1','2','ab'] 

- sum() 对序列进行求和计算

- 保留浮点型的小数点后n位，可以用 decimal包 里的 Decimal对象 和 getcontext()方法 来实现

- map() 根据提供的函数，对指定的序列 做映射
  - map(函数function, 序列iterable, ...)，参数序列iterable中的每一个元素，依次调用function，返回所有调用结束后的结果，python2.x中返回为列表，python3.x中返回为迭代器-可使用list()转换为俩表
  - eg：map(int,test[i]) 将test[i]中的所有元素转化为int型

- str.join(序列sequence) 将序列sequence中的元素们，使用指定的字符串str连接为一个新的字符串
  - eg：str = ' -' ; test = 'abc'; str.join(test) 即返回字符串“a -b -c”


- 列表中随机选择元素
  - random模块，random.choice(列表名)
  - secrets模块，secrets.choice(列表名)，secrets 提供了一种实现 PRNG 的加密安全方法。在现实生活中的应用，如存储密码、认证、加密和解密以及令牌。secrets 比使用 random 要安全得多，因为它只适用于模拟或不处理敏感数据的操作。
  - Numpy模块，numpy.random.chioce()，具体再说

[如何在 Python 中从列表中随机选择元素](https://www.zadmei.com/rhzpzclb.html)



- python变量 作用域
  - L （Local） 局部作用域
  - E （Enclosing） 闭包函数外的函数中
  - G （Global） 全局作用域
  - B （Built-in） 内建作用域
  - 以 L –> E –> G –> B 的规则查找，即：当变量首次使用时，在局部找不到，便会去局部外的局部找（例如闭包），再找不到就会去全局找，再者去内建中找

- global 关键字
[python的global函数学习](https://blog.csdn.net/qq_42103298/article/details/114789146)

[python中打开文件和关闭文件的方法](https://www.ngui.cc/el/1132918.html?action=onClick)


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
  - split()方法，返回一个列表，例 tmp = 'aa'; 
    - 语法：tmpsrt.split(str="",num=string.count(str))[n]
    - str为分隔符，默认为空格

- index(x,start,end)方法
  - 查找并返回x所在位置的索引下标值，范围start~end，如 list.index("测试")


### 元组，<class 'tuple'>，用括号()，序列类型
- test = ('a','b','c')
- test = (1,) 是元组，test = (1) 为int类型
- test = a,b,a,b  默认创建一个元组
- x = tuple() 返回一个空元组
- 通过索引获取元素，test[0] 为 a
- 通过元素获取索引，test.index('b') 为 1
- 统计元组中的元素个数，test.count('b') 为 1

- 元组被创建后不能修改



### 列表，<class 'list'>，[]，序列类型
- 创建列表
  - 直接赋值
  - range()
  - 推导式

a.append() 追加元素


[ppython 星号x, = p的python语法](https://blog.csdn.net/weixin_39552538/article/details/111805082)
- x,y=p 相当于 x=p[0]; y=p[1]??，p = [1,2,3,4,5]
```
a, *x = p 其中a为1，x为[2,3,4,5]
*x ,= p，可以
注意：*x = p 是错误用法。
```
相当于x = list(p)，大概可以理解为对列表p的复制。这个语法是 extended iterable unpacking，翻译过来可以叫做元组解包，元组拆包，迭代解包，
也可以使用星号来表示 忽略多余的元素。

[Python学习-将list列表写入文件](https://blog.csdn.net/DL_Iris/article/details/118603626)

- 列表、数组，赋值、浅拷贝、深拷贝
  - list1 = list2，这是list1成为了list2的引用，改变list2时，list1会随之变化
  - list1 = list2[:]，将list2赋值给list1，修改互不影响
  - list1[m:] = list2，将list1从下标m的元素开始，全用list2替换


[Python中关于列表list的赋值问题](https://blog.csdn.net/weixin_43981621/article/details/123247342)

- 删除 aa=[1,2,3]
  = del aa 或 del(aa)，删除列表or删除指定数据，eg：test = [1,2]; del test 删列表; del test[0] 删元素
  - aa.pop(n)，删除下标为n的数据，返回被删的数据值，缺省默认删最后一个
  - aa.remove(数据值)，删除列表中某数据的第一个匹配项，eg：test.remove(2) 或 test.remove(test[1])
  - aa.clear()，清空列表


### 字典，<class 'dict'>，{} 映射类型
- 形式：{a:b}
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

- 字典的复制
  - dict1 = dict2 这是dict1成为了dict2的引用，改变dict2时，dict1会随之变化
  - dict1 = dict2.copy() 这是复制，使用字典的.copy()方法
  - dict1 = dict(dict2) 这是赋值，使用内置函数dict()实现复制

- 删除
  - 删除某个键值对：dict1.pop(key)-返回该key对应的value 或 del dict1[key]
  - 删除整个字典：del dict1


### 集合，<class 'set'>，{}
- set() 函数
  - 创建一个无序不重复元素集，可进行关系测试，删除重复数据，还可以计算交集、差集、并集等
  - 返回新的集合对象，重复元素只保留一个
- x = set('teest'); alist =[a,a,b,c]; y = set(alist)。则 x 为set(['t', 'e', 's',])？，b 为 {a, b, c}
- 交集 x&y，并集 x|y，差集 x-y，x^y 补集


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

## python的类
[python中类的详细介绍及使用](https://blog.csdn.net/xiaoxianer321/article/details/117237251)


## 自定义函数
- 格式：def 函数名():

在Python中，传递给函数的参数可以是引用传递或者值传递。对于可变对象（如列表、字典等），参数是通过引用传递的，而对于不可变对象（如数字、字符串等），参数是通过值传递的。
如果函数修改了可变对象的值，那么这些修改将在函数外部可见。这是因为函数内部操作的是传递给它的对象的引用，而不是对象本身的拷贝副本。
如果函数修改了不可变对象的值，那么这些修改将只在函数内部可见，并不会影响函数外部的原始对象。这是因为函数操作的是传递给它的对象的拷贝副本。

以下是一个示例，展示了可变对象和不可变对象在函数中的行为：

def modify_list(lst, num):
    lst.append(num)
        num += 1
    my_list = [1, 2, 3]
    my_num = 10
    modify_list(my_list, my_num)
    print(my_list)  # 输出 [1, 2, 3, 10]
    print(my_num)  # 输出 10

在上述示例中，函数modify_list()接受一个列表和一个数字作为参数。函数内部通过引用修改了列表的值，使其增加了一个元素。然而，对于数字参数，函数内部对其进行的修改并不会影响到原始的数字对象。
总结起来，Python中的参数传递方式可以简单归纳为：对于可变对象，是通过引用传递；对于不可变对象，是通过值传递。这种区别对于理解函数内外对象之间的交互非常重要。


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

- enumerate() 将一个可遍历的数据对象(如列表、元组或字符串)组合为一个索引序列，同时列出数据和数据下标，一般用在 for 循环当中，相当于添加下标，返回枚举对象
  - enumerate(sequence, [start=0])，下标默认从0开始
  - for i,j in enumerate(exs)

- round(x [,n]) 四舍五入，返回浮点数 x 取小数点后n位的 粗略的 四舍五入 值
n>0，四舍五入到指定的小数位
n=0，或缺省，四舍五入到最接近的整数
n<0，在小数点左侧进行四舍五入
四舍五入规则：
要求保留位数的后一位<=4，则进位，如round(5.214,2)保留小数点后两位，结果是 5.21
要求保留位数的后一位“=5”，且该位数后面没有数字，则不进位，如round(5.215,2)，结果为5.21
要求保留位数的后一位“=5”，且该位数后面有数字，则进位，如round(5.2151,2)，结果为5.22
要求保留位数的后一位“>=6”，则进位。如round(5.216,2)，结果为5.22

- Decimal(num).quantize(decimal("1."), rounding="模式") 按模式返回把num精确到整数位（1.）的值。避免十进制转二进制的误差。
  - decimal("1.")中，整数位1.，十分位0.1，百分十填0.01，以此类推
  - rounding的模式，ROUND_HALF_UP 为 四舍五入 模式，其他再说
- 向上取整 math.ceil(x)
- 向下取整 math.floor(x) 和 int(x)
- math.modf(): 取整数部分和小数部分，返回一个元组:(小数部分,整数部分)。注意小数部分的结果有异议


在python中，只要两个对象的类型相同，且它们是内置类型(字典除外)，那么这两个对象就能进行比较。关键词：内置类型、同类型。所以，两个对象如果类型不同，就没法比较，比如数值类型的数值不能和字符串类型的数值或字母比较。
[python等值和大小比较](https://www.cnblogs.com/f-ck-need-u/p/10124559.html)


## 推导式


# 模块们（库？）


## numpy
- NumPy(Numerical Python) 是 Python 语言的一个扩展程序库,支持大量的维度数组与矩阵运算,此外也针对数组运算提供大量的数学函数库。

一般 import numpy as np

np.array() 用于生成多维数组
  - 如 去掉0值，a = []，a = np.array(a)，a = a[a!=0].tolist()

np.arange() 返回一个有起点、终点、固定步长的序列

np.exp(x) 为 e^x
np.sqrt(x) 为 x开平方
np.power(x,y) 为 x^y


## pandas
- pandas是基于numpy库的一种工具，纳入了大量库和一些标准的数据模型。
- DataFrame：pandas下的一种数据结构，表格型
  - 它含有一组有序的列，每列可以是不同的值类型（数值、字符串、布尔型值）。DataFrame 既有行索引也有列索引，它可以被看做由 Series 组成的字典（共同用一个索引）

[Python pandas.DataFrame.from_dict函数方法的使用](https://www.cjavapy.com/article/472/)


## matplotlib
- 画图表

import matplotlib.pyplot as plt

plt.xlim(a,b) 显示x轴的作图范围
plt.ylim(a,b) 显示y轴的作图范围
plt.xticks() 表达x轴的刻度内容的范围

plt.xlabel() 横坐标标题
plt.ylabel() 纵坐标标题

plt.bat(x,y,width=,lable=)  根据x和y的内容作图 width为柱子宽度
plt.title() 图表标题
plt.show()

- 标题在竖直方向的位置

import matplotlib.pyplot as plt
plt.subplot(211, fc='r')
plt.title('title')
plt.subplot(212, fc='b')
plt.title('title', y=-0.2)
plt.show()

- matplotlib.pyplot.title方法可以通过设置参数y的值改变标题在竖直方向的位置，只要设置y为负值，就可以将标题显示在图片下方，一般-0.2就行。



plt.style.use('ggplot') 表示模拟 ggplot2 的风格。
plt.figure() 先创建一个基础图。

ax1 = fig.add_subplot(1,1,1) 然后创建一个子图（或多个子图），在子图上操作，1,1,1 表示创建一行一列的子图，并在第一个（此时也是唯一一个）子图上操作。

align='center' 条形与标签中间对齐。
color='darkblue' 设置条形的颜色

ax1.xaxis.set_ticks_position('bottom') 刻度线只显示在 x 轴 底部。
ax1.yaxis.set_ticks_position('left') 刻度线只显示在 y 轴 左侧。

ax1.set_xticks(customers_index) 设置 X轴刻度。
ax1.set_xticklabels(customers) # 设置 X轴刻度标签。

ax1.set_xlabel('Customer Name', fontsize = 14) 设置 X轴标签。

ax1.xaxis.set_tick_params(labelrotation = 45, labelsize = 12) labelrotation =45 标签旋转45°，labelsize 标签字体。

ax1.legend() 显示图例

plt.savefig('bar_plot.png', dpi=400, bbox_inches='tight') 将图片保存在当前文件夹下，并设置文件名；dpi 设置图片分辨率；bbox_inches 保存图片时去掉四周的空白部分

savefig()的format参数指出后台支持的文件格式包含：.png, .pdf, .ps, .eps, .svg。 但不限于这些，当输入一个错误的格式如.bmp，系统会显示错误，并提示其支持的格式： 支持的格式包括：.eps, .jpeg, .jpg, .pdf, .pgf, .png, .ps, .raw, .rgba, .svg, .svgz, .tif, .tiff。
根据Wiley的关于图像的指导准则，一般折线图的dpi设置为600，而图像的dpi设置为300。具体的dpi可根据个人要求，一般为1200/ 600/ 300。 
最后需要说明的是，类似这样图例legend放在图像外侧时，如果不设置图像大小等参数，保存的图往往是不完整的
[Python_matplotlib保存矢量图](https://blog.csdn.net/Poul_henry/article/details/88294297)

[通过python画矢量图（matplotlib，有代码）](https://blog.csdn.net/qq_38222051/article/details/117786600)

[Python子图绘制及常用设置（subplot、subplots绘图 ;plt&oo API)](https://zhuanlan.zhihu.com/p/579495880)
fig, axs = plt.subplots(m,n,figsize=()) 
其中subplots返回的 axs 是二维的，需要用 axs[0,0] 来选择当前子图

[python把标签图例放图外的下面 自动放在外侧](https://blog.csdn.net/Caiqiudan/article/details/107747381)
plt.legend(bbox_to_anchor=(0.5, -0.2),loc=8,ncol=10) # , borderaxespad=0

[python画图时常用的颜色——color=‘ ’](https://blog.csdn.net/xiaobai1_1/article/details/118708433)

[【Python】柱状图与饼状图如何使用黑白色绘制](https://www.cnblogs.com/shan-gui-yao/p/15996683.html)

[【python】python matplotlib绘制并保存多张图片+绘制多张子图](https://blog.csdn.net/baidu_35692628/article/details/125358100)
[python 一个figure上显示多个子图像](https://blog.csdn.net/qq_41597943/article/details/126425019)

[Python matplotlip 柱状图 柱形图 条形图 标签 图例全集](https://blog.csdn.net/qq_35240689/article/details/126743893)
[python如何绘制柱状图](https://blog.csdn.net/ben_na_/article/details/124231092)

[【Pyhton基础绘图】柱状图之坐标轴截断](https://blog.csdn.net/HMXNX/article/details/125175055)
[Python 作图实现坐标轴截断（打断）](https://blog.csdn.net/maryyu8873/article/details/84313423)


## 操作表格 excel
[Python办公自动化之Excel做表自动化：全网最全，看这一篇就够了！](https://zhuanlan.zhihu.com/p/385762133)

### openpyxl
在openpyxl中，主要用到三个概念：Workbooks，Sheets，Cells。

Workbook就是一个excel工作表；
Sheet是工作表中的一张表页；
Cell就是简单的一个格。
openpyxl就是围绕着这三个概念进行的，不管读写都是“三板斧”：打开Workbook，定位Sheet，操作Cell。

### xlwings
[xlwings最全操作；10秒搞定Xlwings全套操作](https://zhuanlan.zhihu.com/p/237583143)

读取数据
data = sheet.range('a1')
data = sheet.range('a1').expand()
data = sheet.range('a1','b3').value # 取单元格(a1,b3)的数据
data = sheet.range(f'a1:b3').value # 取a1到b3的范围数据，默认按行
num = 5; data = sheet.range(f'a1:b{num}').value

Python 使用 xlwings 往 excel 中写入一行数据的两种方法

# -*- coding:utf-8 -*-
import xlwings as xw

list1 = [1,2,3,4,5]
list2 = [[1],[2],[3],[4],[5]]

sht = xw.Book().sheets('sheet1')  # 新增一个表格

-  写入一行数据方法一
sht.range('A1').value = list1

- 写入一行数据方法二
sht.range('A1').options(transpose=True).value = list2


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


- 报错 
Python 的 libpng warning: iCCP: cHRM chunk does not match sRGB 
不用qq输入法即可




