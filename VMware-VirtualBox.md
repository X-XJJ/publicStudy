�����������ܽᲹ��

�ο��μ�������

�����ļ���
/mnt/

[�� Linux ��������ֶ���װ VMware Tools](https://docs.vmware.com/cn/VMware-Workstation-Pro/14.0/com.vmware.ws.using.doc/GUID-08BB9465-D40A-4E16-9E15-8C016CC8166F.html)

[vmware centos7 minimal ���ù����ļ���](https://www.jianshu.com/p/b7a541262ae7)


# VM��VB�������������


# ����ģʽ
## NAT

## host-only

## ����VirtualBox��

## �Ž�
rootȨ���£�suse�����þ�̬ip��ַ 8.0.3.2��softscape�ڲ����Σ�
`ifconfig eht0 8.0.3.2 netmask 255.0.0.0` 
ͼ�ν���Network�£�YaST2������Ϊ��̬ip
Ĭ��ʹ����������VMnet0���Զ���ȡ��ǰ��������ip���������������� = ��ʵ����
  - NATģʽ
Ĭ��ʹ����������VMnet8��VM8��Ϊ����������أ����ӵ�������ڲ�LAN��������ô����
VM8��ģ����һ�׽�����+DHCP���������Դ�������ַ�������ص�ַ�����������������еĵ�ַ��eg������������������ַΪ192.168.8.1��NAT���ص�ַ��VM��Ϊ192.168.8.2

������VM8��������̬���ã������غ�VM��NAT���������غű���һ�£�Ŀ����ʹ����ͨ��VM8�������ͨ��
VM����������༭����VM8����NAT���ú�DHCP���ã����ؼ�����VM8������
������������ڲ�����������eth0������DHCP��̬ip��ping����ʹ��VM8��ַ��DNS��������ַҲʹ�����ص�ַ

��ǰ����
������VM8 192.168.8.1 255.255.255.0 ����192.168.8.2
VM��NATģʽ VM8��NAT����192.168.8.0 DHCP��Χ.128 ~ .254 �㲥��ַ.255
suse11 IP = 192.168.8.3/24
����������������ַΪ192.168.8.1��NAT���ص�ַ��VM��Ϊ192.168.8.2
������Ϊ.2 �Լ����ŷ��㣬��Ϊ��.1������������ʣ�µĶ��������

�����ping������ַ ������Ҫ���÷���ǽ����
1.��win10����ǽ���ڿ�������������ɴ򿪣�
2.ѡ��߼����ã������ѡ�����У�
3.����վ����
4.�����ļ�����Ϊ�����á��ġ��ļ��ʹ�ӡ������������ �C ICMPv4-In��������
(https://blog.csdn.net/fffffer/article/details/81185760)
netsh firewall set icmpsetting 8 ��
������ڲ�������������ַ�� Ĭ�϶�Ϊeth0��

/etc/sysconfig/network/ifcfg-eth0 ��suse9Ϊnetwork�µ�routes�ļ�����
BOOTPROTO='static' ? #��̬IP 'dhcp'��ΪDHCPģʽ
BROADCAST='' ? #�㲥��ַ
IPADDR='192.168.168.129' ? #IP��ַ���˴�Ϊsuse11�����ã�
NETMASK='255.255.255.0' ? #��������
NETWORK='192.168.21.0' ? #���ε�ַ
STARTMODE='auto' ? ?#������������
--------------------- 
��IPADDR�޸�Ϊ��Ӧ����ַip
��NETMASK�޸�Ϊ��Ӧ����������
��NETWORK�޸�Ϊ��Ӧ�����ڶ�
��BROADCAST�޸�Ϊ�������

����������� �����������⣿��
�����������

2������Ĭ������
vi /etc/sysconfig/network/routes #�༭�ļ�
default 192.168.21.2

3������DNS
vi /etc/resolv.conf   #�༭�ļ�
nameserver=8.8.8.8
nameserver=8.8.4.4

������Ч��source ifcfg-eth0

rcnetwork restart   #��������
service network restart #��������
/etc/init.d/network restart #��������
