#!/usr/bin/env bash
set -e

echo "=== Désinstallation de NEMO Ultimate Edition ==="

TARGET_ACTIONS="$HOME/.local/share/nemo/actions"
TARGET_SCRIPTS="$HOME/.local/share/nemo/scripts"

for f in ultimate/actions/*.nemo_action; do
    rm -f "$TARGET_ACTIONS/$(basename "$f")"
done

for f in ultimate/scripts/*.sh; do
    rm -f "$TARGET_SCRIPTS/$(basename "$f")"
done

echo "🎉 Désinstallation terminée"
echo "Redémarrer Nemo : nemo -q"
