#!/bin/bash
# -----------------------------------------------------
# Load Variables
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$DIR/../config.sh"

LOG_FILE=${SHELL_DIR}/logs/AutoUpdate.log

#KSGVN Autoupdate JX2 GS v1.0.0

time=$(date '+%F %T')
echo "[${time}] Autoupdate => Begin" | tee -a "${LOG_FILE}"
export LANG=${LANGUAGE}
echo "1. Set language to ${LANGUAGE}" | tee -a "${LOG_FILE}"
7za x "${UPDATE_FILE}" -o"${UPDATE_DIR}"/ -y
echo "2. Unzipped update patch" | tee -a "${LOG_FILE}"
rm -rf "${UPDATE_FILE}"
echo "3. Delete zip update file" | tee -a "${LOG_FILE}"
\cp -rf "${UPDATE_DIR}/${SOURCE_GODDESS}/". "${GODDESS_DIR}"
\cp -rf "${UPDATE_DIR}/${SOURCE_BISHOP}/". "${BISHOP_DIR}"
\cp -rf "${UPDATE_DIR}/${SOURCE_RELAY}/". "${RELAY_DIR}"
chmod 700 "${GODDESS_DIR:?}/${GODDESS_FILE}"
chmod 700 "${BISHOP_DIR:?}/${BISHOP_FILE}"
chmod 700 "${RELAY_DIR:?}/${RELAY_FILE}"
for ServerIndex in "${!GAMESERVER_PORT_MAP[@]}"; do
  GS_DIR=${GAMESERVER_DIR}${ServerIndex}
  ServerFileName=${GAMESERVER_FILE}${ServerIndex}
  echo "[${time}] Copy update patch to ${GS_DIR}" | tee -a "${LOG_FILE}"
  if [ -e "${UPDATE_DIR}/${SOURCE_GAMESERVER}/${GAMESERVER_FILE}" ]; then
    echo "[${time}] Found GS binary update, remove start file of ${GS_DIR}" | tee -a "${LOG_FILE}"
    rm -rf "${GS_DIR:?}/${ServerFileName}"
    cp "${UPDATE_DIR}/${SOURCE_GAMESERVER}/${GAMESERVER_FILE}" "${GS_DIR:?}/${ServerFileName}"
    chmod 700 "${GS_DIR:?}/${ServerFileName}"
  fi
  if [[ $ServerIndex -eq 1 ]]; then
    if [ -d "${UPDATE_DIR}/${SOURCE_GAMESERVER}/script" ]; then
      rm -rf "${GS_DIR}"/script
    fi
    \cp -rf "${UPDATE_DIR}/${SOURCE_GAMESERVER}"/data/. "${GS_DIR}"/data
    \cp -rf "${UPDATE_DIR}/${SOURCE_GAMESERVER}"/maps/. "${GS_DIR}"/maps
    \cp -rf "${UPDATE_DIR}/${SOURCE_GAMESERVER}"/script/. "${GS_DIR}"/script
    \cp -rf "${UPDATE_DIR}/${SOURCE_GAMESERVER}"/settings/. "${GS_DIR}"/settings
    echo "${GS_DIR} Updated!" | tee -a "${LOG_FILE}"
  fi
done

echo "Cleaning update files" | tee -a "${LOG_FILE}"
updateFiles=$(find "${UPDATE_DIR}" -type f | wc -l)
if [ "${updateFiles}" -gt 0 ]; then
  rm -rf "${UPDATE_DIR:?}"/*
fi
echo "$(date '+%F %T') Autoupdate => Finish" | tee -a "${LOG_FILE}"
