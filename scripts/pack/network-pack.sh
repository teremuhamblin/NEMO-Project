#!/bin/bash
set -e

CONFIG_DIR="/opt/nemo-project/config"
MODULES_FILE="$CONFIG_DIR/modules.conf"

echo "[NEMO-PROJECT] Network Pack"

sudo apt-get update
sudo apt-get install -y \
  openssh-client \
  net-tools \
  nmap

# Active le module réseau SCP
sudo sed -i 's/^scp *= *.*/scp = true/' "$MODULES_FILE"

echo "[OK] Network Pack installé et module SCP activé."
