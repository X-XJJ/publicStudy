## MathType
公式编写用mathtype——发现可以先用office-word自带的，然后在全部“转换公式”成mathtype格式的

[MathType安装及please restart word to load mathtype addin properly的问题](https://blog.csdn.net/alsj123456/article/details/117083075)
[MathType7安装使用及please restart word to load mathtype addin properly的问题。](https://blog.csdn.net/weixin_43115631/article/details/110067650)

- 或者
- word-文件-选项-信任中心-信任中心设置-添加新位置（ppt、excel同理？）
- 添加 C:\Program Files\Microsoft Office\root\Office16\STARTUP\
    - 在信任中心的 startup 下，都复制一下 MathPage.wll、MathType Commands 20xx.dotm、WordCmds.dot


# LaTeX、CTEX

    wj老师ppt，安装CTEX，更新MiKTeX

    中文期刊可能更多要求使用CTEX，到时候不行再安。

    [科技排版系统 CTEX:HomePage](http://www.ctex.org/HomePage)

    VSCode实时显示TeX公式插件：https://zhuanlan.zhihu.com/p/469773497

    [轻松搭建LaTeX+VSCode编辑环境（以CTeX为例）](https://blog.csdn.net/u010186354/article/details/104291015)
    - 目前没找到 LaTeX Preview 扩展包，无法实时预览

    [VSCode与Latex环境的搭建（最简洁，最省事，最舒服的方案，不用搞一堆乱七八糟的配置）](https://blog.csdn.net/tiao_god/article/details/108997742)

    - CTeX、LaTeX、TeX Live，

    TeX Live的iso解压后，index.html为引导手册，安装时解压文件所在路径，最好不要含有中文
    添加环境变量：安装路径\texlive\2022\bin\win32

    1.1 正向查找
    正向查找即根据源文件位置查找生成的 pdf 文件对应位置。

    在 VSCode+LaTexWorkshop 环境中，使用快捷键 Ctrl+Alt+j 即可定位源文件中鼠标位置在 pdf 文件中的对应位置。
    1.2 反向查找
    反向查找即根据 pdf 文件位置查找源文件的对应位置。

    在 VSCode+LaTexWorkshop 环境中，使用 Ctrl+鼠标左击 即可定位 pdf 文件中鼠标位置在源文件中的对应位置。





