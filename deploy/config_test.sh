#!/bin/bash
# -----------------------------------------------------
# Init
export DEPLOY_USER=jxonline2
# file nµy n»m trong th­ môc deploy, néi dung lµ fullfile sever c¬ b¶n
export SOURCE_FILE=./server_deploy.7z

# Load directory cfg
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# shellcheck source=config/directory.sh
source "$DIR/config/directory.sh"

# For autoupdate
export UPDATE_FILE=/home/${DEPLOY_USER}/server_update.7z

# -----------------------------------------------------
# Network Config
# ip a (xem eth0)
# netstat -plnt (xem port dang mo)
export LAN_DEVICE=eth0
export INTERNAL_IP=10.224.31.20
export INTERNAL_IP_ADDRESS_MASK=10.224.31
export EXTERNAL_IP=103.200.21.160

# -----------------------------------------------------
# Global Server Config
export SETUP_GLOBAL_SERVER=1
export GLOBAL_SERVER_NAME=GLOBAL_GW
export GLOBAL_INTERNAL_IP_ADDRESS_MASK=${INTERNAL_IP_ADDRESS_MASK}
export GLOBAL_SERVER_INTERNAL_IP=10.224.31.21
export GLOBAL_SERVER_EXTERNAL_IP=${EXTERNAL_IP}
export GLOBAL_SERVER_PORT=8885

# -----------------------------------------------------
# Database Config
export DB_HOST=${INTERNAL_IP}
export DB_PORT=3306
export DB_USERNAME=root
export DB_PASSWORD=warl20224cdJcQW
export DB_PASSWORD_HASH=t80sy02B0Bbr8LHfqH0aOUBcFWAXigvW

# Custom db install
export DB_CUSTOM_INSTALL_SOURCE_FILE=~/mysql-5.1.32-x86_64-install-for-jxsj.tar.gz
export DB_CUSTOM_CONFIG_FILE=~/my-4G-roledb.cnf
export DB_CUSTOM_INSTALL_CONFIG_DIR=config-file
export DB_CUSTOM_INSTALL_FILE=Install-4G-roledb

# -----------------------------------------------------
# Common Config
export SERVER_GROUP=1
export SERVER_NAME=MINHLONG
export SERVER_GATEWAY_NAME=jx2ib
export SERVER_OPEN_TEST=0
export SERVER_OPEN_GM=0

# -----------------------------------------------------
# Paysys Config
export PAYSYS_IP=${INTERNAL_IP}
export PAYSYS_PORT=9551
export PAYSYS_USERNAME=warlord_gw1
export PAYSYS_PASSWORD=t80sy02B0Bbr8LHfqH0aOUBcFWAXigvW
export PAYSYS_USE_LOCAL_NETCARD=1

# -----------------------------------------------------
# Port Config
# Login port
export LOGIN_PORT=5621
# GameServer Port (GS ID => Open Port)
export GAMESERVER_PORT_MAP=([1]=6661 [2]=6662 [3]=6663 [4]=6664 [5]=6665)
export GGAMESERVER_PORT_MAP=([1]=7661)

# -----------------------------------------------------
# Other Config
export SWAPFILE_SIZE=8G
# or zh_CN.gbk
#export LANGUAGE=zh_CN.gbk
export LANGUAGE=zh_CN.gb18030

# GDB
export GDB_LOG_FILENAME=gdb_crash

# Logs
export START_LOG=start.log
export START_ERROR_LOG=start.err
export STOP_LOG=stop.log
export STOP_ERROR_LOG=stop.err

# Misc
export SERVER_COUNT=${#GAMESERVER_PORT_MAP[@]}
export GSERVER_COUNT=${#GGAMESERVER_PORT_MAP[@]}
