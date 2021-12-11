

[MATLAB最基础的教程](https://blog.csdn.net/qq_38351824/article/details/80765060)

[matlab入门教程最全最 通俗易懂](https://www.bilibili.com/read/cv3307922/)

[MatLab入门手册](https://www.jianshu.com/p/fcf5199cfd2b)

- 字体问题
[matlab字体终极解决方案](https://blog.csdn.net/qq_30835655/article/details/77435883)


# 常用帮助命令
- help  显示指定命令的简短使用说明 如 help who
- doc  以网页形式显示指定命令的帮助页
- lookfor  按指定的关键词查询与之相关的命令
- which  显示指定函数所在的目录

- who    显示工作空间中的所有变量
- whos  查看工作空间中变量的详细属性

- clc 清除屏幕内容，与变量无关
- clear 变量名，不输入变量名默认清除所有变量 = clear all
- close 清除啥？all

- 单行注释：%
- 代码分块：%%，上下%%之间的部分作为一块，搭配“运行节”使用

- 自动调整代码格式：选中后ctrl+i


# 基本用法、语法
- .m 文件：脚本文件，函数文件
  - matlab自动识别，只有函数function~end的文件被识别为函数文件
  - 脚本文件：即一般脚本文件，文件内为命令序列
    - eg：文件名name.m，命令行输入name回车
  - 函数文件：第一行为function引导行，表示该m文件是一个函数。函数名与文件名一致，则命令行中输入函数名运行
    - eg：function y = name(x)，文件名 name.m，命令行输入name(参数)回车

- .asv文件：自动备份文件，预设项→编辑器/调试器→备份文件，默认扩展名为asv

- 脚本型语言？
  - A=[1 2 3] 运行文件？（“运行节”）时，等效于命令行里输入 A 回车？
  - A=[1 2 3]; 运行文件时，命令行结果不输出A的内容


- 命令行运行时，注意“当前文件夹”是目前命令行运行的路径，运行时注意切换到目标文件所在路径or将目标文件路径 加入matlab的搜索范围？

-  变量命名原则
  - 开头为字母、下划线，后可跟字母、下划线、数字
  - 长度≤63个字符，区分大小写

- 字符变量赋值：单引号
- 双引号：

- 若不想在屏幕上输出结果，可以在语句最后加分号？？？
  - “运行”：
  - “运行节”：

- 续行符 “…”（三个点）续行； 续行符的前面最好留一个空格

- ~= 不等于（即C中的!=），& 与，| 或，~ 非，xor 异或
- a=b==c 按符号运算优先顺序 即 a=(b==c)，若对于矩阵，=和==是逻辑判断，得到的是逻辑矩阵，元素在b等于c的地方为1，不等则为0？？


- 运算符
  - * / ^ 这三个算符定义的是矩阵运算（matlab使用矩阵语言？？）
  - .* ./ .^ 点乘，只计算矩阵中对应位置的元素 */
[matlab中的乘除法](https://blog.csdn.net/u013925378/article/details/53695147/)

- 自定义输入输出？函数
  - function [输出形参, ...] = 函数名(输入形参, ...)
    - 输出形参只有一个时，方括号省略
    - 调用方式：命令行输入 函数名(参数们)，[形参名们]=函数名(参数们)
    - eg：function y = name1(x)，调用：name(1) 或 a=name(1)。function [a,b] = name2(x,y)，调用：[a,b]=name2(1,2)；若命令行只输入name2(1,2)，智慧自动输出第一个输出形参的值



-  控制流相关
  - if else switch
  - for i = a : b，判断条件 a≤i≤b时执行循环，以 end 结束循环体，跳出循环后 i=b
    - 带步长的for循环，for i = a:n:b，从a到b，循环系数自增步长为n。如 1:2:7，i=1、3、5、7
    - 指定循环系数的for循环，如 for i = [1 2 4]，则 i=1、2、4

- 自定义输入输出？函数
  - function [输出形参, ...] = 函数名(输入形参, ...)
    - 输出形参只有一个时，方括号省略
    - 调用方式：命令行输入 函数名(参数们)，[形参名们]=函数名(参数们)
    - eg：function y = name1(x)，调用：name(1) 或 a=name(1)。function [a,b] = name2(x,y)，调用：[a,b]=name2(1,2)；若命令行只输入name2(1,2)，智慧自动输出第一个输出形参的值


- @ 操作符：定义函数句柄（函数句柄：可用于传参、赋值，也可以当函数名使用）
  - 变量名 = @特定的函数名，句柄指向特定函数
    - 如 f = @sin，g=f(pi)即g=sin(pi) f = @log(x)
    - 如 ln = @log，直观表示自然对数，ln(x)在matlab中没有定义，正确表示是log(x)
  - 变量名 = @(输入参数列表)运算表达式，句柄指向函数表达式
    - y = @(t) 8t.^6+6t.^5+3t.^3+t.^2+t+520; fplot(y,[0,100]); fzero(y,13);
    - f = @(x,t) x(1)*exp(x(2)*t); fplot(@(t)f(x,t),[1,8],'b');


- 匿名数学？函数？？
f = @(x)sin(x)./x; % y=sinx/x
U = @(a,x) a(1)*exp(a(2)*x); % U=Ae^bt a=a(1) b=a(2)


- inline() 定义函数？R2020b版本中提示未来将会删除inline，需使用匿名函数
  - clearclcf = inline('a * x * x + b * x + c', 'a', 'b','c', 'x')f(1, 2, 3, 1)


- 数组（向量）：matlab存储和运算的基本单元
  - 一维数组：以空格or逗号分隔，a = [1,2,3] 或 a = [1 2 3]
  - 多维数组：同行以空格or逗号分隔，不同行以分号分隔，b = [1,2 ; 3,4]
  - 取数组元素，下标从1开始计数，和其他编程语言不同。如 数组A=[2 4 5] A(1)取的是数组第一个元素2，A(3)取第三个元素5
  - 数组中冒号“：”表示选择某一个维度上的所有索引值
    - eg：A(1,:)表示二维数组中第一行所有值，A(:,1)表示这个矩阵的第一列所有值
    - 其实就是，A（1行，0列:0列）？
    - 三维数组B中，B(1,:,:)和B(:,1,:)和B(:,:,1)表示啥？？？
    - B = A(:) 将A中元素按列排为1列赋值给B
  - 冒号表达式定义 a = [a:d:b] 表示生成一个 首项为a、公差为d、末项≤b的行向量
  - 类似：linespace(a,b,n)？？

- 合并向量 xdata = XYdata(:,1); ydata2 = XYdata(26:50,2);

- A' 将向量A转置

- linspace 生成线性间距向量
  - linspace(x1,x2) 返回包含 x1 和 x2 之间的 100 个等间距点的行向量
  - linspace(x1,x2,n) 生成 n 个点，这些点的间距为 (x2-x1)/(n-1)


- disp() 直接将内容输出在Matlab命令窗口中


# 常用标准数组
- eye() 生成单位矩阵
- ones() 生成全1数组
  - ones(3)生成3x3矩阵，ones(3,4)生成3x4矩阵，ones(3,4,5)生成3x4x5三维数组？？？
- zeros() 生成全0数组
- rand() 生成随机数组, 服从均匀分布
- randn() 生成随机数组, 服从正态分布
- diag() 生成对角矩阵
- size() 

- 科学记数法显示数值：
  - 默认是怎么样的？？怎么改？？
  - format short e？g？，long g？
  - 主页→预设→命令行窗口→文本显示→行距 loose-宽松的 compact-紧凑的

-  系统预定义变量
  - pi ： 圆周率
  - inf，Inf ：无穷大量，-inf 无穷小量
  - nan，NaN ：Not-a-Number，一个不定值，结果不确定，如 0/0，Inf/Inf，Inf-Inf，Infx0，sin(inf)等情况会出现。这种情况下，除数可以用很小的数代替0，如 3x10^(-11)即3e-11？
    - inf/0 结果inf，0/inf 结果0
  - eps ：浮点运算相对精度
  - i，j ：虚部单位
  - 特殊变量 ans

  - 应尽量避免给系统预定义变量重新赋值



- sym() 创建符号数字、符号变量、符号对象，符号对象的类型是sym，
  - 符号变量运算得到的是解析解
  - S = sym(A)将非符号对象（如，数字，表达式，变量等）A转换为符号对象，并存储在符号变量S中
  - x = sym('x') 创建符号变量x，其名字是'x'
  - x = sym('x', 'real') 这里假设x是实数，因此有x的共轭conj(x)等于x
  - k = sym('k', 'positive') 创建一个正的（实数）符号变量
  - x = sym('x', 'clear') 创建一个没有额外属性的纯形式上的符号变量x（例如，创建符号变量x，但是并没指定它是正的或它是一个实数）
- syms()

[官方帮助文档？](https://ww2.mathworks.cn/help/matlab/ref/conv.html)


- str2num()


- func2str() 将函数句柄转换为字符串，
- str2func() 将函数字符串转换为函数句柄，


# 常用数学函数
- 三角函数 sin() cos() tan()，反三角函数 asin() acos() atan()
- 双曲函数 sinh() cosh() tanh()
- 自然底数e的幂 exp(X) 返回X中的每个元素的e^x 
- 绝对值or复数的模 abs()
- peaks函数
  - 峰值函数？？包含多少个？局部极大点、极小点
  - 对于演示 contour、mesh、pcolor 和 surf 等图形函数非常有用。它是通过平移和缩放高斯分布获得的，定义公式略


- conv() 卷积、多项式乘法
  - w = conv(u,v) 返回向量 u 和 v 的卷积。如果 u 和 v 是多项式系数的向量，对其卷积与将这两个多项式相乘等效
  - w = conv(u,v,shape) 返回如 shape 指定的卷积的分段。例如，conv(u,v,'same') 仅返回与 u 等大小的卷积的中心部分，而 conv(u,v,'valid') 仅返回计算的没有补零边缘的卷积部分。

[MATLAB卷积运算（conv、conv2、convn）解释](https://www.cnblogs.com/hyb221512/p/9276621.html)

- poly() 具有指定根的多项式、特征多项式，求以向量为解的方程或方阵的特征多项式，可以直接传递多项式方程的系数矩阵
  - p = poly(r)（其中 r 是向量）返回多项式的系数，其中多项式的根是 r 的元素。
    - 当V是向量时，命令poly(A)生成以V为根的多项式
  - p = poly(A)（其中 A 是 n×n 矩阵）返回矩阵 det(λI – A) 的特征多项式的 n+1 个系数。
    - 当A是一个NxN矩阵式，poly(A)命令求出A的特征多项式
  - A=[1,1]，B=poly(A)，输出B= 1，-2 ，1，得到一个根为 1（二重）的多项式y= x^2-2x+1
  - P=poly([1 2 3]) 可以解出P=[1 -6 11 -6]，即求得方程为：x^3-6x^2+11x-6=0。方程x^3-6*x^2+11*x-6=0的解是x1=1,x2=2,x3=3
  - A=[1,0; 0,1]，B=poly(A)，输出B= 1，-2 ，1，即A 的特征值 就是解 y= x^2-2x+1 得到的根，1，二重根
  - P=poly([1 2 3; 4 5 6; 7 8 0]) 可以解出P=[1 -6 -72 -27]，即方阵A特征多项式为：λ^3-6*λ^2-72*λ-27=0。矩阵（方阵）A=[1 2 3; 4 5 6; 7 8 0]的特征多项式是λ^3-6*λ^2-72*λ-27=0，A的特征值就是特征多项式λ^3-6*λ^2-72*λ-27=0的根。

- poly2sym() 把系数组转换成自符号多项式，若没有符号变量只有系数数组，则符号变量默认为x
  - poly2sym([3 5 4],x) %返回3*x^2+5*x+4
- sym2poly() 返回符号多项式的系数，依次输出由高阶到0阶的系数
  - syms x; sym2poly(x^3 +2*x^2- 4*x -9) %返回 1 2 -4 -9


- feval() 计算函数
  - [y1,...,yi] = feval(fun,x1,...,xi) 使用函数的名称or句柄、输入参数 x1,...,xi 来计算函数的结果


- int() 计算数值积分？？
  - s=int(fun,v,a,b) int表示integral数值积分，fun表示被积函数function，v代表variance积分变量，a和b分别是积分上下限，可以是不定积分
- q = integral(fun,xmin,xmax,Name,Value)？？数值积分



- subs() 符号计算函数，将符号表达式S中的 某些符号变量x 替换为指定的新变量
  - R = subs(S) 由调用函数或Matlab工作空间中获取的值替代了在符号表达式S中的所有当前的变量
  - R = subs(S, new) 用new的值代替符号表达式S中的默认符号
  - R = subs(S, old, new) 利用new的值代替符号表达式中old的值。old为符号变量或是字符串变量名。new是一个符号货数值变量或表达式。
[Matlab subs函数的用法](https://blog.csdn.net/guyuealian/article/details/53997490)


- reshape() 按列，变换为特定维数的矩阵，读取、存放都是按列
  - reshape(A,m,n) 将A中的元素返回到mxn的矩阵中，元素数量需一致。有顺序需求的，考虑使用转置
  - reshape(A,m,n,p,...)

- find()

- ind2sub() 将线性索引转化为相应下标，ind即表示下标
- sub2ind() 将下标转化为线性索引

- hold on 使多次绘制的图形叠加
- hold off ？？

- [MATLAB中plot函数的用法](https://blog.csdn.net/xuxinrk/article/details/80051238)
- plot() 绘制二维图像
  - plot(X, Y)，X=所有输入点坐标的x值的向量，Y=定义的函数
  - plot(X, Y, LineSpec)，X=所有输入点坐标的x值的向量，Y=对应y值的向量，LineSpec=用户指定的绘图样式
  - LineSpec 选项 单引号引用
    - 线型：- 实线（默认），-- 虚线，: 点线，-. 点划线
    - 坐标点：o 圆，+ 加号，* 星号*，. 点，x 十字，s 正方形，……
    - 颜色：r 红色，y 黄色，k 黑色，b 蓝色，g 绿色，c 蓝绿色，w 白色，m 品红……
    - 如 '--or' 表示圆圈坐标、红色虚线
  - 绘制多条曲线，默认一条一条来

- fplot() 绘制表达式or函数？
  - fplot(func [,limit,LineSpec,...])
  - 若不指定区间，默认绘制范围[-5,5]
  - [Matlab fplot函数详解](https://blog.csdn.net/RGBMarco/article/details/70498179)

- subplot() 在同一个窗口绘制多个二维？图像

- plot3() 绘制空间线


- fnplt() 绘制函数 Plot function 暂无中文翻译
  - 按点输出测试得，默认以x范围内平均100个点，做图
  - https://ww2.mathworks.cn/help/curvefit/fnplt.html
  Fnplt (f)在f的基本区间上绘制函数。
  如果f是单变量，则:
    如果f是标量值，fnplt绘制f的图。
    如果f是2向量值，fnplt绘制平面曲线。
    如果f是d向量值d &gt;2、FNPLT绘制由f的前三个分量给出的空间曲线。
  如果f是二元的，则:
    如果f是标量值，fnplt使用surf绘制f的图形。
    如果f是2向量值，则fnplt在定义域内的规则网格平面上绘制图像。
    如果f是d向量值d &gt;2、FNPLT利用surf绘制由参数值的前三个分量给出的参数曲面。
  如果f是一个超过两个变量的函数，那么fnplt绘制二元函数，通过选择除前两个变量外的每个变量的基本区间的中点来获得。




- text() 向数据点添加文本说明

- axis() 放缩坐标轴，设置坐标轴的限制范围
  - axis([xmin xmax ymin ymax ...])    设置当前坐标轴的限制范围，可设置 x轴、y轴、z轴、色差范围
    - axis([0,1,3,5]) 显示的x轴范围0~1，y轴范围3~5
  - axis off 不显示坐标轴
  - 等用法...

- contour() 绘制矩阵的等高线图
- clabel() 标注等高线图的高程 a=contour(...),clabel(a)

- 为图像添加标题，标记坐标区，调整x轴y轴，网格线，沿标签美化图形
  xlabel('自变量 X'),ylabel('因变量 Y')
  title('牛顿插值多项式与三次样条函数')
  legend('三次样条插值点坐标','牛顿插值点坐标')
  grid on, axis equal

- 在title、text、legend等等中写变量
  - title( [ '函数值=', num2str(xdata) ],'测试' )
  - [] 使[]内的内容在同一行or理解为同一个时候显示，默认情况 变量部分已经是下一个显示的了


- mesh() 绘制三维网格图
  - mesh(X,Y,Z)

- surf() 绘制三维曲面图

- figure() 创建一个用来显示图形输出的一个窗口对象

- meshgrid() 返回二维和三维网格坐标
  - [X,Y] = meshgrid(x,y)
  - [X,Y] = meshgrid(x)
  - [X,Y,Z] = meshgrid(x,y,z)
  - [X,Y,Z] = meshgrid(x)



# 工具箱
## cftool 曲线拟合
[Matlab——数据分析之曲线拟合工具cftool](https://blog.csdn.net/weixin_45770896/article/details/109697931)
- 命令行or文件 输入 cftool 打开工具箱
- 命令行or文件 输入xy数据向量and向量名，然后可选择？？
- 拟合类型选项
```
  - Custom Equations：用户自定义的函数类型
  - Exponential：指数逼近，有2种类型， a*exp(b*x) 、 a*exp(b*x) + c*exp(d*x)
  - Fourier：傅立叶逼近，有7种类型，基础型是 a0 + a1*cos(x*w) + b1*sin(x*w)
  - Gaussian：高斯逼近，有8种类型，基础型是 a1*exp(c1-((x-b1)/c1)^2)
  - Interpolant：插值逼近，有4种类型，linear、nearest neighbor、cubic spline、shape-preserving
  - Polynomial：多形式逼近，有9种类型，linear ~、quadratic ~、cubic ~、4-9th degree ~
  - Power：幂逼近，有2种类型，a*x^b 、a*x^b + c
  - Rational：有理数逼近，分子、分母共有的类型是linear ~、quadratic ~、cubic ~、4-5th degree ~；此外，分子还包括constant型
  - Smoothing Spline：平滑逼近（翻译的不大恰当，不好意思）
  - Sum of Sin Functions：正弦曲线逼近，有8种类型，基础型是 a1*sin(b1*x + c1)
  - Weibull：只有一种，a*b*x^(b-1)*exp(-a*x^b)
```
- 结果 Goodness of fit 拟合优度？
  - SSE 误差平方和，即 方差？和方差？SSE越接近0，拟合越好
  - R-Square 复相关系数或复测定系数，即 决定系数？确定系数？越接近1，拟合越好？
  - Adjusted R-Square 调整自由度复相关系数，即 校正后的决定系数？越接近1，拟合越好？
  - RMSE 均方根误差，即 标准差？(Root mearn squared error)，越接近1，拟合越好？
  - MSE 均方差？方差？
[Matlab的cftool拟合后的Adjusted R-square是什么意思？](https://www.ilovematlab.cn/thread-52812-1-1.html)



