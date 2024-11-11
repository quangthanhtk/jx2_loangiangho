#!/bin/bash
# -----------------------------------------------------
# Load Variables
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$DIR/../config.sh"

LOG_FILE=${SHELL_DIR}/logs/CleanCache.log

# High RAM usage checker
CLEAR_WHEN_CACHED=1400 # in MB

# Get data in yyyy-mm-dd format
time=$(date '+%F %T')
CACHE_MEM=$(free -m | awk 'NR==2' | awk '{ print$6 }')
FREE_RAM=$(free -m | awk 'NR==2' | awk '{ print$4 }')

echo "High RAM usage checker started at ${time}" | tee -a "${LOG_FILE}"

if [ "${CACHE_MEM}" -gt ${CLEAR_WHEN_CACHED} ]; then
  NOTIFY_MESSAGE="[${time}] Error: Cache Memory is HIGH: $CACHE_MEM | Free Memory is LOW: $FREE_RAM"
  echo "$NOTIFY_MESSAGE" | tee -a "${LOG_FILE}"
  sync
  echo 1 | sudo tee /proc/sys/vm/drop_caches
  echo "Page Cache dropped | After Drop | Cache Memory: $(free -m | awk 'NR==2' | awk '{ print$6 }') | Free Memory: $(free -m | awk 'NR==2' | awk '{ print$4 }')" | tee -a "${LOG_FILE}"
  exit
else
  echo "[${time}] Info: Cache Memory is low: $CACHE_MEM | Free Memory is Normal: $FREE_RAM" | tee -a "${LOG_FILE}"
fi

echo "--------------------------------------------------------" | tee -a "${LOG_FILE}"
