#!/bin/bash
# -----------------------------------------------------
# Load Variables
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$DIR/../config.sh"

LOG_FILE=${SHELL_DIR}/logs/task_stop_gameserver.log

export LANG=wa_BE.iso885915@euro
time=$(date '+%F %T')

WAIT_TIME=10
GSIndex=all
if [ -n "$1" ] && [ "$1" -ge 0 ] && [ "$1" -le 5 ]; then
  GSIndex=$1
fi

if [[  ${SETUP_GLOBAL_SERVER} == 1 ]]; then
  cd "${GROUTER_DIR}" && ./"${GROUTER_FILE}" send-msg-to-gs close-game-server all "B¶o tr× m¸y chñ!"
fi

for ((i = WAIT_TIME; i != 0; i--)); do
  cd "${BISHOP_DIR}" && ./"${BISHOP_FILE}" send-msg-to-gs to-players "${GSIndex}" "M¸y chñ sÏ tiÕn hµnh b¶o tr× trong ${i} phót n÷a"
  echo "M¸y chñ sÏ tiÕn hµnh b¶o tr× trong ${i} phót n÷a"
  sleep 1m
done

cd "${BISHOP_DIR}" && ./"${BISHOP_FILE}" send-msg-to-gs close-game-server "${GSIndex}" "B¶o tr× m¸y chñ!"
sleep 20
time=$(date '+%F %T')
echo "${time} GameServer ${GSIndex} stopped!"

stop_ggateway() {
  for ProcessIndex in "${!GGAMESERVER_START_PROCESS[@]}"; do
    ProcessDir=${GGAMESERVER_START_PROCESS[${ProcessIndex}]}
    cd "${APP_ROOT}/${ProcessDir}" && ./"${STOP_SERVER_FILENAME}" 1>"${STOP_LOG}" 2>"${STOP_ERROR_LOG}"
    echo "${time} ${ProcessDir} => Stopped" | tee -a "${LOG_FILE}"
    echo "${time} Kill screen ${ProcessDir}..."
    tmux kill-session -t "${ProcessDir}"
    sleep 5
  done
}

stop_gateway() {
  for ProcessIndex in "${!GAMESERVER_START_PROCESS[@]}"; do
    ProcessDir=${GAMESERVER_START_PROCESS[${ProcessIndex}]}
    cd "${APP_ROOT}/${ProcessDir}" && ./"${STOP_SERVER_FILENAME}" 1>"${STOP_LOG}" 2>"${STOP_ERROR_LOG}"
    echo "${time} ${ProcessDir} => Stopped" | tee -a "${LOG_FILE}"
    echo "${time} Kill screen ${ProcessDir}..."
    tmux kill-session -t "${ProcessDir}"
    sleep 5
  done
}

if [ "${GSIndex}" == "all" ]; then
  if [[  ${SETUP_GLOBAL_SERVER} == 1 ]]; then
    stop_ggateway
    echo "${time} Global Gateway Server stopped!"
  fi
  stop_gateway
  echo "${time} Gateway Server stopped!"
fi
