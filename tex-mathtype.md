# MathType
公式编写用mathtype——发现可以先用office-word自带的，然后在全部“转换公式”成mathtype格式的

[MathType安装及please restart word to load mathtype addin properly的问题](https://blog.csdn.net/alsj123456/article/details/117083075)
[MathType7安装使用及please restart word to load mathtype addin properly的问题。](https://blog.csdn.net/weixin_43115631/article/details/110067650)

- 或者
- 首先，word-文件-选项-信任中心-信任中心设置-添加新位置（ppt、excel同理？）
- 其次，添加 C:\Program Files\Microsoft Office\root\Office16\STARTUP\
    - 在信任中心的 startup 下，都复制一下 mathPage\64\MathPage.wll、Office Support\64\MathType Commands 20xx.dotm、WordCmds.dot


# LaTeX、CTEX

- 1、概念不同：

LATEX：LaTeX就是TEX的众多宏集之一，是由Leslie Lamport编写的。编写的目的是使版面设置内容和文档的具体内容尽可能分离，让写文档的人更加专注于文档的撰写，而少花些心思在排版上。

CTEX：CTEX是TEX中的一个版本，是CTEX 中文套装的简称，是把MiKTEX 和一些常用的相关工具，如GSview，WinEdt 等包装在一起制作的一个简易安装程序，并对其中的中文支持部分进行了配置，使得安装后马上就可以使用中文。

2、性质不同：

LATEX：LaTeX 是在 TeX 基础上的一种格式。

CTEX ：是关于 TeX 的一个完整的具体软件包。

- 

TEX是斯坦福大学的教授Donald E.Knuth开发的一个功能强大的幕后排版系统。他当时在撰写名为The Art of Computer Programming的书，由于出版商把他书中的数学式子排版得很难看，他决定推迟出版，自行研发一套排版系统进行排版。这个系统就是TEX系统。
LaTeX：
TEX是很低阶的排版语言，对于绝大多数人来说，学起来会很吃力，而且排版工作也会变得相当繁复，难以被更多人使用，效率也不是很高。所以，一些经常用到的功能，如果我们事先定义好，到要用的时候只引用一小段代码就可以实现一个相对复杂的功能，那不仅提高了排版效率，而且版面也会清晰很多。这种事先定义好的功能，叫做宏集(macro)。
LaTeX就是TEX的众多宏集之一，是由Leslie Lamport编写的。编写的目的是使版面设置内容和文档的具体内容尽可能分离，让写文档的人更加专注于文档的撰写，而少花些心思在排版上。所以，LaTeX从本质上讲，就是TEX排版系统的一个宏集，将一些常用到的功能整合为文档类型中的设置，简化了TEX排版的工作量及难度。
TEX的宏集有很多很多，LaTeX是其中比较实用的一个。
CTEX：
CTEX是利用TEX排版系统的CTEX中文套装的简称。它集成了编辑器 、WinEdt和 PostScript处理软件 Ghostscript 和 GSview 等主要工具。 CTeX中文套装在 MiKTeX的基础上增加了对中文的完整支持。 CTeX中文套装支持 CCT 和 CJK 两种中文 TeX处理方式。
一般用windows操作系统的人会选择CTEX中的WinEdt软件作为编写LaTeX文档的工具，因为它里面会将latex命令改变颜色，并且将多种命令都集成到图形界面中，又简化了排版操作。



- wj老师ppt，安装CTEX，更新MiKTeX
- 
- 中文期刊可能更多要求使用CTEX，到时候不行再安。
- 
- [科技排版系统 CTEX:HomePage](http://www.ctex.org/HomePage)
- 
- VSCode实时显示TeX公式插件：https://zhuanlan.zhihu.com/p/469773497

- 
- [轻松搭建LaTeX+VSCode编辑环境（以CTeX为例）](https://blog.csdn.net/u010186354/article/details/104291015)
- - 目前没找到 LaTeX Preview 扩展包，无法实时预览
- 
- [VSCode与Latex环境的搭建（最简洁，最省事，最舒服的方案，不用搞一堆乱七八糟的配置）](https://blog.csdn.net/tiao_god/article/details/108997742)
- 
- - CTeX、LaTeX、TeX Live，
- 
- TeX Live的iso解压后，index.html为引导手册，安装时解压文件所在路径，最好不要含有中文
- 添加环境变量：安装路径\texlive\2022\bin\win32

[textlive 安装出现的can't spawn cmd.exe问题](https://blog.csdn.net/Lirh_china/article/details/19435431)：在系统变量 path 增加一个项：C:\Windows\System32;


[本地使用VS code + CTEX编辑latex文件](https://blog.csdn.net/xinjieyuan/article/details/125131934)
[vscode中配置latex](https://blog.csdn.net/Ruins_LEE/article/details/123555016?spm=1001.2014.3001.5506)
[latex-vscode环境配置, 入门及ctex中文环境](https://blog.csdn.net/npe_ml/article/details/82912570)
[教教小周做学术的道理第二弹之texlive+vscode环境配置太爽了](https://blog.csdn.net/universe_1207/article/details/121228816)
[vscode中配置latex](https://blog.csdn.net/Ruins_LEE/article/details/123555016)
[VS Code 与texlive真乃天作之合](https://blog.csdn.net/weixin_43660619/article/details/107033739)
[VSCODE 安装LATEX环境，参数配置，常见问题解决](https://blog.csdn.net/qq_41554005/article/details/120712126)
[]()
[]()
[]()
[]()
[]()
[]()


## 在 VSCode+LaTexWorkshop 环境
  - 根据 tex 位置→查找 pdf 对应位置：Ctrl + Alt + j
  - 根据 pdf 位置→查找 tex 对应位置：Ctrl + 鼠标左击

VSCode-settings.json - bak
~~~
{
  /* Latex Workshop */
  "latex-workshop.latex.tools": [
  {
    "name": "latexmk",
      "command": "latexmk",
      "args": [
        "-synctex=1",
      "-interaction=nonstopmode",
      "-file-line-error",
      "-pdf",
      "%DOC%"
      ]
  },
  {
    "name": "xelatex",
    "command": "xelatex",
    "args": [
      "-synctex=1",
    "-interaction=nonstopmode",
    "-file-line-error",
    "%DOC%"
    ]
  },          
  {
    "name": "pdflatex",
    "command": "pdflatex",
    "args": [
      "-synctex=1",
    "-interaction=nonstopmode",
    "-file-line-error",
    "%DOC%"
    ]
  },
  {
    "name": "bibtex",
    "command": "bibtex",
    "args": [
      "%DOCFILE%"
    ]
  }
  ],
  "latex-workshop.latex.recipes": [
  {
    "name": "xelatex",
    "tools": [
      "xelatex"
    ]
  },
  {
    "name": "latexmk",
    "tools": [
      "latexmk"
    ]
  },

  {
    "name": "pdflatex -> bibtex -> pdflatex*2",
    "tools": [
      "pdflatex",
    "bibtex",
    "pdflatex",
    "pdflatex"
    ]
  }
  ],
  "latex-workshop.latex.clean.fileTypes": [
    "*.aux",
  "*.bbl",
  "*.blg",
  "*.idx",
  "*.ind",
  "*.lof",
  "*.lot",
  "*.out",
  "*.toc",
  "*.acn",
  "*.acr",
  "*.alg",
  "*.glg",
  "*.glo",
  "*.gls",
  "*.ist",
  "*.fls",
  "*.log",
  "*.fdb_latexmk"
  ],
  "latex-workshop.latex.autoBuild.run": "onSave",
  "latex-workshop.view.pdf.viewer": "tab",
  "latex-workshop.latex.clean.enabled": true,

  /* 自动保存 */
  "files.autoSave": "onWindowChange",

  /* 视区自动折行 */
  "editor.wordWrap": "on",

}
~~~


- 中文环境配置
  - xelatex可以直接显示中文，不过很多显示效果是英语的排版习惯, 而且很多对中文的支持也不太好。
  - ctex的使用也很简单, 直接\usepackage{ctex}就可以了. 注意这是xelatex的编译方式才可以, 其他的编译方式可能会失败. pdflatex的编译方式要这样写\documentclass[UTF8]{article}, 来表明编码方式是utf-8.

  - ctex内置 6 种默认字体
~~~
\documentclass[UTF8]{article}
\usepackage{hologo}
\usepackage{ctex}

\begin{document}

你好 \hologo{LaTeX}\\

{\heiti 黑体显示效果}\\
{\kaishu 楷书显示效果}\\
{\songti 宋体显示效果}\\
{\lishu 隶书显示效果}\\
{\youyuan 幼圆显示效果}\\
{\fangsong 仿宋显示效果}\\

\end{document}
~~~



# Word、LaTeX 互相转换
- Pandoc：从tax转成各种格式，包括html、word等等，公式支持比较友好，可以把公式单转
- pdf转word：福昕破解版挺好用的，公式存在乱码，图表文字目录都挺好

[latex代码在word里转成word公式（简单方便不需下插件）](https://blog.csdn.net/shengsikandan/article/details/109905213)

[学位论文Latex转Word](https://blog.csdn.net/qazwsxrx/article/details/124298871)

[【最全】latex与word之间的各种转化方法和软件汇总](https://blog.csdn.net/weixin_46233323/article/details/105424033)




# tax 编写
- \声明关键字[]{}：通常[]可选 {}必选
- % 注释

- 目录下文件
  - .tex
  - .log
  - .out
  - .aux
  - .pdf
  - 添加的模版文件 .cls 文档格式规模文件


## 常用声明命令
- \documentclass[可选option]{必选class}：引入文档类型
  - class：指定文档类型，字体、字号、间距等都默认为该文档类型的标准设定
    - article 排版期刊、演示文档、科技论文、报告、说明文档、程序文档、邀请函等。
    - report 长篇报告格式的文档类，具有章节结构，用于综述、长篇论文、简单的书籍等。
    - book书籍文档类，包含章节结构和前言、正文、后记等结构。
    - proc 基于article文档类的一个简单的学术文档模板。
    - slides 幻灯格式的文档类，使用无衬线字体。
    - minimal 一个极其精简的文档类，只设定了纸张大小和基本字号，用作代码测试的最小工作示例(Minimal Working Example)。
    - atricle 英文
    - carticle ctexart 中文？？
    - beamer 做ppt
  - option：文档选项
    - UTF8

- \usepackage[options]{package}：调用宏包
  - package：包名，常用包如插图、彩文等
```
  % 这里我们使用了UTF8的编码格式和ctex宏包来解决中文编码的问题
  % \usepackage[UTF8]{ctex}
  % \usepackage[UTF8]{article}
  % 由于现在LaTeX对中文的支持已经很完善，因此我们可以直接使用\documentclass[UTF8]{ctexart}，代表该文档是中文论文（ctex+article。推荐使用这种方式，因为对部分的宏包的支持较好。
  \documentclass[UTF8,fontset=windows]{ctexart}
```

- \title{}：文章标题
- \author{}：作者
- \date{}：日期，\date{\today} 日期设为今天的日期
- \bibliographystyle{}：定义参考文献引用格式


-  \begin{环境名} \end{环境名}：一对标签，填入环境参数名
  - document：正文，begin-end内为输出pdf的所有内容，eg：\begin{document}正文\end{document}
  - quote：引用，默认增加缩进和上下间距用

- 文章标题，显示时自动在标题前编号，默认阿拉伯数字
  - \section{Section 1} % 一级标题
    - \section*{} % 无编号的一级标题*
  - \subsection{Section 1.1} % 二级标题
  - \subsubsection{Section 1.1.1} % 三级标题
  - \paragraph{paragraph} % 无编号段落标题



- 调整一段分组（begin和end间）的文字格式：\声明关键字 文字内容
  - eg：\zihao{-2} \bf 这是一段文字test。字号小四？？黑体显示



- 空格
  - 中文间 空格无效，使用 \quad = 当前字体下一个汉字的空白距离，\qquad = 当前字体下两个汉字的空白距离
  - 英文间 n空格 = 1空格
- 回车
  - 空1行 = \par 有缩进回车？格式一致回车？
  - \\ = \newline 无缩进回车
- 空1行：空n＞1行
- 换页：\newpage 新起一节？？，\clearpage 新起一页？？
你新加的一页内容较多时，两者基本一样，当新加的一页内容较少时，“\newpage”就无法实现另起一页的效果，但“\clearpage”可以？？


- 特殊控制字符：#，$, %, &, - ,{, }, ^, ~

- 西文字符转换表
\rm   罗马字体          \it     意大利字体
\bf   黑体              \sl     倾斜体
\sf   等线体            \sc     小体大写字母
\tt    打字机字体       \mit     数学斜体

- 纵向固定间距控制命令
\smallskip             \medskip               \bigskip

- 页面控制命令
\textwidth=14.5cm
\textheight=21.5cm
系统默认：字号10pt = 五号字；西文字体为罗马字体；textwidth=12.2cm,textheight=18.6cm。相当于美国标准信纸大小。


- \newcommand{\<name>}[<num>]{<defination>}：name定义的命令名称，num可选，defination命令的具体定义
- \renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}：修改现有的命令
- \providecommand命令是一种比较理想的方案。在命令未定义时，它相当于\newcommand；在命令已定义时，沿用已有的定义。
- [LaTeX中自定义命令renewcommand、newcommand 与providecommand的区别和使用方法](https://blog.csdn.net/weixin_45008608/article/details/119897532)

- \text{文本内容}？？公式里插入非斜体文本？？

- \textbf{文本}:文本环境加粗
- \mathbf{}:数学公式加粗
- \pmb{}：特殊字符加粗



- 上下标
  - 下标：$x_a$ 在符号的后面打下划线“_”,那么下划线后面的符号就自动放在了下标的位置_
  - 上标：$x^a$
  - 上下标：连起来写就行 x_a^b = x^b_a
  - 连续下标用{}括起来
  - 允许套娃
  - [如何用latex编写上标、下标？](https://zhuanlan.zhihu.com/p/262907455)


- makebox


- [LaTeX技巧290：如何设置图表编号和章节相关联](https://www.latexstudio.net/archives/7927.html)




## 公式
[LaTeX：数学公式](https://blog.csdn.net/weixin_39679367/article/details/109966436)


[一个较为完整的中文图书Latex模板](https://blog.csdn.net/jueshu/article/details/83210629)


- [LaTeX公式在线编辑器](https://www.latexlive.com/)
  - [如何将截图中公式转换成为可用的mathtype公式](https://blog.csdn.net/YXYYBZ/article/details/121191621)



- 公式内不能空行，否则编译失败

- 常用宏
  - \usepackage{amsmath}，搭配 {cases} 环境

- latex中文本类型是book 公式随章节自动编号

- 内容与章节关联，以节为基础编号
  - amsmath 宏包提供的 \numberwithin{<sub-counter>}{<counter>} 命令
  \numberwithin{equation}{section} % 公式编号
  \numberwithin{figure}{section} % 图像
  \numberwithin{table}{section} % 表格



- 行内公式
  - $...$，eg：这个公式$a=b$是行内公式，a=b不是公式格式

- 行间公式
  - $$...$$ 或 \[...\] ，eg：这是一个\[\frac{-b \pm \sqrt{b^2-4ac}}{2a}\]行间公式

\begin{equation}
\end{equation}




## 图片插入 graphicx包 figure分组环境
- 宏包：\usepackage{graphicx}，搭配 {figure} 环境
  - [LaTeX中的图像支持](https://zhuanlan.zhihu.com/p/351123408)
  - 导言可追加：
    - \graphicspath{{path0/}{path1/}}，追加n个图像文件夹的路径
    - \DeclareGraphicsExtensions{.png, .pdf}，控制后缀名，使用优先级按控制定义的顺序
  - graphicx可插入的图片格式
    - 位图：jpg，png，bmp，等？
    - 矢量图：pdf，eps，svg，等？

- {figure} 环境：\begin{figure}[htbp]……\end{figure}

- 浮动体[htbp]：图片、表格默认为浮动体，自动寻找最合适的位置
  - 位置参数：
    - h 当前位置，t 顶部，b 底部，p 单独成页，! 在决定位置时忽视限制
  - 排版位置与参数顺序无关，默认 h-t-b-p 的优先级顺序决定浮动体位置，[!htp] = [ht!p]
  - 浮动体个数；默认每页≤3个，其中，顶部≤2个，底部≤1个
  - 浮动体空间：占据页面的百分比，默认顶部≤70%，底部≤30%
- 限制浮动体：\usepackage{float}，\begin{figure}[H]

- \centering % 居中

- 插图命令 \includegraphics[option]{图片文件名}
  - option：可选参数
    - width=a：宽度设为a，height=a：高度设为a。eg：1cm 15pt
    - scale=a：缩放为原图a倍
    - angle=a：逆时针旋转a度
    - keepaspectratio：在同时配置height和width的时候，保持图像本身的缩放比
    - totalheight：图形的总体高度，在图像旋转的操作中会使用会比较方便
    - page：插入多页PDF的时候，使用指定页码的页面，页码从1开始
    - draft：不插图，但是会使用文件名占位
  - eg：\includegraphics[width=.7\textwidth]{1.png}
  - 相对路径默认为.tex同级目录？及其子文件夹？
    - 建议创个文件夹专门放图片，如figure文件夹

- \caption{定义标题}：在当前环境内容下方居中输出 带编号的标题，编号按对应的环境（如figure、table等）自动按序编

- \label{标签名}：为图片交叉定义标签，方便引用？
  - 引用处 \ref{标签名}
  - [LaTeX 交叉引用系统简介](https://www.cnblogs.com/yymn/p/10448403.html)


~~~
\begin{figure}[!h]
  \centering
  \includegraphics[width=.7\textwidth]{1.png}
  \caption{问题三流程图}
  \label{fig1}
\end{figure}
~~~


## 表格制作 table分组环境
- {table} 环境：\begin{table}[htbp]……\end{table}

- {tabular} 列环境：\begin{tabular}{列格式}……\end{tabular}
  - 列格式
    - l/c/r：单元格内容左对齐/居中/右对齐，不折行
    - p{a}：单元格宽度固定为a，可自动折行
    - | 绘制竖线，eg：\begin{tabular}{|c c c|}
    - @{a}：自定义内容a

- \hline：横线

- scalebox{0.9}{表格tabular} 表格整体缩放


 \makebox[0.4\textwidth][c]{符号}&\makebox[0.5\textwidth]&{优}&[c]{良}&[c]{中}&[c]{差} \\


\begin{table}[!h]
  \centering
  \caption{空气质量等级及对应空气质量指数（AQI）范围}
  \begin{tabular}{|c|cccccc|}
  \hline
    \makebox[0.4\textwidth][c]{符号}&\makebox[0.5\textwidth]&{优}&[c]{良}&[c]{中}&[c]{差} \\
    {空气质量等级}&{优}&{良}&{轻度污染}&{中度污染}&{重度污染}&{严重污染} \\
  \hline
    {AQI范围}&{[0,50]}&{[51,100]}&{[101,150]}&{[151,200]}&{[201,300]}&{[301,+∞)} \\
  \hline
  \end{tabular}
  \label{q1tabAQIRange}
\end{table}


~~~
\begin{table}[htb]
  %指定单元格宽度， 并且水平居中。
  \centering
  \begin{tabular}{p{2.0cm}<{\centering}p{9.0cm}<{\centering}p{2.0cm}<{\centering}}
    \hline
    符号 & 说明 & 单位 \\ %换行 
    \hline
    $\hat{S}$ & 接受信号 & V \\ %把你的符号写在这
    $S$ & 发送信号 & V \\ 
    $S_{16QAM}(t)$ &  经 16QAM 调制后的信号 &  V \\ 
    \hline
  \end{tabular}
  \caption{问题三表格}
\end{table}
~~~


## 参考文献

- bib

- endnote、LaTeX

- endnote、Word





## 模版使用 .cls
- 将 .cls 文件放到 .tex文件同目录下


