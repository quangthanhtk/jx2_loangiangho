#!/bin/bash
# -----------------------------------------------------
# Load Variables
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$DIR/../config.sh"

LOG_FILE=${SHELL_DIR}/logs/GlobalServerChecker.log

time=$(date '+%F %T')
PIDFILE=${SHELL_DIR}/task/task_globalserver_checker.pid
if [ -f "${PIDFILE}" ]; then
  echo "${time} Another task is running" | tee -a "${LOG_FILE}"
  echo "${time} Global Server Checker End" | tee -a "${LOG_FILE}"
  echo "--------------------------------------------------------" | tee -a "${LOG_FILE}"
  exit 0
fi
echo $$ > "${PIDFILE}"

# Function
restart_ggateway() {
  # Alias ip paysys, goddess, bishop, relay
  echo "${time} Alias ip grelay, grouter" | tee -a "${LOG_FILE}"
  sudo -u root -H sh -c "ip addr add ${GLOBAL_SERVER_INTERNAL_IP}/32 dev ${LAN_DEVICE}" | tee -a "${LOG_FILE}"
  for ProcessIndex in "${!GGAMESERVER_START_PROCESS[@]}"; do
    ProcessDir=${GGAMESERVER_START_PROCESS[${ProcessIndex}]}
    echo "${time} Restart ${ProcessDir} Server" | tee -a "${LOG_FILE}"

    # Cach 1: chay gw an mac dinh
    #cd "${APP_ROOT}/${ProcessDir}" && ./"${START_SERVER_FILENAME}" 1>"${START_LOG}" 2>"${START_ERROR_LOG}"

    # Cach 4: chay gw thong qua tmux, neu bo duoi ./start 1>start.log 2>start.err o phia sau thi dung den
    echo "${time} Start new screen ${ProcessDir}..."
    sudo -u root -H sh -c "tmux new-session -d -s ${ProcessDir} 'cd ${APP_ROOT}/${ProcessDir} && ./${START_SERVER_FILENAME}'"
    # Output: tmux new-session -d -s goddess 'cd /home/jxonline2/server/goddess && ./start 1>start.log 2>start.err'

    echo "${time} ${ProcessDir} => Restarted" | tee -a "${LOG_FILE}"
    sleep 10
  done
}

check_gserver_status() {
  isOk="false"
  totalGSProc=$(pgrep -f "${GGAMESERVER_FILE}" | wc -l)
  if [ "$totalGSProc" == "${GSERVER_COUNT}" ]; then
    isOk="true"
  fi
  echo ${isOk}
}

# Task Server Checker
# Set language before run
export LANG=${LANGUAGE}
echo "${time} Global Server Checker Begin" | tee -a "${LOG_FILE}"
grelay_per_id=$(pgrep -f "${GRELAY_FILE}" | wc -l)
grouter_per_id=$(pgrep -f "${GROUTER_FILE}" | wc -l)
if [ "${grelay_per_id}" -lt 1 ] || [ "${grouter_per_id}" -lt 1 ]; then
  restart_ggateway
  sleep 10
fi

gserver_status=$(check_gserver_status)
if [ "$gserver_status" == "true" ]; then
  echo "${GSERVER_COUNT} Global Server => Ok" | tee -a "${LOG_FILE}"
  echo "${time} Global Server Checker End" | tee -a "${LOG_FILE}"
  echo "--------------------------------------------------------" | tee -a "${LOG_FILE}"
  rm -rf "${PIDFILE}"
  exit 0
else
  for ServerIndex in "${!GGAMESERVER_PORT_MAP[@]}"; do
    per_id=$(pgrep -f "${GGAMESERVER_FILE}${ServerIndex}" | wc -l)
    sleep 5
    per_id1=$(pgrep -f "${GGAMESERVER_FILE}${ServerIndex}" | wc -l)
    if [ "$per_id" -lt 1 ] && [ "$per_id1" -lt 1 ]; then
      echo "${time} Global GameServer${ServerIndex} is down, auto restart!" | tee -a "${LOG_FILE}"
      echo "${GGAMESERVER_DIR}${ServerIndex}"
      # Alias ip gameserver
      echo "${time} Alias ip global gameserver" | tee -a "${LOG_FILE}"
      sudo -u root -H sh -c "ip addr add "${GLOBAL_INTERNAL_IP_ADDRESS_MASK}.$((SERVER_COUNT+ServerIndex))/32" dev ${LAN_DEVICE}" | tee -a "${LOG_FILE}"

      # Cach 1: chay gs mac dinh
      #sudo -u root -H sh -c "cd ${GGAMESERVER_DIR}${ServerIndex} && ./${START_SERVER_FILENAME} 1>${START_LOG} 2>${START_ERROR_LOG} &"

      # Cach 4: chay gs thong qua tmux
      echo "${time} Kill screen ggs${ServerIndex}..."
      tmux kill-session -t "ggs${ServerIndex}"
      echo "${time} Start new screen ggs${ServerIndex}..."
      sudo -u root -H sh -c "tmux new-session -d -s ggs${ServerIndex} 'cd ${GGAMESERVER_DIR}${ServerIndex} && ./${START_SERVER_FILENAME}'"
      # Output: tmux new-session -d -s gs1 'cd /home/jxonline2/server/gameserver1 && ./start 1>start.log 2>start.err'

      echo "GGS ${ServerIndex} STARTED"
      sleep 10
    fi
  done
fi
rm -rf "${PIDFILE}"
echo "${time} Global Server Checker End" | tee -a "${LOG_FILE}"
echo "--------------------------------------------------------" | tee -a "${LOG_FILE}"
