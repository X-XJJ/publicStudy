# 高等工程数学 理论、公式 对应matlab函数使用
- matlab-AdvancedEngineeringMathematics

## Unit 1 误差相关

## Unit 2 插值、拟合、逼近
## Unit 3 数值积分、数值微分

## Unit 4 线性方程、非线性方程

## Unit 5 误差相关

## Unit 6 误差相关

## Unit 7 误差相关

## Unit 8 误差相关

## Unit 9 误差相关


- interp1() 插值函数
  - yi= interp1(x,y,xi,'method') 其中x、y为插值点向量，yi为在被插值点xi处的插值结果
    - 'method'表示采用的插值方法，MATLAB提供的插值方法有几种： 'nearest'是最邻近插值， 'linear'线性插值； 'spline'三次样条插值； 'pchip'立方插值．缺省时表示线性插值
    - 注意：所有的插值方法都要求x是单调的，并且xi不能够超过x的范围。


- trapz() 梯形数值函数
  - Q = trapz(Y)
  - Q = trapz(X,Y)
  - Q = trapz(,dim)



- 非线性拟合的**初值**问题
  - 从0开始递增测试，看何时达到稳定值收敛？or局部收敛？
  - 靠经验+运气预测个初值？



[复化的梯形公式、Simpson公式与Cotes公式的比较(用Matlab实现）](https://blog.csdn.net/Ednah/article/details/53233438)

