#!/bin/bash
# Load Variables
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$DIR/../config.sh"

# -----------------------------------------------------
# Process Source File
if [ ! -f "${SOURCE_FILE}" ]; then
  echo "Source File: ${SOURCE_FILE} -> Not found. Exit installer." | tee -a "${LOG_FILE}"
  exit
fi
# Create install directory
mkdir -p "${INSTALL_DIR}"

# Unzip source to install folder
export LANG=${LANGUAGE}
7za x "${SOURCE_FILE}" -o"${INSTALL_DIR}"/ -y
echo "Source File: [${SOURCE_FILE}] -> Unzipped to [${INSTALL_DIR}]." | tee -a "${LOG_FILE}"

# Copy Shell to App
echo "Deploy Shell: [${SOURCE_SHELL}] -> copy to [ ${SHELL_DIR}]" | tee -a "${LOG_FILE}"
cp -rf "${SOURCE_SHELL}" "${SHELL_DIR}"
mkdir -p "${SHELL_DIR}/logs"

# -----------------------------------------------------
# Create APP Directory
echo "Create Application Directory" | tee -a "${LOG_FILE}"

# Create Dir for backup and update
mkdir -p "${BACKUP_DIR}"
mkdir -p "${UPDATE_DIR}"

# Create Deploy Dir
createDeployDir()
{
  SourceName=$1
  SourceDeployPath=$2
  # create deploy dir
  mkdir -p "${SourceDeployPath}"
  echo "${SourceDeployPath} -> Created." | tee -a "${LOG_FILE}"
  # Copy Source File
  echo "Copy source [${INSTALL_DIR}/server/${SourceName}] to [${SourceDeployPath}]" | tee -a "${LOG_FILE}"
  cp -a "${INSTALL_DIR}/server/${SourceName}"/. "${SourceDeployPath}"/
}

echo "Copy source to deploy dir -> Begin." | tee -a "${LOG_FILE}"
createDeployDir "${SOURCE_PAYSYS}" "${PAYSYS_DIR}"
createDeployDir "${SOURCE_GODDESS}" "${GODDESS_DIR}"
createDeployDir "${SOURCE_BISHOP}" "${BISHOP_DIR}"
createDeployDir "${SOURCE_RELAY}" "${RELAY_DIR}"
createDeployDir "${SOURCE_GAMESERVER}" "${GAMESERVER_DIR}"
if [[  ${SETUP_GLOBAL_SERVER} == 1 ]]; then
  createDeployDir "${SOURCE_GRELAY}" "${GRELAY_DIR}"
  createDeployDir "${SOURCE_GROUTER}" "${GROUTER_DIR}"
  createDeployDir "${SOURCE_GGAMESERVER}" "${GGAMESERVER_DIR}"
fi

# =======================================================
echo "Start Auto config Common Server." | tee -a "${LOG_FILE}"
configCommonServer()
{
  SourceName=$1
  ServerFileName=$2
  ServerConfigFileName=$3
  ConfigFileNamePrefix=$4
  # create deploy dir
  echo "[${SourceName}] Generate config file." | tee -a "${LOG_FILE}"
  source "${SHELL_DIR}/config/${ConfigFileNamePrefix}${ServerConfigFileName}.sh"
  echo -e "${SERVER_CONFIG}" >"${APP_ROOT}/${SourceName}/${ServerConfigFileName}.ini"
  echo "[${SourceName}] ${APP_ROOT}/${SourceName}/${ServerConfigFileName}.ini => Created" | tee -a "${LOG_FILE}"

  echo "[${SourceName}] Generate start file." | tee -a "${LOG_FILE}"
  export GDB_FILE=${ServerFileName}
  export GDB_PORT="100"
  source "${SHELL_DIR}/config/gdb.sh"
  echo -e "${GDB_CONFIG}" >"${APP_ROOT}/${SourceName}/gdb.ini"

  if [ "${SourceName}" == "${SOURCE_PAYSYS}" ]; then
    # Cach 1: chay an mac dinh
    #echo -e "export LANG=${LANGUAGE}\nkillall -9 ${ServerFileName}\nwine ${ServerFileName} &" >"${APP_ROOT}/${SourceName}/${START_SERVER_FILENAME}"
    # Cach 4: chay tmux
    echo -e "export LANG=${LANGUAGE}\nwine ${ServerFileName}" >"${APP_ROOT}/${SourceName}/${START_SERVER_FILENAME}"

    # Stop 1-2-3-4
    echo -e "export LANG=${LANGUAGE}\nkillall -9 ${ServerFileName}" >"${APP_ROOT}/${SourceName}/${STOP_SERVER_FILENAME}"
  else
    # Cach 1: chay an mac dinh
    #echo -e "export LANG=${LANGUAGE}\nkillall -9 ${ServerFileName}\n./${ServerFileName} start --daemon" >"${APP_ROOT}/${SourceName}/${START_SERVER_FILENAME}"
    # Cach 2: chay bang file truc tiep
    #echo -e "export LANG=${LANGUAGE}\nkillall -9 ${ServerFileName}\n./${ServerFileName}" >"${APP_ROOT}/${SourceName}/${START_SERVER_FILENAME}"
    # Cach 3: chay bang gdb
    #echo -e "export LANG=${LANGUAGE}\ngdb -x gdb.ini" >"${APP_ROOT}/${SourceName}/${START_SERVER_FILENAME}"
    # Cach 4: chay tmux
    echo -e "export LANG=${LANGUAGE}\n./${ServerFileName}" >"${APP_ROOT}/${SourceName}/${START_SERVER_FILENAME}"

    # Stop 1-2-3-4
    echo -e "export LANG=${LANGUAGE}\n./${ServerFileName} stop" >"${APP_ROOT}/${SourceName}/${STOP_SERVER_FILENAME}"
  fi

  echo "[${SourceName}] Grant file permission"
  chmod 0700 "${APP_ROOT}/${SourceName}/${ServerFileName}"
  chmod 0700 "${APP_ROOT}/${SourceName}/${START_SERVER_FILENAME}"
  chmod 0700 "${APP_ROOT}/${SourceName}/${STOP_SERVER_FILENAME}"
}

configCommonServer "${SOURCE_PAYSYS}" "${PAYSYS_FILE}" "${PAYSYS_CONFIG_FILE}"
configCommonServer "${SOURCE_GODDESS}" "${GODDESS_FILE}" "${GODDESS_CONFIG_FILE}"
configCommonServer "${SOURCE_BISHOP}" "${BISHOP_FILE}" "${BISHOP_CONFIG_FILE}"
configCommonServer "${SOURCE_RELAY}" "${RELAY_FILE}" "${RELAY_CONFIG_FILE}"
if [[  ${SETUP_GLOBAL_SERVER} == 1 ]]; then
  configCommonServer "${SOURCE_GRELAY}" "${GRELAY_FILE}" "${GRELAY_CONFIG_FILE}" "g_"
  configCommonServer "${SOURCE_GROUTER}" "${GROUTER_FILE}" "${GROUTER_CONFIG_FILE}" "g_"
fi

configCommonExtend()
{
  echo "[${SOURCE_GODDESS}] Generate KGD_MySQLBackup file." | tee -a "${LOG_FILE}"
  source "${SHELL_DIR}/config/KGD_MySQLBackup.sh"
  echo -e "${KGD_BACKUP_CONFIG}" >"${APP_ROOT}/${SOURCE_GODDESS}/KGD_MySQLBackup.ini"

  echo "[${SOURCE_GODDESS}] Generate KG_StatGameData file." | tee -a "${LOG_FILE}"
  source "${SHELL_DIR}/config/KG_StatGameData.sh"
  echo -e "${KG_STATGAMEDATA_CONFIG}" >"${APP_ROOT}/${SOURCE_GODDESS}/KG_StatGameData.ini"

  echo "[${SOURCE_GODDESS}] Generate KG_RoleAdmin file." | tee -a "${LOG_FILE}"
  source "${SHELL_DIR}/config/KG_RoleAdmin.sh"
  echo -e "${KG_ROLEADMIN_CONFIG}" >"${APP_ROOT}/${SOURCE_GODDESS}/KG_RoleAdmin.ini"

  echo "[${SOURCE_GODDESS}] Grant Goddess file permission"
  chmod 0700 "${APP_ROOT}/${SOURCE_GODDESS}/KGD_MySQLBackup"
  chmod 0700 "${APP_ROOT}/${SOURCE_GODDESS}/KG_StatGameData"
  chmod 0700 "${APP_ROOT}/${SOURCE_GODDESS}/kg_roleadmin"

  echo "[${SOURCE_BISHOP}] Grant Bishop file permission"
  chmod 0700 "${APP_ROOT}/${SOURCE_BISHOP}/stopGS"
  chmod 0700 "${APP_ROOT}/${SOURCE_BISHOP}/stopGS1"
  chmod 0700 "${APP_ROOT}/${SOURCE_BISHOP}/stopGS5"

  echo "[${SOURCE_GROUTER}] Grant GRouter file permission"
  chmod 0700 "${APP_ROOT}/${SOURCE_GROUTER}/stopGS"
}
configCommonExtend

# -----------------------------------------------------
# Config Game Server
echo "Start Auto config GameServer" | tee -a "${LOG_FILE}"
for ServerIndex in "${!GAMESERVER_PORT_MAP[@]}"; do
  ServerPort=${GAMESERVER_PORT_MAP[${ServerIndex}]}
  GS_DIR=${GAMESERVER_DIR}${ServerIndex}
  echo "[${GS_DIR}] => Folder Created" | tee -a "${LOG_FILE}"
  mkdir -p "${GS_DIR}"

  if [[ ${ServerIndex} -eq 1 ]]; then
    echo "[${GS_DIR}] Copy files from source dir: [${GAMESERVER_DIR}]" | tee -a "${LOG_FILE}"
    cp -af "${GAMESERVER_DIR}"/. "${GS_DIR}"/
    mv "${GS_DIR}/${GAMESERVER_FILE}" "${GS_DIR}/${GAMESERVER_FILE}${ServerIndex}"
    7za x "${GS_DIR}/gameserver.7z" -o"${GS_DIR}"/ -y
    7za x "${GS_DIR}/shared.7z" -o"${GS_DIR}"/ -y
  else
    echo "[${GS_DIR}] Link files from source1 dir: [${GAMESERVER_DIR}1]" | tee -a "${LOG_FILE}"
    ln -sf "${GAMESERVER_DIR}1/startlog" "${GS_DIR}/startlog"
    ln -sf "${GAMESERVER_DIR}1/settings" "${GS_DIR}/settings"
    ln -sf "${GAMESERVER_DIR}1/script" "${GS_DIR}/script"
    ln -sf "${GAMESERVER_DIR}1/maps" "${GS_DIR}/maps"
    ln -sf "${GAMESERVER_DIR}1/logs" "${GS_DIR}/logs"
    ln -sf "${GAMESERVER_DIR}1/data" "${GS_DIR}/data"
    ln -sf "${GAMESERVER_DIR}1/_GAMESVR_LOG_" "${GS_DIR}/_GAMESVR_LOG_"
    ln -sf "${GAMESERVER_DIR}1/version.ini" "${GS_DIR}/version.ini"
    ln -sf "${GAMESERVER_DIR}1/verify_up2date_ver.ini" "${GS_DIR}/verify_up2date_ver.ini"
    ln -sf "${GAMESERVER_DIR}1/verify_up2date_list.txt" "${GS_DIR}/verify_up2date_list.txt"
    ln -sf "${GAMESERVER_DIR}1/verify_up2date" "${GS_DIR}/verify_up2date"
    ln -sf "${GAMESERVER_DIR}1/server_package.ini" "${GS_DIR}/server_package.ini"
    cp -af "${GAMESERVER_DIR}1/${GAMESERVER_FILE}1" "${GS_DIR}/${GAMESERVER_FILE}${ServerIndex}"
  fi

  echo "[${GS_DIR}] Generate config file." | tee -a "${LOG_FILE}"
  source "${SHELL_DIR}/config/${GAMESERVER_CONFIG_FILE}.sh"
  echo -e "${SERVER_CONFIG}" >"${GS_DIR}/${GAMESERVER_CONFIG_FILE}.ini"
  echo "${GS_DIR}/${GAMESERVER_CONFIG_FILE}.ini => Saved" | tee -a "${LOG_FILE}"

  ServerFileName=${GAMESERVER_FILE}${ServerIndex}
  echo "${GS_DIR} Create start file." | tee -a "${LOG_FILE}"
  export GDB_FILE="${ServerFileName}"
  export GDB_PORT="${ServerPort}"
  source "${SHELL_DIR}/config/gdb.sh"
  echo "${GDB_CONFIG}" >"${GS_DIR}/gdb.ini"

  # Cach 1: chay an mac dinh
  #  echo -e "export LANG=${LANGUAGE}\nkillall -9 ${ServerFileName}\n./${ServerFileName} ${ServerPort}" >"${GS_DIR}/${START_SERVER_FILENAME}"
  # Cach 3: chay bang gdb
  echo -e "export LANG=${LANGUAGE}\ngdb -x gdb.ini" >"${GS_DIR}/${START_SERVER_FILENAME}"

  chmod 0700 "${GS_DIR}/${ServerFileName}"
  chmod 0700 "${GS_DIR}/${START_SERVER_FILENAME}"
  echo "${GS_DIR} => Task Done" | tee -a "${LOG_FILE}"
done

if [[  ${SETUP_GLOBAL_SERVER} == 1 ]]; then
  # -----------------------------------------------------
  # Config Global Game Server
  echo "Start Auto config Global GameServer" | tee -a "${LOG_FILE}"
  for ServerIndex in "${!GGAMESERVER_PORT_MAP[@]}"; do
    ServerPort=${GGAMESERVER_PORT_MAP[${ServerIndex}]}
    GS_DIR=${GGAMESERVER_DIR}${ServerIndex}
    echo "[${GS_DIR}] => Folder Created" | tee -a "${LOG_FILE}"
    mkdir -p "${GS_DIR}"

    if [[ ${ServerIndex} -eq 1 ]]; then
      echo "[${GS_DIR}] Copy files from source dir: [${GGAMESERVER_DIR}]" | tee -a "${LOG_FILE}"
      cp -af "${GGAMESERVER_DIR}"/. "${GS_DIR}"/
      mv "${GS_DIR}/${GGAMESERVER_FILE}" "${GS_DIR}/${GGAMESERVER_FILE}${ServerIndex}"
      7za x "${GS_DIR}/gameserver.7z" -o"${GS_DIR}"/ -y
      7za x "${GS_DIR}/shared.7z" -o"${GS_DIR}"/ -y
    else
      echo "[${GS_DIR}] Link files from source1 dir: [${GGAMESERVER_DIR}1]" | tee -a "${LOG_FILE}"
      ln -sf "${GGAMESERVER_DIR}1/startlog" "${GS_DIR}/startlog"
      ln -sf "${GGAMESERVER_DIR}1/settings" "${GS_DIR}/settings"
      ln -sf "${GGAMESERVER_DIR}1/script" "${GS_DIR}/script"
      ln -sf "${GGAMESERVER_DIR}1/maps" "${GS_DIR}/maps"
      ln -sf "${GGAMESERVER_DIR}1/logs" "${GS_DIR}/logs"
      ln -sf "${GGAMESERVER_DIR}1/data" "${GS_DIR}/data"
      ln -sf "${GGAMESERVER_DIR}1/_GAMESVR_LOG_" "${GS_DIR}/_GAMESVR_LOG_"
      ln -sf "${GGAMESERVER_DIR}1/version.ini" "${GS_DIR}/version.ini"
      ln -sf "${GGAMESERVER_DIR}1/verify_up2date_ver.ini" "${GS_DIR}/verify_up2date_ver.ini"
      ln -sf "${GGAMESERVER_DIR}1/verify_up2date_list.txt" "${GS_DIR}/verify_up2date_list.txt"
      ln -sf "${GGAMESERVER_DIR}1/verify_up2date" "${GS_DIR}/verify_up2date"
      ln -sf "${GGAMESERVER_DIR}1/server_package.ini" "${GS_DIR}/server_package.ini"
      cp -af "${GGAMESERVER_DIR}1/${GGAMESERVER_FILE}1" "${GS_DIR}/${GGAMESERVER_FILE}${ServerIndex}"
    fi

    echo "[${GS_DIR}] Generate config file." | tee -a "${LOG_FILE}"
    source "${SHELL_DIR}/config/g_${GGAMESERVER_CONFIG_FILE}.sh"
    echo -e "${SERVER_CONFIG}" >"${GS_DIR}/${GGAMESERVER_CONFIG_FILE}.ini"
    echo "${GS_DIR}/${GGAMESERVER_CONFIG_FILE}.ini => Saved" | tee -a "${LOG_FILE}"

    ServerFileName=${GGAMESERVER_FILE}${ServerIndex}
    echo "${GS_DIR} Create start file." | tee -a "${LOG_FILE}"
    export GDB_FILE="${ServerFileName}"
    export GDB_PORT="${ServerPort}"
    source "${SHELL_DIR}/config/gdb.sh"
    echo "${GDB_CONFIG}" >"${GS_DIR}/gdb.ini"

    # Cach 1: chay an mac dinh
    #  echo -e "export LANG=${LANGUAGE}\nkillall -9 ${ServerFileName}\n./${ServerFileName} ${ServerPort}" >"${GS_DIR}/${START_SERVER_FILENAME}"
    # Cach 3: chay bang gdb
    echo -e "export LANG=${LANGUAGE}\ngdb -x gdb.ini" >"${GS_DIR}/${START_SERVER_FILENAME}"

    chmod 0700 "${GS_DIR}/${ServerFileName}"
    chmod 0700 "${GS_DIR}/${START_SERVER_FILENAME}"
    echo "${GS_DIR} => Task Done" | tee -a "${LOG_FILE}"
  done
fi