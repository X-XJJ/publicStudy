
# JavaScript

菜鸟教程
慕课网


# 基础语法
- 在html内添加js代码
  - 使用 <script>JS代码</script> 在html中插入JavaScript代码
  - <script type="text/javascript">JS代码</script>：表示script内的内容为文本类型，且该文本是JavaScript语言
- 单独创建JavaScript代码文件，后缀.js，文件内直接写js代码
  - <script src="name.js"></script>：在html代码中嵌入js文件
- js代码可以放在html的任意位置，但一般放在head或者body部分，放head则浏览器解析head时就会执行
- 注释：同C
- 声明变量：var 变量名。变量以字母、下划线、$开头
- “+”加号连接字符串
- break 直接跳出
- continue 跳过本次循环
- 条件判断：if(){} else if(){} else{}
- 条件选择：switch(){case a: break; default:}
- 条件循环：for(){}，while(){}，do{}while()
- 定义函数：function 函数名(){}，函数可在 script 标签内调用，也可在 body 中调用
- JS中单引号、双引号没什么区别？
- 用操作符比较的表达式会返回bool值，so这么写也可以“result = a!=b;”，a≠b为true，否则为false
- 操作符优先级：算术＞比较＞逻辑＞赋值符号


## 事件
- 事件：JavaScript 创建动态页面。事件是可以被 JavaScript 侦测到的行为。 网页中的每个元素都可以产生某些可以触发 JavaScript 函数或程序的事件。
- 常见事件
  - onclick 鼠标单击事件，onmouseover 鼠标经过，onmouseout 鼠标移开
  - onchange 文本框内容改变，onselect 文本框内容被选中
  - onfocus 光标聚集，onblur 光标离开
  - onload 网页加载。写在 <body onload=""> 中，相当于在加载body以下的内容时先触发onload=""
  - onunload 离开网页。不同浏览器对onunload事件的支持不同
  - 写在JS代码中：elementNode.事件 = function xx(){} 事件发生时触发xx()，如 window.onload = ""
- html中使用事件：在该元素中设置事件属性
  ```
  <body>
  <form>
    <input name="button" type="button" value="点击提交" onclick="add2()" />
  </form>
  </body>
  ```

## 对象-基础概念
- JavaScript 中的所有事物都是对象，如:字符串、数值、数组、函数等，每个对象带有属性和方法。
- 对象的属性：反映该对象某些特定的性质的，如：字符串的长度、图像的长宽等；
- 对象的方法：能够在对象上执行的动作。例如，表单的“提交”(Submit)，时间的“获取”(getYear)等；
- JavaScript 提供多个内建对象，比如 String、Date、Array 等等
  - 使用对象前先定义，如下使用数组对象：
  - var objectName =[];
  - var objectName =new Array();//使用new关键字定义对象
- 访问对象属性: objectName.propertyName
- 访问对象方法: objectName.methodName()
  - 如使用string 对象的 toUpperCase() 方法来将文本转换为大写：
  - var mystr="Hello world!";//创建一个字符串
  - var request=mystr.toUpperCase(); //使用字符串对象方法
  - 以上代码执行后，request的值是：HELLO WORLD!

## 常用对象
### Date() 日期对象
- 可以储存任意一个日期，可精确到毫秒数（1/1000 秒）
- 定义时间对象：var d = new Date(); //使 udate 成为日期对象，且已有初始值：当前电脑系统时间
- 自定义初始值
  - var d = new Date(2012, 10, 1);  //2012年10月1日
  - var d = new Date('Oct 1, 2012'); //2012年10月1日
- 用“方法”来严格定义时间，访问方法语法：“<日期对象>.<方法>”
- 日期对象中的常用方法：
  - d.get/setData()：返回/设置日期
  - d.get/setFullYear()：返回/设置4位数年份
  - 同理将↑的“Data”换为Year、Month（0为1月）、Day（星期几）、Hours、Minutes、Seconds、Time（单位ms毫秒，从1970.1.1算起）
  - eg：var year = d.getFullYear(); d.setYear(20);

### 字符串对象
- 直接赋值即定义 var mystr = "I love JavaScript!"
- 常用属性
  - mystr.length 长度
- 常用方法
  - mystr.toUpperCase()：全设大写
  - mystr.toLowerCase() 全设小写
  - mystr.charAt(index)：返回字符串中下标为index的字符
  - mystr.indexOf(substring [,startPos])：返回指定字符串substring在字符串mystr中首次出现的下标，startPos 可选整数参数 规定开始检索的位置
  - mystr.split(separator [,limit])：按separator指定字符串来分割字符串，limit 可选参数 规定最大分割次数，剩下没分割到的就丢弃。使用空字符串分割 即mystr.split("")表示分割每个字符
  - mystr.substring(startPos [,stopPos])：提取从整数下标startPos 到 stopPos-1 下标处的字符，包含startPos和stopPos-1处的字符
  - mystr.substr(startPos [,length])：提取从包含整数下标startPos开始的字符串，length为可选提取长度。startPos为负数 从尾部开始算，-1倒数第一个、-2倒数第二个

### Math 对象
- 固有对象，无需创建，可直接使用提供数学计算
- 常用属性
  - Math.E：自然对数底数e=2.71828...
  - Math.LN2：ln2。Math.LN10：返回ln10
  - Math.LOG2E：以2为底数的e的对数。Math.LOG10E：以10为底数的e的对数
  - Math.PI：圆周率π
  - Math.SQRT2：2的平方根。Math.SQRT1_2：2的平方根的倒数
- 常用方法
  - Math.max(x,y)：最大值。Math.min(x,y)：最小值
  - Math.ceil(x)：向上取整。Math.floor(x)：向下取整。Math.round(x)：四舍五入
  - Math.abs(x)：求x的绝对值
  - Math.pow(x,y)：x^y。Math.exp(x)：e^x。Math.log(x)：lnx
  - Math.sqrt(x)：x的平方根
  - Math.cos(x)：余弦值
  - Math.toSource()：返回该对象的源代码
  - Math.valueOf()：返回Math对象的原始值
  - Math.random()：0~1之间的随机数，eg获得0~10间的 document.write((Math.random())乘10);
  - ……

### Array() 数组对象
- 下标从0开始
- 一维数组
  - 不指定长度的空数组：var myarr = []; 或 var myarr = new Array();
  - 指定n个空元素但使用中可超过：var myarr = new Array(8); 超过n的部分直接赋值即可，如 myarr[8]=33; 
  - 定义同时初始化：var myarr = new Array(9,2,"dd",14,'aa',5);
- 二维数组
  - 定义同时初始化：var myarr2 = [[1,1],[2,2,2]];
  - 一个个赋值：myarr2[2][3] = 3; 第3行、第4列元素赋值为3
  - 先声明一维、再声明二维，可选是否为每个元素赋值：
    - var myarr = new Array(); myarr[0] = new Array(); myarr[1] = new Array(); ......  ？？？
    ``` 
    <script type="text/javascript">
      var myarr = new Array(n);
      for(i = 0~n){ //一维长度n
        myarr[i] = new Array(m); //二维长度m
        for(j = 0~m){ myarr[i][j] = ""; }
      }
    </script>
    ``` 
- 常用属性
  - myarr.length：一维数组长度，二维数组行数，会自动变化，也可对其赋值，myarr2[0].length 二维数组第一行的长度
- 常用方法
  - myarr.concat(array1,array2,...,arrayN)：合并myarr和()里的多个数组为一个新数组，不改变原数组
  - myarr.join(分隔符)：合并数组元素为一个字符串，用分隔符分隔数组元素如myarr.join("-")，默认分隔符为“,”
  - myarr.slice(start [,end])：返回从数组下标 start 到 end-1 处的元素
  - myarr.sort(方法函数名)：按指定方法对元素进行排序，缺省按unicode码排列
    - 用于比较的方法函数应该有两个输入参数a、b，返回值说明a、b的相对顺序
    - 返回值>=1，表示把 A 放在 B 之后，如 a-b＞1则排序为 b a 升序
    - 返回值>-1 && <1，表示 A 和 B 具有相同的排序顺序。
    - 返回值<=-1，表示把 A 放在 B 之前。
    ```
    <script type="text/javascript">
      function sortNum(a,b) {
      return a - b; //升序，如降序，把“a - b”该成“b - a”
    }
     var myarr = new Array("80","16","50","6","100","1");
      document.write(myarr + "<br>");
      document.write(myarr.sort(sortNum));
    </script>
    //输出：80,16,50,6,100,1 和 1,6,16,50,80,100
    ```
  - myarr.pop()：删除并返回数组最后一个元素
  - myarr.shift()：删除并返回数组第一个元素
  - myarr.unshift()：开头添加一个or多个元素
  - myarr.push()：末尾添加一个or多个元素，返回新的长度
  - myarr.reverse()：元素倒序
  - myarr.splice()：删除元素，并添加新元素
  - myarr.toSource()：返回该对象源代码
  - myarr.toString()：数组转换为字符串
  - myarr.toLocaleString()：数组转换为本地数组
  - myarr.valueOf()：返回数组对象的原始值

### window 对象
- window对象是BOM的核心，指当前的浏览器窗口
- BOM：浏览器对象模型，Browser Object Model，是浏览器的内置对象管理模型
- 开关网页方法
  - window.open([URL],[窗口名称],[参数字符串])：打开一个窗口，参数用单引号？双引号？？
    - 窗口名称：字母、下划线、数字组成，窗口名称不可重复、不允许空格
    - 特殊意义的名称
    ```
    '_blank'：在新窗口显示目标网页
    '_self'：在当前窗口显示目标网页
    '_top'：框架网页中，在上部窗口中显示目标网页
    ```
    - 参数字符串：窗口参数，各个参数间用逗号隔开
      - top-窗口顶部距离屏幕顶部的像素数，left-窗口左端距离屏幕左端的像素数，默认是？？
      - width-窗口宽度，height-窗口高度，默认是？？
      - menubar-窗口是否有菜单，toolbar-工具条，scrollbars-滚动条，status-状态栏，值为yes或no，默认yes？
    - 如 <script type="text/javascript"> window.open('http://www.imooc.com','_blank','width=300,height=200,menubar=no,toolbar=no, status=no,scrollbars=yes') </script>
  - window.close()：关闭当前窗口
    - <窗口对象>.close()：关闭指定窗口，如 var mywin = window.open("URL"); mywin.close();

- 计时器方法
  - setInterval(code,time)
    - 每隔指定的时间time就触发一次code，单位为毫秒，返回值为计时器的id，可用于clearInterval
    - 如有一个clock()函数，使用 var a = setInterval("clock()",1000) 或 setInterval(clock,1000)
  - clearInterval(计时器id)：取消对应设置，clearInterval(a)
  - setTimeout(code,time)
    - 只在指定延迟的时间time后触发一次code，其余同setInterval()，如 var a = setTimeout("alert("aa"),100)
  - clearTimeout(延时器id)：取消对应设置




- history对象
  - history.[属性|方法] 或 window.history.[属性|方法]
  - 记录用户曾经浏览过的页面(URL)，并可以实现浏览器前进与后退相似导航的功能。
  - 从窗口被打开的那一刻开始记录，每个浏览器窗口、每个标签页乃至每个框架，都有自己的history对象与特定的window对象关联
  - 属性：history.length：历史列表中URL的数量
  - 方法
    - history.back()：加载列表中上一个URL
    - history.forward()：加载下一个
    - history.go(整数)：按URL在列表中的相对位置加载该页面，0为当前页面，back() 即 go(-1)，forward() 即 go(1)

- location对象
  - window.location.[属性|方法]：获取、设置窗体的URL，可用于解析URL
  - 如一个完整URL：http://www.imooc.com:8080/list.php?courseid=8&chapterid=86#mediaid118
  - 属性
    - href：完整URL
    - protocol：协议，http
    - host：主机端口，www.imooc.com:8080/
      - hostname：主机名，可为域名、ip，www.imooc.com
      - port：端口号，8080
    - pathname：相对路径部分，list.php
    - search：从问号 ？ 开始的URL查询部分，?courseid=8&chapterid=86
    - hash：从井号 # 开始的URL锚，#mediaid118
  - 方法
    - assign()：加载新文档
    - reload()：刷新当前文档
    - replace()：用新的文档替换当前文档

- navigator对象
  - navigator.属性：包含有关浏览器的信息，通常用于检测浏览器与操作系统的版本
  - 常用属性
    - navigator.appCodeName：浏览器代码名的字符串表示
    - navigator.appName：浏览器名称
    - navigator.appVersion：浏览器的平台、版本信息
    - navigator.platform：运行浏览器的操作系统平台
    - navigator.userAgent：客户机发送给服务器的 user-agent 头部值，可用于判断当前使用的是什么浏览器
  - 属性 navigator.userAgent：用户代理头的字符串，即包括浏览器版本信息等等的字符串，几种浏览的user_agent.，像360的兼容模式用的是IE、极速模式用的是chrom的内核
    - 常见浏览器内核：Chrome，Firefox，MSIE
    - 使用userAgent判断使用的是什么浏览器(假设使用的是IE8浏览器),代码如下:
    ```
    function validB(){ 
      var u_agent = navigator.userAgent; 
      var B_name="Failed to identify the browser"; 
      if(u_agent.indexOf("Firefox")>-1){ 
          B_name="Firefox"; 
      }else if(u_agent.indexOf("Chrome")>-1){ 
          B_name="Chrome"; 
      }else if(u_agent.indexOf("MSIE")>-1&&u_agent.indexOf("Trident")>-1){ 
          B_name="IE(8-10)";  
      }
        document.write("B_name:"+B_name+"<br>");
        document.write("u_agent:"+u_agent+"<br>"); 
    } 
    ```
- screen对象
  - 获取用户的屏幕信息
  - screen.属性 或 window.screen.属性
  - 属性：
    - availHeight：窗口可使用的屏幕高度，单位像素
    - availWidth：窗口可使用的屏幕宽度，单位像素
    - colorDepth：用户浏览器表示的颜色位数，一般32位（每像素的位数）
    - pixelDepth：用户浏览器表示的颜色位数，一般32位（每像素的位数），IE不支持
    - height：屏幕高度，单位像素
    - width：屏幕宽度，单位像素


- 消息对话框方法
  - alert([str]) 或 window.alert()：带 确定 按钮的消息对话框、点确定前无法进行其他操作
  - prompt(str1,str2)：带 确定、取消、文本输入框 的消息对话框，str1为对话框显示文本，str2为文本框默认文本，确定返回文本框内容、取消返回null
  - confirm(str)：带 确定、取消 按钮的消息对话框，函数返回值为布尔型、确定返回true、取消返回false

- print()：打印当前窗口的内容
- focus()：将键盘焦点给予一个窗口。blur()：将键盘焦点从顶层窗口移开
- moveBy()：相对窗口的当前坐标、将它移动指定的像素。moveTo()：将窗口左上角移动到指定的坐标
- resizeBy()：按指定的像素值调整窗口大小。resizeTo()：将窗口大小调整到指定的宽、高
- scrollBy()：按指定的像素值滚动内容。scrollTo()：将内容滚动到指定的坐标


### 浏览器窗口的尺寸（浏览器的视口，不包括工具栏和滚动条）相关
一、对于IE9+、Chrome、Firefox、Opera 以及 Safari：
•  window.innerHeight - 浏览器窗口的内部高度
•  window.innerWidth - 浏览器窗口的内部宽度

二、对于 Internet Explorer 8、7、6、5：
•  document.documentElement.clientHeight表示HTML文档所在窗口的当前高度。
•  document.documentElement.clientWidth表示HTML文档所在窗口的当前宽度。
或者
Document对象的body属性对应HTML文档的<body>标签
•  document.body.clientHeight
•  document.body.clientWidth

在不同浏览器都实用的 JavaScript 方案：
var w= document.documentElement.clientWidth || document.body.clientWidth;
var h= document.documentElement.clientHeight || document.body.clientHeight;

### scrollHeight和scrollWidth，获取网页内容高度和宽度。
一、针对IE、Opera:
scrollHeight 是网页内容实际高度，可以小于 clientHeight。

二、针对NS、FF:
scrollHeight 是网页内容高度，不过最小值是 clientHeight。也就是说网页内容实际高度小于 clientHeight 时，scrollHeight 返回 clientHeight 。

三、浏览器兼容性
var w=document.documentElement.scrollWidth || document.body.scrollWidth;
var h=document.documentElement.scrollHeight || document.body.scrollHeight;

scrollHeight和scrollWidth还可获取Dom元素中内容实际占用的高度和宽度。

[JavaScript获取浏览器高度和宽度值(documentElement,clientHeight,offsetHeight,scrollHeight,scrollTop,offsetParent,offsetY,innerHeight)](https://www.cnblogs.com/easirm/p/4205155.html)
```
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 

</head>
<body>
<script type="text/javascript">
    document.write("body-height："+document.body.scrollHeight + "<br>body-width：" + document.body.scrollWidth);
    document.write("<br>documentElement-height："+document.documentElement.scrollHeight + "<br>documentElement-width：" + document.documentElement.scrollWidth)
</script>
</body>    
</html>
```

### 网页尺寸offsetHeight
offsetHeight和offsetWidth，获取网页内容高度和宽度(包括滚动条等边线，会随窗口的显示大小改变)。
一、值
offsetHeight = clientHeight + 滚动条 + 边框。

二、浏览器兼容性
var w= document.documentElement.offsetWidth || document.body.offsetWidth;
var h= document.documentElement.offsetHeight || document.body.offsetHeight;


### 网页卷去的距离与偏移量
- scrollLeft:设置或获取位于给定对象左边界与窗口中目前可见内容的最左端之间的距离 ，即横向滚动条滚动的距离。
- scrollTop:设置或获取位于对象最顶端与窗口中可见内容的最顶端之间的距离，即纵向滚动条滚动的距离。
- offsetLeft:获取指定对象相对于版面或由 offsetParent 属性指定的父坐标的计算左侧位置 。
- offsetTop:获取指定对象相对于版面或由 offsetParent 属性指定的父坐标的计算顶端位置 。
- offsetParent：布局中设置postion属性(Relative、Absolute、fixed)的父容器，从最近的父节点开始，一层层向上找，直到HTML的body。



## this关键字
[JavaScript this 关键字](https://www.runoob.com/js/js-this.html)
[JS中this关键字详解](https://www.cnblogs.com/lisha-better/p/5684844.html)
[彻底理解js中this的指向，不必硬背。](https://www.cnblogs.com/pssp/p/5216085.html)



## DOM 文档对象模型
### 基础概念
- 文档对象模型DOM（Document Object Model）：定义访问和处理HTML文档的标准方法
- DOM 将HTML文档呈现为有元素、属性和文本的树结构（节点树）。
- 结点结构
  - html{head,body}
    - head{meta,title}
    - body{h2,p,ul}
      - h2{a}
      - ul{li}
html
  head
    meta
    title
  body
    h2
      a
    p
    ul
      li

- HTML文档是由节点构成的集合，一个节点就是一个对象，三种常见的DOM节点如下:
  - 元素节点：<html>、<body>、<p>等都是元素节点，即标签。
  - 文本节点：向用户展示的内容，如<li>文本</li>中的JavaScript、DOM、CSS等文本。
  - 属性节点：元素属性，如<a>标签的链接属性 href="http://www.imooc.com"。

### ducument方法
- document.createElement(tagName)：创建以tagName为标签的新元素结点，返回element对象
  - 通常使用 父节点.appendChild() 或 同级节点.insertBefore() 来显示元素，用 element.href、element.style...或 element.setAttribute()等方法设置属性
- document.createTextNode(text)：创建内容为text的新文本节点
  - var textnode = document.creatTextNode("I love JavaScript!");
- document.getElementById(id)：根据id属性获取该元素对象，id是唯一标识，如...ById("clock")
- document.getElementsByName(name)：通过name属性获得元素对象的数组，返回的是元素的数组NodeList，因为可能有多个元素是相同name，注意是“Elements”带s的复数
- document.getElementByTagName(tagName)：通过标签名 如h1、span等获取元素，返回数组
- 元素属性

- document.getElementXX.value：根据元素的id属性获取、设置的该元素的value值（string类型）
- document.getElementXX.innerHTML：根据元素的id属性获取、设置的该元素的标签内的值？？如 <span>aaa</span>中的aaa？

- document.write(str)：向html输出流中写入内容
  - str为 数字、"字符串"、"<html标签>"、变量名，加号 + 连接多个内容。html标签如 "<br>"为输出换行符，如 document.write(myChar+"<br>") 

- document.body：？？？


### 节点属性
- 约定elementNode表示：使用getElementById()、getElementsByTagName()等方法，获取到的元素节点

- 节点属性：nodeName、nodeType、nodeValue

- elementNode.nodeType：结点类型，为一个整数，只读。常见如下
  - 元素 1，如 body、p、li、ul、……
  - 属性 2，如 type、name……
  - 文本 3，在标签内直接的文本，如 <div>aaa</div>中的aaa
    - 注意：空白符or连续空白符（空格、回车等）算一个节点，在IE内核是文本类型3，在其他内核是类型7。由于浏览器兼容问题？？
  - 7，？
  - 注释 8，？
  - 文档 9，？

- elementNode.nodeName：结点名称字符串，只读
  - 元素节点的 nodeName 与标签名相同
  - 属性节点的 nodeName 为属性的名称
  - 文本节点的 nodeName 永远是 #text
  - 文档节点的 nodeName 永远是 #document

- elementNode.nodeValue：结点的值
  - 元素节点的 nodeValue 是 undefined 或 null
  - 文本节点的 nodeValue 是文本自身（元素开始与结束节点内的文本内容是文本节点，不是元素节点的值）
  - 属性节点的 nodeValue 是属性的值

- elementNode.getAttribute(属性名)：通过属性名获取属性的值
- elementNode.setAttribute(属性名,属性值)：增加一个新属性、属性值，或设置该属性值
  - eg：myhead[i].getAttribute("type")：获取myhead数组中第i个元素的type属性的值


### 节点方法
- 节点树结构相关
  - elementNode.childNodes：返回一个数组，内容是给定元素结点elementNode的子结点们
     - eg：var divs = document.getElementsByTagName("div")[0].childNodes;
  - elementNode.firstChild：返回elementNode的第一个子结点，等价于 elementNode.childNodes[0]
  - elementNode.lastChild：返回elementNode的最后一个子结点
  - elementNode.parentNode：返回elementNode结点的父节点，父节点只有一个
  - elementNode.nextSibling：返回elementNode结点后的一个兄弟结点（同一树分支下的），只有IE会忽略空白符节点
  - elementNode.previousSibling：返回elementNode结点前的一个兄弟结点（同一树分支下的），只有IE会忽略空白符节点
    - eg：两个ul，每个ul里有3个li，找document.getElementsByTagName("li")[i]，这个数组中有6个元素
    - 找[0]的前一个兄弟节点、[2]的后一个兄弟节点都为空，∵第一个分支只包含[0][1][2]共3个节点 
  - elementNode.appendChild(newnode)：在elementNode节点的最后一个子节点列表后 添加一个新的子结点
    - eg：var node = document.createElement("span"); elementNode.appendChild(node);
  - elementNode.insertBefore(newnode,node)：在elementNode节点的子结点node之前插入一个新的子结点newnode
  - elementNode.removeChild(node)：删除elementNode中的子结点node，返回被删除的节点
    - 注意：elementNode.childNodes.length 会随着删除动作随时变动更新，so清除节点下的所有子结点的循环用倒序 i--
  - elementNode.replaceChild(newnode,oldnode)：将elementNode节点的子结点oldnode对象全部相关内容都替换为新结点newnode



- parseInt()：解析一个字符串，返回对应整数
  - 如果 string 以 "0x" 开头，parseInt() 会把 string 的其余部分解析为十六进制的整数。
  - 如果 string 以 0 开头，那么 ECMAScript v3 允许 parseInt() 的一个实现把其后的字符解析为八进制或十六进制的数字。
  - 如果 string 以 1 ~ 9 的数字开头，parseInt() 将把它解析为十进制的整数。

  ```
  <!DOCTYPE HTML>
  <html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>confirm</title>
    <script type="text/javascript">
    function rec(){
      var test=9; var mymessage=confirm(test+"测试");
      if(mymessage==true) { document.write("你是女士!"); }
      else { document.write("你是男士!"); }
    }    
    </script>
  </head>
  <body>
      <input name="button" type="button" onClick="rec()" value="点击我，弹出确认对话框" />
  </body>
  </html>
  ```

  ```
  <body>
  <p id="con">JavaScript</p>
  <script type="text/javascript">
    var mychar=document.getElementById("con");
    document.write("结果:"+mychar); //输出获取的P标签。 
    mychar.innerHTML = "new text";
    mychar.style.width = "300px";
  </script>
  </body>
  ```
- 元素对象.innerHTML：innerHTML属性中存放该元素的内容，可以更改
- 元素对象.style.属性：存放该元素对应的CSS样式属性，可以更改，使用""
  - 常用属性
  - backgroundColor height width color font fontFamily fontSize display……等
  - display：设置显示、隐藏效果，值为 block显示为块级元素、none隐藏该元素
  - cssText：设置元素的css样式？obj.style.cssText = "" 即 设置样式为空
- 元素对象.className：获取元素的类属性名（class属性名）
  - 若该元素没有设置类属性，可为该元素设置类属性名
  - 也可更改类属姓名，即为该元素更改样式（外观），更改的样式是该类属性名指定的css样式
- 元素对象.removeAttribute()：取消设置，恢复默认css样式，移除元素内在属性
  ```
  <!DOCTYPE HTML>
  <html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>className属性</title>
    <style>
        body{ font-size:16px;}
        .one{ border:1px solid #eee; width:230px; height:50px; background:#ccc; color:red; }
        .two{ border:1px solid #ccc; width:230px; height:50px; background:#9CF; color:blue; }
    </style>
  </head>
  <body>
    <p id="p1" > JavaScript使网页显示动态效果并实现与用户交互功能。</p>
    <input type="button" value="添加样式" onclick="add()"/>
    <p id="p2" class="one">JavaScript使网页显示动态效果并实现与用户交互功能。</p>
    <input type="button" value="更改外观" onclick="modify()"/>

    <script type="text/javascript">
       function add(){
          var p1 = document.getElementById("p1");
          p1.className = "one";
       }
       function modify(){
          var p2 = document.getElementById("p2");
          p2.className = "two";
       }
    </script>
  </body>
  </html>
  ```
  ```
  <!DOCTYPE HTML>
  <html>
  <head>
    <meta http-equiv="Content-Type" Content="text/html; charset=utf-8" />
    <title>javascript</title>
    <style type="text/css">
      body{font-size:12px;}
      #txt{ height:400px; width:600px; border:#333 solid 1px; padding:5px; color:blue; }
      p{ line-height:18px; text-indent:2em;}
    </style>
  </head>
  <body>
    <h2 id="con">JavaScript课程</H2>
    <div id="txt"> 
       <h5>JavaScript为网页添加动态效果并实现与用户交互的功能。</h5>
          <p>1. JavaScript入门篇，让不懂JS的你，快速了解JS。</p>
          <p>2. JavaScript进阶篇，让你掌握JS的基础语法、函数、数组、事件、内置对象、BOM浏览器、DOM操作。</p>
          <p>3. 学完以上两门基础课后，在深入学习JavaScript的变量作用域、事件、对象、运动、cookie、正则表达式、ajax等课程。</p>
    </div>
    <form>
    <!--当点击相应按钮，执行相应操作，为按钮添加相应事件-->
      <input type="button" value="改变颜色" onClick="changeColor()">  
      <input type="button" value="改变宽高" onClick="changeWH()">
      <input type="button" value="隐藏内容" onClick="hide()">
      <input type="button" value="显示内容" onClick="show()">
      <input type="button" value="取消设置" onClick="cancel()">
    </form>
    <script type="text/javascript">
      var txtObj = document.getElementById("txt");
      document.write("txtObj = " + txtObj);
      //定义"改变颜色"的函数
      function changeColor(){
        txtObj.style.color = "red";
        txtObj.style.backgroundColor = "yellow";
      }

      //定义"改变宽高"的函数
      function changeWH(){
        txtObj.style.width = "400px";
        txtObj.style.height = "400px";        
      }

      //定义"隐藏内容"的函数
      function hide(){
        txtObj.style.display = "none";
      }

      //定义"显示内容"的函数
      function show(){
        txtObj.style.display = "block";
      }

      //定义"取消设置"的函数
      function cancel(){
        var result = confirm("Are you sure?");
        if(result == true){
            //txtObj.className = "txt";
            //txtObj.removeAttribute("style");
            txtObj.style.cssText = "";
          }
      }
    </script>
  </body>
  </html>
  ```

9-22 制作一个表格，显示班级的学生信息。
要求：
1. 鼠标移到不同行上时背景色改为色值为 #f2f2f2，移开鼠标时则恢复为原背景色 #fff
2. 点击添加按钮，能动态在最后添加一行
3. 点击删除按钮，则删除当前行
```
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>实践题 - 选项卡</title>
    <style type="text/css">
     /* CSS样式制作 */  
    *{
        padding:0px;
        margin:0px;
        font:12px normal "microsoft yahei";
    }

    #tabs{
        width:350px;
        height:300px;
        margin:20px;
        padding:5px;
    }
    
    #tabs ul{
        height:30px;
        line-height:30px;
        display:block;
        list-style:none;
        border-bottom:2px red solid;
    }

    #tabs ul li{
        height:28px;
        width:60px;
        margin:0px 3px;
        line-height:28px;
        list-style:none;
        border:1px solid #aaa;
        border-bottom:none;
        background:#fff;
        cursor:pointer;
        float:left;
        display:inline-block;
        text-align:center;
    }

    #tabs ul li.on{
        border-top:2px solid red;
        border-bottom:2px solid #fff;
    }

    #tabs div{
        height:150px;
        line-height:25px;
        padding:5px;
        border:1px solid blue;
        border-top:none;
        clear: left;
    }
    
    #tabs p{
        margin:1px;
        padding:5px;
    }

    .hide{
        display:none;
    }

    </style>

    <script type="text/javascript">
    // JS实现选项卡切换

    window.onload=function(){
        var oTab = document.getElementById('tabs');
        var oUl = oTab.getElementsByTagName('ul')[0];
        var oLis = oUl.getElementsByTagName('li');
        var oDivs = oTab.getElementsByTagName('div');
        var len = oLis.length;
        
        for(var i=0;i<len;i++){
            oLis[i].index = i;
            oLis[i].onclick=function(){
                for(var n=0;n<len;n++){
                    oLis[n].className="";
                    oDivs[n].className="hide";
                }
                this.className='on';
                oDivs[this.index].className='';
            }
        }
    }
    </script>
</head>

<body>
<!-- HTML页面布局 -->
<div id='tabs'>
    <ul>
        <li class='on'>房产</li>
        <li>家居</li>
        <li>二手房</li>
    </ui>

    <div>
      <p>275万购昌平邻铁三居 总价20万买一居</p>
      <p>200万内购五环三居 140万安家东三环</p>
      <p>北京首现零首付楼盘 53万购东5环50平</p>
      <p>京楼盘直降5000 中信府 公园楼王现房</p>
    </div> 
    <div class='hide'>
      <p>40平出租屋大改造 美少女的混搭小窝</p>
      <p>经典清新简欧爱家 90平老房焕发新生</p>
      <p>新中式的酷色温情 66平撞色活泼家居</p>
      <p>瓷砖就像选好老婆 卫生间烟道的设计</p>
    </div>    

    <div class='hide'>
      <p>通州豪华3居260万 二环稀缺2居250w甩</p>
      <p>西3环通透2居290万 130万2居限量抢购</p>
      <p>黄城根小学学区仅260万 121平70万抛!</p>
      <p>独家别墅280万 苏州桥2居优惠价248万</p>
    </div>

</div>
</body>
</html>
```

















- => 箭头函数表达式
  - (参数1, 参数2, …, 参数N) => { 函数声明 }
-
- resolve和reject的区别

## 异步
- 不同的机制：
  - 回调函数 - callback 嵌套太深，回调噩梦
  - promise
  - async
  - *func
- pormise 解决回调的多层嵌套问题，可控制和判断上一阶（高阶）函数的返回结果
- generator生成器 对promise产生作用
  - 一种数据类型

- async/await(es7)
  - 并行方式
-
-
- 单线程，消息队列，任务队列，时间循环，调用栈

