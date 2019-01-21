vim 暂存  
  
# shell内启动vim  
vim 直接启动  
vim filename 打开vim并创建文件(可选择带后缀格式名)  
vim file (file1 file2 ...) 打开文件(多个)  
vim ./ 使用netrw文件管理器查看当前目录, <CR>打开or进入下级, -返回, 更多命令会有显示;    
:e. = :edit . 打开文件管理器, 显示当前工作目录  
:E = :Explore 打开文件管理器, 显示活动缓冲区所在目录  
C-^ 切回./ 文件目录;  
  
n_ n行/字/词 3j aw 5G ...  
  
  
# Nomal 普通模式:   
## 实际行移动(加前缀g 操作屏幕行gh gj...)  
h 前;  j 下;  k 上;  l 后; (J 合并两行)  
w 到后一词头word;  b 到前一词头back;  e 到后一词尾;  ge 到前一词尾;  
W B E gE 同样作用, 面向字串  
    字串: 只有空格分隔;  
    单词: 字母、数字、下划线、标点符号等都作为单独的单词, 空格分隔;  
0 = <HOME> 到行首字符;  ^ 到非空行首;  $ 到行尾;  
[[ = gg 到文件头;  ]] = G 到文件尾;  nG = :n  到第n行;  
C-c = C-[ = Esc 切回普通模式  
利用查找移动  
  
## 文本对象(操作分隔符, 操作文本块)  
- 和操作符连用，表范围 eg：ya) 复制括号内内容，含括号
- 操作分隔符-分隔符文本对象-范围文本对象(标点...):   
    a_ 选择一对xx的范围，含xx eg: a( = a) 一对圆括号(); at 一对XML标签; `a<` `a'` `a]`...  
    i_ 选择一对xx内部，不含xx eg: i( = i) 圆括号内部; ...  
- 操作文本块(w s p...) :   
    a_ 选择当前xx及一个空格 eg: aW 当前字串+空格; as 当前句子+空格; ap当前段落+空格 ...  
    i_ 选择当前xx eg: iw 当前单词; is 当前句子; ip 当前段落; ...  
  
## 位置标记相关  
- vim的自动位置标记  
`` 上次跳转动作之前的位置``  
`. 上次修改的位置;  
`^ 上次插入位;  
`[ 上次修改or复制的起始位;  `] 上次修改or复制的结束位;  
`< 上次高亮起始位;  `> 上次高亮结束位;  
  
- 位置标记   
m[a-zA-Z] 用选定的字母标记当前光标位置  
`[mark] 跳转到标记字母mark标记的位置`  
    小写字母: 作用范围当前活动窗口  
    大写字母: 作用范围全局(eg: 用于当前窗口内, 在文件间跳转)  
  
## 跳转相关  
- 匹配的xx之间跳转  
% 作用于() {} [] (在范围命令里%表示全文or全路径匹配？梳理一下%的所有作用)  
    括号常用: dt(%r[``r] 找到(, 提前找到跳的配对括号, 改前, 跳转, 改后个  
激活matchit插件, 在vimrc中, % 增强作用于配对的关键字, eg: if/end``  
- 跳转列表  
C-o 光标转到上一个跳转位置;  C-i 下一个;  
跳转: 任何改变当前窗口中活动文件的命令, 如 nG %匹配..., hjkl不算  
:jumps 查看跳转列表  
  
:changes 查看改变列表  
g; 光标转到上一个改变列表的位置; g, 下一个;  
  
- 其他文件跳转: 可能不太用的到, 略了先  
  
## 滚屏  
C-d 下去半屏;  C-u 上去半屏;  C-f 下一; C-b 上一; C-e 下行; C-y 上行;   
zz 当前输入行显示到屏幕中间(ZZ = wq)  
  
## 撤销粘贴  
u 撤销;  C-r 回滚;    
p 粘贴在光标后;  P 粘贴在光标前;  
  
## 操作符 (+范围动作命令)  
c 剪切, 切为插入模式(eg:caw dl yap段落...)  
d 剪切  
y 复制到寄存器  C-Insert 复制到无名寄存器" Shift-Insert粘贴到光标
g~ 反转当行all字母的大小写, ~反转当前光标下字符;  gu 行转小;  gU 行转大;  
> 加缩进;  < 减缩进;  = 自动缩进;   `
! 过滤动作跨越的行  
双写作用于当前行(dd >> gUU yy...)  
  
## 查找  
f(char) 当前行找字符;  F 反向找;  
t(char) 当前行找字符, 光标停在其前;  T 反向找;(常用dt. ct, 等, f_dt_ 剪切除从_到_的内容)  
    f t :/ 查找都可以和d c 等操作符结合, 寻找d c 等的范围, eg: v/ge<CR> 可视模式选中到"ge"的位置;  
    ; 重复向后找;  , 重复向前找  
    * 全文中找当前光标词  
n 调到下一个任何查找结果的匹配项;  N 前一个？;  
  
## 各种插入和等价  
i 插前切模 插当前位置前;  I 插行首切模;  
a 插后切模 插当前位置后;  A 插行尾切模; (ea 单词结尾添加文本)  
o 插下切模 当前之下插行;  O 插上行切模;  
r(char) 替换当前字符为char;  R(chars)  
x = dl 剪切当前字符;  X 剪切前一个字符;  
s = cl 剪切当前字符 切模;  S = C 剪切行 切模;   
  
## 寄存器相关  
:reg [register]= :register [register] 查看寄存器内容  
"[register] `"`作为命令前缀指定要使用的寄存器名  如"" "0 "a ...
" 无名寄存器, 未指定时默认使用  
0 复制专用, 即y专用  
a-z 有名寄存器, 小写正常用, 使用"A-"Z则会添加新内容到原内容之后  
_ 黑洞寄存器, 使用即删除文本且不保存任何副本  
+ 系统剪贴板, 复制vim的到外部or从外部复制进来  
= 表达式寄存器(具体在前)  
   其他寄存器暂略  
  
  
  
  
# Insert 插入模式  
C-v(u)nnn  以(Unicode)编码号写入字符  
C-k(charchar) 以二合字母插入字符   
C-r[register] 粘贴寄存器内容到光标后, eg: C-r" 粘无名寄存器的; C-r0 粘复制寄存器的  
  
  
  
  
# Visual 可视模式  
v 面向字符    
V 面向行  
C-v 面向列;  $ 选区扩大到每行行尾; 
 - 此处模式下可编辑多行，以I输入，必用ESC关闭插入
gv 重选上次选的  
o 切换光标活动端;  
p 以指定寄存器内容替换高亮区内容, eg: "0p  
  
  
  
  
# 命令模式  
## 进入命令模式  
:  进入命令模式  
/  查找提示符(C-r C-w 连按 对单词or词组的查找域自动补全)  
C-r= 查表达式寄存器  
  
  
:yank [motion] = :y 复制 eg: :yand 112 复制第112行到复制寄存器0  
:sort 将行按规则属性排序 eg: :1,3 sort 按规则(什么规则？)对1~3行排序  
  
:[range]命令[目的地] eg: :3,5t. 第3~5行复制到当前行下方  
range: 单个;  _,_ 范围(eg: 3,5);  
    1 第一行;  $ 最后一行;  0 第一行上方虚拟行;  
    . 光标所在行;  'm 包含位置标记m的行;  
    '< 高亮起始行;   
    '> 高亮结束行; ' 
    %  整个文件; >
    eg:.+3,$-5 当前往下第三行, 到倒数5行  
:noh = :nohlsearch 暂时关闭高亮直到下次查找 no highlight(另: insearch功能在查找时预览第一处匹配)  
:行号 跳到n行 = nG  
<Tab> 自动补全顺序滚动;  C-d 显示可用的补全列表  
  
:set   
  
## 文件命令:  
:f 显示当前文件名
:open 在缓冲区中打开文件  
:edit = :e 按文件路径读入缓冲区  只有:e则为reload重载当前缓冲区，即刷新当前文件
    % 活动缓冲区的完整文件路径; :h 修饰符, 保留去除文件名的部分;  
    (eg: :edit %:h<Tab> 将展开为当前文件所在目录路径)  
:find 在path含的所有路径中通过文件名打开文件;  :set path+=目录名/** 匹配该目录下所有子目录, 并添加进path;  
:write = :w 保存文件写入磁盘;  :wall = :wa 保存全部缓冲区并;  
:w filename 另存为   
:q 离开vim (:wq = ZZ 保存并离开 zz 当前行挪到屏幕中间);  :qall = :qa 关闭全部并离开;  
:h help  
:pwd 打印当前工作目录print working directory  
  
## 缓冲区  
* 占位通配符, 作用于指定目录;  ** 递归进入指定目录的子目录;  
    eg: `**/*.js` 匹配当前目录含.js的, 子目录含/和.js的;  
:ls 显示所有已打开的缓冲区buffer  
    % 当前窗口可见;  # 可用C-^轮换的一个缓冲区 切换之前所在的前一个缓冲区;  a active活动缓冲区;  h hidden隐藏的缓冲区;  
:b 编号 = 切换buffer
:bn = :bpnext 移到后一个缓冲区buffer   :bp = :bprev 前一个;    
:bf = :bfirst 开头;  :bl = :blast 结尾;  
:b [n/bufname name1...] = :buffer 按编号/路径字符跳转缓冲区, 路径可Tab补全  
:[range] bd [n/bufname] = :bdelete 删除缓冲区(们)  
:wn 保存第n个缓冲区  
  
## 文本相关  
:r 复制到当前缓冲区的光标or目的地下  :[目的地] r 源头eg被复制文件的名   
  
:copy = :t 复制粘贴copy to(不涉及寄存器, normal模式的y复制到寄存器)  
:move = :m 剪切粘贴  
  
:normal 指定范围内全执行normal命令   
    eg: %normalA; 全文执行"A;"; 3,5normal. 3~5行执行.  
    VG :`'<,'>normal @a` 在高亮区域每行执行寄存器a里存的宏  
  
## 替换  
:substitute = :s 语法 :[range]s/原词pattern/替换词string/[flags]   
指定范围的替换操作, 缺省时默认只修改第一处  

- flags: g 修改一行内的所有匹配; c 每一次都可选择确认or拒绝每一处修改; n 不替换, 只报告匹配个数; & 重用上一次substitute命令用的标志位; p列印 c确定 e未找到不报错...  
    eg: :%s/old/new/ 用new替换所有行的第一个old;   
        :%s/old/new/g 用new替换所有行的全部, 即整个文件的old;   
        (理解为g控制行-横坐标, %控制列-纵坐标)  
        :%s/old/new/gc 比上条加一个每次替换前都确认 y是 n否 q退出 l换完退 a换完这次和之后所有...         
    查找域若留空, 则作用于当前的;  
- 寄存器内容替换查找域  
    传值 :s//C-r寄存器名/ 空字符串替换, 寄存器内容粘进查找域;  
    引用 :s/a/\=@寄存器名/ 用a替换, @寄存器 引用寄存器内容进行查找, \=表示执行一段表达式脚本  
:[range]&[&][flags][count] g重复上次的:substitute命令, 第二个&重复上次:s的标志位  
:[range]g&[&][flags][count] g&在所有行 重复上次的:substitute命令  
  
- 整个工程内查找替换多个文件内容  
    :vimgrep 先查找所有匹配文件  
    :cfdo %s/old/new/gc 所有文件替换  
    :cfdo update 存盘  
  
:vim = :vim[grep][!] /{pattern}/[g][j] {file} ...  
    file参数不能空, 文件名、通配符、反引号表达式等等组合也行  
    缺省[g][j] 只找第一处匹配, g 找行上的所有匹配  
  
  
## 参数列表  
:args 显示启动时作为参数传给vim的文件列表  
:args [arglist] 设置/改变参数列表内容, 文件存在则添加入参数列表, 不存在则创建并添加入参数列表  
    arglist: 文件名, 通配符, shell命令(格式'command', 执行命令后使用命令的输出结果)...  
:next 遍历下一个参数列表文件;  :prev 上一个;  :argdo 列表中每个缓冲区执行同一条命令;  
:argdo write = :wall 全部保存;   
  
## 窗口相关window  
C-ws 水平切分, standard;  C-wv 垂直切分, vertical;    
:sp [file] = :split [file] 水平切分, 新窗口载入file, split分裂分开  
:vsp [file] = :vsplit [file] 垂直切分, 新窗口载入file  
:clo = :close = C-wc 关闭当前窗口;  :on = :only = C-wo 只保留活动窗口;  
C-ww 窗口间循环切换  
C-wh/wj/wk/wl) 光标切到左/下/上/右的窗口  
C-wH/wJ/wK/wL) 调整当前活动窗口的位置 向左/向下/向上/向右  
:bn 在当前窗口切到下一个缓冲区/文件; :bp 上一个;  
  

## 标签页  
:tabe = :tabedit 新标签页中打开file, 若无参数则打开一个空标签空缓冲区  
C-wT 当前窗口移动到新标签页  
:tabc = :tabclose 关闭当前;  :tabo = :tabonly 只保留活动窗口;  
:tabn = :tabnext = gt 切下一个go tab;  :tabp = :tabprevious = gT 切上一个;  
(n)gt 调到下n个标签页  
:tabmove(n) 重排列标签页  
  
:led [path] 设置当前窗口的本地工作目录  
  
  
# 文件格式和换行符  
:set ff=unix/dos <==> :set fileformat=unix/dos 设置当前文件格式为nuix下,Windows下(unix下文本格式换行字符为\n, windows为\r\n)  
:set ff? = :set fileformat? 查询格式  
:set endofline 设置结束符;  :set noendofline 去掉结束符;  
:set list 显示换行;  :set nolist 退出显示;  
:%s/\n//g 删除换行符\n？  
:%s/\r//g 删除dos文件回车符^M  
  
  
## 自动补全 插入模式下   
C-n 补全普通关键字, 显示自动补全列表, 默认选中第一个; C-p 自动选中最后一个;  

- 具体按某某补全: C-x C-某某  
    某某: n 当前缓冲区关键字; f 文件名补全; l 整行补全; i 包含文件一起找(如c语言包含的头文件); ] 标签文件一起找(如补全编程语言对象, 函数名类名); o 全能补全, 更智能的根据上下文选择补全内容; k 字典查找; ...  
- 补全列表交互:   
    C-n 使用下一个; C-p 上一个; <UP> 选择上一个; <DOWN> 下一个...  
    C-e 终止放弃所有选择  

:set include? 查看vim当前支持的语言文件的对应提示符  
      
## shell相关  
- 命令行窗口相关  
    q: 进入;  :q 退出;  C-f 命令行模式to命令行窗口;  
    q/ 进入查看历史命令;  <CR> 执行当前行的命令;  
- 调用外部shell相关  
    :(read) ![command] 调用shell外部程序(输出插入光标下方)  
    :[range](write) ![command] [range]作为cmd的标准输入  
    :shell = :sh 临时进入shell;  exit 退出shell返回vim;  
  
  
## 宏相关  
- 录制宏
q[register] 开始录制, 内容保存到寄存器, 再次按q结束录制  
    寄存器名小写: 覆盖; 大写: 追加;  
n@[register] 执行指定寄存器的内容n次  
@@ 重复调用最近一次宏  
    VG :`'<,'>normal @a` 在高亮区域（当前到文末）每行执行寄存器a里存的宏 
- 修改宏

  
  
## global命令相关  
:[range]g[lobal]/{pattern}/[cmd] = :g  
    在指定的文本范围内(缺省为整个文件)查找{pattern}, 然后对匹配到的行执行命令{command}, 如果希望对没匹配上的行执行命令, 则使用:global!或:vglobal = :v 命令(invert)  
    :g/test/-,test/+d 删除一个文本文件中的所有带 ‘test’ 的行, 以及这一行的前一行和后一行  
    :!g/test/d 删除所有不含test的行  
  
## 编译代码相关  
切换到程序目录后, shell中: vim -u NONE -N wakeup.c  
打开后可在vim内编译wakeup.c文件, 结果与在shell中运行一致, 且为每条错误信息在quickfix列表内创建记录  
:make 编译当前文件  
浏览quickfix列表 从:h quickfix 中查看具体命令, 如 :cnext 向下遍历; :cprevious 向上;  
  
:grep 需要已经安装grep工具(文件搜索工具), vim调用外部grep  
:vimgrep 自带的文件搜索工具  
  
  
## 拼写检查器  
:set spell 开启拼写检查, 检查全文并标记错误单词, 缺省状态按照英文单词字典检查  
:set nospell 关闭;  
其他语言的拼写字典需下载安装, 在vimrc中配置  
]s 跳到下一处错误; [s 上一处;   
z= 显示更正建议并可选择;   
zg 当前单词添加入拼写文件; zw 当前单词从拼写文件中删除;   
zug 撤销zg或zw命令;   
  
  
# 其他&备注  
  
nnoremap 按键映射  
  
以上内容中, 其他感觉不常用的略过辽  
编辑宏  
按模式匹配 按原义匹配 正则表达式  
所有模式相关  
  
工具ctags建立索引, 标签文件, 浏览源代码,   

## 高亮问题之 颜色显示错误or不显示
- 终端不支持彩色;
- 终端支持彩色，vim不知道，需设置$TERM;
- 文件类型无法识别
  :set filetype         结果"filetype="即vim不知道该文件类型;
  :set filetype=类型名  手动设置当前文件类型;
  有效类型的查看目录：$VIMRUNTIME/syntax目录;
- vim无语法高亮定义

[*06.2* 颜色显示不出来或者显示出错误的颜色怎么办？](https://blog.csdn.net/ysm_sd/article/details/51145332)
  
# 配置问题们
- 详见_vimrc

"中文字符乱码问题 编辑
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
set ambiwidth=double

" 菜单语言
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" consle输出乱码
language messages zh_CN.utf-8

" https://www.ibm.com/developerworks/cn/linux/l-tip-vim1/index.html
" https://blog.csdn.net/rehung/article/details/1794293

"**************************************

"显示行号
set number

"关闭自动备份的.~文件
set noundofile
set nobackup

"设置默认文件路径 路径中别有空格
"exec 'cd' . fnameescape('C:\Users\Andra\Desktop')
"cd C:\Users\Andra\Desktop
cd D:\softscape\publicStudy

"自动切换目录为当前编辑文件所在目录 au = autocmd
au BufRead,BufNewFile,BufEnter * cd %:p:h

"设置tab键为4个空格
set tabstop=4

"自动对齐 将当前行的缩进拷贝到新行 
set autoindent

"自动缩进 按照C语言语法调整 即新行加一个TABSTOP的值 还会根据括号加减TAB
"set cindent

"在输入 tab 后, vim 用恰当的空格来填充这个 tab
set expandtab 

"C-d取消当前缩进

"***************使用Vundle插件管理工具***************
"https://www.cnblogs.com/wldragon/p/4509820.html
"https://github.com/VundleVim/Vundle.vim
"vundle start
set nocompatible              " be iMproved, required
filetype off                  " required

"将Vundle插件的目录添加到gvim的运行时变量中
set rtp+=$VIM/bundle/Vundle.vim

"vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
let path='$VIM/bundle'
call vundle#begin(path)

Plugin 'VundleVim/Vundle.vim'      " Vundle自身管理 
"Plugin 'scrooloose/nerdtree'   " NerdTree插件

Plugin 'godlygeek/tabular'        " 对齐插件(不必须)
Plugin 'plasticboy/vim-markdown'  " markdown语法高亮插件

Plugin 'iamcco/markdown-preview.vim'  " 同步预览markdown插件
"https://github.com/iamcco/markdown-preview.vim/blob/master/README_cn.md

call vundle#end()            " required

filetype plugin indent on    " required

""***************vundle end***************


## markdown 
[vim安装markdown插件](https://www.jianshu.com/p/24aefcd4ca93)
[vim-markdown：在gvim(win7)中编辑并预览markdown文件](https://blog.csdn.net/justheretobe/article/details/50570555)


# vim官网下载时版本需注意官方文档的说明啊……
开头的gvim81.exe只有32位，没有-python -python3 等支持（版本要python3.6）
“A 64 bit version, which only runs on 64 bit MS-Windows and uses a lot more memory, but is compatible with 64 bit plugins, can be found *here* You can also find links to interfaces to install there (Python, Perl, Ruby, etc.). ”
here连接到vim的GitHub
才有64位的，不同版本和方式说明请看官方说明，有试验exe，zip，经验证也支持python3，还自动解决了中文乱码的问题们

vim --version  或者在vim里的 :version
可以查看版本、支持的编译、vim自身编译链接方式
或许可以通过这个去修改32位的哪个？

https://www.cnblogs.com/hustfeiji/articles/4848827.html 
https://www.jianshu.com/p/5de863537d99

https://www.jianshu.com/p/edd8aad3adc7

https://www.ibm.com/developerworks/cn/linux/l-tip-vim1/index.html


# 折叠
- :set foldmethod=* == :set fmd=*
 - 可在vimrc配置
- 六种折叠方式（不兼容）
 - manual  手工定义折叠
   indent  更多的缩进表示更高级别的折叠
   expr    用表达式来定义折叠
   syntax  用语法高亮来定义折叠
   diff    对没有更改的文本进行折叠
   marker  对文中的标志折叠

- 快捷键
zc 折叠cuttle当前折叠？; zC 折叠范围内所有嵌套的折叠
zo 展开open当前折叠; zO 展开范围内所有嵌套的折叠
[z 到当前打开的折叠开始处
z] 到当前打开的折叠末尾处
zj 移动到下一个折叠开始处
zk 移动到上一个折叠末尾处
...
zi 打开/关闭折叠所有折叠？
zv 查看此行？

暂时先用着




