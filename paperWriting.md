

# 演讲

[哈佛经济系李光耀孙子做经济学术presentation的经验和建议！](https://mp.weixin.qq.com/s/LukUjmrtmAM22RCJVuitRg)




# 方向顶刊
TON
？？


# 排版工具
tex


# 文献工具
[超详细！文献管理软件对比——Endnote、Noteexpress、Zotero、Citavi](https://zhuanlan.zhihu.com/p/348608795)

## Zotero


[关于参考文献的格式，一次性讲清楚！](https://zhuanlan.zhihu.com/p/258523437?utm_source=wechat_session)

[文献管理神器 Zotero - 参考文献格式 CSL 文件编辑](https://www.cnblogs.com/xiaolaodi1997/p/16854934.html)

- csl文件，直接在Zotero中修改，只能看效果，不会生效。需要改了存了再导入。

[Zotero设置毕业论文/中文期刊参考文献格式](https://blog.csdn.net/weixin_42642296/article/details/129278237)

[文献管理软件//Zotero导入文献的五种方式（九）](https://blog.csdn.net/qq_43210428/article/details/120459203)
[文献管理软件//Zotero的常用插件——Zotero Connector自动抓取网页并批量下载保存文献（三）](https://blog.csdn.net/qq_43210428/article/details/120382871)
[文献管理软件//Zotero的常用插件——Zotero translators//知网下载//知乎翻译器+Jasminum（茉莉花）（四）](https://blog.csdn.net/qq_43210428/article/details/120377475)

[zotero-好用插件大集锦](https://zhuanlan.zhihu.com/p/595970972)
zotero-pdf-preview ：这是一款让zotero具备PDF预览的插件
Jasminum 茉莉花：中文文献抓取和管理
Zotero PDF Translate 插件：文献阅读和翻译
Zotero Tag 插件：给文献设置标签
ZotFile：用于管理文献附件，例如移动、格式化重命名等
zotero-scihub：自动从 Sci-Hub 下载 PDF（若有的话）。如果地址失效，需自行寻找有效地址手动更新。
Zotero Connector：具有强大的文献嗅探和捕获能力，能够展示相关一系列文献。可认为集成了connected papers
DOI manager：能自动帮助你更新文献的DOI信息
zotero-better-notes：集成了思维导图等工具，可边看文献边管理

- 插件安装统一方式：
对于windows, 打开zotero软件，点击工具-插件，进入插件管理界面.
点击右上角小齿轮，选择Install Add-on From File.
选择所下载.xpi文件，并打开.
弹出对话框，等待3秒倒计时结束，点击Install Now, 重启即可.
对于MacOs, 打开zotero软件，点击工具-附加组件，进入插件管理界面.
点击右上角小齿轮，选择Install Add-on From File.
选择所下载.xpi文件，并打开.
弹出对话框，等待3秒倒计时结束，点击Install Now, 重启即可.


[LaTex + Zotero 实现点击插入参考文献](https://zhuanlan.zhihu.com/p/515335936)

[Zotero使用心得（笔记）](https://zhuanlan.zhihu.com/p/458084656)


# 公式工具 MathType

- 公式预置-保存到文件，格式化公式-使用公式文件进行格式化 
[MathType中如何批量修改公式大小？](https://jingyan.baidu.com/article/90bc8fc87f28ffb753640cf9.html)

[word中mathtype7公式右编号右对齐解决方法，超实用！](https://zhuanlan.zhihu.com/p/507833012)

公式编写用mathtype——发现可以先用office-word自带的，然后在全部“转换公式”成mathtype格式的

[MathType安装及please restart word to load mathtype addin properly的问题](https://blog.csdn.net/alsj123456/article/details/117083075)
[MathType7安装使用及please restart word to load mathtype addin properly的问题。](https://blog.csdn.net/weixin_43115631/article/details/110067650)

- 或者
- 首先，word-文件-选项-信任中心-信任中心设置-添加新位置（ppt、excel同理？）
- 其次，添加 C:\Program Files\Microsoft Office\root\Office16\STARTUP\
    - 在信任中心的 startup 下，都复制一下 mathPage\64\MathPage.wll、Office Support\64\MathType Commands 20xx.dotm、WordCmds.dot

- 角标，如一撇的，不用框[Mathtype如何打出偏导、一撇](https://blog.csdn.net/weixin_47289438/article/details/110632281)
  - 先打下标，再打一撇时，显示时分开的
  - 反过来，显示挤着的

[MathType快速编辑公式攻略](https://blog.csdn.net/corfox_liu/article/details/43084247)




# 论文写法

┌┐

i.e. 也就是说 拉丁语id est
s.t. 约束条件 subject to


## 变量写法（默认字体新罗马）
（描述顺序：字体、大小写、倾斜、加粗……）
- word中：
  - 常量：大写，斜体
  - 变量：斜体
    - 决策变量：小写，斜体，x、y、z
  - 向量：斜体，粗体
    - 一个用户元组：斜体
  - 集合：花体，大写
    - letex中：用/mathcal

- 矩阵：大写希腊字母Δ

- 字体
  - Times New Roman 新罗马 字母、数字默认使用
  - Enclid Math One 花体


- 希腊字母24个
  - 小写：αβγδεζηθικλμνξοπρστυφχψω
  - 大写：ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ

序号 大写 小写 英文注音 国际音标注音 中文注音 
1   Α α alpha a:lf 阿尔法 
2   Β β beta bet 贝塔 
3   Γ γ gamma ga:m 伽马 
4   Δ δ delta delt 德尔塔 
5   Ε ε epsilon ep`silon 伊普西龙 ϵ-半月形的伊普西龙
6   Ζ ζ zeta zat 截塔 
7   Η η eta eit 艾塔、伊塔 
8   Θ θ thet θit 西塔 
9   Ι ι iot aiot 约塔 
10  Κ κ kappa kap 卡帕 
11  ∧ λ lambda lambd 兰布达 
12  Μ μ mu mju 缪 
13  Ν ν nu nju 纽 
14  Ξ ξ xi ksi 克西、可赛
15  Ο ο omicron omik`ron 奥密克戎 
16  ∏ π pi pai 派 
17  Ρ ρ rho rou 肉 
18  ∑ σ sigma `sigma 西格马 
19  Τ τ tau tau 套 
20  Υ υ upsilon jup`silon 宇普西龙 
21  Φ φ phi fai 佛爱、斐 
22  Χ χ chi phai 西、喜
23  Ψ ψ psi psai 普西 
24  Ω ω omega o`miga 欧米伽+



