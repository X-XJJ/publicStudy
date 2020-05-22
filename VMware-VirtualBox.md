虚拟机们相关总结补充

参考课件、网络

共享文件夹
/mnt/

[在 Linux 虚拟机中手动安装 VMware Tools](https://docs.vmware.com/cn/VMware-Workstation-Pro/14.0/com.vmware.ws.using.doc/GUID-08BB9465-D40A-4E16-9E15-8C016CC8166F.html)

[vmware centos7 minimal 配置共享文件夹](https://www.jianshu.com/p/b7a541262ae7)


# VM和VB共存の网络连接


# 网络模式
## NAT

## host-only

## （仅VirtualBox）

## 桥接
root权限下，suse内配置静态ip地址 8.0.3.2（softscape内部网段）
`ifconfig eht0 8.0.3.2 netmask 255.0.0.0` 
图形界面Network下，YaST2下配置为静态ip
默认使用虚拟网卡VMnet0，自动获取当前主机网段ip给虚拟机？，虚拟机 = 真实主机
  - NAT模式
默认使用虚拟网卡VMnet8，VM8作为虚拟机的网关，连接到虚拟机内部LAN，主机怎么连？
VM8卡模拟了一套交换机+DHCP服务器，自带两个地址——网关地址和主机在虚拟网络中的地址，eg：主机在虚拟内网地址为192.168.8.1，NAT网关地址在VM内为192.168.8.2

主机：VM8卡，若静态配置，则网关和VM的NAT设置里网关号保持一致，目的是使主机通过VM8和虚拟机通信
VM：设置网络编辑器内VM8卡，NAT设置和DHCP设置，网关即主机VM8的网关
虚拟机：配置内部即本地网卡eth0，设置DHCP或静态ip，ping主机使用VM8地址，DNS服务器地址也使用网关地址

当前配置
主机下VM8 192.168.8.1 255.255.255.0 网关192.168.8.2
VM下NAT模式 VM8的NAT网段192.168.8.0 DHCP范围.128 ~ .254 广播地址.255
suse11 IP = 192.168.8.3/24
主机在虚拟内网地址为192.168.8.1，NAT网关地址在VM内为192.168.8.2
网关设为.2 自己看着方便，因为把.1给物理主机，剩下的都是虚拟的

虚拟机ping主机地址 主机需要设置防火墙规则
1.打开win10防火墙（在控制面板搜索即可打开）
2.选择高级设置（在左边选项栏中）
3.打开入站规则
4.启用文件类型为“公用”的“文件和打印共享（回显请求 – ICMPv4-In）”规则。
(https://blog.csdn.net/fffffer/article/details/81185760)
netsh firewall set icmpsetting 8 ？
虚拟机内部网卡（本机地址） 默认都为eth0？

/etc/sysconfig/network/ifcfg-eth0 （suse9为network下的routes文件？）
BOOTPROTO='static' ? #静态IP 'dhcp'则为DHCP模式
BROADCAST='' ? #广播地址
IPADDR='192.168.168.129' ? #IP地址（此处为suse11的设置）
NETMASK='255.255.255.0' ? #子网掩码
NETWORK='192.168.21.0' ? #网段地址
STARTMODE='auto' ? ?#开机启动网络
--------------------- 
将IPADDR修改为对应的网址ip
将NETMASK修改为对应的子网掩码
将NETWORK修改为对应的网口段
将BROADCAST修改为最高网段

虚拟机连主机 网段设置问题？？
网段如何设置

2、设置默认网关
vi /etc/sysconfig/network/routes #编辑文件
default 192.168.21.2

3、设置DNS
vi /etc/resolv.conf   #编辑文件
nameserver=8.8.8.8
nameserver=8.8.4.4

配置生效：source ifcfg-eth0

rcnetwork restart   #重启网络
service network restart #重启网络
/etc/init.d/network restart #重启网络
