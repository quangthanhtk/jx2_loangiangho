#!/bin/bash
# -----------------------------------------------------
# Load Variables
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$DIR/../config.sh"

LOG_FILE=${SHELL_DIR}/logs/LogCleaner.log

# -----------------------------------------------------
# Auto remove log
#Clear log older than 30 days
TIME_DIFF=+30
DB_BACKUP_TIME_DIFF=+15
time=$(date '+%F %T')
timeFull=$(date "+%Y_%m_%d_%H_%M")

echo "${time} Log Cleaner Begin" | tee -a "${LOG_FILE}"

for ServerIndex in "${!GAMESERVER_PORT_MAP[@]}"; do
  echo "${time} Remove logs in gameserver${ServerIndex}" | tee -a "${LOG_FILE}"
  find "${GAMESERVER_DIR}${ServerIndex}"/logs/* -type d -mtime ${TIME_DIFF} -exec rm -rf {} +
  find "${GAMESERVER_DIR}${ServerIndex}"/_GAMESVR_LOG_/* -type d -mtime ${TIME_DIFF} -exec rm -rf {} +
  echo "${time} Log in gameserver${ServerIndex} => cleaned" | tee -a "${LOG_FILE}"
done

while IFS= read -r dbName; do
  find "${GODDESS_DIR}/${dbName}"/* -type d -mtime ${DB_BACKUP_TIME_DIFF} -exec rm -rf {} +
  echo "${time} Clear backup database ${dbName} => Finish!" | tee -a "${LOG_FILE}"
done < "${BACKUP_DIR}"/dblist.txt

find "${GODDESS_DIR}"/logs/* -type d -mtime ${TIME_DIFF} -exec rm -rf {} +
find "${GODDESS_DIR}"/Logs/* -type d -mtime ${TIME_DIFF} -exec rm -rf {} +
find "${GODDESS_DIR}"/Statistic/* -type d -mtime ${TIME_DIFF} -exec rm -rf {} +
echo "${time} Logs in Goddess => cleaned" | tee -a "${LOG_FILE}"

find "${BISHOP_DIR}"/logs/* -type d -mtime ${TIME_DIFF} -exec rm -rf {} +
echo "${time} Logs in Bishop => cleaned" | tee -a "${LOG_FILE}"

find "${RELAY_DIR}"/_RELAY_LOG_/* -type d -mtime ${TIME_DIFF} -exec rm -rf {} +
find "${RELAY_DIR}"/runtime_stat_result/* -type d -mtime ${TIME_DIFF} -exec rm -rf {} +
find "${RELAY_DIR}"/TongSortLog/* -type d -mtime ${TIME_DIFF} -exec rm -rf {} +
find "${RELAY_DIR}"/IBLog/* -type f -mtime ${TIME_DIFF} -exec rm -rf {} +
find "${RELAY_DIR}"/logs/* -type d -mtime ${TIME_DIFF} -exec rm -rf {} +
echo "${time} Logs in Relay => cleaned" | tee -a "${LOG_FILE}"

echo "${time} Log Cleaner End" | tee -a "${LOG_FILE}"
echo "--------------------------------------------------------" | tee -a "${LOG_FILE}"
