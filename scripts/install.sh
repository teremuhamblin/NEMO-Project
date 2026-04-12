#!/bin/bash

set -e

echo "[NEMO-PROJECT] Installation..."

INSTALL_DIR="/opt/nemo-project"
ACTIONS_DIR="$HOME/.local/share/nemo/actions"

sudo mkdir -p "$INSTALL_DIR"
sudo cp -r actions "$INSTALL_DIR/"
sudo cp -r config "$INSTALL_DIR/"
sudo cp -r scripts "$INSTALL_DIR/"

mkdir -p "$ACTIONS_DIR"
cp actions/*.nemo_action "$ACTIONS_DIR/"

echo "[OK] Installation terminée."
