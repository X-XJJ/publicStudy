Linux相关 暂存

命令参数和选项在标题中不单独列出位置
参数选项不列全

-a = --all 短选项和长选项，-为连字符
-at 多个短选项如a和t串联使用，短选项顺序无要求
$ 一般用户的shell提示符 # 超级用户的shell提示符

<Esc> 进入vi模式，可直接运行vi命令 如/word 查找缓冲区命令中出现的含word命令

### 各种计算校验命令 
- ls -al /usr/bin/*sum
- md5sum <fileName(s)>
  - 计算文件内容的MD5消息摘要，与文件名无关 算一个or多个都可
  - MD算法家族均为128位二进制 即16字节 可换算为32位十六进制
  - -b = --binary 以二进制模式读入 读入模式不同 求md5时逐位校验 结果相同
  - -t = --text   以文本模式读入，默认项
  - -c = --check  根据已生成的md5值(如存在文件中的)对现存文件进行校验
    - --status 校验check完成后，不生成提示信息，通过命令的返回值判断正确或错误，一致返回0，不一致返回1
  - -w = --warn   在check的时候，检查输入的md5信息又没有非法的行，如果有则输出相应信息
  - eg：
    - md5sum data > a.md5 将计算得到data的md5值重定向到文件a.md5，若为多个文件，则每个文件的md5生成为一行
    - md5sum -c a.md5 根据a.md5中已经生成的值对目录下对应文件进行校验，正确的返回OK，错误返回错误信息
    - 利用管道直接计算显示字符串md5，如
      - echo -n '123'|md5sum (echo输出的字符串默认添加换行符'\n'，-n)
      - printf 123|md5sum
      - ...
  -
[https://blog.csdn.net/kenkao/article/details/46875571l[linux shell 命令获取字符串/文件的MD5值](https://blog.csdn.net/ydyang1126/article/details/71171541)
echo -n 'string'|md5sum|cut -d ' ' -f1

- 安全散列 sha系列 用法类似md5sum 
  -b -c -t -w
- sha1sum   长度160位二进制
- sha224sum 长度256
- sha256sum 长度224
- sha384sum 长度384
- sha512sum 长度512
 
- cksum fileName
  - 进行32位CRC循环冗余校验，基于以太网标准帧检查的CRC算法
  - 输出校验码、文件字节数
  - 除了--help和--version这俩通常参数外，无其他参数
  - 算字符串和md5sum类似

- innochecksum
- 消息认证码 mac

expr 一般用于整数值计算，但也可用于字符串操作

xargs 从标准输入中建立、执行命令行

touch 更改文件的日期时间
- 缺省则创建文件，文件存在则修改时间戳为当前
- -t $datetime 修改文件时间

stat 显示文件or文件系统的状态


# shell相关
- shell是一个程序，接受键盘/输入的命令，传递给操作系统来执行
sh csh bash ksh等shell的区别与联系
[linux几种常见的Shell：sh、bash、csh、tcsh、ash](https://blog.csdn.net/whatday/article/details/78929247)

## 一些命令和使用？
命令种类：可执行程序、shell内置命令、shell函数、alias命令

## 时间日期
- 在Linux运行过程中，系统时间和硬件时间以异步的方式运行，互不干扰
- 硬件时间运行靠BIOS电池，系统时间用CPU Tick维持。开机时系统自动从BIOS中取得硬件时间，设置为系统时间
- date 系统时间日期 -s 修改 有多种格式修改，可同时改年月日时分秒，也可分开
cal 当月日历
- ntp服务器
  - ntpdate 系统时间设为mtp服务器时间，生产慎用
  - ntpd平滑同步，客户端与标准时间服务器同步 
tzselect 设置时区
- hwclock 硬件时间相关
  - -r = --show 显示当前硬件时间，缺省为此
  - --set --date="2017-02-03 08:09:04" 修改当前硬件时间
  - -s = --hctosys 以硬件时间为准，修改系统时间
  - -w = --systohc <== 系统时间 to hc？ 以系统时间为准，修改硬件时间>

# 查找程序
watch -n 2 ls

strings /lib64/libc.so.6 | grep GLIBC

mkfs -t ext4 /dev/sda5
mkfs.ext4 -O ^has_journal /dev/sda5
tune2fs -O has_journal /dev/sda5
tune2fs -O ^has_journal /dev/sda5

ulimit
```
core file size          (blocks, -c) 0
data seg size           (kbytes, -d) unlimited
scheduling priority             (-e) 0
file size               (blocks, -f) unlimited
pending signals                 (-i) 15400
max locked memory       (kbytes, -l) 64
max memory size         (kbytes, -m) unlimited
open files                      (-n) 1024
pipe size            (512 bytes, -p) 8
POSIX message queues     (bytes, -q) 819200
real-time priority              (-r) 0
stack size              (kbytes, -s) 8192
cpu time               (seconds, -t) unlimited
max user processes              (-u) 15400
virtual memory          (kbytes, -v) unlimited
file locks                      (-x) unlimited

S 设置软限制
H 设置硬限制
```

## 帮助型命令
- `type 命令名` 显示命令类型
- `which 命令名` 显示可执行程序的路径位置
which $command 检验、查看命令是否存在、存在位置
如witch ls 找到ls的配置？安装？路径 /usr/bin/ls

whereis $commmand 查找程序信息，打印可执行程序位置、man文档位置、源代码位置
-b binary = which
-m manual
-s source

- help 显示shell内置命令帮助文档; help 命令名 获得该命令帮助文档
 - 命令参数 --help
 - 版本参数 --version
- `man 命令名` 显示程序的分页手册页
 - `man 部分的序号 命令名` 查看手册文档的具体部分
 - 部分序号：1-用户命令，2-内核系统调用的程序接口，3-C库函数程序接口，4-特殊文件 如设备节点和驱动程序，5-文件格式，6-游戏和娱乐 如屏幕保护程序，7-其他杂项，8-系统管理命令
- apropos 显示合适的命令 显示手册页+该部分的内容
- whatis 显示命令的简要描述 关键字的手册页的名字+一行描述
- info 显示程序的info条目 超链接 树形结构
 - 可使用的控制阅读器命令
 - ? 显示命令帮助；PgUp或Backscape退格 上一页；PgDn或Spacebar 下一页；n 显示下一个节点next；p 显示上一个节点previous；u 显示当前节点的父节点up；Enter 进入超链接；q 退出；

## 当前屏相关
- 配置文件，在命令行以vi方式编辑后 
  - ESC进入vi方式，可用 前后w b x s A 0 ...？
  - v 进入vim编辑该命令，退出即执行
-
- 库Readline：实现编辑命令行，供不同的应用程序共享使用的线程集合
- Tab 自动补齐
  - 双击Tab = Alt-$ 在结果不唯一时显示所有可能的自动补齐列表
  - Alt-* 插入所有可能的匹配项
- history 输出所有历史命令列表的记录
  - ~/.bash_history 保存该用户最近使用过的命令历史记录列表，默认500条
  - history | less 查看历史记录的内容列表
  - history | grep xxx 显示相关命令在.bash_history中的行号+完整命令
  - 历史命令扩展
    - !number 执行历史记录中第number行的命令
    - ! string 执行最近的以string开头的历史记录
    - !?string 执行最近的含有string的历史记录
  - ↑↓ = C-p C-n：利用缓冲区选择历史命令
  - C-r 逆向递增搜索历史记录，输入查找内容后继续C-r到查找的下一条
  -
  - Esc 进入缓存区 可用vim的/寻找最近一次？历史命令——特殊的？普遍的？

- shift+↑↓：滚屏

## 光标相关等快捷键
C-a 移动光标到行首; C-e 移到行尾
C-b = ← 光标左移一位; C-f = → 光标右移一位
C-l = clear 清屏
Alt-f 光标前移一字; Alt-b 光标后移一字

- 编辑命令
C-d 删除光标处的字符
C-t 对调字符，光标处的和光标前的
Alt-t 对调字，光标处的和光标前的
Alt-l 变小写字母，从光标处到字尾
Alt-u 变大写字母，从光标处到字尾

- 剪切killing和粘贴yanking
C-k 剪切，从光标到行尾
C-u 剪切，从光标到行首
Alt-d 剪切，从光标到词尾
Alt-Backspace 剪切，从光标到词头，光标在开头则剪上一个
C-y 把kill-ring缓冲区中存的剪切文本粘贴到光标位置

C-s 锁屏，光标不移动，中断控制台输出
C-q 解锁，在锁屏时键入的内容存在缓存，解锁时恢复控制台输出

C-c 发送sigint信号给前台进程组的所有进程，强行终止
C-z 发送sigtstp信号，挂起进程，使用fg/bg恢复执行前台/后台被挂起的进程，如在vi时C-z挂起一下，出来执行命令，再fg返回vi
C-d 表示EOF = 终端输入exit回车

stty -a 查看终端控制字符


# 查看目录、文件
## 少的
- pwd 输出当前工作目录 print working directory;
- file 确定文件类型;

- cd 改变目录：
. 工作目录;  .. 工作目录的父目录;  若目标文件夹前无指定路径名，默认为./
~ 当前用户的宿主目录; ~username 跳到username家目录;  - 跳回先前工作目录;  无后缀 跳回当前用户主目录;
!$ 进入上一次操作的目录，如刚刚查看了ls test/usr/ 则这个可以切到

- less filename 分页浏览文本内容：
q 退出;  h 帮助;
PgUp 后翻页PageUp;  PgDn 前翻页;  上箭头 向上一行;  下箭头 向下一行;
g = 1G 跳开头;  G 跳结尾;  /abc 查找字符串abc;  n 查找下一个abc;

## ls 查看目录内容
- 显示文件&文件夹的各种不同字段信息;
- --help 帮助文档 /folderPath 如/usr/a列出usr下a文件夹的内容;
- -a = -all 列出包括隐藏文件的所有文件; &本级上级目录
- -A ？ 显示所有文件包括隐藏文件~本级上级目录
- -d = --directory 列出目录条目而不是内容信息，并且不取消对符号链接的引用;
- -l 以长格式显示结果;
  -dl 查看目录自己的详细信息，而不是内容;
- -L 显示链接所指的信息而非自己的信息
- -F = --classify 文件名拼接类型符号？加类型指示符，
 - / 目录名;   @ 链接;  * 程序;  = 套接;  | 管道
- -h = --human-readable 显示文件大小时，以KMGTPEZY为单位，人可读的方式显示而非字节数，如43M;
  -hl 长格式显示可读结果;
- -s 显示文件大小，以块为单位
- -S 按文件大小排序;
  -hlS 长格式大小排序且可读结果;
- -r = --reverse 倒序显示结果，通常为按字母降序;
- -R ？递归
- -X 按后缀排序
- -t 按修改时间排序;
- -c 显示change time
- -u 显示access time
- -i 显示文件系统节点号
 
常用 ls -lrt
ls -alF|grep / 列出目录
ls -alF|grep -v 列出文件

长列表格式-在后权限部分

批量改名rename？
具体看 man rename
语法:  rename [ -h|-m|-V ] [ -v ] [ -n ] [ -f ] [ -e|-E perlexpr]*|perlexpr [ files ]
举例： rename 's/$/\.mp3/' *
意思是，把所有文件增加 .mp3 的扩展名
 * 是目标要操作的一批匹配的文件，中间字符串是一个 perl 正则表达式， s/ 表示替换操作，  将空 的替换（/）.mp3 其中 . 是保留字符用 \ 转义 ， 最后一个 / 表示结束

# 操作文件、目录？
## 通配符（依据字符模式选择文件名）
- * 匹配任意多个字符（包括0、1个）
 - eg：* 所有文件;  g* 以g开头的任一文件;  g*.txt g开头的txt文件;
- ? 匹配任一单个字符（不包括0个）
 - eg：ggg??? 以ggg开头，后有3个字符的任一文件
-  不是   ^   !$someting 匹配不属于
- [字符集] 匹配任意一个属于字符集中的字符; [!字符集] 不在字符集;
 - eg：[abc]* 以abc中的任意一个开头的任一文件
- [字符类] 匹配任意一个属于指定字符类中的字符; [!字符类] 不属于;
 - 字符类 `[:类名:]` ——有问题
   - [:alnum:] 任意一个字母or数字
   - [:alpha:] 任意一个字母;  [:digit:] 任意一个数字
   - [:lower:] 任意一个小写字母;  [:upper:] 任意一个大写字母
 - eg：`*[![:digit:]]` 不以数字结尾的任一文件;
       `[[:lower:]123]*` 以小写字母或数字1、2、3中的任一一个开头的任一文件;

## cp mv rm ln
- 这堆-i 可加入配置文件 每次变动前询问
- cp 复制
 - cp item1 item2 将单个文件or目录item1复制到文件or目录item2中
 - cp item1 item2 item3 item... directory 将多个项目复制进一个目录中
 - 参数
   -i = --interactive 覆盖前询问，缺省为默认直接覆盖
   -a = --archive 复制文件和目录、所有属性
   -r = --recursive 递归赋值目录、内容、所有项
   -u = --update 文件从目录1到目录2的复制，只会复制不存在or有变化的文件
   -v = --verbose 复制文件时显示信息性消息
   -d 复制时保留链接（类似快捷方式）
 
- mv 移动（剪切）、重命名
mv item1 item2 将文件/目录item1移动/重命名为item2
mv item1 item2 ... directory 将多个item移动到directory目录下
参数：
 -i 覆盖前询问
 -u 只移动目标目录中不存在的or更新的
 -v 移动文件时显示信息性消息

- rm 删除
rm item ...
参数：
 -i 删除前询问，缺省默认直接删除
 -r 递归删除目录
 -d 删除空目录
 -v 显示信息性消息
 -f = --force 没有任何提示，忽略不存在的文件，直接删除
 ？？不可恢复的删除，慎用
 rm -- $filename 删除以-开头的文件

- ln 创建硬链接、符号链接（软连接）
    ln file link 创建硬链接
    ln -s item link 创建软连接，item=文件or目录
 - 硬链接：直接指向自身文件系统内的引用文件，不能用于目录
 - 软连接：特殊类型的文件，该文件包含指向引用文件or目录的文本指针（≈快捷方式），显示中含有"->"

# 重定向
## 相关概念
- 标准输入：默认为键盘
- 标准输出：程序运行结果、生成数据，默认链接到屏幕
- 标准错误：程序运行状态、错误信息，默认链接到屏幕
- 文件描述符：shell内部索引，以上分别为输入-0 输出-1 错误-2

## 各种重定向
- 命令形式：`执行的命令 重定向操作符 文件名`
- `>` 标准输出重定向到文件中，不显示于屏幕
  - 如 ls -a /usr/app/ > ls-test.txt 将命令执行结果输出到文件ls-test.txt中
  - 如 > test.txt 删除test.txt的内容，或创建一个空文件test.txt
- `>>` 标准输出重定向**追加**到文件尾部，若无文件则创建，eg md5sum data >> a.md5 将data的md5值追加到a.md5文件末尾
- `2>` 标准错误重定向，使用描述符编号
- `&>` = `命令 > 文件1 2>&1` 标准输出、错误重定向到同一个文件
  - 注：>和2>&1 顺序不可变，错误必在输出后，先把输出定到文件1，再把错误定到文件1
- `cat < 文件名` 利用cat，标准输入源头重定向为文件

### cat
- `cat 文件名/缺省` 
- 显示文件，即读取一个or多个文件，并复制到标准输出中
  - 利用cat进行文件拼接，如 cat a.txt.0* > a.txt 所有匹配的文件输出到a.txt中
- 参数缺省，则cat从标准输入读取内容，C-d结束
  - 利用cat进行标准输入的重定向 
- -n 打印行号
- 清空文件内容 cat dev/null > $filepath/name

dev/null 空设备文件

### more
类似cat
可分页显示文件内容
空格space下一页 b上一页

## 管道重定向相关
- shell的管道特性：命令从标准输入到读取数据，并将数据发送到标准输出
- 管道操作符`|`可以将多条命令合到一起形成一个管道
  - 一般形式`命令1 | 命令2` 将命令1的标准输出传到命令2的标准输入
    - 如 ls -a usr/ | less 在屏幕上分页查看ls命令的运行结果
    - 如 ls usr/ | grep zip 从ls列出的程序中找出所有含zip的结果
- 过滤器：在将多条命令合到一起形成一个管道的时候，这多个命令的统称

### 常用于过滤的命令
- 如 ls usr/ | sort -M | uniq | less 将列表按月排序后忽略重复行再分页输出
- sort
  - 文本行排序，默认按？排序
  - -f 忽略大小写; -b 忽略行首空格; -M 按月份排序; -r 反向排序; -u 去除重复行; -t 指定分隔符; -k 按某列排序; 
- uniq
  - 忽略文件or输入中的重复行，常和sort连用
  - -i 忽略大小写; -c 统计重复行数; -d 显示重复行; -u 仅显示不重复的行; 
- wc 
  - 统计文件中换行符、字、字节的个数
  - -l 只显示行数
- grep
  - 形式`grep pattern [file...]` 打印匹配到的模式的行，文本，正则表达式
  - 如 grep zip 找到输入中所有含zip的行
  - -i 忽略大小写; -v仅输出不匹配的行; 
- head和tail
  - 输出文件的前/最后10行
  - -n 数字 输出文件的前/最后n行; -f 文件名 实时查看监视文件的进展动态，C-c结束监控
- tee
  - 从stdin读取数据，同时输出到stdout和文件
  - 文本流形似“T”，读取标准输入，送到标准输出和文件中
  - 如 ls usr/ | tee ls.txt | grep zip 将中间结果即ls usr/结果输入ls.txt

# 文本处理--切割
cat 连接文件并打印到标准输出

cut 从每一行中移除文本区域
-d 指定分隔符
-f 显示某列

mkdir 目录1 [目录2 ...] 创建目录
- -p 创建多层级目录
- -m $权限值755 设置权限
- -v 显示信息

iconv 改文件编码

paste 合并文件文本行

join 基于某个共享字段来联合两个文件的文本行

comm 逐行比较两个已排序文件
diff 逐行比较文件
patch 对原文件打补丁
tr 转换or删除字符
sed 用于过滤&转换文本的流编辑器
aspell 交互式拼写检查器

# 格式化输出--文本打印到屏幕
nl 对行进行标号
fold 设定文本行长度
fmt 简单的文本格式化工具
pr 格式化打印文本
printf 格式化并打印数据
groff 文档格式化系统


# 扩展和引用
- echo 将文本参数内容打印到标准输出
  - -n 去掉换行符

如 直接计算并打印出字符串md5
echo -n 'string'|md5sum|cut -d ' ' -f1

SHELL 八大扩展 https://www.cnblogs.com/root-wang/p/3884448.html

## shell扩展
- 扩展：按Enter后，bash执行命令前，对命令字符序列进行多重处理，如识别通配符
- 路径名扩展：通配符实现
  - 如 ls .[!.]?* 以一个点字符开头的所有文件名，第二个字符不是点，至少包含第三个字符，后面可能有其他字符，即包含隐含文件而不含./和../的当前所有文件名
- 波浪线：`~用户名` 扩展为指定用户主目录，缺省则为当前用户
- 花括号扩展：`前导字符{模式}附言` 按{}内的模式创建多种文本字符串
  - {}内可包含 一系列“,”分隔的字符串，一系列整数，单个字符，不允许空白
  - 多用于创建一系列文件and目录，有“,”即默认将逗号左右默认为字符串
  - 如 echo {Z..A} 输出逆序排列的字母
  - 如 echo a-{A,B}_b 输出a-A_b a-B_b
  - 如 mkdir {9..10}-0{1..3} 建立目录 9-01 9-02 9-03 10-01 10-02 10-03
- 参数扩展：$，如 echo $USER $PATH，环境变量PATH=$HOME/bin等，容后再论，shell脚本中更有用
- 算术扩展：`$((表达式))` 整数的计算器
  - + 加;  - 减;  * 乘;  / 除;  % 取余;  ** 取幂;
  - 表达式可嵌套 如 $(($((3+1))-2)) = $(((3+1)-2))
- 命令替换：`$(命令)` 将命令的输出作为一个扩展模式使用
  - 如 echo $(ls) 命令ls的结果作为echo的输入
  - 如 ls -a $(which cp) 命令which cp的结果作为ls的参数

## 引用
- 引用：有选择的避免不希望的扩展，即转义
- 双引号：""中，除了 美元符$ 反斜杠\ 反引号` `，其他特殊字符都失效
  - 如空格、制表符、换行符，都被当成文本的一部分，而非用于切割参数，即 命令被识别为只跟着一个参数
  - 只有参数扩展、算术扩展、命令替换生效
  - 如 echo $(cal) 中echo后跟着38个参数，echo "$(cal)" 中echo后只跟着一个包含嵌入空格和换行符的参数
- 单引号：转义所有的字符，扩展全失效
- 转义字符：反斜杠 \，单字符转义
 - 反斜杠另外可作为控制码开头 \a 响铃，\b 退格，\n 新的一行，\r 回车，\t 制表符

# 权限
## 系统安全
- 所有者，组成员，其他所有用户
  - 一个用户可拥有自己的文件和目录，用户拥有对自己文件目录访问权限的控制权，如授予特定用户们、群组、所有用户不同的访问权限
  - 一个用户至少归属于一个群组，一个群组至少有一个用户
  - 文件和目录的访问权限由其所有者进行授予
  - 用户账户文件/etc/passwd，用户组文件/etc/group，用户密码信息/etc/shadow

## 读写执行
d       |rwx       |r-x   |r-x         |2|user|group|4.0K|Dec 16 21:49|.skel
--------|----------|------|------------|------------|-----|-----
文件类型|所有者权限|组权限|其他用户权限|

```
-rw------- 1 oracle-xue oinstall 4.7K Dec 18 05:16 .bash_history
drwx------ 2 oracle-xue oinstall 4.0K Dec 16 21:49 .gconf
drwxr-xr-x 2 oracle-xue oinstall 4.0K Dec 16 21:49 .skel
```

#### 长列表格式
项            |表示内容
--------------|----------------
"drwxr-xr-x"  |文件属性
文件类型 第1位|d  第一个字符，文件类型，d为目录
文件模式 后9位|rwx 第234个字符，文件所有者 的访问权限
              |r-x 第567个字符，文件所属组中成员 的访问权限
              |r-x 第8910个字符，其他所有人 的访问权限
"2"           |文件硬链接数目
"oracle-xue"  |文件所有者的用户名
"oinstall"    |文件所属用户组的名称
"4.0K"        |以可读显示的文件大小
"Dec 16 21:49"|上次修改文件的日期时间
".skel"       |文件or目录名称

- 文件类型 “d l c b -”
  - d 目录;  - 普通文件;  l 软链接;  c 字符设备文件;  b 块设备文件;

- 文件模式

权限 |文件                                    |目录
-----|----------------------------------------|----
r    |打开&读取                               |若r-x则允许列出目录下的内容
w    |写入&截短，-wx则允许文件创建&重命名&删除|不允文件的重命名&删除
x    |允许文件被执行，脚本文件必同时有r r-x   |允许进入目录
-    |无                                      |无

## 权限相关命令
- id 显示用户身份标识
 - -g = --group 用户所属群组的ID;
 - -G = --groups 用户所属附属群组的ID;
 - 输出含义：
   uid 用户ID，与用户名一一映射;
   gid 有效组ID即用户所属群组的ID，用户同时也可归属于其他组;
   groups 用户所属附加群组的ID;

#### 符号表示法
条目  |对应项
------|---
字符  |u                 |g                |o                 |a
含义  |文件目录所有者user|文件所属群组group|其他所有用户others|u + g + o = all 缺省值
操作符|+           |-           |=
含义  |添加一种权限|删除一种权限|只留指定的权限

- 对谁执行哪个操作进行哪种权限的设置
- 指定多种权限时，逗号“,”分隔
    - 如 +rx 即 a+rx，为文件所有者、所属群组和其他所有用户添加读、执行权
    - 如 g-rw,o=r 删除所属群组的读写权，除所有者和所属群组外的其他所有用户只有读权限

#### 八进制数字表示法 读写执421
进制    |无权|执行|写入|写执|读  |读执|读写|读写执
--------|----|----|----|----|----|----|----|------
八进制  |0   |1   |2   |3   |4   |5   |6   |7
二进制  |000 |001 |010 |011 |100 |101 |110 |111
文件模式|--- |--x |-w- |-wx |r-- |r-x |rw- |rwx
  - rwx可利用八进制设定数字表示，每个八进制数字对应3个二进制数字，文件模式刚好3类8种组合
  - 首先使用二进制表示文件模式，再将对应二进制表示为八进制
  - r = 4，w = 2，x = 1，- = 0，常用7 6 5 4 0
    - eg：rw--r--r--即644，rw-=6，r--=4

#### umask 设置文件默认权限
条目      |例子
原始文件模式，例子？|---  rw- rw- rw-|
文件模式二  |无关 110 110 110|-   110 110 110|-   110 110 110|
掩码八进制  |0000            |0002           |0022（系统默认）
掩码二进制  |000  000 000 000|000 000 000 010|000 000 010 010|
结果二进制  |无关 111 101 101|-   110 110 100|-   111 111 111|
结果        |无关 rw- rw- rw-|-   rw- rw- r--|为啥阿……
  - 不常用，`umask 八进制掩码`
  - 利用八进制数字表示法 + 八进制掩码 异或？与？运算 得出的结果，对文件的默认权限进行控制
    - 子网掩码是异或？与？
  - 掩码如 0002 0022 常用,其他还有0000 0001 4000，通常只使用后三位，不用看开头的第一位
  - 掩码二进制中出现1的位置，其对应的属性值被取消
  - 参数缺省即为查看当前默认值


- su 以另一个用户身份再加载shell
  - `su [usrname]`: 只切换用户身份，shell环境仍为原用户的，环境变量不切换
  - `su - [usrname]` = su -l [username]: 连用户和shell一起切换，工作目录变为指定用户主目录，环境变量也切换
  - 需验证指定用户的密码，缺省为root
  - `su -c '单个命令'` 使用su将单个命令传到新的shell环境下运行
- sudo 以另一个用户身份执行命令
  - 能执行的命令有范围
  - 只验证当前用户自己的密码

- chmod 更改文件模式（权限）
  - 能使用者：文件所有者&超级用户
  - -R 权限 文件名
  - +权限内容 文件名

linux 下执行.sh文件总是提示permission denied
如果你是root登陆的话（不是的话，切换到root用户，对*.sh赋可执行的权限） 
`chmod 777 *.sh`   or   `chmod +x  *.sh`，然后运行就OK了

- chown 更改文件所有者或所属群组
  - `chown [ower][:[group]] file ...` 把file所有者改为ower，file所属群组改为group组
  - 如 chown bob file 把文件所有者改成bob
  - 如 bob:user 把文件所有者改bob，文件所属群组改user
  - 如:user 所有者不变，所属群组改user
  - 如 bob: 所有者改bob，所属群组改bob登录系统时所属的组
- chgrp 只能更改文件所属群组

- passwd 修改用户密码
  - `passwd 用户名`
  - 普通用户设置自己密码，超级用户可设置所有


# 进程
## ps 列出当前进程运行情况的快照
内容    |不分先后
--------|--------
缩写    |PID   |TTY     |TIME         |COMMEND |STAT     |USER  |START
字段含义|进程ID|控制终端|消耗CPU时间和|完整命令|state状态|用户ID|开启时间
|%CPU         |%MEM          |VSZ             |RSS
|CPU使用百分比|内存使用百分比|虚拟耗用内存大小|实际使用内存RAM大小，单位KB
top其他 |PR |NI |VIRT |RES |SHR |S
        |
STAT内容|R   |S         |D           |T   |Z   |<       |N
        |运行|可中断睡眠|不可中断睡眠|暂停|僵死|高优先级|低优先级
+ 前台 | 线程 s 领导        >

缩写   |字段含义
-------|--------
PID    |进程ID       ||%CPU
TTY    |控制终端     ||
TIME   |消耗CPU时间和||
COMMEND|完整命令     ||
STAT   |state状态    ||
 
- 缺省参数，只显示和当前终端会话相关的进程信息
- 不加前置连字符“-”的，BSD模式运行ps命令
  - ps x 显示所有进程信息
  - ps aux 显示属于每个用户的进程信息
-f
-L
-e 显示全部进程
-t 终端
-o 项目


## top 实时显示当前所有任务的资源占用情况
顶部信息|字段示例
--------|------
第一行  |名字       |时分秒  |up 小时:分钟|n users     |load average:
        |程序名     |当前时间|正常运行时间|已登陆用户数|负载均值
第二行  |Tasks:     |n + total, |running, |sleeping, |stopped, |zombie
        |进程数状态 |各状态下进程数
第三行  |Cpu(s):    |n% + us,|sy,     |ni,     |id, |wa,    |hi, si
        |被占cpu时间|用户进程|系统进程|低优先级|空闲|等待I/O|
第四行  |Mem:       |n + total, |used, |free, |buff
        |物理RAM随机存取内存
第五行  |Swap:      |n + total, |used, |free, |cach
        |交换空间虚拟内存

 -l 开启或关闭第一部分第一行
 -t 开启或关闭第一部分第二行和第三行
 -m 开启或关闭第一部分第四行和第五行
 -M 排序按:内存使用
 -P 排序按:CPU使用
 -T 排序按:运行时间
 -c 显示完整命令
 -s 更新刷新时间
- 键盘指令常用 h-显示帮助，q-退出top命令
（类似Windows的TaskManager）

# 控制进程
C-c 中断一个程序
C-z 暂停一个程序

bg 使作业切换到后台运行 缺省显示当前后台运行的作业列表
fg %作业编号 使作业切换到前台运行

命令+& 在后台开始运行程序

jobs 列出所有活动作业的状态信息

## kill [-signal] PID ...
- 信号signal，可为信号编号or信号名，缺省默认为TERM terminate
- -l 显示完整信号列表
- killall 杀死指定名字的在多个在运行线程or指定用户名的多个进程

常用信号|
------|--
编号  |1
信号名|HUP
含义|挂起

编号|信号名|含义   
1   |HUP   |挂起，后台进程重启并初始化||
|2| INT 中断，即C-c
|9 KILL 杀死，内核直接终止进程，不能忽略，最后的选择
|15 TERM 终止，缺省默认项
|18 CONT 继续，恢复STOP的进程
|19 STOP 暂停，不由目标进程接受，不能忽略
|3 QUIT 退出
|11 SEGV 段错误时系统发送
|20 TSTP 终端暂停，即C-z，
|28 WINCH 窗口改变大小时系统发送


## 一些其他命令
- pstree 树状模式输出进程列表，父/子关系
- vmstat 输出系统资源使用情况的快照，内存、交换空间、磁盘I/O
- xload 图形化界面程序，绘制显示系统时间负载情况图形
- tload 终端上绘制，类似xload

- shutdown 关机or重启
  -r 重启
  -h 关机
  -r +10 10秒后重启
  -h +10 10秒后关机
  -r HH:MM 指定时分重启
  -c 取消计划

- crontab 定时任务操作
  - crontab fileName 可将设定存于文件中，使用之设定时程表
  - -u user 指定用户user的时程表(需有该用户权限)，缺省默认设定当前用户的
  - -l 列出目前的时程表
  - -e 编辑目前的时程表，编辑的才生效
  - -r 删除目前的时程表
  - 时程表格式：`f1 f2 f3 f4 f5 program`
    - f1 分钟，f2 小时，f3 天-一个月中的第几日，f4 月份，f5 一周中的第几天，program 要执行的程序
  - f们的取值：
    - * 每分钟/小时/... 都要执行
    - a-b 从第a分钟/小时/...到第b分钟/小时/...都要执行
    - `*/n` 每n分钟/小时/...个时间间隔执行一次
    - a,b,c... 第a、b、c...分钟/小时要执行
  - eg：
    - 0 * * * * /bin/ls 每月每天每小时的第0分钟执行一次/bin/ls
    - 0 6-12/3 * 12 * /usr/bin/backup 在12个月内，每天早6到12点，每隔3小时0分执行一次/usr/bin/backup
    - 0 17 * * 1-5 mail -s "hi" a@xx.com 周一到周五每天下午5点0分发个邮件
    - 50 7 * * * /sbin/service sshd start 每天7：50启动ssh服务

# 环境
## 环境存储内容
- 变量们
  - 环境变量：除shell变量外的所有其他变量
  - shell变量：bash存放的少量数据，变量、别名、shell函数
- printenv 显示环境变量
- set 显示环境变量和shell变量，设置shell选项
  - 以上常用 |less 重定向
- alias 命令别名相关，缺省为显示当前所有命令别名

- 一些变量
DISPLAY 运行图形界面环境时界面的名称
|EDITOR 用于文本编辑的程序名
|SHELL 本机shell名
|HOME 本机主目录路径
|LANG 定义本机语言的字符集和排序规则
|OLD_PWD 先前的工作目录
|PWD 当前工作目录
|PAGER 用于分页输出的程序名
PATH 可执行程序的目录列表们
|PS1 定义本机shell的系统提示符1 
|TERM 终端类型的名称，定义本机中断模拟器使用的协议
|TZ 指定本机时区
|USER 用户名
|...

## 环境建立
- shell会话的两种类型
  - login shell的启动文件：
    - etc/profile
    - ~/.
  - non-login shell的启动文件：
    - /etc/bash.bashrc
    - /.bashrc
    - 继承父进程的环境
  - bash在不同环境中可能名称不同，比如sh
复合命令、shell函数、shell脚本在后
图形界面编辑器gedit

export 将环境导出到随后要运行的程序中，shell的子进程使用指定环境or变量的内容
path 在脚本中

source filepath/name <==> . filepath/name，使当前shell读入路径为filepath的shell文件并依次执行文件中的所有语句，通常用于重新执行刚修改的初始化文件，使之立即生效，而不必注销并重新登录

echo $SP1 输出PS1的值，PS1即提示符的环境变量


# 定制shell提示符
提示符由环境变量PS1决定，prompt string 1，容后Config部分


# 软件包管理 package
## 软件包系统
- 一些概念
  - 软件包文件：安装文件、元数据、安装脚本等等
  - 库：包含软件包们的地方
  - 依赖关系：程序之间互相依赖完成既定工作
- 主流软件包系统类和管理工具
  - 低级工具-安装、删除软件包等；高级工具-能进行元数据搜索、提供依赖性解决
  - Debian的.deb技术：Debian，Ubuntu，Xandros，Linspire ...
    - .deb类工具：低级dpkg，高级apt-get、aptitude
  - Red Hat的.rpm技术：CentOS，Fedora，Red Hat，openSUSE ...
    - .rpm类工具：低级rpm，高级yum

- pkName表软件包实际名称，pkFile表包含软件包的文件名

高级工具      |.deb类|.rpm类|备注
--------------|------|------|----
从库搜索      |apt-get update;apt-cache search 内容|yum search 内容|apt-getf带分号两句一起用
从库安装      |apt-get update;apt-get install 包名|yum install 包名
从文件安装    |dpkg --install pkFile|rpm -i 文件名|不安装依赖关系
卸载删除      |apt-get remove pkName|yum erase pkName
从库更新      |apt-get update;apt-get upgrade|yum update
从文件更新    |dpkg --install pkFile|rpm -U pkFile
察看已安装包  |dpkg --list|rpm -qa
判断是否安装  |dpkg --status pkName|rpm -q pkName
显示安装信息  |apt-cache show pkName|yum info pkName
察看文件安装源|dpkg --search file_name|rpm -qf file_name

- apt-get

- yum

-l 显示软件包中的文件列表
-c 显示配置文件列表
-ql 包名 查看具体安装路径

Directory      |Contents of Directory
---------------|---------------------
/etc           |一些配置文件的目录，例如/etc/init.d/mysql
/usr/bin       |一些可执行文件
/usr/lib       |一些程序使用的动态函数库
/usr/share/doc |一些基本的软件使用手册与帮助文档
/usr/share/man |一些man page文件

安装软件 
zypper install


# 存储介质
## mount 挂载文件系统;  umount 卸载文件系统
- /etc/fstab 系统启动时挂载的设备，一行一个，包括硬盘分区和虚拟系统
  - 前三行？是硬盘分区
- 6个参数
如 
1 设备 相关设备文件的真实名称
2 挂载节点 设备附加到文件系统树上的目录
3 文件系统类型 如ext3 FAT32 NTFS CD-ROM等
4 选项 设置挂载的方式属性等等参数
5 频率 dump命令使用该参数决定对此文件系统是否备份、备份频率
6 优先级 fsck命令使用该参数决定启动时扫描的文件系统顺序

- 缺省则输出目前已经挂载的文件系统列表
输出格式：设备名 on 挂载点 type 文件系统类型(允许的操作)
如 dev/

- umount 设备名 卸载设备
- mount 设备名 挂载目录
如 mount -t 文件系统类型 设备名 挂载目录
挂载前，挂载目录需要已存在

free 输出存储器的使用情况

- 设备命名
  - 一些固定模式
/dev/fd* 软盘驱动器
/dev/hd* 较旧系统的IDE硬盘，
/dev/lp* 打印机设备
/dev/sd* SCSI硬盘，和所有的类硬盘设备，包括PATA/SATA硬盘、闪存、USB等等

- 硬盘命名规则
  - 第一个驱动器为主设备，第二个为从设备，ab区分，末尾加数字表分区号
  - 如 /dev/sda 为第一个通道上的主设备，/dev/sdb/ 为第一个通道上的从设备
  - 如 /dev/sda1 假设/dev/sda为整个硬盘，则此为第一个分区

## 硬盘软盘
- fdisk 硬盘分区命令;
  - 进入fdisk程序菜单，提示已经很全
  - 常用 m 显示帮助信息，m for help，p 显示设备分区表

- mkfs 创建or按类型格式化文件系统
  - 如 mkfs -t 文件系统类型 分区的设备名

- fsck  检查修复文件系统
  - 启动时自动监测
  - fsck 设备名：修复文件系统，设备先卸载；已修复的文件放在根目录下lost+found目录中

- fdformat 设备名：格式化软盘

- dd 直接向设备写入面向块的数据data definition
  - dd if=input_file of=output_file [bs=block_size [count=blocks]]
  - 如 克隆设备，两个容量一样的u盘从sdb复制到sdc：dd if=/dev/sdb of=/dev/sdc
  - 如 先克隆到文件 dd if=/dev/sdb/ of=temp.img

- 创建CD-ROM映像
  - 创建ISO，即CD-ROM的文件系统映像
    - dd，从光盘创建iso，适用于数据类DVD，音频类使用cdrdao
    - 从文件集合中创建iso，使用enisoimage，genisoimage？ genisoimage（mkisofs） 创建一个ISO 9600映像文件
  - 将ISO写入CD-ROM只读光盘介质中
    - 不写入介质，只使用即可——挂载iso，mount的参数-o loop ...
    - 擦除并写入介质，wodim，wodim（cdrecord） 向光存储介质写入数据


df 磁盘驱动器;  free 可用内存;

磁盘、分区、挂载等相关内容，LVM与非LVM

linux下查看磁盘分区的文件系统格式 https://www.cnblogs.com/youbiyoufang/p/7607174.html


# 网络
IP Internet protocol, host and domain name 主机名和域名, URI Uniform resource identifier 统一资源标识符, URL 

## 检查、监测网络
- ifconfig (win-ipconfig)
  - 显示ip信息
  - 此命令一般默认预装，但某些时候Linux某些mini版没有，需自行安装，另有命令 ip
  - [Centos7 ifconfig这个命令没找到的解决方法](https://blog.csdn.net/u011277123/article/details/54846422)

- ping 
  - 向网络主机发送ICMP ECHO_REQUEST数据包，时间间隔默认1s
  - 数据链路层，
  - 显示：返回包？字节 from 域名（ip）：icmp_seq ttl time
  - 通常默认情况被设置为阻碍ICMP通信，降低主机被攻击风险

- traceroute或tracepath，win-tracert
  - 跟踪数据包到网络主机的路由路径
  - 显示：主机名？域名？ip，运行状态信息，3次往返时间？三次握手？
  - 不提供身份信息的地方使用*表示

- route
  - 路由相关
  - route add default gw ip 添加默认网关
  -

- netstat
  - 显示各种网络设置和相关统计数据，网络连接、路由表、网络接口数据、伪连接、多点传送成员等信息
  - netstat -nape|grep 端口号
  - -n 显示数字(否则显示别名) 
  - -a 显示所有(否则不显示LISTEN状态) 
  - -p 显示进程信息
  - -e 显示扩展信息
  - -l 仅显示LISTEN状态 
  - -t 仅显示TCP套接字 
  - -u 仅显示UDP套接字 
  - -x 仅显示UNIX套接字 
  - -r 显示路由信息
  - -i 显示接口信息
  - -s 按协议统计
  - -c 持续显示
  - 如：
  - tcp  0  0  192.168.100.61:11003  10.10.10.1:32849  ESTABLISHED 1000  3760904  25506/linker 

## 文件传输
- FTP协议
  - ftp命令，传统ftp客户端，使用FTP文件传输协议，file transfer protocol
  - lftp命令，比ftp强大，支持包括多协议、下载失败自动重新尝试、后台进程支持、tab补全等等

- wget
  - 非交互式网络下载器
  - 既可从网站下载，也支持ftp站点下载
  - 单个文件，多个文件，整个网站，都支持，递归下载、后台文件、继续下载等

## 远程安全通信
- SSH
  - Secure Shell 安全登陆远程系统
  - 身份验证-避免中间人攻击，通信加密-安全传输
  - 多数采用OpenSSH版方法
  - 远程主机为ssh服务端，监听22端口；申请连接的主机为ssh客户端
  - ssh 远程主机；ssh 用户名@远程主机（主机名orIPor域名...）
  - 更多内容暂略，如密钥，
  -
  - ssh免密登录
  - ssh_keygen -t rsa -P ''
  - 用户目录下自动生成.ssh目录，下有文件authorized_keys
  - authorized_keys里存放所有服务器公钥
  -
- OpenSSH内含网络间文件复制程序
- scp 源路径 目的路径：远程复制文件，secure copy，路径为远程时，需要加“主机名:”，即“10.12.1.1:~/test.txt”
- sftp 安全的文件传输，ftp的安全版本，只需要ssh服务器即可，无需ftp服务器
- Windows的ssh客户端：PuTTY，Xshell等

## telnet 远程登录服务，基于TCP/IP协议族
telnet 域名:端口号
如telnet www.baidu.com 1999

使用脚本+telnet
如
(echo "00BCD400{\"checkDate\":\"20190501\"}";sleep 1)|telnet 127.0.0.1 60120
sleep 60
发送socket到地址端口


## curl 
命令行综合传输工具工具，基于URL规则进行数据or文件的传输
支持HTTP HTTPS FTP等等众多协议
选项<参数>    |功能
--------------|----
-X <command>  |= --request 指定什么命令 如-X POST 
-d <data>     |HTTP POST方式传送数据 如-d "`cat 1`" 传送文件1输出的内容 注意双引号内的反引号
-H <头部信息> |添加一个或多个HTTP头部信息 如-H "TD-Charset:utf-8" -H "33"

[Linux curl 命令模拟 POST/GET 请求](https://blog.csdn.net/ithomer/article/details/82156402)
如文件1：
curl http://10.129.22.230:8096/sp1/bms -X POST -d "`cat body`"\
    -H "TD-Charset:utf-8"\
    -H "TD-Account:BANK_YN_SBJF_ZGNYYH"\
    -H "TD-Timestamp:1530178791371"\
    -H "Content-Type:application/json"
之后shell内“sourse 1”

[curl返回常见错误码](https://blog.csdn.net/kenkao/article/details/46875571)
[cURL在发送post请求后，返回Empty reply from server](https://blog.csdn.net/igaming/article/details/50739075)

# 文件搜索 常与grep等连用
- 文件名查找 locate
  -  通过文件名查找，文件名可带路径，如locate bin/zip 查找到文件所在最后一级目录应为bin/
  - 衍生 slocate mlocate


## 复杂查找 find
- find $path -option [-print] [-exec -ok command] {} \
- find 在文件系统目录框架中查找，依据文件的各种属性在既定目录&子目录里查找
- find 一个or多个目录名 在此目录范围内搜索 如find ~ 列出主目录下的文件
- 三类选项 test action options
- 参数相当多啊……
- [Linux中find常见用法示例](https://www.cnblogs.com/archoncap/p/6144369.html)
常用：
- test类
  - -type



# 归档和备份，管理文件集合
gzip 压缩解压文件工具
bzip2 块排序文件压缩工具

## tar 磁带归档工具
- tar [-cxtzjvfpPN] 文件与目录 ...
- tar zcvf 打包后生成的文件名全路径.tar 要打包的目录
    `tar zcvf Z07-develop.tgz Z07/*`
- tar zxvf $压缩文件名  解压文件到当前
 -c   打包create
 -x   解包
 -t   查看包里的文件 ≈ 使用vim打开压缩文件 可层层查看
 -u   更新包
 -v   过程中显示进度过程
 -f   制定文件？使用文档名的时候，f必须在参数末尾
 -z   调用gzip，即同时具有gzip的压缩属性
 -j   调用bzip2
 -r   增加文件
 -tvf 查看压缩包内文件列表
 错误：unexpected end of file，归档文件中异常的EOF
 原因：源码包损坏

zip 打包和压缩文件
unzip

rsync 远程文件和目录的同步


# 编译程序-详见linuxConfig.md

# shell脚本-详见linuxConfig.md
编写--脚本文件权限为允许执行--脚本放置位置最好在没指定路径时shell能自动发现的地方(如PATH环境变量中包含的目录)

"#!" 字符序列为特殊结构，名shebang，告知操作系统应使用哪个解释器执行该脚本;应该放在每个shell脚本的第一行;
  eg: #!/bin/bash 

- sh filepath 或 ./filepath
 - 建立新的子shell来执行脚本中的语句

- source filepath 或 ./filepath
 - 使当前shell读入路径为filepath 的shell文件并依次执行文件中的所有语句
 - 常用于重新执行刚修改的初始化文件，立即生效，如source /etc/profile

其他的估计暂时用不到，再看再看

-------------------------------

# 文件系统？
常用目录|内容         |备注
--------|-------------|----
/       |根目录       |/etc /bin /dev /lib /sbin应和根目录放在一个分区
/boot   |启动装载核心 |系统内核文件&引导装载程序文件 建议单独分区100M左右
        |.vmlinuz Linux内核文件；/grub 启动配置文件们
/bin    |可执行程序   |系统启动&运行必须的二进制文件 Linux基本操作命令
/sbin   |可执行命令   |系统管理相关 管理员有权 同理/usr/sbin usr/local/sbin
/etc    |系统配置文件 |主机、系统、网络等等的系统层面配置文件
/lib /lib64|系统重要库   |类似Windows的dll 同理/usr/lib，/usr/local/lib
/dev    |设备目录     |挂载无关 虚拟文件系统 存放所有能识别的设备对应的信息文件
/media  |媒体挂载点   |可移除媒体设备 自动挂载 如USB CD-ROM等
/mnt    |临时挂载点   |文件系统/可移除设备挂载 可手动挂载 
/opt    |主机额外软件 |在主机安装其他可选的软件
/var    |变化的文件   |系统执行过程中经常变化的 如日志、邮件、各种数据库等
/srv    |数据目录     |若Linux作为服务器 在服务启动后访问的数据目录
/tmp    |临时文件     |重启清空
/proc   |虚拟文件系统 |内存中建立的虚拟目录 提供系统实时信息
/home   |非root用户宿主目录
        |用户名/      |默认宿主用户有创建文件权限 目录下含用户独有配置 
/root   |root用户主目录
/usr    |应用程序     |普通用户使用的所有程序和相关文件
        |./share/doc 程序说明文件 ./local 系统本地使用的程序的安装目录
/lost+found|系统恢复分区 |系统崩溃后自动修复救回的文件存放地
/run    |系统运行时所需文件,以前在/var/run中,后来拆成独立的/run目录,重启后重新生成对应的目录数据
...     |...

具体配置等见linuxConfig.md

Linux   只有一个文件系统树（Windows 每个存储设备都有一个独立的系统树）
每个用户账号有一个主目录，唯一允许该普通账号写文件？--授权啥的怎么算？

[Linux目录详解](https://www.cnblogs.com/itcui/p/5632311.html)
[Linux目录结构及详细介绍](https://blog.csdn.net/m0_38044196/article/details/72844025)

/dev/shm文件夹 [/dev/shm（转）](https://www.cnblogs.com/softidea/p/5196858.html)

runlevel 查看系统当前运行级别

执行脚本 shell名称 脚本名？ bash a.sh

在linux中安装软件通常要用root身份，软件安装到/usr里，可以为系统的所有用户使用； 如果是用户自己安装自己的软件通常安放到/home/$user/..里，不会影响其它用户；


[Linux软件安装，RPM与YUM](http://www.cnblogs.com/shijiaqi1066/p/3843955.html)

一、Linux 的五个重启命令
　　1、shutdown 　　2、poweroff 　　3、init 　　4、reboot 　　5、halt

# 拓展
[各种缩写的含义们](https://blog.csdn.net/u013258415/article/details/78852770)

# [用户和用户组](https://www.cnblogs.com/xd502djj/archive/2011/11/23/2260094.html)
Linux添加/删除用户和用户组
adduser phpq                             //新建phpq用户
passwd phpq                               //给phpq用户设置密码
groupadd test                          //新建test工作组

查看组 group
