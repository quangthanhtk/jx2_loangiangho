#!/bin/bash
# -----------------------------------------------------
# Load Variables
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$DIR/../config.sh"

time=$(date '+%F %T')
LOG_FILE=${SHELL_DIR}/logs/AutoMaintain.log

# Function
check_server_status() {
  isOk="false"
  totalGSProc=$(pgrep -f "${GAMESERVER_FILE}" | wc -l)
  if [ "$totalGSProc" == "${SERVER_COUNT}" ]; then
    isOk="true"
  fi
  echo ${isOk}
}

# Task Auto Maintain
# Set language before run
export LANG=${LANGUAGE}
echo "${time} Jx2 Auto Maintenance Begin" | tee -a "${LOG_FILE}"

bishop_proc_id=$(pgrep -f "${BISHOP_FILE}" | wc -l)

server_status=$(check_server_status)
if [ "${bishop_proc_id}" != 0 ] && [ "$server_status" == "true" ]; then
  echo "${time} Stopping Game Servers..."
  sh "${SHELL_DIR}"/task/task_stop_gameserver.sh
  echo "${time} Stop Game Servers => success!" | tee -a "${LOG_FILE}"
fi

if [ -f "${UPDATE_FILE}" ]; then
  sh "${SHELL_DIR}"/task/task_auto_update_gameserver.sh
  echo "${time} GameServer => updated!" | tee -a "${LOG_FILE}"
fi

if [ -f "${BACKUP_DIR}"/dblist.txt ]; then
  # Backup All Database before run
  sh "${SHELL_DIR}"/task/task_auto_backup.sh
  echo "${time} Backup DB => finished!"
fi

# Set language before run
export LANG=${LANGUAGE}
echo "${time} Run Auto Start Game Server" | tee -a "${LOG_FILE}"

# Run Server Checker to auto start ggs & gs
sh "${SHELL_DIR}"/task/task_globalserver_checker.sh
echo "${time} Auto Start Global Game Server => Finish" | tee -a "${LOG_FILE}"
sh "${SHELL_DIR}"/task/task_server_checker.sh
echo "${time} Auto Start Game Server => Finish" | tee -a "${LOG_FILE}"
echo "${time} Jx2 Auto Maintenance End" | tee -a "${LOG_FILE}"
echo "--------------------------------------------------------" | tee -a "${LOG_FILE}"
