# 终端复用工具 tmux 
- terminal multiplexer 终端多路复接[转换]器，类似的gnu screen等

- 可创建多个会话，一个会话-多个窗口（标签页），一个窗口-多个窗格（分屏/面板）
- 会话session 窗口window 窗格pane（最小操作单位）
- 来自OpenBSD，采用BSD授权

- 默认命令前缀C-b，激活控制台后，命令快捷键生效
- 和vi搭配使用，也可将命令配置为熟悉的vi方式

- 命令安装
yum的不是最新版，有些新特性、功能无法使用，如layout中的窗口重命名
最新版使用安装包、手动编译

- 安装包安装
可下tar，或git源
[Linux终端复用神器-Tmux使用梳理](http://www.cnblogs.com/kevingrace/p/6496899.html)
[[转载]tmux安装遭遇的问题解决](http://blog.sina.com.cn/s/blog_4cff1c6d010190fz.html)

tmux依赖libevent和ncurses，可以先查看下有没有，如whereis libevent
[非root用户安装tmux](https://blog.csdn.net/Rlin_by/article/details/101869021)

- 非root用户安装
  - 成功在用户家目录下make了tmux之后，将tmux-2.8/tmux拷贝到~/.local/bin下，PATH里加此路径
  - 启动找不到lib，执行“LD_DEBUG=libs $HOME/.local/bin/tmux”查看缺啥（trying file）
  - 在用户~目录下，centOS系统为例，配置文件.profile中加安装的tmux路径和libevent路径
```
#tmux
export PATH=$PATH:$HOME/.local/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.local/lib
```


[Tmux 出現 protocol version mismatch 解法](https://blog.longwin.com.tw/2013/11/tmux-protocol-version-mismatch-fix-2013/)

- 其他用到再说
- [Linux终端复用神器-Tmux使用梳理](https://www.cnblogs.com/kevingrace/p/6496899.html)
- [tmux常用命令](https://www.cnblogs.com/lizhang4/p/7325086.html)
- [Tmux 速成教程：技巧和调整](https://www.cnblogs.com/maoxiaolv/p/5526602.html)

# 命令
## shell下or命令模式
加**前缀**后：
tmux为命令前缀，如tmux ls，缺省为创建并打开新会话
  - 底部从左到右为 `[会话名] 窗口序号0:窗口名* 序号1:窗口名 ... 创建时间`
  - * 表当前操作的窗口，会话名默认是自动递增的序号

- tmux ls = tmux list-session 查看后台运行中的tmux会话列表，一行一session
- tmux $字母 若有多种含义 tmux会显示

- tmux new -s <会话名> = tmux new-session -s $session-name 指定会话名新建会话
- tmux a -t [会话序号？会话名？] = attach-session -t $session-name
  从终端返回已存在的会话
- tmux a 进入会话列表第一个session

- tmux kill-session -t $session-name 关闭会话
- tmux kill-session -a -t $session-name 关闭除了指定会话之外的所有session
- tmux tmux kill-server 销毁所有会话并停止tmux

- tmux rename -t $oldname $newname = tmux rename-session -t 会话名 新会话name 重命名会话
-
- tmux detach 退出会话.

## tmux会话环境下 可用配置文件修改命令(bind&unbind)
- 以下操作均为加**前缀**后：
- 默认快捷键前缀 C-b，可修改为C-a（C-a在vim中为加1，不如设为C-q，没有快捷键冲突）

### 会话操作session
- ? 帮助
- d 即detach，脱离tmux会话，回到shell环境，
- s 会话列表+预览、切换
- w 所有会话+窗口+面板pane预览，任意窗口/会话切换
- $ 重命名会话
- f 搜索关键字
- t 显示当前时间
-
- : 进入命令模式 可以操作shell下的tmux命令，不带'tmux'前缀，如:new -s <sessionName>


### 窗口操作window
- c 创建窗口 = :new-window
- 0~9 按序号切换到窗口
- , 重命名窗口，窗口名默认为 `登录终端的用户名@主机名` = :rename-window
- 0 切换到0号窗口，使用窗口序号以此类推
- p n l 切换到上一个/下一个/相邻的窗口，unbind为
- & 关闭当前window
-

### 面板操作pane
- % " 垂直/水平分屏，unbind为|-
- o 依次切换分屏pane
- ↑ ↓ ← → 按方向切换pane
- SPACE空格 对当前窗口的所有pane重新排列布局，按一次换一种样式
- z 最大化/恢复当前pane
- x 关闭当前pane
- { } 往左、右移动pane位置
- ! 移动pane到新的window
- q 显示pane序号
- :join-pane -t <windowName> 移动pane合并到某个window

- 以下一格的 = C-b不松手再按↑↓←→
- :resize-pane -D          当前窗格向下扩大 1 格
- :resize-pane -U          当前窗格向上扩大 1 格
- :resize-pane -L          当前窗格向左扩大 1 格
- :resize-pane -R          当前窗格向右扩大 1 格
- :resize-pane -D 20       当前窗格向下扩大 20 格
- :resize-pane -t 2 -L 20  编号为 2 的窗格向左扩大 20 格

- 
- 其他的修改绑定配置，更符合使用习惯

- [当将较小的监视器切换到更大的监视器时，有没有办法重新绘制tmux窗口？](https://cloud.tencent.com/developer/ask/49645)
- 用更大分辨率的显示器和已经启动的tmux连接时，它会在控制台周围画点
- mux将窗口的尺寸限制为它所连接的所有会话中的每个尺寸中的最小尺寸。如果不是这样的话，就无法显示所有连接的客户端的整个窗口区域。
最简单的方法是在连接的时候将其他客户端从会话中分离出来：
- tmux attach -d
- 最近的tmux版本上有一个更简单的解决方案
- tmux detach -a
- -a为该会话中的所有其他客户端设置，但当前客户端除外。
你可以在.[bash|zsh]rc设置alias：
alias takeover="tmux detach -a"
Workflow：你可以正常连接到会话中，并且如果你被另一个强制缩小tmux窗口大小的会话干扰的话，可以通过使用takeover来解决这个问题。


# 修改默认配置
默认配置文件.tmux.conf
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

其中，布局配置文件（自定义命名）.tmux-layout
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


