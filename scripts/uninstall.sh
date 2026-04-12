#!/bin/bash

set -e

echo "[NEMO-PROJECT] Désinstallation..."

sudo rm -rf /opt/nemo-project
rm -f ~/.local/share/nemo/actions/*.nemo_action

echo "[OK] Désinstallation complète."
