# git

yum -y install git
Windows ：选择git bush工具，或Windows自带powershell

[官方手册（中文）](https://git-scm.com/book/zh/v2)

# 一些概念
工作区
暂存区
版本库

提交
合并
冲突
分支branch
fork


# 配置账号 
[git config配置](https://www.cnblogs.com/fireporsche/p/9359130.html)

全局配置系统级别--global  当前系统用户级别--system  当前项目仓库级别--local，缺省为local
读取的优先级依次 --local > --global > --system

git config --global user.name "用户名"
git config --global user.email 邮箱地址

项目根目录下单独配置 针对公司项目 则在当前项目下会优先使用当前项目配置
git config user.name "用户名"
git config user.email 邮箱地址

git config --list 查看当前配置 全局配置+当前项目配置？
--global 对git的操作git config内容保存在.gitconfig的文件下
  --local对git的操作git config内容保存在.git/config的文件下

- 查看当前配置
git config user.name
git config user.email



## example
[root@localhost /home/usr/hhh] # git clone http://8.8.0.0:3000/hhh/Z08.git

初始化Z07仓库
[root@localhost /home/usr/hhh/Z07] # git init 
[root@localhost /home/usr/hhh/Z07] # git add .
[root@localhost /home/usr/hhh/Z07] # git commit -m '财政取数接口测试完成四分之三'
[root@localhost /home/usr/hhh/Z07] # git remote add Z07 http://8.8.0.0:3000/hhh/Z07.git 
  - 上面是，把这个http://8.8.0.0:3000/hhh/Z07.git远程地址关联为Z07
git remote 查看远程地址名 -v查看远程地址的具体信息
git status

[root@localhost /home/usr/hhh/Z07] # git push Z07 master

您的姓名和邮件地址基于登录名和主机名进行了自动设置。请检查它们正确
与否。您可以通过下面的命令对其进行明确地设置以免再出现本提示信息：

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

设置完毕后，您可以用下面的命令来修正本次提交所使用的用户身份：

    git commit --amend --reset-author

### 拉取远程分支更新本地代码，再进行推送，预防push冲突
- 查看远程地址 git remote -v
- git fetch Z07 master:temp 拉取即fetch远程主分支，拉到本地temp作为暂存分支
- git branch 查看当前指针指向哪个分支 `*`表示当前
- git merge temp 将temp合并到当前指针指向的分支
- git push Z07 master 推送push远程仓库
- git branch -d temp 删除暂存分支
- git branch 再次查看本地分支


[git各种情况的版本回退](https://blog.csdn.net/sinat_29774479/article/details/78599702)
[]()

# git reset
重置当前hard指向？
git reset --hard HEAD^
git reset --hard $该版本摘要前几位

注：回退某版本之后在git log下就看不到此版本之后的commit信息了，要么提前记录，要么使用git reflog

## 撤销commit操作 
git reset --soft HEAD^
HEAD^ = HEAD~1 表示上个版本
HEAD^^ = HEAD~2 上上个版本，以此类推，上一百个版本写100个^或HEAD~100
如果你进行了2次commit，想都撤回，可以使用HEAD~2
--mixed 
意思是：不删除工作空间改动代码，撤销commit，并且撤销git add . 操作
这个为默认参数,git reset --mixed HEAD^ 和 git reset HEAD^ 效果是一样的。
--soft
不删除工作空间改动代码，撤销commit，不撤销git add . 
--hard
删除工作空间改动代码，撤销commit，撤销git add . 
注意完成这个操作后，就恢复到了上一次的commit状态。
顺便说一下，如果commit注释写错了，只是想改一下注释，只需要：
git commit --amend
此时会进入默认vim编辑器，修改注释完毕后保存就好了。

# 基本操作？
git clone <repoURL> <directory> 克隆仓库repository到指定目录
git init 当前目录作为本地仓库初始化，可管理的空仓库
git init -bare 初始化裸库，不生成.git目录，只生成.git目录下的版本历史纪录文件
git add
git commit


# git log 查看日志、历史记录
- 显示从最近到最远的提交日志
- 默认输出：commit版本号(sha1)，Author用户，Date日期，提交的备注
git log -pretty=oneline --abbrev-commit 查看历史提交的commit id？？
git log -pretty=oneline 简化输出

## git reflog
- 记录使用过的命令记录，命令作用的版本commitID
- 数量？条，如何设置？
- 范围 版本变更类？commit？pull？push？merge？

# git tag 标签
- 轻量级lightweight，轻量级标签-不会变化的分支，指向特定提交对象的引用
- 含附注annotated，即-a，标签即为独立对象，有自身的校验和信息，包含标签名，电子邮件地址和日期，标签说明，标签本身也允许使用 GNU Privacy Guard (GPG) 来签署或验证
- git tag 查看所有tag，按字母顺序排列
  - -l '$带通配符*的tagName 只查看匹配的标签
- git tag -a $<tagName> -m "$附注信息" 为当前最新版本添加标签
  - -a $tagName $该版本摘要前几个即commitID 为该版本添加标签

- git push $关联的远程地址名 $tagName 将标签推送到远程仓库
  - $originName --tags 推送所有未推标签
- git show $tagName 查看标签版本的具体信息
- git tag -d $tagName  删除本地标签
- git push $originName :refs/tags/$tagName 删除远程标签

- 用 GPG 来签署标签，即添加私钥，只需要把之前的 -a 改为 -s ，即signed
- git show 缺省则显示最近版本的commit备注信息

## ssh和http方式 连接远程
- ssh key 
配置免密登录

http smart？


### .git/ 下的版本历史记录文件
- HEAD         # 这个git项目当前处在哪个分支里
- config       # 项目的配置信息，git config命令会改动它
- description  # 项目的描述信息
- hooks/       # 系统默认钩子脚本目录
- index        # 索引文件 暂存区？
- logs/        # 各个refs的历史信息
- objects/     # Git本地仓库的所有对象 (commits, trees, blobs, tags)
- refs/        # 标识你项目里的每个分支指向了哪个提交(commit)。



git status [...] 查看项目的当前状态
	-s 简短输出;
状态：?? 本地？;  A 暂存区;  AM 添加到暂存区后有新的改动;modified;

git add file (file1 file2...) 添加文件(们)到暂存区(缓存)
git add . 添加当前项目所有文件到暂存区

git add --ignore-removal <pathspec>
不会 将删除操作提交至暂存区
git add --all <pathspec>
将删除操作提交至暂存区

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

关联远程仓库

创建远程仓库

在push代码时，出现“git master branch has no upstream branch”问题的原因是没有将本地的分支与远程仓库的分支进行关联

[Git master branch has no upstream branch的解决](https://blog.csdn.net/benben_2015/article/details/78803753)


#分支管理



# 多账号管理


- windows更新版本
git --version
git update-git-for-windows


-------------------------
# 忽略提交
[Git忽略提交规则 - .gitignore配置运维总结](https://www.cnblogs.com/kevingrace/p/5690241.html)
## 匹配规则

## 三种方式
- 项目的文件夹下定义.gitignore文件
一行一个忽略规则，从上到下顺序匹配；
对.gitignore所在文件夹进行忽略

- 项目设置中指定 .git/info/exclude文件
写入要忽略提交的文件规则

- 全局定义.gitignore文件
.gitignore可以放在任意位置
git config --global core.excludesfile ~/.gitignore

## 配置失效常见解决
- .gitignore中已经标明忽略的文件目录下的文件，git push的时候还会出现在push的目录中，或者用git status查看状态，想要忽略的文件还是显示被追踪状态。
- 原因：在git忽略目录中，新建的文件在git中会有缓存，如果某些文件已经被纳入了版本管理中，就算是在.gitignore中已经声明了忽略路径也是不起作用的，
- 1）.gitignore只能忽略那些原来没有被track的文件，如果某些文件已经被纳入了版本管理中，则修改.gitignore是无效的。
- 2）想要.gitignore起作用，必须要在这些文件不在暂存区中才可以，.gitignore文件只是忽略没有被staged(cached)文件，对于已经被staged文件，加入ignore文件时一定要先从staged移除，才可以忽略。 
-
- 解决：这时候我们就应该先把本地缓存删除，然后再进行git的提交，这样就不会出现忽略的文件了。
-
- 1、 git清除本地缓存（改变成未track状态），然后再提交:
[root@kevin ~]# git rm -r --cached .
[root@kevin ~]# git add .
[root@kevin ~]# git commit -m 'update .gitignore'
[root@kevin ~]# git push -u origin master

- 2、在每个clone下来的仓库中手动设置不要检查特定文件的更改情况。
[root@kevin ~]# git update-index --assume-unchanged PATH                  //在PATH处输入要忽略的文件

## 在使用.gitignore文件后如何删除远程仓库中以前上传的此类文件而保留本地文件
在使用git和github的时候，之前没有写.gitignore文件，就上传了一些没有必要的文件，在添加了.gitignore文件后，就想删除远程仓库中的文件却想保存本地的文件。这时候不可以直接使用"git rm directory"，这样会删除本地仓库的文件。可以使用"git rm -r –cached directory"来删除缓冲，然后进行"commit"和"push"，这样会发现远程仓库中的不必要文件就被删除了，以后可以直接使用"git add -A"来添加修改的内容，上传的文件就会受到.gitignore文件的内容约束。


## git库所在的文件夹中的文件大致有4种状态
Untracked: 
未跟踪, 此文件在文件夹中, 但并没有加入到git库, 不参与版本控制. 通过git add 状态变为Staged.
 
Unmodify: 
文件已经入库, 未修改, 即版本库中的文件快照内容与文件夹中完全一致. 这种类型的文件有两种去处, 如果它被修改, 
而变为Modified. 如果使用git rm移出版本库, 则成为Untracked文件
 
Modified: 
文件已修改, 仅仅是修改, 并没有进行其他的操作. 这个文件也有两个去处, 通过git add可进入暂存staged状态, 
使用git checkout 则丢弃修改过, 返回到unmodify状态, 这个git checkout即从库中取出文件, 覆盖当前修改
 
Staged: 
暂存状态. 执行git commit则将修改同步到库中, 这时库中的文件和本地文件又变为一致, 文件为Unmodify状态. 
执行git reset HEAD filename取消暂存, 文件状态为Modified
 
Git 状态 untracked 和 not staged的区别
1）untrack     表示是新文件，没有被add过，是为跟踪的意思。
2）not staged  表示add过的文件，即跟踪文件，再次修改没有add，就是没有暂存的意思

-------------------------
部分添加暂存区

重新提交

临时区相关操作

比较文件提交

修改远程仓库地址

回退文件/工作区到某一版本（包括暂存区）

变基

修改 提交历史 合并 提交信息 文件修改 废弃

------------------------

###### git init
进入一个项目目录,执行git init,会初始化一个repo,并在当前文件夹下创建一个.git文件夹.
 
###### git clone
     获取一个url对应的远程Git repo, 创建一个local copy.
     一般的格式是git clone [url].
     clone下来的repo会以url最后一个斜线后面的名称命名,创建一个文件夹,如果想要指定特定的名称,可以git clone [url] newname指定.
 
###### git status
     查询repo的状态.
     git status -s: -s表示short, -s的输出标记会有两列,第一列是对staging区域而言,第二列是对working目录而言.

    git checkout . #本地所有修改的。没有的提交的，都返回到原来的状态git stash #把所有没有提交的修改暂存到stash里面。可用git stash pop回复。git reset --hard HASH #返回到某个节点，不保留修改。git reset --soft HASH #返回到某个节点。保留修改
    
    ---------------------

 
###### git log
     show commit history of a branch.
     git log --oneline --number: 每条log只显示一行,显示number条.
     git log --oneline --graph:可以图形化地表示出分支合并历史.
     git log branchname可以显示特定分支的log.
     git log --oneline branch1 ^branch2,可以查看在分支1,却不在分支2中的提交.^表示排除这个分支(Window下可能要给^branch2加上引号).
     git log --decorate会显示出tag信息.
     git log --author=[author name] 可以指定作者的提交历史.
     git log --since --before --until --after 根据提交时间筛选log.
     --no-merges可以将merge的commits排除在外.
     git log --grep 根据commit信息过滤log: git log --grep=keywords
     默认情况下, git log --grep --author是OR的关系,即满足一条即被返回,如果你想让它们是AND的关系,可以加上--all-match的option.
     git log -S: filter by introduced diff.
     比如: git log -SmethodName (注意S和后面的词之间没有等号分隔).
     git log -p: show patch introduced at each commit.
     每一个提交都是一个快照(snapshot),Git会把每次提交的diff计算出来,作为一个patch显示给你看.
     另一种方法是git show [SHA].
     git log --stat: show diffstat of changes introduced at each commit.
     同样是用来看改动的相对信息的,--stat比-p的输出更简单一些.
    
###### git add
     在提交之前,Git有一个暂存区(staging area),可以放入新添加的文件或者加入新的改动. commit时提交的改动是上一次加入到staging area中的改动,而不是我们disk上的改动.
     git add 文件名
     git add .
     会递归地添加当前工作目录中的所有文件.
 
###### git diff
     不加参数的git diff:
     show diff of unstaged changes.
     此命令比较的是工作目录中当前文件和暂存区域快照之间的差异,也就是修改之后还没有暂存起来的变化内容.
 
     若要看已经暂存起来的文件和上次提交时的快照之间的差异,可以用:
     git diff --cached 命令.
     show diff of staged changes.
     (Git 1.6.1 及更高版本还允许使用 git diff --staged，效果是相同的).
 
     git diff HEAD
     show diff of all staged or unstated changes.
     也即比较woking directory和上次提交之间所有的改动.
 
     如果想看自从某个版本之后都改动了什么,可以用:
     git diff [version tag]
     跟log命令一样,diff也可以加上--stat参数来简化输出.
 
     git diff [branchA] [branchB]可以用来比较两个分支.
     它实际上会返回一个由A到B的patch,不是我们想要的结果.
     一般我们想要的结果是两个分支分开以后各自的改动都是什么,是由命令:
     git diff [branchA]…[branchB]给出的.
     实际上它是:git diff $(git merge-base [branchA] [branchB]) [branchB]的结果.
 
 
###### git commit
     提交已经被add进来的改动.
     git commit -m “the commit message" 只提交刚才使用git add的文件
     git commit -a 会先把所有已经track的文件的改动add进来,然后提交(有点像svn的一次提交,不用先暂存). 对于没有track的文件,还是需要git add一下.
     git commit --amend 增补提交. 会使用与当前提交节点相同的父节点进行一次新的提交,旧的提交将会被取消.
 
###### git reset
     undo changes and commits.
     这里的HEAD关键字指的是当前分支最末梢最新的一个提交.也就是版本库中该分支上的最新版本.
     git reset HEAD: unstage files from index and reset pointer to HEAD
     这个命令用来把不小心add进去的文件从staged状态取出来,可以单独针对某一个文件操作: git reset HEAD - - filename, 这个- - 也可以不加.
     git reset --soft
     move HEAD to specific commit reference, index and staging are untouched.
     git reset --hard
     unstage files AND undo any changes in the working directory since last commit.
     使用git reset —hard HEAD进行reset,即上次提交之后,所有staged的改动和工作目录的改动都会消失,还原到上次提交的状态.
     这里的HEAD可以被写成任何一次提交的SHA-1.，修改HEAD的指向位置
     不带soft和hard参数的git reset,实际上带的是默认参数mixed.
 
     总结:
     git reset --mixed id,是将git的HEAD变了(也就是提交记录变了),但文件并没有改变，(也就是working tree并没有改变). 取消了commit和add的内容.
     git reset --soft id. 实际上，是git reset –mixed id 后,又做了一次git add.即取消了commit的内容.
     git reset --hard id.是将git的HEAD变了,文件也变了.
     按改动范围排序如下:
     soft (commit) < mixed (commit + add) < hard (commit + add + local working)
 
###### git revert
     反转撤销提交.只要把出错的提交(commit)的名字(reference)作为参数传给命令就可以了.
     git revert HEAD: 撤销最近的一个提交.
     git revert会创建一个反向的新提交,可以通过参数-n来告诉Git先不要提交.
    
###### git rm
     git rm file: 从staging区移除文件,同时也移除出工作目录.
     git rm --cached: 从staging区移除文件,但留在工作目录中.
     git rm --cached从功能上等同于git reset HEAD,清除了缓存区,但不动工作目录树.
 
###### git clean
     git clean是从工作目录中移除没有track的文件.
     通常的参数是git clean -df:
     -d表示同时移除目录,-f表示force,因为在git的配置文件中, clean.requireForce=true,如果不加-f,clean将会拒绝执行.
 
###### git mv
     git rm - - cached orig; mv orig new; git add new
 
###### git stash
     把当前的改动压入一个栈.
     git stash将会把当前目录和index中的所有改动(但不包括未track的文件)压入一个栈,然后留给你一个clean的工作状态,即处于上一次最新提交处.
     git stash list会显示这个栈的list.
     git stash apply:取出stash中的上一个项目(stash@{0}),并且应用于当前的工作目录.
     也可以指定别的项目,比如git stash apply stash@{1}.
     如果你在应用stash中项目的同时想要删除它,可以用git stash pop
 
     删除stash中的项目:
     git stash drop: 删除上一个,也可指定参数删除指定的一个项目.
     git stash clear: 删除所有项目.
 
###### git branch
     git branch可以用来列出分支,创建分支和删除分支.
     git branch -v可以看见每一个分支的最后一次提交.
     git branch: 列出本地所有分支,当前分支会被星号标示出.
     git branch (branchname): 创建一个新的分支(当你用这种方式创建分支的时候,分支是基于你的上一次提交建立的). 
     git branch -d (branchname): 删除一个分支.
     删除remote的分支:
     git push (remote-name) :(branch-name): delete a remote branch.
     这个是因为完整的命令形式是:
     git push remote-name local-branch:remote-branch
     而这里local-branch的部分为空,就意味着删除了remote-branch
 
###### git checkout
　　git checkout (branchname)
 
 

 切换到一个分支.
     git checkout -b (branchname): 创建并切换到新的分支.
     这个命令是将git branch newbranch和git checkout newbranch合在一起的结果.
     checkout还有另一个作用:替换本地改动:
     git checkout --<filename>
     此命令会使用HEAD中的最新内容替换掉你的工作目录中的文件.已添加到暂存区的改动以及新文件都不会受到影响.
     注意:git checkout filename会删除该文件中所有没有暂存和提交的改动,这个操作是不可逆的.
 
###### git merge
     把一个分支merge进当前的分支.
     git merge [alias]/[branch]
     把远程分支merge到当前分支.
 
     如果出现冲突,需要手动修改,可以用git mergetool.
     解决冲突的时候可以用到git diff,解决完之后用git add添加,即表示冲突已经被resolved.
 
###### git tag
     tag a point in history as import.
     会在一个提交上建立永久性的书签,通常是发布一个release版本或者ship了什么东西之后加tag.
     比如: git tag v1.0
     git tag -a v1.0, -a参数会允许你添加一些信息,即make an annotated tag.
     当你运行git tag -a命令的时候,Git会打开一个编辑器让你输入tag信息.
     
     我们可以利用commit SHA来给一个过去的提交打tag:
     git tag -a v0.9 XXXX
 
     push的时候是不包含tag的,如果想包含,可以在push时加上--tags参数.
     fetch的时候,branch HEAD可以reach的tags是自动被fetch下来的, tags that aren’t reachable from branch heads will be skipped.如果想确保所有的tags都被包含进来,需要加上--tags选项.
 
###### git remote
     list, add and delete remote repository aliases.
     因为不需要每次都用完整的url,所以Git为每一个remote repo的url都建立一个别名,然后用git remote来管理这个list.
     git remote: 列出remote aliases.
     如果你clone一个project,Git会自动将原来的url添加进来,别名就叫做:origin.
     git remote -v:可以看见每一个别名对应的实际url.
     git remote add [alias] [url]: 添加一个新的remote repo.
     git remote rm [alias]: 删除一个存在的remote alias.
     git remote rename [old-alias] [new-alias]: 重命名.
     git remote set-url [alias] [url]:更新url. 可以加上—push和fetch参数,为同一个别名set不同的存取地址.
 
###### git fetch
     download new branches and data from a remote repository.
     可以git fetch [alias]取某一个远程repo,也可以git fetch --all取到全部repo
     fetch将会取到所有你本地没有的数据,所有取下来的分支可以被叫做remote branches,它们和本地分支一样(可以看diff,log等,也可以merge到其他分支),但是Git不允许你checkout到它们. 
 
###### git pull
     fetch from a remote repo and try to merge into the current branch.
     pull == fetch + merge FETCH_HEAD
     git pull会首先执行git fetch,然后执行git merge,把取来的分支的head merge到当前分支.这个merge操作会产生一个新的commit.    
     如果使用--rebase参数,它会执行git rebase来取代原来的git merge.
  
 
###### git rebase
     --rebase不会产生合并的提交,它会将本地的所有提交临时保存为补丁(patch),放在”.git/rebase”目录中,然后将当前分支更新到最新的分支尖端,最后把保存的补丁应用到分支上.
     rebase的过程中,也许会出现冲突,Git会停止rebase并让你解决冲突,在解决完冲突之后,用git add去更新这些内容,然后无需执行commit,只需要:
     git rebase --continue就会继续打余下的补丁.
     git rebase --abort将会终止rebase,当前分支将会回到rebase之前的状态.
 
###### git push
     push your new branches and data to a remote repository.
     git push [alias] [branch]
     将会把当前分支merge到alias上的[branch]分支.如果分支已经存在,将会更新,如果不存在,将会添加这个分支.
     如果有多个人向同一个remote repo push代码, Git会首先在你试图push的分支上运行git log,检查它的历史中是否能看到server上的branch现在的tip,如果本地历史中不能看到server的tip,说明本地的代码不是最新的,Git会拒绝你的push,让你先fetch,merge,之后再push,这样就保证了所有人的改动都会被考虑进来.
 
###### git reflog
     git reflog是对reflog进行管理的命令,reflog是git用来记录引用变化的一种机制,比如记录分支的变化或者是HEAD引用的变化.
     当git reflog不指定引用的时候,默认列出HEAD的reflog.
     HEAD@{0}代表HEAD当前的值,HEAD@{3}代表HEAD在3次变化之前的值.
     git会将变化记录到HEAD对应的reflog文件中,其路径为.git/logs/HEAD, 分支的reflog文件都放在.git/logs/refs目录下的子目录中.
 
 
###### 特殊符号:
     ^代表父提交,当一个提交有多个父提交时,可以通过在^后面跟上一个数字,表示第几个父提交: ^相当于^1.
     ~<n>相当于连续的<n>个^.


## 一些总结性
[Github搭建个人博客（2018最新版,亲测）](https://blog.csdn.net/xudailong_blog/article/details/78762262)


## 与svn区别
svn 集成
各个版本信息记录在服务器，只有一个集中服务器

git 分布式
各个版本信息记录在所有拥有此仓库的地方，可远程连接、对外开放的地方，都可以当成服务器

