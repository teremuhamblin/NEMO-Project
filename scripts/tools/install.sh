#!/usr/bin/env bash
set -e

echo "=== Installation de NEMO Ultimate Edition ==="

TARGET_ACTIONS="$HOME/.local/share/nemo/actions"
TARGET_SCRIPTS="$HOME/.local/share/nemo/scripts"

mkdir -p "$TARGET_ACTIONS" "$TARGET_SCRIPTS"

cp ultimate/actions/*.nemo_action "$TARGET_ACTIONS/"
cp ultimate/scripts/*.sh "$TARGET_SCRIPTS/"

chmod +x "$TARGET_SCRIPTS"/*.sh

echo "🎉 Installation terminée"
echo "Redémarrer Nemo : nemo -q"
