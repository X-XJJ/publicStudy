git��� �ݴ�

[�ٷ��ֲᣨ���ģ�](https://git-scm.com/book/zh/v2)

#�����˺� 
ȫ������--global  ��ǰϵͳ���û���--system
git config --global user.name "�û���"
git config --global user.email �����ַ

��Ŀ��Ŀ¼�µ������� ��Թ�˾��Ŀ ���ڵ�ǰ��Ŀ�»�����ʹ�õ�ǰ��Ŀ����
git config user.name "�û���"
git config user.email �����ַ

git config --list �鿴��ǰ���� ȫ������+��ǰ��Ŀ���ã�

#����������
git clone <repoURL> <directory> ��¡�ֿ�repository��ָ��Ŀ¼
git init ��ǰĿ¼��Ϊ���زֿ��ʼ�����ɹ���Ŀղֿ�

git status [...] �鿴��Ŀ�ĵ�ǰ״̬
	-s ������;
״̬��?? ���أ�;  A �ݴ���;  AM ��ӵ��ݴ��������µĸĶ�;modified;

git add file (file1 file2...) ����ļ�(��)���ݴ���(����)
git add . ��ӵ�ǰ��Ŀ�����ļ����ݴ���

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

#��֧����



# ���˺Ź���



-------------------------
��������ݴ���

�����ύ

��ʱ����ز���

�Ƚ��ļ��ύ

�޸�Զ�ֿ̲��ַ

�����ļ�/��������ĳһ�汾�������ݴ�����

���

�޸� �ύ��ʷ �ϲ� �ύ��Ϣ �ļ��޸� ����

