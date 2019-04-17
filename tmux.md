# 终端复用工具 tmux 
- terminal multiplexer 终端多路复接[转换]器
- 会话session 窗口window 窗格pane
- 可创建多个会话，一个会话-多个窗口（标签页），一个窗口-多个窗格（分屏/面板）
- 来自OpenBSD，采用BSD授权

- 默认命令前缀C-b，激活控制台后，命令快捷键生效


# 安装
## 命令安装
yum的不是最新版，有些新特性、功能无法使用，如layout中的窗口重命名
最新版使用安装包、手动编译

## 安装包安装
可下tar，或git源
[Linux终端复用神器-Tmux使用梳理](http://www.cnblogs.com/kevingrace/p/6496899.html)
[[转载]tmux安装遭遇的问题解决](http://blog.sina.com.cn/s/blog_4cff1c6d010190fz.html)

[Tmux 出現 protocol version mismatch 解法](https://blog.longwin.com.tw/2013/11/tmux-protocol-version-mismatch-fix-2013/)


# 默认命令
## shell下 前缀为tmux
- tmux 缺省创建新会话
- tmux ls 查看后台运行中的tmux会话列表，一行一session
- tmux $字母 若有多种含义 tmux会显示

- tmux new-session -s $session-name新建会话
    tmux new -s 也可以
- 显示会话.  - tmux list-session
- tmux attach-session -t $session-name
  - tmux a -t $sessionName 从终端返回已存在的会话

- tmux kill-session -t $session-name删除会话

- tmux rename-session -t old_session_name  new_session_name  重命名会话
- 或tmux rename -t aaa bbb 会话默认名是自动递增的序号
-
- 退出会话.  - tmux detach

## tmux会话环境下
加**前缀**后：

系统操作
- ? 帮助
- d 脱离tmux会话，回到shell环境，tmux内程序继续运行，detach
- s 根据列表切换会话，有会话预览
- : 进入命令模式，可以操作shell下的tmux命令，不带'tmux'前缀
命令：

PREFIX : resize-pane -D          当前窗格向下扩大 1 格
PREFIX : resize-pane -U          当前窗格向上扩大 1 格
PREFIX : resize-pane -L          当前窗格向左扩大 1 格
PREFIX : resize-pane -R          当前窗格向右扩大 1 格
PREFIX : resize-pane -D 20       当前窗格向下扩大 20 格
PREFIX : resize-pane -t 2 -L 20  编号为 2 的窗格向左扩大 20 格



窗口操作window
- c 创建新窗口
- 0~9 按序号切换到窗口


面板操作pane



- z 当前分屏面板最大化/还原
- o 顺序切换分屏
- $ 重命名会话
- s 获取并选择后台会话列表
- 
- 其他的修改绑定配置，更符合使用习惯


## 修改默认配置
如
```
set -g prefix C-a
unbind C-b

unbind '"'
bind - splitw -v
unbind %
bind | splitw -h

unbind 'x'
bind-key x kill-pane
unbind '&'
bind-key v kill-window

bind-key k select-pane -U
bind-key j select-pane -D
bind-key h select-pane -L
bind-key l select-pane -R

bind -r ^k resizep -U 16
bind -r ^j resizep -D 16
bind -r ^h resizep -L 48
bind -r ^l resizep -R 48

bind P swapp -U
bind N swapp -D

bind D source-file ~/.tmux-layout

setw -g mode-keys vi
```

配置.tmux-layout布局
```
new-window
new-window
new-window

selectw -t 0
rename-window develop
selectp -t 0
splitw -v -p 50
selectp -t 0
splitw -h -p 50
selectp -t 2
splitw -h -p 50
selectp -t 0

selectw -t 1
rename-window dgm
selectp -t 0
splitw -h -p 50
selectp -t 1
splitw -v -p 50
selectp -t 0

selectw -t 2
rename-window dbs
selectp -t 0
splitw -h -p 50
selectp -t 1
splitw -v -p 50
selectp -t 0

selectw -t 3
rename-window dpl
selectp -t 0
splitw -h -p 50
selectp -t 0

selectw -t 0
```


