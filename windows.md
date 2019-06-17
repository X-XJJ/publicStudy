# 双系统
- 镜像.iso解压到非系统盘 如解压到D:\win7C\下
- D:\win7C\boot\下,添加C:\Windows\Boot\EFI\bootmgr.efi(不隐藏受保护的操作系统文件),改名为bootx64.efi或bootx32.efi
- 运行D:\win7C\setup.exe
- 如果需要，最好还是单独分一个区作为系统盘，方便管理

# 激活win10
slmgr.vbs /upk
slmgr /ipk $license
slmgr /skms zh.us.to
slmgr /ato

slmgr.vbs -xpr

如
[使用kms激活win10企业版400年教程](http://www.xitongzu.com/jc/19471.html)
slmgr /ipk YYVX9-NTFWV-6MDM3-9PT4T-4M68B
slmgr /skms kms.03k.org
slmg /ato

# PowerShell
- 计算信息摘要，如md5
  - Get-FileHash C:\Windows\notepad.exe -Algorithm MD5| Format-List

- windows系统默认不允许通过桌面方式创建.（点）开头的文件夹或文件，但是并不代表不支持此类文件，可以用shell创建
  - mkdir = md 创文件夹；vim 或echo重定向 创文件，eg：echo test > .aaa

# 快捷键
shift切换中英文时
设置→轻松使用→键盘：粘滞键功能，关闭则shift一次切换中英文，开启粘滞键则连按两次shift切换中英文，连按5次shift进行开启/关闭粘滞键

　　Win+X：简易版开始菜单（同鼠标在Win徽标上点击右键）——快速找powershell；
　　Win+i：设置面板；
　　Win+L：快速锁屏；
　　Win+A：呼叫操作中心，也就是我们常说的通知面板，在屏幕右侧边缘，不仅能查阅Windows通知项目，还可以直接对系统功能进行控制；
　　Win+Tab：调出虚拟桌面，查找窗口超方便；
　　Win+Ctrl+D：新建虚拟桌面，虚拟桌面快捷键；
　　Win+Ctrl+→/←： -在不同虚拟桌面间切换；
　　Win+Ctrl+F4：关闭当前虚拟桌面；
　　Win+P：将当前画面投影至第二屏幕，支持复制、扩展；
　　Win+↑/↓/←/→：将当前窗口按比例固定到屏幕的四个边角，如左上、右上、左下、右下；
　　Win+C：呼叫Cortana小娜，呼出后可直接口述命令；
　　Win+S：呼叫Cortana小娜主面板，与“Win+C”区别是不支持口述命令，但能提供今日详情；
　　Win+G：启动Win10内置屏幕录像功能，游戏玩家必须牢记的，不然你怎么把自己的精彩表现分享给大家呢？
　　Win+K：启动无线连接模块，可以将当前屏幕的音视频无线传递至其他无线显示设备；
　　Win+1、2、3…：按顺序打开任务栏上的已固定程序，也就是开始菜单最右边的图标依次排开，如果你的任务栏像小编这样井井有条，使用这个快捷组合是极好的；
　　Win+PrtScr：截取当前桌面截图，并将截图自动存放至“图片-屏幕截图”文件夹中。
　　Crtl+A、Crtl+C、Crtl+V或者Ctrl+Alt+Del
C-c=C-Insert复制 C-v=Shift-Insert粘贴
“Win+E”启动资源管理器“Win+D”在窗口最小化和显示桌面之间来回切换
Win-r $program 打开程序
如
net start mssqlserver 开启Sql Server服务
net stop mssqlserver 关闭Sql Server服务
msconfig 电脑启动配置
regedit.exe 注册表
explorer 打开资源管理器
cliconfg SQL SERVER 客户端网络实用程序
sndrec32 录音机
notepad 打开记事本
logoff 注销命令
shutdown /s /t 30倒计时关机命令
shutdown -a 取消关机命令
calc 启动计算器
ipconfig 查看本机IP（在DOS窗体的情况下输入）
ipconfig /all 查看本机IP（详细信息）
mspaint 画图板
osk 打开屏幕键盘
mstsc 远程桌面连接
winver 检查Windows版本
msconfig 系统设置（关闭开机自启动）

# 系统备份还原


# 自动更新相关部分
- gpedit.msc 本地组策略编辑器——计算机配置→Windows组件→Windows更新→一堆，如配置自动更新
- services.msc 服务——Windows Update→常规&恢复


# 一些概念
## 休眠&睡眠
1、睡眠和休眠，系统都会将内存中的数据全部存在一个休眠文件中，不同的是休眠存硬盘，可断电，睡眠存在内存，不可以断电。
休眠：恢复时间较长且需要较大的硬盘空间，可断电，休眠是“关机”的一种模式，原理是在执行休眠时，会把内存中暂存的数据写入到硬盘中。执行休眠的时候，CPU、内存、硬盘等等都不会工作，基本等同于断电关机。——灯灭
睡眠：选择睡眠模式时，系统会将正在处理的数据保存到【内存】中，除内存以外的所有设备都停止供电。这里有个一个特别注意的事情，如果此时停电了，那么内存也断电了，数据就会丢失！——灯亮

