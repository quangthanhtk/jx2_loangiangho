#!/bin/bash
# -----------------------------------------------------
# Load Variables
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$DIR/../config.sh"

# -----------------------------------------------------
# Install MySQL
MYSQL_SERVICE_NAME=mysqld
MYSQL_COMMAND=mysql
if [ ! -f "${DB_CUSTOM_INSTALL_SOURCE_FILE}" ]; then
#  echo "Install MySQL" | sudo tee -a "${LOG_FILE}"
#  sudo yum -y install mysql-server
  echo "Install MariaDB v10.4" | sudo tee -a "${LOG_FILE}"
  source "${SHELL_DIR}/config/mariadb_repos_v10.4.sh"
  echo -e "${MARIADB_REPOS}" > "/etc/yum.repos.d/MariaDB.repo"
  sudo yum -y install mariadb-server
  sudo systemctl start mariadb
  sudo systemctl enable mariadb
  sudo systemctl status mariadb
  sudo /sbin/chkconfig --levels 235 ${MYSQL_SERVICE_NAME} on
#  sudo service ${MYSQL_SERVICE_NAME} start
#  sudo systemctl ${MYSQL_SERVICE_NAME} start
#  sudo systemctl ${MYSQL_SERVICE_NAME} enable
  sudo ln -s /var/lib/mysql/mysql.sock /tmp/mysql.sock
else
  echo "Install Custom MySQL" | sudo tee -a "${LOG_FILE}"
  sudo mkdir -p /usr/local/mysql
  mkdir -p ~/mysql
  tar -zxf "${DB_CUSTOM_INSTALL_SOURCE_FILE}" -C ~/mysql --strip-components 1
  \cp -rf "${DB_CUSTOM_CONFIG_FILE}" ~/mysql/"${DB_CUSTOM_INSTALL_CONFIG_DIR}"
  sudo -u root -H sh -c "cd /home/${USER}/mysql && ./${DB_CUSTOM_INSTALL_FILE}"
  sudo ln -s /usr/local/mysql/bin/mysql /usr/local/bin/mysql
  MYSQL_SERVICE_NAME=mysql
#  MYSQL_COMMAND=/usr/local/mysql/bin/mysql
  MYSQL_COMMAND=mysql
fi

# Create MySQL user
echo "Create mysql user" | sudo tee -a "${LOG_FILE}"
sudo ${MYSQL_COMMAND} -e "drop database if exists test;"
sudo ${MYSQL_COMMAND}  -e "delete from mysql.user where User='';"
sudo ${MYSQL_COMMAND}  -e "create database if not exists ${SERVER_GATEWAY_NAME}_db character set 'latin1' collate 'latin1_swedish_ci';"
sudo ${MYSQL_COMMAND}  -e "create database if not exists ${SERVER_GATEWAY_NAME}_log character set 'latin1' collate 'latin1_swedish_ci';"
sudo ${MYSQL_COMMAND}  -e "create database if not exists ${SERVER_GATEWAY_NAME}_cdkey character set 'latin1' collate 'latin1_swedish_ci';"
sudo ${MYSQL_COMMAND}  -e "create database if not exists paysys character set 'utf8' collate 'utf8_general_ci';"
sudo ${MYSQL_COMMAND}  -e "grant all privileges on ${SERVER_GATEWAY_NAME}_db.* to ${DB_USERNAME}@'${INTERNAL_IP_ADDRESS_MASK}.%' identified by '${DB_PASSWORD}' with grant option;"
sudo ${MYSQL_COMMAND}  -e "grant all privileges on ${SERVER_GATEWAY_NAME}_log.* to ${DB_USERNAME}@'${INTERNAL_IP_ADDRESS_MASK}.%' identified by '${DB_PASSWORD}' with grant option;"
sudo ${MYSQL_COMMAND}  -e "grant all privileges on ${SERVER_GATEWAY_NAME}_cdkey.* to ${DB_USERNAME}@'${INTERNAL_IP_ADDRESS_MASK}.%' identified by '${DB_PASSWORD}' with grant option;"
sudo ${MYSQL_COMMAND}  -e "grant all privileges on paysys.* to ${DB_USERNAME}@'${INTERNAL_IP_ADDRESS_MASK}.%' identified by '${DB_PASSWORD}' with grant option;"
if [[  ${SETUP_GLOBAL_SERVER} == 1 ]]; then
  sudo ${MYSQL_COMMAND}  -e "create database if not exists global_${SERVER_GATEWAY_NAME}_db character set 'latin1' collate 'latin1_swedish_ci';"
  sudo ${MYSQL_COMMAND}  -e "create database if not exists global_${SERVER_GATEWAY_NAME}_log character set 'latin1' collate 'latin1_swedish_ci';"
  sudo ${MYSQL_COMMAND}  -e "grant all privileges on global_${SERVER_GATEWAY_NAME}_db.* to ${DB_USERNAME}@'${INTERNAL_IP_ADDRESS_MASK}.%' identified by '${DB_PASSWORD}' with grant option;"
  sudo ${MYSQL_COMMAND}  -e "grant all privileges on global_${SERVER_GATEWAY_NAME}_log.* to ${DB_USERNAME}@'${INTERNAL_IP_ADDRESS_MASK}.%' identified by '${DB_PASSWORD}' with grant option;"
fi
sudo ${MYSQL_COMMAND}  -e "flush privileges;"

echo "${SERVER_GATEWAY_NAME}_db" | sudo tee -a "${BACKUP_DIR}"/dblist.txt
echo "${SERVER_GATEWAY_NAME}_log" | sudo tee -a "${BACKUP_DIR}"/dblist.txt
echo "${SERVER_GATEWAY_NAME}_cdkey" | sudo tee -a "${BACKUP_DIR}"/dblist.txt
if [[  ${SETUP_GLOBAL_SERVER} == 1 ]]; then
  echo "global_${SERVER_GATEWAY_NAME}_db" | sudo tee -a "${BACKUP_DIR}"/dblist.txt
  echo "global_${SERVER_GATEWAY_NAME}_log" | sudo tee -a "${BACKUP_DIR}"/dblist.txt
fi
echo "paysys" | sudo tee -a "${BACKUP_DIR}"/dblist.txt

if [ ! -f "${DB_CUSTOM_INSTALL_SOURCE_FILE}" ]; then
  sudo crudini --set /etc/my.cnf ${MYSQL_SERVICE_NAME} lower_case_table_names 1
  sudo crudini --set /etc/my.cnf ${MYSQL_SERVICE_NAME} max_allowed_packet 16M
#  sudo cp -rf "${SHELL_DIR}"/config/mysql.cnf /etc/my.cnf
fi

# sudo service ${MYSQL_SERVICE_NAME} restart
sudo systemctl restart mariadb
