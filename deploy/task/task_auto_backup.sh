#!/bin/bash
# -----------------------------------------------------
# Load Variables
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$DIR/../config.sh"

if [ ! -f "${BACKUP_DIR}"/dblist.txt ]; then
  exit
fi
LOG_FILE=${SHELL_DIR}/logs/AutoBackUp.log

# KSGVN Auto Backup v1.0.0
time=$(date '+%F %T')
timeFull=$(date "+%Y_%m_%d_%H_%M")
echo "${time} Auto Backup Begin" | tee -a "${LOG_FILE}"

while IFS= read -r dbName; do
  dbBackupName=${dbName}.${timeFull}
  if [ "${dbName}" != "information_schema" ]; then
    cd "${GODDESS_DIR}" && ./KGD_MySQLBackup -d "${dbName}"
    echo "${time} Backup database ${dbName} => Finish!" | tee -a "${LOG_FILE}"
  fi
done < "${BACKUP_DIR}"/dblist.txt

echo "${time} Auto Backup End" | tee -a "${LOG_FILE}"
echo "--------------------------------------------------------" | tee -a "${LOG_FILE}"
