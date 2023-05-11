
# cplex

- 安装玩cplex后，缺失“9.附加依赖项，确认并应用”中的
(2).    C:\ProgramFiles\IBM\ILOG\CPLEX_Studio201\cplex\lib\x64_windows_msvc14\stat_mda\cplex12100.lib
- test：用到的地方，都换为存在的 cplex2010.lib
- 观察截图，教程里的一套 都是12100


https://www.ibm.com/docs/en/icos

https://www.ibm.com/docs/en/icos/22.1.0?topic=cparm-overview

http://ibmdecisionoptimization.github.io/docplex-doc/

https://www.ibm.com/academic/topic/data-science
(Software)

https://community.ibm.com/community/user/datascience/blogs/xavier-nodet1/2020/07/09/cplex-free-for-students


# cplex + c++


# cplex + python

- anaconda中pip install的cplex 和 docplex 是社区免费版，有求解的规模限制
- 除了商业版，还有免费学术版，需要edu邮箱注册ibm

[安装IBM CPLEX学术版 academic edition | conda 安装 CPLEX](https://blog.csdn.net/yihang___/article/details/125385030)

# cplex 与 docplex
- docplex中的 cp 与 mp
import docplex.mp.model 线性规划、整数规划？
import docplex.cp.model 非线性规划、混合整数规划？变量在指数位置，可用 mode.exponent()？



法1、
官方最后步骤：如果想要通过 Python API 使用 CPLEX 或 CP Optimizer 引擎，那么需要告知 Python 可在何处找到它们。  要执行此操作，请将以下命令输入到终端：
python "D:\Program Files\IBM\ILOG\CPLEX_Studio221\python\setup.py" install
- 路径中含有空格，会默认截断了

python setup.py install

可能问题：
- 权限问题，拒绝访问
- EasyInstallDeprecationWarning: easy_install command is deprecated. Use build and pip and other standards-based tools
- 以管理员身份打开anaconda的cmd
- 激活环境，要将cplex安装到的地方
- 进入到你的cplex安装路径下的python路径
- 执行安装命令，Cplex需要事先安装好


法2、曲线救国？
拷贝安装好的cplex包到对应的项目的site-packages下
[DOcplex介绍](https://blog.csdn.net/yaologos/article/details/85284768)
[DOcplex系列（二）——怎样成功安装和调用学术版DOcplex](https://blog.csdn.net/LemurHui/article/details/103377318)



[python 如何调用Cplex?](https://www.zhihu.com/question/51750510)

[python调用cplex_python运筹优化（一）：Cplex for python使用简介](https://blog.csdn.net/weixin_39763293/article/details/110283400)


PROGRA~1

- 创建模型对象，模型类型：(0,1)规划 Binary Model，整数规划 Integer，

- opt_model = cpx.Model(name="模型类型")


[python运筹优化（一）：Cplex for python使用简介](https://zhuanlan.zhihu.com/p/124422566)



# cplex + java




