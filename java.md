# 面向对象の基础见 softwareEngineering.md

# Java基 础概念
- 一个Java程序可以认为是一系列对象的集合，而这些对象通过调用彼此的方法来协同工作
-

- 栈：存基本类型、引用类型变量、方法
- 堆：空间大，存实例对象

- 即时编译，运行在虚拟机上，边解释边执行，解释型语言，自动垃圾回收处理

# 基本语法
- 类，class 类名{}
  - 类是java程序的基本组成单元
  - 每个程序都必须有一个main()方法，主类就是含有main()的类
- 关键字 new：为一个类创建新对象的方法之一，即 实例化一个xx类的对象
  - 类名 对象名 = new 类名(不填or填构造方法的参数); // 实例化 该类 的一个对象
  - TestClassName test = null; test = new TestClassName();
  - TestInterfaceClassName test = null; test = new TestImplementsClassName(); // 是接口类时，new后面的类名则为实现该接口类的类
- 常量，即开头加fanal：final Type valName，如 final int i = 1;
- 枚举，enum 枚举数组名{a,b,c}
- 数组
- 一维数组：
- 声明：Type arrayName[] 或 Type[] arrayName，如 int intArray[]; 或 int[] intArray;
- 创建：

- 方法，即 函数，public static void 方法名(){}

- this 关键字，
  - this.成员变量名，表示 使用本类中的变量、方法
  - 表示就近的对象
  - 只用 this，没有.，表示使用当前的对象，使用自己本身，如 当前的对象作为参数，使用当前的对象

- abstract 表示抽象

- 理解：类 = 洗衣机，实例化一个对象 = 现实来了一个洗衣机，接口 = 洗衣机上的按键，让人知道怎么使用，但不需要知道 洗衣机内部如何实现洗衣服

- 构造方法
  - 只能是【public 方法名(){}】形式，没有返回值类型
  - 类中的一种特殊方法，每个类都有一个自己的构造方法，名字必须【与该类名同名】，在创建对象时，由编译器自动调用，并且在整个对象的生命周期内只调用一次。
  - 系统默认给的是 无参数 构造方法
  - 自己写的，系统就用自己写的，可以写成有参数的，如果有参数，则在 new Data()时，括号内也必须带对应的参数
  - 作用：主要完成对象的初始化工作，将对象中的成员进行初始化，并不负责给对象开辟空间。
  - 构造方法的调用，是在创建一个对象时使用new操作进行的
  - 类中必定有构造方法，若不写，系统自动添加无参构造方法。接口不允许被实例化，所以接口中没有构造方法

public class Data {
    public int year;
    public int month;
    public int day;
 
    //构造方法：
    public Data(int year, int month, int day) {
        this.year = year;
        this.month = month;
        this.day = day;
        System.out.println("调用构造方法");
    }
 
    //Data类里的公有方法
    public void printDate() {
        System.out.println(year + "-" + month + "-" + day);
    }
 
    public static void main(String[] args) {
        //创建一个对象
        Data data = new Data(2022,11,13);
        data.printDate();
    }
}

[详解JAVA中的构造方法](https://blog.csdn.net/m0_70322372/article/details/127829707)


## 接口
- 在 接口类 中，只定义方法，不实现，只会有括号和参数()，没有方法体{}。
- 在用来实现接口的类里，一定会实现接口类中的 除了构造方法外的 所有公有方法？
- 接口本身，不可以进行实例化，即 不可以用 new
  - 接口名 对象名 = new 实现接口的子类名();
  - 接口名 对象名 = null; 对象名 = new 实现接口的子类名();
- interface 是定义/创建接口的关键字，表示 接口
- implements 用来将 实现接口的类 和 该接口 进行关联，用来实现接口的类 也可以理解为 接口类的子类？（implement翻译为实现）

// 创建接口类
interface 接口名{
  public 变量名 or 变量定义赋值; // 变量默认是 public static final 修饰的，可缺省
  public 方法名(); // 方法默认是抽象方法 public abstract 修饰的，可缺省
  public test(int[] a);
}
// 用这个类来实现接口类中的方法
class 类名 implements 接口名{
  public 方法名(){}
  public test(int[] a){a=3;return a;}
}


## 继承，父类子类
- extends 关键字，表示 继承
- abstract 定义抽象类、抽象方法。抽象类不可以实例化，即 不可以 new
  - 父类名 对象名 = new 子类名;
  - 父类名 对象名 = null; 对象名 = new 子类名();
- 如果父类定义为 抽象类 abstract 和？或？抽象方法 abstract ，则在子类中才具体实现，即 用于实现 多态
- 抽象方法只有括号和参数()，不加方法体{}

- supper()，必须且只能出现在子类的方法or构造方法中，用于在子类中调用父类的构造方法，必须在子类构造方法的方法体里的第一行


public class 父类名{
}

public abstract class 父类名{
  public 父类名(int a, int b){...} // 父类的构造函数
  public abstract void testName();
}

public class 子类名 extends 父类名{
  public 子类名(int a, int b){ super(a,b); } // 子类的构造函数，super()用于调用父类的构造函数
  public void testName(){}
}

[Java中super详解](https://blog.csdn.net/qq_42933309/article/details/124024427)


组合 关系的类，一般属性有 protected 类型，# 表示



### 软考下午最后一题
这一题 完全不懂设计模式也能做。但需要对继承和多态有足够理解。
题目就3种，
1.写类前面的关键字，当前类里没有实现具体方法就是 interface 且 在后面有其他类来实现这个类里的方法， 有实现具体方法的abstract class？？
2.写缺失的成员，子类父类对比着 找谁缺了啥就行，如果是个抽象方法，注意接口不用写abstract，类需要写。
3.写子类的具体实现，基本都是用父类/传进的参数，去调用某个抽象方法，注意参数，如果抽象方法定义的参数是具体的类，那你要填的空基本就是aaa.bbb(this)了



# 开发环境
- 平台：Java应用程序接口API + Java虚拟机JVM
- 开发工具包JDK
  - javac.exe：Java编译器，把.java编译为.class
  - java.exe：Java解释器，接受.class启动Java虚拟机解释并执行
  - ...
- 集成开发工具IDE Integrated Development Environment
- NetBeans，Eclipse，IntelliJ IDEA
---

# java内存
## 堆，栈，常量池
- 开辟内存，存储常量池？常量池放在哪里？

- 如string a="123"; 在栈中入栈，名为a，指向堆中的值123
- 堆：存放引用变量的内容
- 栈：存放基础类型，引用变量的名称
- 常量池：不存放于堆中

## 内存泄漏，溢出，，越界
- 堆中不断开辟空间，死循环情况，占用满，内存溢出
-
- 堆中开辟空间后一直存在，不使用，生命周期长，但占用着空间，无法回收，内存泄露
-
# 程序过程
.java
↓
.class
↓
classloader 封装Class类，加载


# string类
- 创建字符串变量，继承自object类
常用方法：
string 变量名 = new string(); == string 变量名;
带参数的构造方法：string 变量名 = new string("abc"); == string str="abc";

字符数组 
char[]  value = {'a','b','c'};
string str1 = value; //"abc"
string str2 = new string(value,1,2); //"bc"

byte[] stb = new byt[]{65,66}; //
string str3 = new string(stb); //"AB"

string str = "aaa bbb dd";
str.length(); //求字符串长度
str.substring(起始取数地 [,取串结束地]); //按位取子串
int a = str.compareTo(strt); //字符串比较，返回int，相同为0，否则大于0？
int b = str.compareToIgnore(strt); //相同返回0
str.equals; 相同返回ture，否则false

string c = "aa".concat("bb"); //字符串连接 "aabb"

str.indexof() 查找字符串
str.indexof("字符or字符串") 返回int为该字符or字符串起始位置 在原字符串中下标
str.indexof("字符",n) ？？

str.toLoverCase() 字符串转小写
str.toUpperCase() 字符串转大写
str.trim() 去除字符串两端的空格
str.contains("字符串") 返回bool为该字符串参数？是否存在

- string stringBuff stringBuilder
  - 运行效率string最小，stringBuilder最大
  - string 定义长度不可变
  - stringBuff 定义可变对象 改变字符串时自动在原来的空间上扩展长度，单线程
  - stringBuild为stringBuff升级版，多线程
  -

# Flie类
- 文件、文件夹操作
File file = new File($path或文件夹);
File file = new File($fatherPath, $fileName);
File file = new File(file对象, $fileName);
File file = new File($URL); //web开发，传入URL映射成文件对象

获取
file.get
- getPath() 获取传入的路径
- getabsolutorPath() 获取相对路径
- getname() 获取文件名
- getlength() 获取文件大小，返回int

判断
is exists() 判断是否存在，返回true false
is file() 判断是否是文件，必须存在
is director() 判断是否文件夹，必须存在

构造和删除
mkdir() 创建单个目录
mkdirs() 创建多层级目录
creatNewfile() 操作文件对象
file.delecte() 删除文件

- IO流进行文件操作
按字符读取 Reader() Writter() 文本
按字节读取 inputStream() outputStream() 文本 音频 视频
close()
flush()

inputStreamReader() 转换流 utf8 gbk 文件字符集类型和用于解析的字符类型需一致
objectInputStream() 序列化流
?() buffer流

# 位级
bitSet方法

# list类的内存分配
- ArrayList 连续数组结构？
-
- LinkedList 二链表内存结构
-


# java反射机制
将编译出的字节码文件封装到另一个对象（类），并对其进行操作

[Java中反射机制详解](https://www.cnblogs.com/whgk/p/6122036.html)


# redis 缓存
shiro 认证/授权框架，使用缓存 ehcache
需要获取资源、信息时，先去寻找缓存，没有再去查询

（听起来类似操作系统的机制，分页分段等）

redis-sever 端口号？开启？进入？服务
redis-cli -h $host -p $port
>auth $password，还有set get select dbsize keys del 等等命令



# 注解
本质：一个接口，该接口默认继承Annotation接口
属性：接口中的抽象方法

元注解：写在编写的注解接口之前，表明此注解的使用范围，如作用于类，作用于方法，成员变量，成员方法

使用注解：先写在要使用注解的东西前，@annotationName注解名，类似C中写在前的include或者函数声明

[java注解](https://blog.csdn.net/weixin_39151817/article/details/88921238)


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
      - compile 编译时使用 - test 测试时使用 - provided 编译使用，不打入jar - runtime 运行时使用，编译时不用，打入jar - system 可直接当成本地jar访问 - ...
  - ...
### 一些命令
mvn 插件名:参数

- 使用meven创建java项目
- mvn archetype:create -D 组名-包名 [-D artifactId=项目名 ...] 需指定参数
- mvn archetype:generate [-D 组名-包名 -D artifactId=项目名 ...] 可在运行中输入这些参数
- -D interactivemode=false 交互模式 true false 即是否可在运行中才输参数

mvn dependency tree 查看依赖树
mvn dependency resolve 查看依赖
mvn install -x 追踪依赖轨迹

# eslint/fontmin
es：ECMAScripe javaScripe标准之一
JS代码格式等的检查工具，如定义不允许存在var，空格检查，缩进检查等等
工作目录 npm install eslint
node_modules/.bin/eslint

fontmin 程序协助，有选择性在原字体文件中选用需要的内容，生成所需的新字体文件



# spring
## spring MVC
- 实现界面、逻辑、数据分离的框架
- model view controller
- 数据层 视图层 控制器
- 配置文件

- 工作原理
  - 用户请求 → dispateher Servelet

## IoC、DI 
IoC 控制反转 反转资源控制 Injection of control
DI 依赖注入
spring DI/IOC和AOP

1:DI/IOC
DI(依赖注入/Dependency Injection)原理与IOC(控制反转/Inversion of Control)一一样
IOC:反转控制-->反转资源获取方式
传统的资源获取方式是,一个组件告诉资源管理器自己需要什么.然后发起资源获取

也就是说,当你创建一个组件的时候,他会主动且固定的向资源管理器获取这份资源
那么,这份资源和该组件就紧紧的耦合在一起了,会造成开发的不便

那么什么叫IOC呢 IOC的意思就是控制反转
具体表现与上述传统的获取方式相反,组件不再主动获取资源,而是靠外部的其它程序将资源传递给他

而DI是IOC理论的一种实现方式
DI就是代码对即将创建的对象,对它进行该类所需资源的注入。而这个即将创建的对象并不知道其它的程序会注入什么样的资源过来
它只需要负责做好自己应该处理的部分,这样极大的降低了代码的耦合度

注:IOC是一种理论,而DI才是一种实现,所以一般情况下,对Java的DI/IOC,一般不叫IOC,通常都是叫做DI

2:AOP
AOP(面向切面编程/aspect oriented programming)
一般来说,程序都是大多都会体现出线性的执行,而面向切面则是从某个部分切开,在这个切面进行编程
比如说,一个人一天要做的事情如下的线性执行
起床->洗漱->上班-下班->买菜->做饭
其中买菜就需要花钱,如果我们的程序是记录这个人一天的消费的话,就可以在买菜这个位置切开,可以记录买菜前的金额,然后再买菜后再将买菜前的钱减去现在的钱
这样子就可以记录每天买菜消费的数额

使用Aspect的日志系统
假如我们有一个需求,就是负责记录每个函数的调用情况的日志
那么,在每个函数的代码中,就需要在开头调用一次日志记录函数,这样子的话会使本来的一个函数功能会处理多余的工作,不能专注自己自身的义务逻辑处理
各种散步在代码中的这些日志功能则被称为横切关注点

## AOP
面向切面编程
Aspect Oriented Programming的缩写，
通过预编译方式和运行期动态代理实现程序功能的统一维护的一种技术

横切关注点
通知
连接点
切点
切面：把横切关注点模块化，分类、抽象、描述、总结、组织
织入

通知们 + 切点们 = 切面

连接点：任何连接的地方都是，可以被选择做为切点
环绕通知：
AOP:一些功能需要散布在程序中的各个位置,但又不想主动的去调用它
也就是说,主动去调用它的话,这些功能是必须的,但同时主动调用它的话,会让本来的业务逻辑增加一些与本身业务无关的代码
横切关注点:
    散布在应用程序中的功能被称为横切关注点
    从根本上来说,这部分本来是与业务逻辑分开的,但它往往会嵌入到业务逻辑中
        比如说:有一个负责处理各种程序错误的类,但它还需要记录日志,那么日志系统和处理错误的系统
        根本来讲,他们理应是独立的东西,但其实在实际中,错误系统经常需要调用日志系统的API来完成这种事情
        注:散布在错误系统中的调用日志API的部分就是横切的关注点
    将横切关注点与业务逻辑分离出来才是AOP所解决的问题
切面:
    切面能帮助我们模块化横切关注点
    简而言之:横切关注点能够被描述为影响多处的功能,比如说日志记录
    就比如说,每个业务逻辑都能为特定的业务提供服务,但这些业务都需要类似的辅助功能,比如说日志记录的功能
    如果要重用这些功能的话,可以使用OOP的继承,或者委托.
    但如果要在整个程序中都继承这个日志类的话,会导致一个比较脆弱的继承结构
    使用委托的话,它的调用步骤会更加的复杂,并没有比原先的实现好多少

    AOP提供了一种取代他们的方法,而且可以使代码更加的清晰简洁.
    在使用AOP的时候,我们任然正常的定义通用功能,但是可以通过申明的方式定义它在何时何处应用
    横切关注点可以被模块化为特殊的类,这些类被称为切面
    这样做可以让业务模块更简洁,因为他们只负责关注核心功能的代码,而次要的代码都被移到切面中了

通知(Advice):
    通知定义了切面是什么,以及何时使用.
    也就是说,它同时定义了切面要做的事,也定义了它何时去做.
    通知=做什么,什么时候做

连接点(Join point):
    也就是任何可以被横向切入的地方,可以定义切点的地方

切点:(Pointcut):
    切点定义了何处,当通知定义了何时,做什么的时候,那么切点定义了何处

切面(Aspect):
    切面就是通知和切点的结合

织入(Weaving):
    织入就是把切面应用到目标对象并且创建新的代理对象的过程.
    切面在指定的连接点被织入到目标对象中
    织入的方法一般有:
        编译期的织入:
            在目标类型被编译时将它嵌入到目标对象中
        类加载期:
            切面在目标类被加载到JVM时织入
        运行期:
            在应用运行的某个时候被织入,在织入切面时,AOP容器会为目标目标对象创建一个对象
        


    我们可以看一个人一天做的事情的流程
    起床->洗漱->上班-下班->买菜->做饭
    我们可以定义一个日志系统,对这个人下班后的事情进行日志记录
    其中,每个要做的流程就可以看作是连接点,我们记录的是下班后做的事,也就是在买菜和做饭这两件事
    这两件事就是切点,而通知定义了做什么,以及什么时候做.
    也就是说我们可以定义在他准备买菜和做饭之前记录日志,其中在他做这两件事之前则为什么时候做.
    而进行记录日志则为做什么,这样子就是通知的组成部分

# java三大核心组件之——过滤器 filter
- 前端、后端互相访问时，经过过滤器
- 常用验证各种状态，数据加密等等中间的事情，满足条件则放行通过，或者拦截
- 创建filter即 实现filter接口，重写dofilter()方法

# 其他 
- λ表达式 Lambda
  - 匿名函数，闭包，Java 8 新特性
  - 允许把函数作为一个方法的参数，传递进方法中
  -


