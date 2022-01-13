# 前端相关 html(5)+css(3)

# html（html5）
- 超文本标记语言（HyperText Markup Language，HTML），用于创建web网页的标准标记语言，web浏览器中一般按 F12 打开调试模式
- 常用编辑器：VS Code，Sublime Text
  - VSCode使用浏览器打开 html 文件需要 安装 "open in browser" 扩展
- 后缀：.html .htm 都可使用，没有区别？
- 标签：尖括号包围的关键词，开始标签和结束标签成对出现
  - <标签>内容</标签>，这个整体叫元素。标签可嵌套，先后顺序需一致。不区分大小写，建议小写。
- 注释：<!-- 注释内容 -->
- 语义化：明确标签用途


## 常用html标签
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

- 辅助性标签，包含在head内
  - <meta charset="编码名称">：在head中声明网页的字符编码，中文网页一般使用<meta charset="utf-8">，部分浏览器如360使用 gbk 编码
  - <title></title>：页面标题
  - <link/><meta/>
  - <style></style>
  - <script></script>

- <body></body>：在head标签对之后出现，包含显示在浏览器页面中的可见内容

- 语义化标签，包含在body内
  - <h1></h1>：定义一级标题，以此类推 h2 二级标题到 h6 六级标题
  - <p></p>：定义一个段落
  - <span></span>：没有语义，设置单独的样式。style内定义样式span{}，body内用<span></span>显示
  - <div></div>：自定义块，作用相当于一个容器，划分各个不同模块
  - <header></header>：定义头部区域
  - <footer></footer>：定义头部区域
  - <section></section>：定义一个区域
  - <aside></aside>：定义一个侧边栏区域

- 效果标签，包含在body内需要的地方
  - html中忽略文字中的回车和多个空格，无论有多少连续的回车和空格，都只显示为一个空格
  - <br /> 或 <br>：回车换行标签，是一个空标签，没有html内容
  - &nbsp;：空格代码，一个显示一个空格


  - <a href="链接地址"></a>：定义一个html链接，属性href为链接地址
  - <img src="图片地址" width="显示宽度" height="显示高度">：定义图片
  - <ol></ol>
  - <li></li>


# CSS
```
<!--定义一级标题的样式-->
<style type="text/css">
 h1{
      font-size:12px;
      color:#930;
      text-align:center;
   }
</style>
```
- 层叠样式表（Cascading Style Sheets），“样式”用于修饰html样式，即定义如何显示html、xml元素，如布局、外观、颜色等，写在“样式表”中。外部样式表写在css文件中。
- <style type="text/css"></style>：样式表的标签style
- 选择器 声明：声明由属性构成，如 h1{color:#930}
- 样式属性
  - font-size：文字大小，如 12px，数字越大文字越大，最小号为12？
  - color：颜色，如 #930，blue
  - text-align：文字横向位置，如 center表示居中




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
