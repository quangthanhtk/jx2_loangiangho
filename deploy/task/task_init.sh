#!/bin/bash
# -----------------------------------------------------
# Load Variables
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$DIR/../config.sh"

# -----------------------------------------------------
# Change timezone
sudo cp /etc/localtime /root/old.timezone
sudo rm -rf /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
sudo localectl set-locale LANG="${LANGUAGE}"

# -----------------------------------------------------
# Create user
sudo adduser "${DEPLOY_USER}"
sudo mkhomedir_helper "${DEPLOY_USER}"
sudo usermod -aG wheel "${DEPLOY_USER}"

sudo chown "${USER}":wheel -R /home/"${DEPLOY_USER}"

# -----------------------------------------------------
# Create Swap File
echo "Create Swap file ${SWAPFILE_SIZE}" | tee -a "${LOG_FILE}"
sudo fallocate -l "${SWAPFILE_SIZE}" /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
