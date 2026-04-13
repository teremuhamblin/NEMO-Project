#!/usr/bin/env bash

ACTIONS_DIR="actions"
SCRIPTS_DIR="scripts"

while true; do
    clear
    echo "=== NEMO-PROJECT — Testeur TUI ==="
    echo ""
    echo "Actions disponibles :"
    echo ""

    select action in $ACTIONS_DIR/*.nemo_action "Quitter"; do
        if [[ "$action" == "Quitter" ]]; then
            exit 0
        fi

        script=$(grep "Exec=" "$action" | cut -d'=' -f2)
        script_path="$SCRIPTS_DIR/$script"

        clear
        echo "=== Test de l'action : $action ==="
        echo "Script associé : $script_path"
        echo ""

        if [[ ! -f "$script_path" ]]; then
            echo "❌ Script introuvable"
            read -p "Appuyer sur Entrée..."
            break
        fi

        echo "🧪 Exécution du script..."
        bash "$script_path"
        echo ""
        read -p "Appuyer sur Entrée pour revenir au menu..."
        break
    done
done
