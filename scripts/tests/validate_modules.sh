#!/usr/bin/env bash
set -e

CONFIG="config/modules.conf"
SCRIPTS_DIR="scripts"

echo "=== Validation modules.conf ==="

[[ ! -f "$CONFIG" ]] && echo "❌ modules.conf introuvable" && exit 1

errors=0

while IFS= read -r line; do
    [[ "$line" =~ ^# ]] && continue
    [[ -z "$line" ]] && continue

    module=$(echo "$line" | cut -d'=' -f1)
    state=$(echo "$line" | cut -d'=' -f2)

    echo "➡️ Module : $module ($state)"

    if [[ "$state" == "enabled" ]]; then
        script="$SCRIPTS_DIR/$module.sh"

        if [[ ! -f "$script" ]]; then
            echo "❌ Script manquant : $script"
            ((errors++))
        fi
    fi
done < "$CONFIG"

echo ""
if [[ $errors -gt 0 ]]; then
    echo "❌ $errors erreurs détectées"
    exit 1
else
    echo "🎉 modules.conf valide"
fi
