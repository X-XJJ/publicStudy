" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

"**************************************
"编辑中文字符乱码
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
set ambiwidth=double

"菜单语言
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"consle输出乱码
language messages zh_CN.utf-8

" https://www.ibm.com/developerworks/cn/linux/l-tip-vim1/index.html
" https://blog.csdn.net/rehung/article/details/1794293
"**************************************
winpos 500 200           "设置初始界面位置
set lines=31 columns=120 "设置初始界面大小
colorscheme desert       "设置默认配色方案

set guifont=Consolas:h11:cANSI:qDRAFT "设置字体字号

set number     "显示行号
set noundofile "关闭交换文件.swap
set nobackup   "关闭自动备份文件.

"exec 'cd' . fnameescape('C:\Users\Andra\Desktop')
"设置默认文件路径 路径中不要空格
cd D:\

"自动切换目录为当前编辑文件所在目录 au = autocmd
au BufRead,BufNewFile,BufEnter * cd %:p:h

set shiftwidth=2 "设置自动缩进空格数 C-d取消2格缩进
set tabstop=4    "设置tab键为4个空格
set expandtab    "输入tab后, vim用恰当的空格来填充
set autoindent   "自动对齐 将当前行的缩进拷贝到新行 
set cindent      "按C语法自动缩进 新行加一个TABSTOP的值 根据括号加减TAB

set foldmethod=indent "配置折叠 indent-缩进方式（.md由md插件管理，应该优先级更高）

"***************Plug***************
"https://github.com/junegunn/vim-plug
"$VIM即C:\Program Files\Vim 下有_vimrc /vim81 自建/vimfiles /plugged(plug工具管理安装目录)
call plug#begin('$VIM/plugged')

Plug 'scrooloose/nerdtree'              "NerdTree插件
Plug 'godlygeek/tabular'                "对齐插件(不必须)
Plug 'plasticboy/vim-markdown'          "markdown语法高亮插件
Plug 'iamcco/mathjax-support-for-mkdp'  "预览数学公式
Plug 'iamcco/markdown-preview.vim'      "同步预览markdown插件
"https://github.com/iamcco/markdown-preview.vim/blob/master/README_cn.md

call plug#end()
""***************Plug end***************

"***************Vundle***************
"https://github.com/VundleVim/Vundle.vim
"遇到E484: Can't open file C:\Users\<userid>\AppData\Local\Temp\... Error
"set nocompatible              " be iMproved, required
"filetype off                  " required
"将Vundle插件的目录添加到gvim的运行时变量中
"set rtp+=$VIM/bundle/Vundle.vim
"let path='$VIM/bundle'
"call vundle#begin(path)
"Plugin 'VundleVim/Vundle.vim' " Vundle自身管理 
"call vundle#end()             " required
"filetype plugin indent on     " required
""***************vundle end***************
