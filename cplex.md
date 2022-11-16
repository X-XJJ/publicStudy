
# cplex

- 安装玩cplex后，缺失“9.附加依赖项，确认并应用”中的
(2).    C:\ProgramFiles\IBM\ILOG\CPLEX_Studio201\cplex\lib\x64_windows_msvc14\stat_mda\cplex12100.lib
- test：用到的地方，都换为存在的 cplex2010.lib
- 观察截图，教程里的一套 都是12100



# cplex + c++


# cplex + python

- anaconda中pip install的cplex 和 docplex 是社区免费版，有求解的规模限制
- 除了商业版，还有免费学术版，需要edu邮箱注册ibm

[安装IBM CPLEX学术版 academic edition | conda 安装 CPLEX](https://blog.csdn.net/yihang___/article/details/125385030)


如果想要通过 Python API 使用 CPLEX 或 CP Optimizer 引擎，那么需要告知 Python 可在何处找到它们。  要执行此操作，请将以下命令输入到终端：
python D:\Program Files\IBM\ILOG\CPLEX_Studio221\python\setup.py install



https://www.ibm.com/docs/en/icos

https://www.ibm.com/docs/en/icos/22.1.0?topic=cparm-overview

http://ibmdecisionoptimization.github.io/docplex-doc/

https://www.ibm.com/academic/topic/data-science
(Software)

https://community.ibm.com/community/user/datascience/blogs/xavier-nodet1/2020/07/09/cplex-free-for-students

[python 如何调用Cplex?](https://www.zhihu.com/question/51750510)


如果想要通过 Python API 使用 CPLEX 或 CP Optimizer 引擎，那么需要告知 Python 可在何处找到它们。  要执行此操作，请将以下命令输入到终端：
 
<<<<<<
python C:\Program Files\IBM\ILOG\CPLEX_Studio201\python\setup.py install
>>>>>>


PROGRA~1

- 创建模型对象，模型类型：(0,1)规划 Binary Model，整数规划 Integer，

- opt_model = cpx.Model(name="模型类型")


[python运筹优化（一）：Cplex for python使用简介](https://zhuanlan.zhihu.com/p/124422566)



# cplex + java




