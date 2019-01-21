git相关 暂存

[官方手册（中文）](https://git-scm.com/book/zh/v2)

#配置账号 
全局配置--global  当前系统？用户？--system
git config --global user.name "用户名"
git config --global user.email 邮箱地址

项目根目录下单独配置 针对公司项目 则在当前项目下会优先使用当前项目配置
git config user.name "用户名"
git config user.email 邮箱地址

git config --list 查看当前配置 全局配置+当前项目配置？

#基本操作？
git clone <repoURL> <directory> 克隆仓库repository到指定目录
git init 当前目录作为本地仓库初始化，可管理的空仓库

git status [...] 查看项目的当前状态
	-s 简短输出;
状态：?? 本地？;  A 暂存区;  AM 添加到暂存区后有新的改动;modified;

git add file (file1 file2...) 添加文件(们)到暂存区(缓存)
git add . 添加当前项目所有文件到暂存区

git diff [...] (commit commit1 .. HEAD)查看本地和暂存区改动的区别
	--cached 已存入暂存区的改动;
	HEAD 已add和未add的所有改动;
	--stat 显示摘要;

git commit [...] 暂存区内容添加到仓库
	-m '注释说明' 同时提交本次的注释说明;

git reset HEAD file 取消file的暂存区改动
git checkout 替换指定文件？

git rm [...] file 从git中移除文件
	-f 强制删除，删前修改且add入暂存区
	--cached 只从暂存区移除
	-r * 递归删除整个目录&子目录&文件

git mv filename newname 重命名文件,移动目录，软连接？

#一些区分
git merge 从指定commit(s)合并到当前分支，合并俩分支
git commit 从暂存区提交修改到本地库
git push 从本地库发到远程库
git pull 从远程拉取最新版到本地，自动merge = fetch + merge
git fetch 从远程拉取最新版到本地，不merge

#远程仓库

#分支管理



# 多账号管理



-------------------------
部分添加暂存区

重新提交

临时区相关操作

比较文件提交

修改远程仓库地址

回退文件/工作区到某一版本（包括暂存区）

变基

修改 提交历史 合并 提交信息 文件修改 废弃

