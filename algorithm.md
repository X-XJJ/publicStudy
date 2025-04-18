# 算法 algorithm


- P问题，P = Polynomial time 多项式时间
  - 解决问题的步骤数量、所需要的时间，是 问题大小 的 某个多项式函数（最坏情况）
  - 属于 NP 问题

- NP问题，non-deterministic polynomial time 非确定性多项式问题
  - 有关多项式时间检验，即 可以在多项式时间内，检验出正确解
  - 有限、但足够多的计算机，就可以检验所有可能的答案，就可以在多项式时间内找到正确的答案（最坏情况）
  - 属于 NP 问题

- NP完全问题 NP-complete
  - 任何NP问题，都可以在多项式时间内转化为该类or另一类NP问题中的任何一个
  - 属于 NP 问题，包含了每个NP问题中真正困难的部分。能完全解决NP-complete问题的程序 就能解决NP问题

- NP难问题，NP-hard
  - 无法在多项式时间内检验的问题

- Co-NP：容易排除错误答案的问题
- P-space：可以在给定无限时间的情况下解决的问题
- ……

[算法复习7 - NP问题（NPC、NP完全、NP-hard、停机问题）超详解](https://zhuanlan.zhihu.com/p/673064230)

[(210829) Tutorial-覆盖问题](https://zhuanlan.zhihu.com/p/408556395)



## 3-SAT问题


## 动态规划DP，Dynamic Programming

- 通过组合子问题的解，来求解原问题
动态规划应用与子问题重叠的情况，即不同的子问题具有公共的子子问题

- 我们解决动态规划问题一般分为四步：
   1、定义一个状态，这是一个最优解的结构特征
   2、进行状态递推，得到递推公式
   3、进行初始化
   4、返回结果

- 动态规划，即动态递推
  - 1、递归 + 记忆化 = 递推
  - 2、状态的定义 opt[n] dp[n] fib[n]
  - 3、状态转移方程 opt[n] = best_of (opt[n-1], opt[n-2])
  - 4、最优子结构

- 魔改高中数列题？？？

- 爬楼梯：小明爬n级楼梯，一次可以爬1级or爬2级，问小明有多少种上楼梯的办法
假设现在已知小明爬n-2级楼梯有f(n-2)种方法，爬n-1级楼梯有f(n-1)种方法，那么他可以选择从n-2级楼梯上两级到n级，也可以选择从n-1级楼梯上一级到n级，所以很容易得到状态转移方程：

当i>2时，status(i) = status(i-1) + status(i-2)
status(1) = 1，status(2)=2

参考代码：
```
int climbStairs(int n) {
    if(n == 1){
      return 1;
    }
    if(n == 2){
      return 2;
    }
    int num1 = 1;
    int num2 = 2;
    for(int i = 2; i < n ; i++){
      int tmp = num1 + num2;
      num1 = num2;
      num2 = tmp;
    }
    return num2;
}
```

  作者：yuruilee
  链接：https://www.jianshu.com/p/bd6b834d2546
  来源：简书
  著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。


- 斐波那契数列
  - 又称黄金分割数列，0、1、1、2、3、5、8、13、21、34、……在数学上，斐波那契数列以如下被以递推的方法定义：F(0)=0，F(1)=1, F(n)=F(n - 1)+F(n - 2)（n ≥ 2，n ∈ N*）



- 

ref：https://blog.csdn.net/haponchang/article/details/94721399
https://www.jianshu.com/p/bd6b834d2546
