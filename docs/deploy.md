## Change server language

`vi /etc/sysconfig/i18n`

Add the following lines

```shell
LANG="zh_CN.gb18030" 
LANGUAGE="zh_CN.gb18030:zh_CN.gb2312:zh_CN" 
SUPPORTED="zh_CN.UTF-8:zh_CN:zh:en_US.UTF-8:en_US:en" 
SYSFONT="latarcyrheb-sun16"
```

`vi /etc/profile`

Append this line to `export` part

```shell
LANG="zh_CN.gb18030"

export PATH USER LOGNAME MAIL HOSTNAME HISTSIZE HISTCONTROL LANG
```



## 1. Change timezone

```shell
sudo cp /etc/localtime /root/old.timezone
sudo rm -rf /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
```

## 2. Install libraries

```shell
sudo yum update -y
sudo yum -y install epel-release
sudo yum update -y
sudo yum -y install iptables unzip bind-utils perl-libwww-perl e2fsprogs perl-LWP-Protocol-https crudini dos2unix ntp wget
sudo yum -y install perl-Crypt-SSLeay
sudo yum -y install screen
sudo yum -y install libuuid.i686
sudo yum -y install libstdc++.so.6
sudo yum -y install libstdc++.i686
sudo yum -y install libstdc++-devel.i686
sudo yum -y install libuuid-devel.i686
sudo yum -y install libcrypto.so.6
sudo yum -y install libstdc++.so.6
sudo yum -y install libuuid.so.1
sudo yum -y install libz.so.1
sudo yum -y install gdb
sudo yum -y install p7zip
sudo yum -y install yum-utils
sudo yum -y install net-tools
sudo yum -y install psmisc
sudo yum -y install gcc gcc-c++
sudo debuginfo-install -y glibc

yum list all libgcc # check lib version 4.8.4-44.el7 >= version <= 4.9.5-44.el7
```

## 4. Mysql server

```shell
sudo yum install mariadb-server
sudo systemctl enable mariadb
sudo service mariadb start
```

### Check MYSQL version

```shell
mysql --version
```

Version 5.5 (mysql Ver 15.1 Distrib 5.5.68-MariaDB)

### Set up the database

```shell
mysql_secure_installation
```

## 5. Create database

```shell
mysql -uroot -pyourpassword
create user jxonline2@'%' identified by 'yourpassword';
create database jx2ib_database;
create database jx2ib_database_log;
create database jx2ib_cdkey;
grant all privileges on jx2ib_database.* to jxonline2@'%' with grant option;
grant all privileges on jx2ib_database_log.* to jxonline2@'%' with grant option;
grant all privileges on jx2ib_cdkey.* to jxonline2@'%' with grant option;
```

## 6. Change MySQL config

Edit file `/etc/my.cnf`

Add this line

```ini
[mysqld]
lower_case_table_names = 1
```

## 7. Open port

```shell

sudo firewall-cmd --add-port=5621/tcp --permanent
sudo firewall-cmd --add-port=6660-6665/tcp --permanent
```

## 8. Run server

```shell
export LANG=zh_CN.gbk
cd /home/jxonline2/gateway/Goddess/
./KG_Goddess
cd /home/jxonline2/gateway/Bishop/
./KG_Bishop
cd /home/jxonline2/gateway/Relay/
./KG_Relay

cd /home/jxonline2/gameserver/server1
./KG_GameServer1
cd /home/jxonline2/gameserver/server2
./KG_GameServer2
...
```
