#!/bin/bash
# -----------------------------------------------------
# Load Variables
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$DIR/../config.sh"

# -----------------------------------------------------
# Preconfig Firewall
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
# Flush all existing rules:
sudo iptables -F
sudo iptables -X
sudo iptables -Z
# Allow all loopback (lo) traffic and drop all traffic to 127.0.0.0/8 other than lo:
sudo iptables -A INPUT -i lo -j ACCEPT
# LongDaiKa: thuc te thi goddess, bishop, relay van co dung 127.0.0.1 nen khong the reject netmask nay dc
#sudo iptables -A INPUT -d 127.0.0.0/8 -j REJECT
# Block common attack:
sudo iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
sudo iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
sudo iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
# Accept all established inbound connections:
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# Allow SSH connections:
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
# Allow NTP Connections:
sudo iptables -A INPUT -p udp --dport 123 -j ACCEPT
# Allow DNS queries:
sudo iptables -A INPUT -p udp --dport 53 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 53 -j ACCEPT
# Allow MySQL connection:
sudo iptables -A INPUT -p tcp --dport "${DB_PORT}" -j ACCEPT
# firewall-cmd --zone=public --add-port=${DB_PORT}/tcp --permanent
# Default Policies:
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD DROP

# Allow Player Port:
sudo iptables -A INPUT -p tcp --dport "${LOGIN_PORT}" -j ACCEPT
# firewall-cmd --zone=public --add-port=${LOGIN_PORT}/tcp --permanent
# Allow GameServer Port:
for ServerIndex in "${!GAMESERVER_PORT_MAP[@]}"; do
  ServerPort=${GAMESERVER_PORT_MAP[${ServerIndex}]}
  sudo iptables -A INPUT -p tcp --dport "${ServerPort}" -j ACCEPT
  # firewall-cmd --zone=public --add-port=${ServerPort}/tcp --permanent
done
if [[  ${SETUP_GLOBAL_SERVER} == 1 ]]; then
  # Allow Global Port: (neu ggs khong connect duoc port thi chay lenh mo port duoi day)
  sudo iptables -A INPUT -p tcp --dport 8871 -j ACCEPT
  sudo iptables -A INPUT -p tcp --dport 8872 -j ACCEPT
  sudo iptables -A INPUT -p tcp --dport 8873 -j ACCEPT
  sudo iptables -A INPUT -p tcp --dport 8874 -j ACCEPT
  sudo iptables -A INPUT -p tcp --dport 8875 -j ACCEPT
  # Allow Global GameServer Port:
  for ServerIndex in "${!GGAMESERVER_PORT_MAP[@]}"; do
    ServerPort=${GGAMESERVER_PORT_MAP[${ServerIndex}]}
    sudo iptables -A INPUT -p tcp --dport "${ServerPort}" -j ACCEPT
    # firewall-cmd --zone=public --add-port=${ServerPort}/tcp --permanent
  done
fi

sudo service iptables save
sudo iptables-save > /etc/sysconfig/iptables
echo "Config firewall done." | tee -a "${LOG_FILE}"
# firewall-cmd --reload

#ip addr add 103.200.21.160/32 dev eth0
#iptables -t nat -I PREROUTING -d 10.224.31.175/32 -p tcp -m tcp -m multiport --dports 5621 -j DNAT --to-destination 103.200.21.160
#iptables -t nat -I PREROUTING -d 10.224.31.175/32 -p tcp -m tcp -m multiport --dports 5623 -j DNAT --to-destination 103.90.224.218
#tao card mang alias
#ip addr add 10.224.31.1/32 dev eth0:1
#ip addr add 10.224.31.2/32 dev eth0:2
#ip addr add 10.224.31.3/32 dev eth0:3
#ip addr add 10.224.31.4/32 dev eth0:4
#ip addr add 10.224.31.5/32 dev eth0:5
#ip addr add 10.224.31.6/32 dev eth0:6
#ip addr add 10.224.31.20/32 dev eth0:20
