一些相关理解

一个Java程序可以认为是一系列对象的集合，而这些对象通过调用彼此的方法来协同工作。下面简要介绍下类、对象、方法和实例变量的概念。
- 对象：对象是类的一个实例，有状态和行为。例如，一条狗是一个对象，它的状态有：颜色、名字、品种；行为有：摇尾巴、叫、吃等。
- 类：类是一个模板，它描述一类对象的行为和状态。
- 方法：方法就是行为，一个类可以有很多方法。逻辑运算、数据修改以及所有动作都是在方法中完成的。
- 实例变量：每个对象都有独特的实例变量，对象的状态由这些实例变量的值决定。


# meven工具
- 管理jar包，类似还有tomact
- 目录 
  - bin lib .ML ...
- 全局配置文档settings.xml
- .ML文件夹下，
优先级 mvn→/.ML/settings.xml/→conf/settings.xml
- 创建mvn项目：脚手架创建 archetype
  - 目录结构 有默认，也可以自己配置
  - 默认 src-main-java，resources，...
- POM.xml配置文件
  - groupId 公司域名
  - artifactId 功能命名
  - version 版本号
  - packaging 打包方式，默认jar包
  - description 版权
  - dependency内：
    - type 设置打包类型
    - scope 控制管理的？依赖的使用时刻，是否打入jar
      - compile 编译时使用
      - test 测试时使用
      - provided 编译使用，不打入jar
      - runtime 运行时使用，编译时不用，打入jar
      - system 可直接当成本地jar访问
      - ...
  - ...


# eslint/fontmin
es：ECMAScripe javaScripe标准之一
JS代码格式等的检查工具，如定义不允许存在var，空格检查，缩进检查等等
工作目录 npm install eslint
node_modules/.bin/eslint

fontmin 程序协助，有选择性在原字体文件中选用需要的内容，生成所需的新字体文件


# 0305
## react
UI框架，前端，开发高效灵活，配合度高
声明式 逻辑+html 模块化
传递参数，声明函数？渲染html

工具：Node.js
npm install -g cleate-react-app 安装react

- 组件
  - 属性props 由外部jsx传入
  - 状态state 如动画变化等，控制界面状态，更新不用刷新整个界面，为局部即时

-
- JSX语法
  - 即js+xml
-
- 虚拟dom
  - 组件state改变后，自动调用某方法，返回到组StaffPaymentDetail件，自动更新，再更新浏览器的dom
-
- 单向数据传递
-
-
-
-




