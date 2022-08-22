# 前端相关 html(5)+css(3)

菜鸟教程
慕课网

# html（HyperText Markup Language，HTML）
- 超文本标记语言（HyperText Markup Language，HTML），用于创建web网页的标准标记语言，web浏览器中一般按 F12 打开调试模式，浏览器按先后顺序解释html代码
- 常用编辑器：VS Code，Sublime Text
  - VSCode使用浏览器打开 html 文件需要 安装 "open in browser" 扩展
- 后缀：.html .htm 都可使用，没有区别？
- 标签：尖括号包围的关键词，开始标签和结束标签成对出现
  - <标签 属性="">内容</标签>，这个整体叫“元素”。元素可嵌套，先后顺序需一致
  - 标签内可以有属性，属性不一定全都需要。
- 不用配结束标签的标签们：
  - br，

- 注释：<!-- 注释内容 -->
- 语义化：明确标签用途
- html不区分大小写，但建议小写。

## 常用html标签
- 不用首尾成对的标签：meta、br、hr、input、
```
<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <title>菜鸟教程(runoob.com)</title>
  </head>

  <body>
    <h1>我的第一个标题</h1>
    <p>我的第一个段落。</p>
  </body>

</html>
```
- <!DOCTYPE 版本名称>：声明html版本，版本名不区分大小写，html5的声明为<!DOCTYPE html>
- <html></html>：HTML页面的根元素，必须在首尾
- <head></head>：头部元素，包含文档的元（meta）数据，可以包含一些辅助性标签
- <body></body>：在head标签对之后出现，包含显示在浏览器页面中的可见内容

### 辅助性标签，包含在head内
- <meta charset="编码名称">：在head中声明网页的字符编码，中文网页一般使用<meta charset="utf-8">，部分浏览器如360使用 gbk 编码
- <title></title>：页面标题
- <link/><meta/>
- <style></style>
- <script></script>

### 语义化标签，包含在body内
- <h1></h1>：定义一级标题，以此类推 h2 二级标题到 h6 六级标题
- <p></p>：定义一个段落
- <span></span>：没有语义，设置单独的样式。style内定义样式span{}，body内用<span></span>显示
- <div></div>：自定义块，作用相当于一个容器，划分各个不同模块
- <header></header>：定义头部区域
- <footer></footer>：定义头部区域
- <section></section>：定义一个区域
- <aside></aside>：定义一个侧边栏区域

### 效果标签
- html中忽略文字中的回车和多个空格，无论有多少连续的回车和空格，都只显示为一个空格
- <br /> 或 <br>：回车换行标签，是一个没有html内容的空标签
- &nbsp;：空格代码，一个显示一个空格
- <hr /> 或 <hr>：水平分割线标签，是一个空标签

### 列表标签
- <ul><li>信息1</li><li>信息2</li></ul>：无序信息列表，每项li前默认为黑圆点
- <ol><li>信息1</li><li>信息2</li></ol>：有序信息列表，每项li前默认为数字序号

### 图片、链接、表格标签
- <img src="图片地址" alt="下载失败时的替换文本" title="鼠标滑过提示的文本" width="显示宽度" height="显示高度">：定义图片，gif、png、jpeg格式
- <a href="目标网址" title="鼠标滑过提示的文本" target="打开网页的方式">链接显示的文本</a>：定义一个html链接，target属性中_self 默认在当前界面打开链接，_blank 在新窗口打开链接
- <nav></nav>：标注一个导航链接的区域，nav内的内容是<a></a>们
- <table border="表格边框"></table>：表格开始结束标签，border值为数字，0无边框数字越大边框越粗
  - <caption></caption>：表格标题
  - <tr></tr>：表中的一行
    - <th></th>：表头行的一个单元格，默认加粗居中
    - <td></td>：一行的一个单元格，一行有n个单元格即为有n列
  - <thead></thead>：组合html表格的表头内容，其中一般放tr、th标签
  - <tbody></tbody>：可将表格分段，其中内容下载完后优先显示，其中一般放tr、td标签
  - <tfoot></tfoot>：分组表注（页脚）内容，其中一般放tr、td标签

### 表单form、浏览器交互，用于将输入数据传到服务器
- <form name="后台用的表单名" method="传送方式" action="服务器文件"></form>：表单开始结束标签，method为get、post，action为数据被传送到的地方？如 save.php文件
- 表单控件放在form标签内
- <input type="输入文本的类型" name="文本框名称" value="文本" placeholder="占位符内容" id="该元素？控件标识、可与label绑定">：文本输入框标签
  - type
    - text为文本输入框，password为密码框，number为数字框、只能输入数字、鼠标滑过时框右边有上下符号
    - url为网址框、内容需以http://或https://开头，email为邮箱框、值需包含@
    - radio：单选框，一个选项为一条input、同一组单选选项的name属性的取值一致，用户只能选择一项
    - checkbox：复选框
    - submit：提交按钮，按下后提交该表单数据到后台服务器
    - reset：重置按钮，按下后重置该表单数据
    - button：按钮
  - onClick：点击按钮时触发的动作？？如调用js函数？？？
  - checked：单选框、复选框使用，checked="checked"时默认选中状态
  - value：框内、按钮上显示的文本
  - name：给后台程序asp、php使用
  - placeholder：文本框占位符、输入框无内容时提示、输入内容时消失
  - id：标识，可用于label标签的for属性
- <textarea rows="行数" cols="列数"></textarea>：文本输入域，在表单中输入大段文字。在CSS样式中rows可用height代替、cols用width代替
- <label for="要绑定的元素控件id值"></label>：为input元素定义标记，在label元素内点击文本就会触发此控件，当用户选择label显示的内容，浏览器自动将焦点转到和label绑定的表单控件上。for属性将label绑定到另一个元素，for的值=要绑定的元素的id值
- <select></select>：下拉列表，其中只能放option标签
  - <option value="向后台提交的值" selected="selected">显示的值</option>：下拉列表的选项内容，一条一项，selected="selected"为默认选中，否则默认选中第一个option



# css（Cascading Style Sheets，CSS）
- 层叠样式表（Cascading Style Sheets），“样式”用于定义html内容在浏览器里的显示样式，即定义如何显示html、xml元素，如布局、外观、颜色等，定义写在“样式表”中，可以让不同王爷位置的文字有统一的外观。外部样式表写在css文件中。
- 注释：斜杠星号对`/**/`
- 在head标签内，使用样式表的标签or属性，关键字为style，如<style type="text/css"></style>
- 标签选择器{样式;}
  - style中的样式语句由“选择器 声明”构成
  - “选择器”用于指明声明中“样式代码”的作用对象，选择器名英文任意起？
  - 声明{...}由属性构成，属性之间用分号分隔。选择符=选择器
  - 如 span{color:red}，h1{color:#930}，span和和h1为选择符，{...}为声明语句，color为属性，red为属性值
- body标签中用选择器标签对括起来的内容将按设定的样式显示，如 <span>要按red显示的内容</span>
```
<!--定义一级标题h1的样式-->
<style type="text/css">
 h1{
      font-size:12px;
      color:#930;
      text-align:center;
   }
</style>
```

## html网页中，CSS样式的插入形式：内联、嵌入、外部
- 优先级
  - 相同权值下，内联＞嵌入＞外部
  - 嵌入和外部的优先级，看就近原则，即 离被设置元素越近的，优先级越高
- 内联式
  - 将css样式代码直接写在现有html的开始标签中，用 style="" 包含起来
  - 如 <p>aaa<span style="color:red; font-size:12px">这里文字是红色，字号12</span>这里不是</p>
- 嵌入式
  - 将css样式代码写在style标签内，一般style写在head内，<style type="text/css"></style>将样式代码包含起来
  - 如 <head><style type="text/css">span{color:red;}</style></head> 将所有span括起来的内容设置为红色
- 外部式
  - 将css样式代码写在一个单独的.css文件中，文件用英文命名，在head标签内使用<link/>链接.css文件到html文件内
  - <link href="文件地址" rel="styleheet" type="text/css"/>：rel和type部分为固定写法

## CSS3选择器（选择符）
- 选择器，起名规则为任意英文，语法：选择器名{css样式代码}，以下一般定义在style内，用在body内
- 优先级
  - 内联样式 <属性=> ＞id选择器 #{} ＞类选择器 .{} ＞标签选择器 {} ＞通配符选择器
    - ？？通配符选择器？是通用选择器？
- 继承
  - 某些样式具有继承性，即 该样式可以应用于p标签 和 p标签中的所有子标签，如color样式 p{color:red;}，有些不具备，如border样式
- 权值计算、特殊性
- 浏览器计算权值，通常使用权值高的css样式，且用户自己设置的样式＞网页制作者样式＞浏览器默认的样式
  - 特殊最高层级：在属性值后、分号前添加“!important”
  - 标签的权值为1，类选择符的权值为10，ID选择符的权值最高为100。
  - 例如下面的代码：
```
  p{color:red;} /*权值为1*/
  p span{color:green;} /*权值为1+1=2*/
  .warning{color:white;} /*权值为10*/
  p span.warning{color:purple;} /*权值为1+1+10=12*/
  #footer .note p{color:yellow;} /*权值为100+10+1=111*/
  p{color:red!important;} /*p段落显示red颜色*/
```
  - 注意：继承也有权值但很低，有的文献提出它只有0.1，所以可以理解为继承的权值最低。

### 分类
- 一般选择器？？
  - 语法：选择器名{css样式代码;}
  - 应用的标签就是选择器名，如 p{color:red;} 应用到<p></p>上

- 类选择器（点.）
  - 语法：.类选择器名{css样式代码;}
    - 英文圆点开头，如 .stress{color:red;} .size{font-size:12px}
  - 为标签设置一个类属性：class="类选择器名"，如 <span class="stress size">test</span>
  - 应用于任何元素，在一个html文档<p>中可使用多次，一个class=""内可以列多个类选择器

- id选择器（井号#）
  - 语法：#id选择器名{css样式代码;}
    - 井号开头，如 #stress{color:red;}
  - 为标签设置一个类属性：id="id选择器名"，如 <span id="stress">test</span>
  - 应用于任何元素，但在一个html文档<p>中只能使用一次，且一个class=""内只能有一个id选择器
  
- 子选择器（右尖括号>，作用于子选择器当前层）
  - 语法：.类选择器名>子选择器名{css样式代码;}
    - 如 .stress>span{color:red;}
  - 在类选择器范围内实现子选择器的样式，如 <p class="stress">无效果<span>test有效果</span>无效果</p>
  
- 包含选择器（空格 ，作用于包含选择器以下的所有层）
  - 语法：.类选择器名 包含选择器名{css样式代码;}，如 .stress span{color:red;}
  - 在类选择器范围内实现包含选择器的样式，如 <p class="stress">无效果<span>test有效果<li>test有效果</li></span>无效果</p>
  
- 通用选择器（星号*）
  - 语法：*{css样式代码;}
    - 如 *{color:red}
  - 匹配html中的所有标签元素，所有标签全设置*
  
- 分组选择器（逗号,）
  - 语法：分组选择器名1,分组选择器名2{css样式代码;}
    - 如 h1,span{color:red}，如 .first,#second span{}
  - 将多个选择器范围内的内容都设置为同一个样式，如 上述代码等价于 h1{color:red} span{color:red}

- 伪类选择器
  - 语法：伪类选择器名:………………待续，不太明白？？？？
  - 给不是html里的标签设置样式，如 a:hover{}，表示在a标签上使用:hover，设置鼠标滑过文字时文字显示的状态，a标签是可以兼容所有浏览器的“伪类选择符”？如<a>无效果</a>
  

## 常用样式属性
### 字体
- font-family：字体，body{font-family:"宋体";}，其他如 Microsoft Yahei、微软雅黑、楷体等
- font-size：字号，12px 为12像素，数字越大文字越大，最小号为12？
- font-weight：粗细，bold 为粗体
- font-style：字体样式，normal 为正常，italic 为字体本身就有倾斜样式的斜体，oblique 为强制斜体
- color：颜色，英文命令 如 red、blue等，RGB整数or百分数颜色 如 rgb(133,45,200)、rgb(20%,33%,25%)等，十六进制颜色 如 #930、#00ffff等
- font：字型简写，font样式可以简写为一行，以空格分割各属性，其中至少要有font-size、font-family的属性值，在font-size与line-height中间要有斜杠“/”。如 body{font:italic bold 12px/1.5em "宋体",sans-serif;}

### 文本
- line-height：行间距，1.6em 为1.6倍行距
- letter-spacing：字符间隔，50px 为50像素
- word-spacing：单词间隔，50px 为50像素
- text-decoration：文本装饰，默认值 none 为标准文本，underline 为下划线，overline 为头顶线，line-through 为删除线
- text-indent：段首缩进，2em 为2倍文字大小
- text-align：设置“块状元素”的样式，文字横向位置，center 居中，left 居左，right 居右
- 相对长度值
  - px 像素，css规范中假设 90px = 1英寸，浏览器使用显示器的实际像素值
  - em，其大小为本标签元素中font-size值，如 font-size:12px 则 1em = 12px。若在font-size中使用了em，则该em以父标签的font-size为基础
  - % 百分比，直接使用时其基础也为本标签元素中font-size值

### CSS盒子模型
- 元素分类：块状元素、内联元素（行内元素）、内联块状元素
```
  - 常用块状元素
    - <div>、<p>、<h1>...<h6>、<ol>、<ul>、<li>、<dl>、<table>、<address>、<blockquote> 、<form>
  - 常用内联元素
    - <a>、<span>、<br>、<i>、<em>、<strong>、<label>、<q>、<var>、<cite>、<code>
  - 常用内联块状元素
    - <img>、<input>
```
- 块状元素
  - 一个块状元素在显示时将独占一行，可设置高度、宽度、行高、顶边剧、底边距，宽度默认和父容器宽度一致
  - 将元素 a 设置为块状元素：a{display:block;}
- 内联元素（行内元素）
  - 显示时和其他元素在同一行，不可设置高宽、顶底边距，宽度为内容宽度，内联元素间存在间距
  - 将元素 a 设置为内联元素：a{display:inline;}
- 内联块状元素
  - 显示时和其他元素在同一行，可设置高度、宽度、行高、顶边距、底边距
  - 将元素 a 设置为内联块状元素：a{display:inline-block;}
- 隐藏元素a：a{display:none;}

- 盒子模型理解
  - 盒子 如<div>内容</div>，盒子有一个方形边框，盒子里有内容，内容可以是文字、图片、标签等，这些内容在边框内显示，盒子和内容显示的位置由以下内容决定：
    - 边框，样表中叫border，盒子的边框
    - 内边距（内填充），样表中叫padding，内容到边框的距离
    - 外边距，样表中叫margin，盒子与另一个盒子之间的距离
  - 内填充、外边距、边框，每个都有4个方向的值，left、right、top、bottom，如 border设置所有边框，border-left只设置左边框
  - 元素实际宽度 = 盒子宽度 = 内容的宽度 + 左右padding的宽度 + 左右border的宽度 + 左右margin的宽度，高度同理
  - 块状元素（块级标签）都具备盒子模型的特征
- width-宽、height-高：内容范围，单位为px-像素。如 li{width:200px;height:30px;}
- background-color：背景色，块状元素、行内元素可设置
- border：边框，可设置 粗细、样式、颜色 等属性
  - border-width：粗细、宽度，单位为px，thin medium thick，
  - border-style：样式，dashed 虚线，dotted 点线，solid 实线
  - border-color：颜色
  - 三种属性可一个个设置，写也可缩写，缩写如 border:2px solid red; 表示2px粗的实心红色边框
  - border-bottom：单独设置下边框，同理可单独设置上左右边框，如 border-top:1px solid red;
  - border-radius：边框的圆角效果，单位为px，同理可一个个写也可缩写
    - border-top-left-radius：左上角圆角效果值
    - border-top-right-radius：右上角
    - border-bottom-right-radius：右下角
    - border-bottom-left-radius：左下角
    - 缩写只写一个值的默认四角都用这个值 如 border-radius:10px;
    - 缩写只写两个值的默认第一个值是左上、右下，第二个值是右上、左下
    - 缩写时顺序为顺时针，左上、右上、右下、左下。如 border-radius:10px 20px 30px 40px;
    - 正方形边框中，圆角值 = 元素宽度width的一半 时，显示效果为正圆形弧
- padding：内边距（内填充），单位为px
  - padding-top：上内边距
  - padding-right：右内边距
  - padding-bottom：下内边距
  - padding-left：左内边距
  - 缩写时顺序为顺时针，上、右、下、左。如 padding:10px 20px 30px 40px
  - 缩写只写一个值的默认四边都用这个值
  - 缩写只写两个值的默认第一个值是上、下，第二个值是左、右
- margin：外边距（边界），单位为px
  - margin-top：上外边距
  - margin-right：右外边距
  - margin-bottom：下外边距
  - margin-left：左外边距
  - 缩写规则同padding

- list-style：列表属性，简写属性在一个声明中设置所有的列表属性。
  - 可以设置的列表属性：list-style-type，list-style-position，list-style-image，none

- cursor：定义了鼠标指针放在一个元素边界范围内时所用的光标形状


### CSS布局模型
- 在网页中，元素有三种布局模型：Flow 流动模型，Float 浮动模型，Layer，层模型
- Flow 流动模型：网页的默认布局模式
  - 排队显示：平级的块状元素从上到下按行顺序垂直延伸分布显示，平级的内联元素从左到右水平分布显示
- Float 浮动模型：任何元素默认不能浮动，需定义
  - 定义：a{float:属性;}
  - 属性
    - left 左浮动 即a标签内的内容们在一行内左对齐？？？
    - right 右浮动 即右对齐
- Layer 层模型：类似PS中的图层，操作能精确定位到图层
- position 定位，分三种：绝对定位(position: absolute)，相对定位(position: relative)，固定定位(position: fixed)
- 绝对定位：absolute
  - 将元素从文档流中分离出来
  - 使用left、right、top、bottom属性定位，定位位置是相对于其最接近的一个具有定位属性的父包含块来说的
  - 如果不存在这样的包含块，则 相对于body元素（即相对于浏览器）
  - 如 a{position:absolute; left:20px; top:10px;} 表示元素a距离其父元素左边界20px、上边界10px
- 相对定位：relative
  - 确定元素在文档流中的偏移位置（相对位置）
  - 相对定位完成的过程是首先按static(float)方式生成一个元素(并且元素像层一样浮动了起来)，然后相对于以前的位置移动，移动的方向和幅度由left、right、top、bottom属性确定，偏移前的位置保留不动。
  - 元素偏移显示后，原位置依然是占用着的，新元素显示在该元素原位置之后，不受该元素偏移的影响
  - 如 a{position:relative; left:20px; top:10px;} 表示元素a距离其原位置的左边界20px、上边界10px
- 固定定位：fixed
  - 相对于视图（屏幕内的网页窗口）的位置，因为视图本身是固定的so叫固定定位
  - 视图本身是固定的，它不会随浏览器窗口的滚动条滚动而变化，除非你在屏幕中移动浏览器窗口的屏幕位置，或改变浏览器窗口的显示大小，因此固定定位的元素会始终位于浏览器窗口内视图的某个位置，不会受文档流动影响，这与background-attachment:fixed;属性功能相同，
  - 拖动滚动条时，元素位置固定不变，如 一直在界面显示、看起来跟着滚动条滚的广告弹窗
  - 使用left、right、top、bottom属性，相对于浏览器视图进行绝对定位
  - 如 a{position:fixed; left:20px; top:10px;} 表示元素a距离浏览器视图左边界20px、上边界10px
- 组合使用 relative、absolute
  - 相对于body外的其他元素，进行定位
  - 参照定位的元素必须是相对定位元素的前辈元素，即 B元素在A元素内，则可以设置B相对于A的位置
  - 参照定位的元素必须加入position:relative; ，即 在A里加
  - 定位元素加入position:absolute后，使用top、bottom、left、right来进行偏移定位，即 在B里加


### flex弹性盒子模型
- display:flex：添加在父元素的css样式中，可以将父元素包含的子元素们显示在一行，默认从左到右排列，与父元素左边没有间隙
```
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>flex布局</title>
    <style type="text/css">
    .box {
        background: blue;
        display: flex;
        border:20px solid yellow;
    }

    .box div {
        width: 200px;
        height: 200px;
        border:10px solid blue;
    }

    .box1 {
        background: red;
    }

    .box2 {
        background: orange;
    }

    .box3 {
        background: green;
    }
    </style>
</head>

<body>
    <div class="box">
        <div class="box1"></div>
        <div class="box2"></div>
        <div class="box3"></div>
    </div>
</body>

</html>
```
- justify-content：定义项目在横轴上的对齐方式，添加在父元素的css样式中，如 justify-content:flex-start;
  - flex-start：左对齐，默认值
  - flex-end：右对齐
  - center：居中
  - space-between：两端对齐，项目与项目之间的间隔相等，即A与B、B与C之间的间隔相等，A-B-C
  - space-around：每个项目两侧的间隔相等，即A两侧、B两侧、C两侧的间隔相等，-A--B--C-
- align-items：定义项目在纵轴上的对齐方式，添加在父元素的css样式中，如 align-items:flex-start;
  - flex-start：上左对齐，默认值
  - flex-end：下左对齐
  - center：纵轴居中
  - baseline：按第一行文字的底边基线对齐，如字体大小不一时
  - stretch：默认值高度，若项目没设置高度or设为auto，讲占据满整个容器的高度？？？
- flex：设置子元素相对于父元素的占比，添加在子元素的css样式中，如 flex:1;
  - flex属性值表示占比多少，只能为正整数。如 共两个子元素 分别设置为 flex:1; 和 flex:2; ，则一个占1/3，一个占2/3
  - 子元素中设置flex属性后，宽度属性失效

### 样式设置小技巧
- text-align:center：设置文本、图片类行内元素的水平居中，在该元素的父元素样式内设置
```
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="utf-8">
  <title>定宽块状元素水平居中</title>
  <style>
    div{
        border:1px solid red;
        margin:20px;
    }
    .txtCenter{
        text-align:center;
    }
    .imgCenter{
        text-align:center;
    }
  </style>
</head>

<body>
  <div class="txtCenter">我想要在父容器中水平居中显示。</div>
  <div class="imgCenter"><img src="http://img.mukewang.com/52da54ed0001ecfa04120172.jpg" /></div>
</body>
</html>
```
- margin:20px auto：设置定宽块状元素的水平居中，此法必须同时满足“定宽、块状”两个条件
  - 等价写法：{margin-left:auto; margin-rignt:auto}，上下margin随意
  - 定宽：宽度width为固定值
- 已知宽、高，实现盒子的水平、垂直居中：通常使用定位
  - eg：子元素相对于父元素的垂直水平居中
  - 使用父元素中设置relative、子元素中设置absolute结合定位
  - 子元素中偏移top、left都设为50%，即子元素左上角设置在父元素中心点
  - 子元素中margin的top、left都设为负的一半自身宽高。如 width和height都为20px则 margin:-10px 0 0 -10px
- 不定宽、高，实现盒子的水平、垂直居中：通常使用定位、translate
  - eg：子元素相对于父元素的垂直水平居中
  - 使用父元素中设置relative、子元素中设置absolute结合定位
  - 子元素中偏移top、left都设为50%，即子元素左上角设置在父元素中心点
  - 子元素中translate位移的top、left都设为-50%。如 transform:translate(-50%, -50%);


### CSS变量使用
- 变量名以两个破折号（--）开头，如 --a，--cardName
- 全局变量，使用 :root{} 关键字，:root 选择器匹配文档的根元素
:root{
--a:65px;
--b:red;
}
使用var()函数引用变量，如 color: var(--b);


- transform() 位移 旋转 动画 鼠标悬停





# VSCode？实用工具
## emmet

类似关键字大括号自动补充

例如写出开头和辅助字符，Tab键执行 自动生成对应的html结构

辅助字符 * # [ 等等组合使用


## swagger
整理前后端接口

快速注解
请求测试等


# react
UI框架，前端，开发高效灵活，配合度高
声明式 逻辑+html 模块化
传递参数，声明函数？渲染html

工具：Node.js
npm install -g cleate-react-app 安装react

- 组件：组件是什么？？？
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



# 本地调试
localhost
Windows打开：控制面板-程序-启用或关闭Windows功能-lnternet lnformation Services，-llS 管理控制台

[localhost本地网站使用方法](http://www.scicat.cn/aa/20220226/2161682.html)

