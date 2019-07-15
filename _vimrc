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
"�༭�����ַ�����
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
set ambiwidth=double

"�˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"consle�������
language messages zh_CN.utf-8

" https://www.ibm.com/developerworks/cn/linux/l-tip-vim1/index.html
" https://blog.csdn.net/rehung/article/details/1794293
"**************************************
winpos 500 200           "���ó�ʼ����λ��
set lines=31 columns=120 "���ó�ʼ�����С
colorscheme desert       "����Ĭ����ɫ����

set guifont=Consolas:h11:cANSI:qDRAFT "���������ֺ�

set number     "��ʾ�к�
set noundofile "�رս����ļ�.swap
set nobackup   "�ر��Զ������ļ�.

"exec 'cd' . fnameescape('C:\Users\Andra\Desktop')
"����Ĭ���ļ�·�� ·���в�Ҫ�ո�
cd D:\

"�Զ��л�Ŀ¼Ϊ��ǰ�༭�ļ�����Ŀ¼ au = autocmd
au BufRead,BufNewFile,BufEnter * cd %:p:h

set shiftwidth=2 "�����Զ������ո��� C-dȡ��2������
set tabstop=4    "����tab��Ϊ4���ո�
set expandtab    "����tab��, vim��ǡ���Ŀո������
set autoindent   "�Զ����� ����ǰ�е��������������� 
set cindent      "��C�﷨�Զ����� ���м�һ��TABSTOP��ֵ �������żӼ�TAB

set foldmethod=indent "�����۵� indent-������ʽ��.md��md�������Ӧ�����ȼ����ߣ�

"***************Plug***************
"https://github.com/junegunn/vim-plug
"$VIM��C:\Program Files\Vim ����_vimrc /vim81 �Խ�/vimfiles /plugged(plug���߹���װĿ¼)
call plug#begin('$VIM/plugged')

Plug 'scrooloose/nerdtree'              "NerdTree���
Plug 'godlygeek/tabular'                "������(������)
Plug 'plasticboy/vim-markdown'          "markdown�﷨�������
Plug 'iamcco/mathjax-support-for-mkdp'  "Ԥ����ѧ��ʽ
Plug 'iamcco/markdown-preview.vim'      "ͬ��Ԥ��markdown���
"https://github.com/iamcco/markdown-preview.vim/blob/master/README_cn.md

call plug#end()
""***************Plug end***************

"***************Vundle***************
"https://github.com/VundleVim/Vundle.vim
"����E484: Can't open file C:\Users\<userid>\AppData\Local\Temp\... Error
"set nocompatible              " be iMproved, required
"filetype off                  " required
"��Vundle�����Ŀ¼��ӵ�gvim������ʱ������
"set rtp+=$VIM/bundle/Vundle.vim
"let path='$VIM/bundle'
"call vundle#begin(path)
"Plugin 'VundleVim/Vundle.vim' " Vundle������� 
"call vundle#end()             " required
"filetype plugin indent on     " required
""***************vundle end***************
