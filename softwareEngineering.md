# 软件工程 Software Engineering

- 软件生命周期：软件定义、软件开发、运行维护
  - 软件定义（系统分析）
    - 问题定义，可行性研究，需求分析
  - 软件开发
    - 概要设计、详细设计，编码和单元测试，综合测试
    - 概要+详细=系统设计，编码+综合=系统实现
  - 运行维护
    - 使软件持久地满足用户的需要，一般包括4类
    - 改正性（改bug修错误），适应性（迁移），完善性（升级），预防性（？预先为以后的维护做准备？）

[软件中级设计师 - 软件工程](https://blog.csdn.net/laity__c/article/details/127870166)

能力成熟度模型 CMM，CMMI

# 软件过程模型（软件开发模型）
- 瀑布模型SDLC：只适用于需求明确或者二次开发（需求稳定）
- 原型模型：和瀑布模型相反，针对需求不明确的情况，通过演示和沟通，不适合大型项目！！！
- 演化（迭代）模型：和原型模型的区别就是，原型个人呢适用于需求不明确用于获取需求！
- 增量模型：每一次增量版本可作为独立可操作的作品，而原型的构造只是为了演示
- V模型：增加了很多轮测试，测试贯穿于软件开发的各个阶段
  - 需求建模、概要设计、详细设计、编码
  - 单元测试、集成测试、系统测试、验收测试
- 螺旋模型：增加了风险分析，适合大型项目
- 喷泉模型：特点是面向对象，而其他的都是结构化开发的模型

#软件开发方法
上面的软件过程模型基本都可归属下面四种开发方法中，注意特点：

- 结构化方法：流程固定，需求明确，自顶向下；以瀑布模型为代表，逐渐淘汰
- Jackson方法：面向！数据结构！开发方法，适合小规模项目
- 原型方法：适合于需求不明确的开发，以原型模型为代表【dkb】
- 面向对象方法：强调复用，以构建组装模型为代表，逐步流行

- “敏捷开发”的基本原则（小公司,中小型项目，去掉不必要的会议和文档）

- 结对编程：程序员审查代码
- 自适应开发：开发方法的适应性
- 水晶方法：每套项目都有不同的策略方法
- 极限编程XP：无需很多文档，提倡测试先行，将bug率最低
- 并列争球法SCRUM：迭代增量过程（“冲刺”，一期，二期）

- 逆向工程：属于 软件维护阶段 工具

- 沟通路径：人与人，两两之间有一条路径
  - n个人的团队中，共有 n(n-1)/2 条沟通路径

- 耦合：即 模块之间 互相影响、联系、互相连接的紧密程度

- McCabe方法计算程序复杂度：流程图中的闭合区域数+1


# 面向对象的分析方法
## 基本概念
- 类：我们分析抽象出的一个模板，它包含一类相似对象的 共同属性和方法
  - 属性 = 成员变量，方法 = 成员函数
  - 分类：实体类，接口类/边界类，控制类
- 对象：类的一个实例、实体，由“对象名、状态/属性、行为/操作”组成，封装“数据、行为”
  - 将自然存在的“名词”作为一个对象，运行时的基本实体，将 数据 + 操作，即 属性 + 行为，封装 为一个整体。
  - 对象的状态 = 对象的所有静态属性 + 每个属性的当前值
  - eg：在 狗类 中实例化一个对象，对象名为 一条小狗，它的状态有：颜色、名字、品种；行为有：摇尾巴、叫、吃等。
  - 实例变量：每个对象都有独特的实例变量，对象的状态由这些实例变量的值决定。
  - 聚合对象：指 一个对象包含其他对象。（静态方法属于类，不属于对象）
- 消息传递：对象之间进行通信时，使用消息，当成个消息包。
- 方法：即函数、行为，一个类可以有很多方法（即 成员函数），方法内有逻辑运算、数据修改以及所有动作。
- 动态绑定：在程序运行时，才确定具体调用什么方法，把方法和它所需的代码结合。
- 静态绑定：在程序编译时，就确定。
- 封装：对外只公开接口，隐藏对象的属性、实现细节

- 继承：父类定义抽象，子类实现具体。是父子类共享数据和方法的机制。
  - 子类 = 基类，父类 = 超类。子类继承父类，父类被子类继承
- 覆盖：= 子重写父，在子类中重写父类的方法。
- 重载：= 同类同名不同参，同一个类中，多个方法为同名方法，只是参数不同
- 多态：= 同消异果，同一消息传递，得到不同结果。
  - 使用父子类的“继承”来实现多台。由“动态绑定”为实现基础，由“继承”机制支持实现
  - 即 不同的对象 在收到同一消息时 可以产生不同的结果。
  - 运用本质：在父类中声明一个虚函数test不写内容，在各个子类中重写这个函数test。运行时，将子类的对象传给父类，实际上是传递了子类对象中重写的具体函数test给父类
  - 通用多态：允许不同类型的值，执行相同的代码
    - 参数多态：parametric，一个结构里，给不同的类型参数？？
    - 包含多态：inclusion，一样的操作可以用到 类型和其子类型上（≠子类）？？
  - 特定多态：限制可以用的类型，可能各类值要执行不同的代码
    - ！过载！多态：考的多，overloading，即 C++的重载，同名内容，在不同的上下文中有不同的类型
    - 强制多态：coercion，强制类型转换，由编译程序or程序猿来搞



# E-R图 实体联系图
- 联系转换：多对多的联系，需要将两端的主键归并到新的联系中？



## 进度管理 Pert图

- Gantt图/甘特图：横向的时间图，反应时间。简单，明了，但 不能表现任务之间的 逻辑关系

- PERT图：类似于前趋图，反应依赖关系，标注活动运行时间，但无法反应活动之间的并行关系
  - 关键路径(项目总工期)：耗时最长的路径
  - 最早开始时间ES：取所有前趋活动最早完成时间EF的最大值（走最长的路）
  - 最早完成时间EF：最早开始时间ES+活动本身时间
  - 最晚完成LF：取后续活动最晚开始的最小值（关键路径-完成该活动的后序活动最小值）
  - 最晚开始时间LS：最晚完成LF-活动本身时间（关键路径-最短的路）
  - 松弛时间：该结点最多可以晚多久开始（关键路径-包含结点活动的最大路径）

- 风险曝光度 = 风险概率 ×风险可能的损失


## UML图
- 统一建模语言(Unified Modeling Language，UML)是一种为面向对象系统的产品进行说明、可视化和编制文档的一种标准语言，是非专利的第三代建模和规约语言。UML是面向对象设计的建模工具，独立于任何具体程序设计语言。
- 构造块，规则，公共机制
  - 构造块：事物，关系，图
  - 规则
  - 公共机制：规格说明，修饰，公共分类，扩展机制

- 构造块→关系
  - 依赖，关联，泛化，实现

### 构造块→图
- 分类：结构图，行为图，静态图，动态图
- 结构图、静态图：
  - √类图：一组对象、接口、协作、和它们之间的关系
  - √对象图：某一时刻、一组对象、和它们之间的关系
  - 包图
  - 组合结构图
  - √构件图：静态 实现
  - 部署图：软件的构建 部署在 哪个硬件节点上。其他图都是 表示 xx和xx的关系
  - 制品图
- 行为图、动态图（用例图大部分归为动态，少部分归静态）
  - √用例图（用例）：系统在它的周边环境的语境中，提供的外部可见服务
  - √顺序图/序列图：按时间顺序，有生命线
  - √通信图/协作图：不强调时间顺序，无生命线，对象为节点，传递的消息
  - 定时图
  - √状态图：状态的 变迁、转移 情况，一个状态，遇到什么条件，转移到下一个状态
  - √活动图：一个活动到另一个活动的流程，类似 流程图，粗横线-产生多个并行线程-并行结束合并也是粗横线
    - 带泳道的活动图，泳道纵向，顶部为不同的对象
  - 交互概览图

- 类图——一组对象、接口、协作、他们的关系
  - 类(Class)封装了数据和行为，是面向对象的重要组成部分，它是具有相同属性、操作、关系的对象集合的总称
    - 类：三层矩形，第一层写类名，第二层写属性（如name：string），第三层写方法（如test():bool）
    - 符号：+，表示public公有的属性。-，表示private私有属性。#，表示protected受保护的。~，表示package是包。
  - 类 与 类 的 关系：依赖，泛化，关联，聚合，组合，实现
    - 关联：【A —B】，实线/无向边/箭头实线，描述对象之间的连接
      - 特殊关联：聚集，即 整体和部分的关系，分为聚合、组合
        - 聚合：【部分—◇整体】【部分—◇被聚合】，实线+白菱形，整体消失，不影响部分，生命周期不一致。如班级和学生
        - 组合：【部分—◆整体】【部分—◆被组合】，实线+黑菱形，整体消失，部分跟着消失，生命周期一致。如人和器官
      - 关联多重度：即 能与多少实例关联，A3—5B，表示一个A对应5个B，一个B对应3个A
    - 依赖：【类--→被依赖】，A-→B，虚线+箭头，A依赖于B，B被A依赖，B为独立事物
    - 泛化：【子类—▷父类】【子类—▷被泛化】，实线+白三角箭头，一般—▷特殊，子类泛化为父类
    - （不常考）实现：【某类--▷接口】【用例--▷协作？？】，虚线+白三角箭头

- 用例图（用例）——一组用例、参与者、他们的关系，表达 系统 和 外界 的 交互关系
  - 参与者：火柴人，用例：椭圆
  - 参与者 与 用例 的关系：关联，【A —B】，实线or实线箭头，关联/通信
  - 参与者 与 参与者 的关系：泛化
  - 用例 与 用例 的关系：包含，扩展，泛化
  - 包含：【基本--<<include>>-→被包含】，A→B，A包含了B，A分解出的一堆用例里，B是其中一个。
    - 虚线+<<include>>+箭头，被包含的一定使用，在基本用例的执行过程中，调用已经定义好的 被包含用例
    - eg：放饮料→打开柜子，放饮料→关闭柜子
  - 扩展：【扩展--<<extend>>-→被扩展/基本】，A→B，A扩展了B的内容，一个用例执行时，可能会发生特殊or可选情况
    - 虚线+<<extend>>+箭头，常规动作放在基本用例中，可选or特定条件才执行的动作放在它的扩展用例中
    - eg：还书→延期罚款，
  - 泛化：【子 —▷父】【子 —▷被泛化】，子泛化为父，特殊→一般，eg：精确查找→查找
    - 实线+空心白三角箭头，子用例继承了父用例所有的结构、行为和关系，是父用例的一种 特殊 形式
    - 英文 generalize

- 状态图

- 活动图
  - 类似 流程图


- 对象图，通常与类图一起出现
  - 对象名，方法名，属性名
  - 多重度：一个对象对应 1 0或多 1或多 个对象
  - 对象名：类名

- 顺序图
  - 对象（放顶端），往下引出 生命线，执行过程从上往下画，箭头表示消息传递
  - 表示对象之间的交互关系



## 软件测试
- 按？？分：单元、集成、系统、验收


- 动态：黑盒，白盒，灰盒
- 静态：

- McCabe复杂度：
  - McCabe度量法是由托马斯·麦克凯提出的一种基于程序控制流的复杂性度量方法。McCabe复杂性度量又称环路度量。
  - 计算有向图 G 的环路复杂度 V(G) = m - n + 2
  - V = 通路个数，m = 有向弧数量，n = 节点数量
 

## 模式
- 设计模式：23种，创建型，结构型，行为型

- 创建型
  - 工厂：专门用于创建相关对象族。
  - 原型：

- 行为型
  - 策略模式：封装一系列算法，使算法之间可以相互替换
 
- 状态模式：一个对象在其内部状态改变时，改变他的行为

- 观察者模式：一对多，一个对象的状态发生改变时，依赖它的对象都得到通知并自动更新

- 命令模式：将请求封装为对象，用不同的请求对客户进行参数化





