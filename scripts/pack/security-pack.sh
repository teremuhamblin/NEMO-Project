#!/bin/bash
set -e

CONFIG_DIR="/opt/nemo-project/config"
MODULES_FILE="$CONFIG_DIR/modules.conf"

echo "[NEMO-PROJECT] Security Pack"

sudo apt-get update
sudo apt-get install -y \
  gnupg \
  exiftool \
  coreutils \
  xclip

# Active les modules sécurité dans modules.conf
sudo sed -i 's/^secure_delete *= *.*/secure_delete = true/' "$MODULES_FILE"
sudo sed -i 's/^sha256 *= *.*/sha256 = true/' "$MODULES_FILE"
sudo sed -i 's/^md5 *= *.*/md5 = true/' "$MODULES_FILE"
sudo sed -i 's/^gpg *= *.*/gpg = true/' "$MODULES_FILE"

echo "[OK] Security Pack installé et modules activés."
