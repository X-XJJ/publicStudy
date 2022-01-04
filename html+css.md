# 前端相关

# html（html5）
- 超文本标记语言（HyperText Markup Language，HTML），用于创建web网页的标准标记语言
- 后缀：.html .htm 都可使用，没有区别？
- 注释：<!-- 注释内容 -->
- web浏览器中一般按 F12 打开调试模式
- 标签：尖括号包围的关键词，开始标签和结束标签成对出现，<标签>内容</标签>，这个整体叫元素
- 常用编辑器：VS Code，Sublime Text
  - VSCode使用浏览器打开 html 文件需要 安装 "open in browser" 扩展

## 常用标签
- <!DOCTYPE 版本名称>：声明html版本，版本名不区分大小写，html5的声明为<!DOCTYPE html>
- <html></html>：HTML页面的根元素
- <head></head>：头部元素，包含文档的元（meta）数据
  - <meta charset="编码名称">：在head中声明网页的字符编码，中文网页一般使用<meta charset="utf-8">，部分浏览器如360使用 gbk 编码
  - <title></title>：描述文档的标题
- <body></body>：包含显示在浏览器页面中的可见内容
  - <h1></h1>：定义一个大标题
  - <p></p>：定义一个段落

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


# VSCode？实用工具
## emmet

类似关键字大括号自动补充

例如写出开头和辅助字符，Tab键执行 自动生成对应的html结构

辅助字符 * # [ 等等组合使用


## swagger
整理前后端接口

快速注解
请求测试等


# CSS
层叠样式表(英文全称：Cascading Style Sheets)
一种用来表现HTML（标准通用标记语言的一个应用）或XML（标准通用标记语言的一个子集）等文件样式的计算机语言
- transform() 位移 旋转 动画 鼠标悬停


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
