#!/bin/bash
# -----------------------------------------------------
# Load Variables
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$DIR/../config.sh"

LOG_FILE=${SHELL_DIR}/logs/ServerChecker.log

time=$(date '+%F %T')
PIDFILE=${SHELL_DIR}/task/task_server_checker.pid
if [ -f "${PIDFILE}" ]; then
  echo "${time} Another task is running" | tee -a "${LOG_FILE}"
  echo "${time} Server Checker End" | tee -a "${LOG_FILE}"
  echo "--------------------------------------------------------" | tee -a "${LOG_FILE}"
  exit 0
fi
echo $$ > "${PIDFILE}"

# Function
restart_gateway() {
  # Alias ip paysys, goddess, bishop, relay
  echo "${time} Alias ip paysys, goddess, bishop, relay" | tee -a "${LOG_FILE}"
  sudo -u root -H sh -c "ip addr add ${INTERNAL_IP}/32 dev ${LAN_DEVICE}" | tee -a "${LOG_FILE}"
  for ProcessIndex in "${!GAMESERVER_START_PROCESS[@]}"; do
    ProcessDir=${GAMESERVER_START_PROCESS[${ProcessIndex}]}
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

check_server_status() {
  isOk="false"
  totalGSProc=$(pgrep -f "${GAMESERVER_FILE}" | wc -l)
  if [ "$totalGSProc" == "${SERVER_COUNT}" ]; then
    isOk="true"
  fi
  echo ${isOk}
}

# Task Server Checker
# Set language before run
export LANG=${LANGUAGE}
echo "${time} Server Checker Begin" | tee -a "${LOG_FILE}"
pay_per_id=$(pgrep -f "${PAYSYS_FILE}" | wc -l)
gd_per_id=$(pgrep -f "${GODDESS_FILE}" | wc -l)
bs_per_id=$(pgrep -f "${BISHOP_FILE}" | wc -l)
rl_per_id=$(pgrep -f "${RELAY_FILE}" | wc -l)
if [ "${pay_per_id}" -lt 1 ] || [ "${gd_per_id}" -lt 1 ] || [ "${bs_per_id}" -lt 1 ] || [ "${rl_per_id}" -lt 1 ]; then
  restart_gateway
  sleep 10
fi

server_status=$(check_server_status)
if [ "$server_status" == "true" ]; then
  echo "${SERVER_COUNT} Server => Ok" | tee -a "${LOG_FILE}"
  echo "${time} Server Checker End" | tee -a "${LOG_FILE}"
  echo "--------------------------------------------------------" | tee -a "${LOG_FILE}"
  rm -rf "${PIDFILE}"
  exit 0
else
  for ServerIndex in "${!GAMESERVER_PORT_MAP[@]}"; do
    per_id=$(pgrep -f "${GAMESERVER_FILE}${ServerIndex}" | wc -l)
    sleep 5
    per_id1=$(pgrep -f "${GAMESERVER_FILE}${ServerIndex}" | wc -l)
    if [ "$per_id" -lt 1 ] && [ "$per_id1" -lt 1 ]; then
      echo "${time} GameServer${ServerIndex} is down, auto restart!" | tee -a "${LOG_FILE}"
      echo "${GAMESERVER_DIR}${ServerIndex}"
      # Alias ip gameserver
      echo "${time} Alias ip gameserver" | tee -a "${LOG_FILE}"
      sudo -u root -H sh -c "ip addr add "${INTERNAL_IP_ADDRESS_MASK}.${ServerIndex}/32" dev ${LAN_DEVICE}" | tee -a "${LOG_FILE}"

      # Cach 1: chay gs mac dinh
      #sudo -u root -H sh -c "cd ${GAMESERVER_DIR}${ServerIndex} && ./${START_SERVER_FILENAME} 1>${START_LOG} 2>${START_ERROR_LOG} &"

      # Cach 4: chay gs thong qua tmux
      echo "${time} Kill screen gs${ServerIndex}..."
      tmux kill-session -t "gs${ServerIndex}"
      echo "${time} Start new screen gs${ServerIndex}..."
      sudo -u root -H sh -c "tmux new-session -d -s gs${ServerIndex} 'cd ${GAMESERVER_DIR}${ServerIndex} && ./${START_SERVER_FILENAME}'"
      # Output: tmux new-session -d -s gs1 'cd /home/jxonline2/server/gameserver1 && ./start 1>start.log 2>start.err'

      echo "GS ${ServerIndex} STARTED"
      sleep 10
    fi
  done
fi
rm -rf "${PIDFILE}"
echo "${time} Server Checker End" | tee -a "${LOG_FILE}"
echo "--------------------------------------------------------" | tee -a "${LOG_FILE}"
