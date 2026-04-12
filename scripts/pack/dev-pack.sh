#!/bin/bash
set -e

CONFIG_DIR="/opt/nemo-project/config"
MODULES_FILE="$CONFIG_DIR/modules.conf"

echo "[NEMO-PROJECT] Dev Pack"

sudo apt-get update
sudo apt-get install -y \
  git \
  build-essential \
  shellcheck \
  vim \
  curl

# Ici tu peux plus tard ajouter des modules dev spécifiques
echo "[OK] Dev Pack installé (outils développeur)."
