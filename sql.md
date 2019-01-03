sql���

# ����
sql�����ڣ�
sp_help

��ͬ���ݿ����ù��߲�ͬ��

�﷨Լ��
�ؼ��ִ�Сд����--Ĭ�������п��Բ��ִ�Сд������ִ��ʱ�ؼ��ֻ���תΪ��д��ִ�У���д����ʡ�Ա���ʱ��

Ԫ�飺һ��
�ַ���ʹ�õ�����`'` '�ַ���'

|    ���﷨ѡ�ֻ��ѡ������һ��
[]   ��ѡ�﷨ѡ��
--   ����ע��
/**/ ����ע��

# ��ϵ���ݿ��׼����SQL
- ���ݶ���DDL
  ����      CREATE--����  DROP--ɾ��    ALTER--�޸�
  ��������  database--���ݿ�  table--��  view--��ͼ  index--����
- ���ݲ���DML�����ݣ�
  ����      INSERT--����  UPDATE--����  DELETE--ɾ�����У�
  ��������  ���е�����������
- ���ݲ�ѯDQL      
  ����      SELECT
  ��������  ��and�����ǣ�
- ���ݿ���DCL����ȫ��
  ����      GRANT--��Ȩ   REVOKE--�ջ���Ȩ
  ��������  ���ݶ��󣨱��С���ͼ...�������ݿ�ϵͳ


# ���ݲ�ѯ
## һ���ʽ
select [all|distinct] Ŀ���б��ʽ1 as ���� ,���ʽ2 ...
from   ����or��ͼ�� ,����2... | (select���) [as] ���������
[where �������ʽ] 
[group by ����1 [having [�ۺ�][�������ʽ]] [,����2...]]  --�����ɣ��ܶ����
[order by ���� [ASC | DESC]]
---
- "distinct" ���������ظ���;  all ��ȡ���ظ���allΪĬ��ֵ;
- "as ����"  --ȡ�ò�ѯ����еı�������ʡ�ԣ�����Ϊ���ַ�������Ĭ��;
- "Ŀ���б��ʽ" ��ѡ��ʽ��
    *       --��all��;  
    ����.*  --��ñ��all��;
    count ([all | distinct] *)  --�麬NULL��Ԫ�����;
    [����.]�����������ʽ1 ,���ʽ2...  
        - �����С��������еľۼ������������������ǵ�����������ʽ
        - "�ۼ�����" 
          ʹ�ã�select �����ؼ���([all|distinct]����) ���� having �����ؼ���([all|distinct]����)������select count(*) ��ֱ��ʹ��;
          ��������
          - count() ͳ�����з�NULLֵ�ĸ���;  count(*) ͳ�ƺ�NULLԪ�����;
          - SUM() ����һ��ֵ�ܺ�;  AVG() ����һ��ƽ��ֵ;  �˶�����Ϊ��ֵ��;
	  - MAX() MIN() ��һ��ֵ�е������Сֵ;
- "where �������ʽ" �������ʽ��ѡ��ʽ��"having"��where������ͬ;
    ���� �Ƚ������ ����|����| [any | all](select���)  --�Ƚ�;
         [NOT] between ����|����| [any|all](select���) AND ����|����| [any|all](select���)                            --ȷ����Χ��between����and����;
         [NOT] IN (ֵ1 ,ֵ2...) | (select���)          --ȷ������;
         IS [NOT] NULL                                  --�жϿ�ֵ;
    [NOT] exists (select���)                           --�Ƿ����;
    �������ʽ1 [AND | OR �������ʽ2 AND|OR ...]       --���ȼ�AND > OR;
- "group by ... having ..."
    ����ѯ�����ĳ��or���е�ֵ���飬ֵ��ȵ�Ϊһ��;
    ������where��group by�����棻���Ӳ�ѯ�У�where�������group by;
- "order by"
    ASC ����Ĭ�ϵ�; DESC ����;
    order byֻ�ɶ����ս������Ƕ�ײ�ѯ���Ӳ�ѯ��order by����top n����;
    eg��... IN (select top 3 name from A order by age)

## �����ѯ
- from�Ӿ���ֻ�漰һ����;
- �������Ա�־��������������
  select name,'����',year ...  --��ѯ��������ڸ�λ�ö�һ�У����ݾ�Ϊ'����';
- ���ö���
  select���������order by��where��group by���ۼ�������like��having
- �������� [NOT] like 'ƥ�䴮' [escape '�����ַ�']  --ģ����ѯ���ַ�ƥ��
  ƥ�䴮���ַ������ɺ�ͨ�����% ���ⳤ���ַ���;  _ ���ⵥ���ַ�; eg: a%b��;
  �����ַ��������Զ����ת���ַ�;
  eg��select name as '����',year from A where year like '1_\_20%' escape '\'
      �ӱ�A��ѡ����������ݣ����������Ϊ1��ͷ����345λΪ_20����β���޵�;
- ����һ����ѯ����ͬʱ����where��group by��having����ʹ��˳��Ϊwhereѡ���У�group by������ֳ��飬having��Ϊgroup by���Ӿ�;

## ���Ӳ�ѯ
- ���ӣ�������Ԫ�鰴�����
- ������ 
  ��ʽ��from ��1��,��2�� where ��������
        from ��1 inner join ��2��(select���)ѡ������ where ��������
  ���������Ĳ�ѯ��Ϊ�ѿ�����ƥ�䣨����������ϣ����ݳ��󰡣�;
  - [��]��ֵ����
    where�Ӿ��У�������ĿɱȽϵ������ֶν��бȽϣ��پݴ�Ϊ������������;
    eg��select B.a,b,c from A,B where A.a=B.a and B.d>3  --�����ٲ�
        ��A�ֶ�{a,b}����B�ֶ�{a,c,d}���������ڱ�����Ψһ������ʡ�Ա���ǰ׺;
	����������A.a=B.a���ӱ�A��B��Ԫ�飬����ѯ����d > 3�Ĳ�ѯ����;
	<==>
	select C.a,b,c from A,(select * from B where d>3) as C where A.a=C.a
    ���������ӣ����Լ��ı���or����ȡ������������;��
- ������
  ��ʽ��from ��1�� left|right|full [outer] join ��2�� on (��������)
  ��ʾ��NULL����Ĳ�ѯ������������Ԫ��Ҳ�����ڽ����ϵ��;
  - �������� left���г���ߣ������ȫ����ϵ;
  - �������� right���г��ұߣ��ұ���ȫ����ϵ;
  - ȫ������ = ���Ҷ��г�;

## Ƕ�ײ�ѯ
- һ����ѯ��Ƕ������һ����ѯ���where�Ӿ��having�����еĲ�ѯ;
- һ����ѯ�飺һ��select-from-where�Ӿ�;
- �����Ӳ�ѯ��ν�ʣ�
  [not] in;  �Ƚ������;  �Ƚ������ some|all;  [not] exists;
  - IN()     <==> exists()     <==> =some();
  - NOT in() <==> NOT exists() <==> !=all();
- �����Ƕ�ף�ÿ��ִֻ��һ�Σ�������ڸ���ѯ;
  eg��select a from A where b<some (select b from A where c=3)
      �ڱ�A�в�ѯ��*��*��c=3�����µ�bС ��b ��Ӧ��a�ǵ�ֵ; >
- ���Ƕ�ף��Ӳ�ѯ��where��ѯ���������ڸ���ѯ
  eg��select a from A where b<(select b from B where A.c=B.c)
      �Ӳ�ѯÿ��ִ�ж�������ѯ��ȡ����A��һ��Ԫ�飬��㽫c��ֵ���͸��Ӳ�ѯ���Ӳ�ѯִ�д��� = ����ѯԪ����; >

## ���ϲ�ѯ
- �������󣺶��select���Ĳ�ѯ�������������ͬ����Ӧ���������ͱ���ͬ;
- ��ʽ��select���1 ���ϲ��� select���2
- ���ϲ�����
  union     �����Զ�Ĭ��ȥ�أ�union all�����ظ�;
  intersect ��;
  except    ��;


# ���ݲ���
## �޸����� 
update ���� set ����=���ʽ [,����=���ʽ...] [where ����]
## �������� 
- ���������ݣ�ԭ�飩
insert into ���� [(������1 [,������2...])] values (����1 [,����2 ...])
- �����Ӳ�ѯ���
insert into ���� [(��������)] �Ӳ�ѯ
  - ���Ʊ�����  select * into �±��� from ԭ����
  - ���Ʊ�ṹ  select * into �±��� from ԭ���� where һ�������ڵ�����
## ɾ������ 
delete from ���� [where ����] 


# ���ݶ��壨Ŀǰ�����õ��٣���ʱ��һ�ţ�
- ��ϵ��ģʽ�ṹ
  ��ģʽ--��ͼ  ģʽ--������  ��ģʽ--�����������ֵ�
## ���ݿ� database
create database ���ݿ��� 
  [ON ���ݿ���Ϣ��name,size...]
  [LOG ON ��־��Ϣͬ��]
## �� table
- ����������
create table ����(
  ����1 �������� [�м�������Լ������], ����2 �������� [��������Լ��], 
  ...,
  [��������Լ������]
)
  - ��������
    �ַ�����--��char(n)����ֵ����--��int������ʱ����--��date time datetime
  - ��������Լ�� - �м�������Լ��
- �޸Ļ�����
alter table ����
  [add ������ �������� [������Լ����]]
�ȵ�
- ɾ��������
drop table ���� [restrict|cascade]

## ���� index
- �ۼ��������Ǿۼ�����
- ��������
create [] [|] index ������ ON ���� (����1 [����][,����2 [����]...])
- �޸�������
alter index ���� rename to ��������
- ɾ������
drop index ���� ������

## ��ͼ
- ��1��or����������������ֻ�ж���û�����ݣ��Ի���Ϊ��׼
- ������ͼ
create view ��ͼ�� [(����1 [,����2 ...])] 
  AS �Ӳ�ѯ [with check option]
- ɾ����ͼ
drop view ��ͼ�� [cascade]

# ���ݿ���DCL����ȫ��
## �û�
- �����û�
  create user �û��� identified by ����
	default tablespace USERS--��ռ���
	temporary tablespace temp --��ʱ��ռ���
    profile DEFAULT    --�����ļ���Ĭ�������ļ���
	account unlock; -- �˻��Ƿ������lock:������unlock������
- ɾ���û�
  drop user


## Ȩ��
��ͬ���ݿ�Ľ�ɫ��Ȩ�ޡ�������ͬ����
grant
--GRANT ����Ȩ�� on ���� TO �û�    
grant select, insert, update, delete on JSQUSER to STUDENT;
 
--GRANT ϵͳȨ�� to �û�
 grant select any table to STUDENT;
  
--GRANT ��ɫ TO �û�
 grant connect to STUDENT;--��Ȩconnect��ɫ
 grant resource to STUDENT;--����resource��ɫ

revoke
deny
�õĸ��٣��ݷ�

# ������ trigger
�ݷ�


�����ڱʼǣ��������䣩

