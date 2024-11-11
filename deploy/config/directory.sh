# Directory Config
export APP_ROOT=/home/${DEPLOY_USER}/server

# Install Dir
export INSTALL_DIR="${APP_ROOT}/install"

# App Dir
export BACKUP_DIR="${APP_ROOT}/backup"
export UPDATE_DIR="${APP_ROOT}/update"

# Shell
export SOURCE_SHELL="../deploy"
export SHELL_DIR="${APP_ROOT}/shell"

# Source Server
export SOURCE_PAYSYS="paysys"
export SOURCE_GODDESS="goddess"
export SOURCE_BISHOP="bishop"
export SOURCE_RELAY="relay"
export SOURCE_GAMESERVER="gameserver"
export SOURCE_GRELAY="grelay"
export SOURCE_GROUTER="grouter"
export SOURCE_GGAMESERVER="ggameserver"

# Deploy Dir
export PAYSYS_DIR="${APP_ROOT}/${SOURCE_PAYSYS}"
export GODDESS_DIR="${APP_ROOT}/${SOURCE_GODDESS}"
export BISHOP_DIR="${APP_ROOT}/${SOURCE_BISHOP}"
export RELAY_DIR="${APP_ROOT}/${SOURCE_RELAY}"
export GAMESERVER_DIR="${APP_ROOT}/${SOURCE_GAMESERVER}"
export GRELAY_DIR="${APP_ROOT}/${SOURCE_GRELAY}"
export GROUTER_DIR="${APP_ROOT}/${SOURCE_GROUTER}"
export GGAMESERVER_DIR="${APP_ROOT}/${SOURCE_GGAMESERVER}"

# Deploy File
export PAYSYS_FILE="Paysys.exe"
export GODDESS_FILE="KG_Goddess"
export BISHOP_FILE="KG_Bishop"
export RELAY_FILE="SO2Relay"
export GAMESERVER_FILE="SO2GameSvr"
export GRELAY_FILE="SO2GRelay"
export GROUTER_FILE="GRouter"
export GGAMESERVER_FILE="SO2GGameSvr"

# Config file name (without extension)
export PAYSYS_CONFIG_FILE="paysys"
export GODDESS_CONFIG_FILE="KG_Goddess"
export BISHOP_CONFIG_FILE="bishop"
export RELAY_CONFIG_FILE="relay"
export GAMESERVER_CONFIG_FILE="servercfg"
export GRELAY_CONFIG_FILE="relay"
export GROUTER_CONFIG_FILE="Router"
export GGAMESERVER_CONFIG_FILE="servercfg"

export START_SERVER_FILENAME="start"
export STOP_SERVER_FILENAME="stop"

export GAMESERVER_START_PROCESS=([1]="${SOURCE_PAYSYS}" [2]="${SOURCE_GODDESS}" [3]="${SOURCE_BISHOP}" [4]="${SOURCE_RELAY}")
export GGAMESERVER_START_PROCESS=([1]="${SOURCE_GRELAY}" [2]="${SOURCE_GROUTER}")
