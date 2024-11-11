#!/bin/bash
# -----------------------------------------------------
# Load Variables
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$DIR/../config.sh"

# -----------------------------------------------------
# Clean and Start
echo "=======================================================" | tee -a "${LOG_FILE}"
echo "Remove setup files." | tee -a "${LOG_FILE}"
# Delete source file
rm -rf "${SOURCE_FILE}"
echo "Source File: ${SOURCE_FILE} -> Deleted." | tee -a "${LOG_FILE}"
if [ -f "${DB_CUSTOM_INSTALL_SOURCE_FILE}" ]; then
  echo "Remove db setup files"
  rm -rf ~/mysql
  rm -rf "${DB_CUSTOM_INSTALL_SOURCE_FILE}"
  echo "${DB_CUSTOM_INSTALL_SOURCE_FILE} -> Deleted." | tee -a "${LOG_FILE}"
  rm -rf ~/"${DB_CUSTOM_INSTALL_FILE}"
  echo ~/"${DB_CUSTOM_INSTALL_FILE} -> Deleted." | tee -a "${LOG_FILE}"
  rm -rf "${DB_CUSTOM_CONFIG_FILE}"
  echo "${DB_CUSTOM_CONFIG_FILE} -> Deleted." | tee -a "${LOG_FILE}"
fi
rm -rf "${INSTALL_DIR}"
rm -rf "${GAMESERVER_DIR}"
echo "Run server" | tee -a "${LOG_FILE}"
time=$(date '+%F %T')
echo "${time} Start JX2 Server" | tee -a "${LOG_FILE}"
# run checker to auto start gs
sudo -u root -H sh -c "sh ${SHELL_DIR}/task/task_auto_maintain.sh"
echo "${time} Start Game Server => Finish" | tee -a "${LOG_FILE}"
echo "Finish!" | tee -a "${LOG_FILE}"
echo "=======================================================" | tee -a "${LOG_FILE}"
