#!/bin/bash
# -----------------------------------------------------
# Update OS and install package

sudo yum update -y
sudo yum -y install epel-release
sudo yum update -y
sudo yum -y install iptables unzip bind-utils perl-libwww-perl e2fsprogs perl-LWP-Protocol-https crudini dos2unix ntp
sudo yum -y install perl-Crypt-SSLeay
sudo yum -y install tmux
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
sudo yum -y install wine.i686
sudo yum -y install glibc.i686
sudo yum -y install zlib.i686
sudo yum -y install https://harbottle.gitlab.io/wine32/7/i386/wine32-release.rpm
sudo debuginfo-install -y libgcc-4.8.5-44.el7.x86_64 libstdc++-4.8.5-44.el7.x86_64 zlib-1.2.7-20.el7_9.x86_64

sudo /sbin/chkconfig --levels 235 ntpd on
#sudo service ntpd start
sudo systemctl ntpd start
