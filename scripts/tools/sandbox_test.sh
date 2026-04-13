#!/usr/bin/env bash
set -e

ACTIONS_DIR="actions"
SCRIPTS_DIR="scripts"
SANDBOX="/tmp/nemo-sandbox"

mkdir -p "$SANDBOX"

echo "=== NEMO-PROJECT — Sandbox Test ==="
echo "Sandbox : $SANDBOX"
echo ""

select action in $ACTIONS_DIR/*.nemo_action "Quitter"; do
    [[ "$action" == "Quitter" ]] && exit 0

    script=$(grep "^Exec=" "$action" | cut -d'=' -f2)
    script_path="$SCRIPTS_DIR/$script"

    echo "➡️ Action : $action"
    echo "➡️ Script : $script_path"
    echo ""

    if [[ ! -f "$script_path" ]]; then
        echo "❌ Script introuvable"
        exit 1
    fi

    echo "🧪 Exécution dans la sandbox..."
    cp -r test-data/* "$SANDBOX" 2>/dev/null || true
    (cd "$SANDBOX" && bash "$script_path" testfile.txt)

    echo ""
    read -p "Appuyer sur Entrée pour continuer..."
done
