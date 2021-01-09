# git

yum -y install git
Windows ��ѡ��git bush���ߣ���Windows�Դ�powershell

[�ٷ��ֲᣨ���ģ�](https://git-scm.com/book/zh/v2)

# һЩ����
������
�ݴ���
�汾��

�ύ
�ϲ�
��ͻ
��֧branch
fork


# �����˺� 
[git config����](https://www.cnblogs.com/fireporsche/p/9359130.html)

ȫ������ϵͳ����--global  ��ǰϵͳ�û�����--system  ��ǰ��Ŀ�ֿ⼶��--local��ȱʡΪlocal
��ȡ�����ȼ����� --local > --global > --system

git config --global user.name "�û���"
git config --global user.email �����ַ

��Ŀ��Ŀ¼�µ������� ��Թ�˾��Ŀ ���ڵ�ǰ��Ŀ�»�����ʹ�õ�ǰ��Ŀ����
git config user.name "�û���"
git config user.email �����ַ

git config --list �鿴��ǰ���� ȫ������+��ǰ��Ŀ���ã�
--global ��git�Ĳ���git config���ݱ�����.gitconfig���ļ���
  --local��git�Ĳ���git config���ݱ�����.git/config���ļ���

- �鿴��ǰ����
git config user.name
git config user.email



## example
[root@localhost /home/usr/hhh] # git clone http://8.8.0.0:3000/hhh/Z08.git

��ʼ��Z07�ֿ�
[root@localhost /home/usr/hhh/Z07] # git init 
[root@localhost /home/usr/hhh/Z07] # git add .
[root@localhost /home/usr/hhh/Z07] # git commit -m '����ȡ���ӿڲ�������ķ�֮��'
[root@localhost /home/usr/hhh/Z07] # git remote add Z07 http://8.8.0.0:3000/hhh/Z07.git 
  - �����ǣ������http://8.8.0.0:3000/hhh/Z07.gitԶ�̵�ַ����ΪZ07
git remote �鿴Զ�̵�ַ�� -v�鿴Զ�̵�ַ�ľ�����Ϣ
git status

[root@localhost /home/usr/hhh/Z07] # git push Z07 master

�����������ʼ���ַ���ڵ�¼�����������������Զ����á�����������ȷ
���������ͨ�������������������ȷ�����������ٳ��ֱ���ʾ��Ϣ��

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

������Ϻ�����������������������������ύ��ʹ�õ��û���ݣ�

    git commit --amend --reset-author

### ��ȡԶ�̷�֧���±��ش��룬�ٽ������ͣ�Ԥ��push��ͻ
- �鿴Զ�̵�ַ git remote -v
- git fetch Z07 master:temp ��ȡ��fetchԶ������֧����������temp��Ϊ�ݴ��֧
- git branch �鿴��ǰָ��ָ���ĸ���֧ `*`��ʾ��ǰ
- git merge temp ��temp�ϲ�����ǰָ��ָ��ķ�֧
- git push Z07 master ����pushԶ�ֿ̲�
- git branch -d temp ɾ���ݴ��֧
- git branch �ٴβ鿴���ط�֧


[git��������İ汾����](https://blog.csdn.net/sinat_29774479/article/details/78599702)
[]()

# git reset
���õ�ǰhardָ��
git reset --hard HEAD^
git reset --hard $�ð汾ժҪǰ��λ

ע������ĳ�汾֮����git log�¾Ϳ������˰汾֮���commit��Ϣ�ˣ�Ҫô��ǰ��¼��Ҫôʹ��git reflog

## ����commit���� 
git reset --soft HEAD^
HEAD^ = HEAD~1 ��ʾ�ϸ��汾
HEAD^^ = HEAD~2 ���ϸ��汾���Դ����ƣ���һ�ٸ��汾д100��^��HEAD~100
����������2��commit���붼���أ�����ʹ��HEAD~2
--mixed 
��˼�ǣ���ɾ�������ռ�Ķ����룬����commit�����ҳ���git add . ����
���ΪĬ�ϲ���,git reset --mixed HEAD^ �� git reset HEAD^ Ч����һ���ġ�
--soft
��ɾ�������ռ�Ķ����룬����commit��������git add . 
--hard
ɾ�������ռ�Ķ����룬����commit������git add . 
ע�������������󣬾ͻָ�������һ�ε�commit״̬��
˳��˵һ�£����commitע��д���ˣ�ֻ�����һ��ע�ͣ�ֻ��Ҫ��
git commit --amend
��ʱ�����Ĭ��vim�༭�����޸�ע����Ϻ󱣴�ͺ��ˡ�

# ����������
git clone <repoURL> <directory> ��¡�ֿ�repository��ָ��Ŀ¼
git init ��ǰĿ¼��Ϊ���زֿ��ʼ�����ɹ���Ŀղֿ�
git init -bare ��ʼ����⣬������.gitĿ¼��ֻ����.gitĿ¼�µİ汾��ʷ��¼�ļ�
git add
git commit


# git log �鿴��־����ʷ��¼
- ��ʾ���������Զ���ύ��־
- Ĭ�������commit�汾��(sha1)��Author�û���Date���ڣ��ύ�ı�ע
git log -pretty=oneline --abbrev-commit �鿴��ʷ�ύ��commit id����
git log -pretty=oneline �����

## git reflog
- ��¼ʹ�ù��������¼���������õİ汾commitID
- ����������������ã�
- ��Χ �汾����ࣿcommit��pull��push��merge��

# git tag ��ǩ
- ������lightweight����������ǩ-����仯�ķ�֧��ָ���ض��ύ���������
- ����עannotated����-a����ǩ��Ϊ���������������У�����Ϣ��������ǩ���������ʼ���ַ�����ڣ���ǩ˵������ǩ����Ҳ����ʹ�� GNU Privacy Guard (GPG) ��ǩ�����֤
- git tag �鿴����tag������ĸ˳������
  - -l '$��ͨ���*��tagName ֻ�鿴ƥ��ı�ǩ
- git tag -a $<tagName> -m "$��ע��Ϣ" Ϊ��ǰ���°汾��ӱ�ǩ
  - -a $tagName $�ð汾ժҪǰ������commitID Ϊ�ð汾��ӱ�ǩ

- git push $������Զ�̵�ַ�� $tagName ����ǩ���͵�Զ�ֿ̲�
  - $originName --tags ��������δ�Ʊ�ǩ
- git show $tagName �鿴��ǩ�汾�ľ�����Ϣ
- git tag -d $tagName  ɾ�����ر�ǩ
- git push $originName :refs/tags/$tagName ɾ��Զ�̱�ǩ

- �� GPG ��ǩ���ǩ�������˽Կ��ֻ��Ҫ��֮ǰ�� -a ��Ϊ -s ����signed
- git show ȱʡ����ʾ����汾��commit��ע��Ϣ

## ssh��http��ʽ ����Զ��
- ssh key 
�������ܵ�¼

http smart��


### .git/ �µİ汾��ʷ��¼�ļ�
- HEAD         # ���git��Ŀ��ǰ�����ĸ���֧��
- config       # ��Ŀ��������Ϣ��git config�����Ķ���
- description  # ��Ŀ��������Ϣ
- hooks/       # ϵͳĬ�Ϲ��ӽű�Ŀ¼
- index        # �����ļ� �ݴ�����
- logs/        # ����refs����ʷ��Ϣ
- objects/     # Git���زֿ�����ж��� (commits, trees, blobs, tags)
- refs/        # ��ʶ����Ŀ���ÿ����ָ֧�����ĸ��ύ(commit)��



git status [...] �鿴��Ŀ�ĵ�ǰ״̬
	-s ������;
״̬��?? ���أ�;  A �ݴ���;  AM ��ӵ��ݴ��������µĸĶ�;modified;

git add file (file1 file2...) ����ļ�(��)���ݴ���(����)
git add . ��ӵ�ǰ��Ŀ�����ļ����ݴ���

git add --ignore-removal <pathspec>
���� ��ɾ�������ύ���ݴ���
git add --all <pathspec>
��ɾ�������ύ���ݴ���

git diff [...] (commit commit1 .. HEAD)�鿴���غ��ݴ����Ķ�������
	--cached �Ѵ����ݴ����ĸĶ�;
	HEAD ��add��δadd�����иĶ�;
	--stat ��ʾժҪ;

git commit [...] �ݴ���������ӵ��ֿ�
	-m 'ע��˵��' ͬʱ�ύ���ε�ע��˵��;

git reset HEAD file ȡ��file���ݴ����Ķ�
git checkout �滻ָ���ļ���

git rm [...] file ��git���Ƴ��ļ�
	-f ǿ��ɾ����ɾǰ�޸���add���ݴ���
	--cached ֻ���ݴ����Ƴ�
	-r * �ݹ�ɾ������Ŀ¼&��Ŀ¼&�ļ�

git mv filename newname �������ļ�,�ƶ�Ŀ¼�������ӣ�

#һЩ����
git merge ��ָ��commit(s)�ϲ�����ǰ��֧���ϲ�����֧
git commit ���ݴ����ύ�޸ĵ����ؿ�
git push �ӱ��ؿⷢ��Զ�̿�
git pull ��Զ����ȡ���°浽���أ��Զ�merge = fetch + merge
git fetch ��Զ����ȡ���°浽���أ���merge

#Զ�ֿ̲�

����Զ�ֿ̲�

����Զ�ֿ̲�

��push����ʱ�����֡�git master branch has no upstream branch�������ԭ����û�н����صķ�֧��Զ�ֿ̲�ķ�֧���й���

[Git master branch has no upstream branch�Ľ��](https://blog.csdn.net/benben_2015/article/details/78803753)


#��֧����



# ���˺Ź���


- windows���°汾
git --version
git update-git-for-windows


-------------------------
# �����ύ
[Git�����ύ���� - .gitignore������ά�ܽ�](https://www.cnblogs.com/kevingrace/p/5690241.html)
## ƥ�����

## ���ַ�ʽ
- ��Ŀ���ļ����¶���.gitignore�ļ�
һ��һ�����Թ��򣬴��ϵ���˳��ƥ�䣻
��.gitignore�����ļ��н��к���

- ��Ŀ������ָ�� .git/info/exclude�ļ�
д��Ҫ�����ύ���ļ�����

- ȫ�ֶ���.gitignore�ļ�
.gitignore���Է�������λ��
git config --global core.excludesfile ~/.gitignore

## ����ʧЧ�������
- .gitignore���Ѿ��������Ե��ļ�Ŀ¼�µ��ļ���git push��ʱ�򻹻������push��Ŀ¼�У�������git status�鿴״̬����Ҫ���Ե��ļ�������ʾ��׷��״̬��
- ԭ����git����Ŀ¼�У��½����ļ���git�л��л��棬���ĳЩ�ļ��Ѿ��������˰汾�����У���������.gitignore���Ѿ������˺���·��Ҳ�ǲ������õģ�
- 1��.gitignoreֻ�ܺ�����Щԭ��û�б�track���ļ������ĳЩ�ļ��Ѿ��������˰汾�����У����޸�.gitignore����Ч�ġ�
- 2����Ҫ.gitignore�����ã�����Ҫ����Щ�ļ������ݴ����вſ��ԣ�.gitignore�ļ�ֻ�Ǻ���û�б�staged(cached)�ļ��������Ѿ���staged�ļ�������ignore�ļ�ʱһ��Ҫ�ȴ�staged�Ƴ����ſ��Ժ��ԡ� 
-
- �������ʱ�����Ǿ�Ӧ���Ȱѱ��ػ���ɾ����Ȼ���ٽ���git���ύ�������Ͳ�����ֺ��Ե��ļ��ˡ�
-
- 1�� git������ػ��棨�ı��δtrack״̬����Ȼ�����ύ:
[root@kevin ~]# git rm -r --cached .
[root@kevin ~]# git add .
[root@kevin ~]# git commit -m 'update .gitignore'
[root@kevin ~]# git push -u origin master

- 2����ÿ��clone�����Ĳֿ����ֶ����ò�Ҫ����ض��ļ��ĸ��������
[root@kevin ~]# git update-index --assume-unchanged PATH                  //��PATH������Ҫ���Ե��ļ�

## ��ʹ��.gitignore�ļ������ɾ��Զ�ֿ̲�����ǰ�ϴ��Ĵ����ļ������������ļ�
��ʹ��git��github��ʱ��֮ǰû��д.gitignore�ļ������ϴ���һЩû�б�Ҫ���ļ����������.gitignore�ļ��󣬾���ɾ��Զ�ֿ̲��е��ļ�ȴ�뱣�汾�ص��ļ�����ʱ�򲻿���ֱ��ʹ��"git rm directory"��������ɾ�����زֿ���ļ�������ʹ��"git rm -r �Ccached directory"��ɾ�����壬Ȼ�����"commit"��"push"�������ᷢ��Զ�ֿ̲��еĲ���Ҫ�ļ��ͱ�ɾ���ˣ��Ժ����ֱ��ʹ��"git add -A"������޸ĵ����ݣ��ϴ����ļ��ͻ��ܵ�.gitignore�ļ�������Լ����


## git�����ڵ��ļ����е��ļ�������4��״̬
Untracked: 
δ����, ���ļ����ļ�����, ����û�м��뵽git��, ������汾����. ͨ��git add ״̬��ΪStaged.
 
Unmodify: 
�ļ��Ѿ����, δ�޸�, ���汾���е��ļ������������ļ�������ȫһ��. �������͵��ļ�������ȥ��, ��������޸�, 
����ΪModified. ���ʹ��git rm�Ƴ��汾��, ���ΪUntracked�ļ�
 
Modified: 
�ļ����޸�, �������޸�, ��û�н��������Ĳ���. ����ļ�Ҳ������ȥ��, ͨ��git add�ɽ����ݴ�staged״̬, 
ʹ��git checkout �����޸Ĺ�, ���ص�unmodify״̬, ���git checkout���ӿ���ȡ���ļ�, ���ǵ�ǰ�޸�
 
Staged: 
�ݴ�״̬. ִ��git commit���޸�ͬ��������, ��ʱ���е��ļ��ͱ����ļ��ֱ�Ϊһ��, �ļ�ΪUnmodify״̬. 
ִ��git reset HEAD filenameȡ���ݴ�, �ļ�״̬ΪModified
 
Git ״̬ untracked �� not staged������
1��untrack     ��ʾ�����ļ���û�б�add������Ϊ���ٵ���˼��
2��not staged  ��ʾadd�����ļ����������ļ����ٴ��޸�û��add������û���ݴ����˼

-------------------------
��������ݴ���

�����ύ

��ʱ����ز���

�Ƚ��ļ��ύ

�޸�Զ�ֿ̲��ַ

�����ļ�/��������ĳһ�汾�������ݴ�����

���

�޸� �ύ��ʷ �ϲ� �ύ��Ϣ �ļ��޸� ����

------------------------

###### git init
����һ����ĿĿ¼,ִ��git init,���ʼ��һ��repo,���ڵ�ǰ�ļ����´���һ��.git�ļ���.
 
###### git clone
     ��ȡһ��url��Ӧ��Զ��Git repo, ����һ��local copy.
     һ��ĸ�ʽ��git clone [url].
     clone������repo����url���һ��б�ߺ������������,����һ���ļ���,�����Ҫָ���ض�������,����git clone [url] newnameָ��.
 
###### git status
     ��ѯrepo��״̬.
     git status -s: -s��ʾshort, -s�������ǻ�������,��һ���Ƕ�staging�������,�ڶ����Ƕ�workingĿ¼����.

    git checkout . #���������޸ĵġ�û�е��ύ�ģ������ص�ԭ����״̬git stash #������û���ύ���޸��ݴ浽stash���档����git stash pop�ظ���git reset --hard HASH #���ص�ĳ���ڵ㣬�������޸ġ�git reset --soft HASH #���ص�ĳ���ڵ㡣�����޸�
    
    ---------------------

 
###### git log
     show commit history of a branch.
     git log --oneline --number: ÿ��logֻ��ʾһ��,��ʾnumber��.
     git log --oneline --graph:����ͼ�λ��ر�ʾ����֧�ϲ���ʷ.
     git log branchname������ʾ�ض���֧��log.
     git log --oneline branch1 ^branch2,���Բ鿴�ڷ�֧1,ȴ���ڷ�֧2�е��ύ.^��ʾ�ų������֧(Window�¿���Ҫ��^branch2��������).
     git log --decorate����ʾ��tag��Ϣ.
     git log --author=[author name] ����ָ�����ߵ��ύ��ʷ.
     git log --since --before --until --after �����ύʱ��ɸѡlog.
     --no-merges���Խ�merge��commits�ų�����.
     git log --grep ����commit��Ϣ����log: git log --grep=keywords
     Ĭ�������, git log --grep --author��OR�Ĺ�ϵ,������һ����������,���������������AND�Ĺ�ϵ,���Լ���--all-match��option.
     git log -S: filter by introduced diff.
     ����: git log -SmethodName (ע��S�ͺ���Ĵ�֮��û�еȺŷָ�).
     git log -p: show patch introduced at each commit.
     ÿһ���ύ����һ������(snapshot),Git���ÿ���ύ��diff�������,��Ϊһ��patch��ʾ���㿴.
     ��һ�ַ�����git show [SHA].
     git log --stat: show diffstat of changes introduced at each commit.
     ͬ�����������Ķ��������Ϣ��,--stat��-p���������һЩ.
    
###### git add
     ���ύ֮ǰ,Git��һ���ݴ���(staging area),���Է�������ӵ��ļ����߼����µĸĶ�. commitʱ�ύ�ĸĶ�����һ�μ��뵽staging area�еĸĶ�,����������disk�ϵĸĶ�.
     git add �ļ���
     git add .
     ��ݹ����ӵ�ǰ����Ŀ¼�е������ļ�.
 
###### git diff
     ���Ӳ�����git diff:
     show diff of unstaged changes.
     ������Ƚϵ��ǹ���Ŀ¼�е�ǰ�ļ����ݴ��������֮��Ĳ���,Ҳ�����޸�֮��û���ݴ������ı仯����.
 
     ��Ҫ���Ѿ��ݴ��������ļ����ϴ��ύʱ�Ŀ���֮��Ĳ���,������:
     git diff --cached ����.
     show diff of staged changes.
     (Git 1.6.1 �����߰汾������ʹ�� git diff --staged��Ч������ͬ��).
 
     git diff HEAD
     show diff of all staged or unstated changes.
     Ҳ���Ƚ�woking directory���ϴ��ύ֮�����еĸĶ�.
 
     ����뿴�Դ�ĳ���汾֮�󶼸Ķ���ʲô,������:
     git diff [version tag]
     ��log����һ��,diffҲ���Լ���--stat�����������.
 
     git diff [branchA] [branchB]���������Ƚ�������֧.
     ��ʵ���ϻ᷵��һ����A��B��patch,����������Ҫ�Ľ��.
     һ��������Ҫ�Ľ����������֧�ֿ��Ժ���ԵĸĶ�����ʲô,��������:
     git diff [branchA]��[branchB]������.
     ʵ��������:git diff $(git merge-base [branchA] [branchB]) [branchB]�Ľ��.
 
 
###### git commit
     �ύ�Ѿ���add�����ĸĶ�.
     git commit -m ��the commit message" ֻ�ύ�ղ�ʹ��git add���ļ�
     git commit -a ���Ȱ������Ѿ�track���ļ��ĸĶ�add����,Ȼ���ύ(�е���svn��һ���ύ,�������ݴ�). ����û��track���ļ�,������Ҫgit addһ��.
     git commit --amend �����ύ. ��ʹ���뵱ǰ�ύ�ڵ���ͬ�ĸ��ڵ����һ���µ��ύ,�ɵ��ύ���ᱻȡ��.
 
###### git reset
     undo changes and commits.
     �����HEAD�ؼ���ָ���ǵ�ǰ��֧��ĩ�����µ�һ���ύ.Ҳ���ǰ汾���и÷�֧�ϵ����°汾.
     git reset HEAD: unstage files from index and reset pointer to HEAD
     ������������Ѳ�С��add��ȥ���ļ���staged״̬ȡ����,���Ե������ĳһ���ļ�����: git reset HEAD - - filename, ���- - Ҳ���Բ���.
     git reset --soft
     move HEAD to specific commit reference, index and staging are untouched.
     git reset --hard
     unstage files AND undo any changes in the working directory since last commit.
     ʹ��git reset ��hard HEAD����reset,���ϴ��ύ֮��,����staged�ĸĶ��͹���Ŀ¼�ĸĶ�������ʧ,��ԭ���ϴ��ύ��״̬.
     �����HEAD���Ա�д���κ�һ���ύ��SHA-1.���޸�HEAD��ָ��λ��
     ����soft��hard������git reset,ʵ���ϴ�����Ĭ�ϲ���mixed.
 
     �ܽ�:
     git reset --mixed id,�ǽ�git��HEAD����(Ҳ�����ύ��¼����),���ļ���û�иı䣬(Ҳ����working tree��û�иı�). ȡ����commit��add������.
     git reset --soft id. ʵ���ϣ���git reset �Cmixed id ��,������һ��git add.��ȡ����commit������.
     git reset --hard id.�ǽ�git��HEAD����,�ļ�Ҳ����.
     ���Ķ���Χ��������:
     soft (commit) < mixed (commit + add) < hard (commit + add + local working)
 
###### git revert
     ��ת�����ύ.ֻҪ�ѳ�����ύ(commit)������(reference)��Ϊ������������Ϳ�����.
     git revert HEAD: ���������һ���ύ.
     git revert�ᴴ��һ����������ύ,����ͨ������-n������Git�Ȳ�Ҫ�ύ.
    
###### git rm
     git rm file: ��staging���Ƴ��ļ�,ͬʱҲ�Ƴ�������Ŀ¼.
     git rm --cached: ��staging���Ƴ��ļ�,�����ڹ���Ŀ¼��.
     git rm --cached�ӹ����ϵ�ͬ��git reset HEAD,����˻�����,����������Ŀ¼��.
 
###### git clean
     git clean�Ǵӹ���Ŀ¼���Ƴ�û��track���ļ�.
     ͨ���Ĳ�����git clean -df:
     -d��ʾͬʱ�Ƴ�Ŀ¼,-f��ʾforce,��Ϊ��git�������ļ���, clean.requireForce=true,�������-f,clean����ܾ�ִ��.
 
###### git mv
     git rm - - cached orig; mv orig new; git add new
 
###### git stash
     �ѵ�ǰ�ĸĶ�ѹ��һ��ջ.
     git stash����ѵ�ǰĿ¼��index�е����иĶ�(��������δtrack���ļ�)ѹ��һ��ջ,Ȼ��������һ��clean�Ĺ���״̬,��������һ�������ύ��.
     git stash list����ʾ���ջ��list.
     git stash apply:ȡ��stash�е���һ����Ŀ(stash@{0}),����Ӧ���ڵ�ǰ�Ĺ���Ŀ¼.
     Ҳ����ָ�������Ŀ,����git stash apply stash@{1}.
     �������Ӧ��stash����Ŀ��ͬʱ��Ҫɾ����,������git stash pop
 
     ɾ��stash�е���Ŀ:
     git stash drop: ɾ����һ��,Ҳ��ָ������ɾ��ָ����һ����Ŀ.
     git stash clear: ɾ��������Ŀ.
 
###### git branch
     git branch���������г���֧,������֧��ɾ����֧.
     git branch -v���Կ���ÿһ����֧�����һ���ύ.
     git branch: �г��������з�֧,��ǰ��֧�ᱻ�Ǻű�ʾ��.
     git branch (branchname): ����һ���µķ�֧(���������ַ�ʽ������֧��ʱ��,��֧�ǻ��������һ���ύ������). 
     git branch -d (branchname): ɾ��һ����֧.
     ɾ��remote�ķ�֧:
     git push (remote-name) :(branch-name): delete a remote branch.
     �������Ϊ������������ʽ��:
     git push remote-name local-branch:remote-branch
     ������local-branch�Ĳ���Ϊ��,����ζ��ɾ����remote-branch
 
###### git checkout
����git checkout (branchname)
 
 

 �л���һ����֧.
     git checkout -b (branchname): �������л����µķ�֧.
     ��������ǽ�git branch newbranch��git checkout newbranch����һ��Ľ��.
     checkout������һ������:�滻���ظĶ�:
     git checkout --<filename>
     �������ʹ��HEAD�е����������滻����Ĺ���Ŀ¼�е��ļ�.����ӵ��ݴ����ĸĶ��Լ����ļ��������ܵ�Ӱ��.
     ע��:git checkout filename��ɾ�����ļ�������û���ݴ���ύ�ĸĶ�,��������ǲ������.
 
###### git merge
     ��һ����֧merge����ǰ�ķ�֧.
     git merge [alias]/[branch]
     ��Զ�̷�֧merge����ǰ��֧.
 
     ������ֳ�ͻ,��Ҫ�ֶ��޸�,������git mergetool.
     �����ͻ��ʱ������õ�git diff,�����֮����git add���,����ʾ��ͻ�Ѿ���resolved.
 
###### git tag
     tag a point in history as import.
     ����һ���ύ�Ͻ��������Ե���ǩ,ͨ���Ƿ���һ��release�汾����ship��ʲô����֮���tag.
     ����: git tag v1.0
     git tag -a v1.0, -a���������������һЩ��Ϣ,��make an annotated tag.
     ��������git tag -a�����ʱ��,Git���һ���༭����������tag��Ϣ.
     
     ���ǿ�������commit SHA����һ����ȥ���ύ��tag:
     git tag -a v0.9 XXXX
 
     push��ʱ���ǲ�����tag��,��������,������pushʱ����--tags����.
     fetch��ʱ��,branch HEAD����reach��tags���Զ���fetch������, tags that aren��t reachable from branch heads will be skipped.�����ȷ�����е�tags������������,��Ҫ����--tagsѡ��.
 
###### git remote
     list, add and delete remote repository aliases.
     ��Ϊ����Ҫÿ�ζ���������url,����GitΪÿһ��remote repo��url������һ������,Ȼ����git remote���������list.
     git remote: �г�remote aliases.
     �����cloneһ��project,Git���Զ���ԭ����url��ӽ���,�����ͽ���:origin.
     git remote -v:���Կ���ÿһ��������Ӧ��ʵ��url.
     git remote add [alias] [url]: ���һ���µ�remote repo.
     git remote rm [alias]: ɾ��һ�����ڵ�remote alias.
     git remote rename [old-alias] [new-alias]: ������.
     git remote set-url [alias] [url]:����url. ���Լ��ϡ�push��fetch����,Ϊͬһ������set��ͬ�Ĵ�ȡ��ַ.
 
###### git fetch
     download new branches and data from a remote repository.
     ����git fetch [alias]ȡĳһ��Զ��repo,Ҳ����git fetch --allȡ��ȫ��repo
     fetch����ȡ�������㱾��û�е�����,����ȡ�����ķ�֧���Ա�����remote branches,���Ǻͱ��ط�֧һ��(���Կ�diff,log��,Ҳ����merge��������֧),����Git��������checkout������. 
 
###### git pull
     fetch from a remote repo and try to merge into the current branch.
     pull == fetch + merge FETCH_HEAD
     git pull������ִ��git fetch,Ȼ��ִ��git merge,��ȡ���ķ�֧��head merge����ǰ��֧.���merge���������һ���µ�commit.    
     ���ʹ��--rebase����,����ִ��git rebase��ȡ��ԭ����git merge.
  
 
###### git rebase
     --rebase��������ϲ����ύ,���Ὣ���ص������ύ��ʱ����Ϊ����(patch),���ڡ�.git/rebase��Ŀ¼��,Ȼ�󽫵�ǰ��֧���µ����µķ�֧���,���ѱ���Ĳ���Ӧ�õ���֧��.
     rebase�Ĺ�����,Ҳ�����ֳ�ͻ,Git��ֹͣrebase����������ͻ,�ڽ�����ͻ֮��,��git addȥ������Щ����,Ȼ������ִ��commit,ֻ��Ҫ:
     git rebase --continue�ͻ���������µĲ���.
     git rebase --abort������ֹrebase,��ǰ��֧����ص�rebase֮ǰ��״̬.
 
###### git push
     push your new branches and data to a remote repository.
     git push [alias] [branch]
     ����ѵ�ǰ��֧merge��alias�ϵ�[branch]��֧.�����֧�Ѿ�����,�������,���������,������������֧.
     ����ж������ͬһ��remote repo push����, Git������������ͼpush�ķ�֧������git log,���������ʷ���Ƿ��ܿ���server�ϵ�branch���ڵ�tip,���������ʷ�в��ܿ���server��tip,˵�����صĴ��벻�����µ�,Git��ܾ����push,������fetch,merge,֮����push,�����ͱ�֤�������˵ĸĶ����ᱻ���ǽ���.
 
###### git reflog
     git reflog�Ƕ�reflog���й��������,reflog��git������¼���ñ仯��һ�ֻ���,�����¼��֧�ı仯������HEAD���õı仯.
     ��git reflog��ָ�����õ�ʱ��,Ĭ���г�HEAD��reflog.
     HEAD@{0}����HEAD��ǰ��ֵ,HEAD@{3}����HEAD��3�α仯֮ǰ��ֵ.
     git�Ὣ�仯��¼��HEAD��Ӧ��reflog�ļ���,��·��Ϊ.git/logs/HEAD, ��֧��reflog�ļ�������.git/logs/refsĿ¼�µ���Ŀ¼��.
 
 
###### �������:
     ^�����ύ,��һ���ύ�ж�����ύʱ,����ͨ����^�������һ������,��ʾ�ڼ������ύ: ^�൱��^1.
     ~<n>�൱��������<n>��^.


## һЩ�ܽ���
[Github����˲��ͣ�2018���°�,�ײ⣩](https://blog.csdn.net/xudailong_blog/article/details/78762262)


## ��svn����
svn ����
�����汾��Ϣ��¼�ڷ�������ֻ��һ�����з�����

git �ֲ�ʽ
�����汾��Ϣ��¼������ӵ�д˲ֿ�ĵط�����Զ�����ӡ����⿪�ŵĵط��������Ե��ɷ�����

