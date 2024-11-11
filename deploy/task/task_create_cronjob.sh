#!/bin/bash
# -----------------------------------------------------
# Load Variables
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$DIR/../config.sh"

# -----------------------------------------------------
# Create CronJob
echo "Create cronjob" | tee -a "${LOG_FILE}"
ROOT_CRON=/var/spool/cron/root
sudo truncate -s 0 ${ROOT_CRON}
echo "0 0 * * * sh ${SHELL_DIR}/task/task_auto_backup.sh" | sudo tee -a "${ROOT_CRON}"
echo "0 0 * * * sh ${SHELL_DIR}/task/task_auto_clear_cache.sh" | sudo tee -a "${ROOT_CRON}"
echo "0 0 * * * sh ${SHELL_DIR}/task/task_auto_clear_log.sh" | sudo tee -a "${ROOT_CRON}"
echo "0 6 * * * sh ${SHELL_DIR}/task/task_auto_maintain.sh" | sudo tee -a "${ROOT_CRON}"
echo "*/30 * * * * sh ${SHELL_DIR}/task/task_auto_backup.sh" | sudo tee -a "${ROOT_CRON}"
#if [[  ${SETUP_GLOBAL_SERVER} == 1 ]]; then
#  echo "* * * * * sh ${SHELL_DIR}/task/task_globalserver_checker.sh" | sudo tee -a "${ROOT_CRON}"
#fi
#echo "* * * * * sh ${SHELL_DIR}/task/task_server_checker.sh" | sudo tee -a "${ROOT_CRON}"
