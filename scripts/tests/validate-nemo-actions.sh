#!/usr/bin/env bash
set -e

ACTIONS_DIR="actions"
errors=0

echo "=== Validation syntaxique des fichiers .nemo_action ==="

for file in $ACTIONS_DIR/*.nemo_action; do
    echo ""
    echo "➡️ Vérification : $file"

    # Champs obligatoires
    for field in Name Comment Exec Icon Selection Extensions; do
        if ! grep -q "^$field=" "$file"; then
            echo "❌ Champ manquant : $field"
            ((errors++))
        fi
    done

    # Vérification Exec=
    exec_line=$(grep "^Exec=" "$file" | cut -d'=' -f2)
    if [[ -z "$exec_line" ]]; then
        echo "❌ Exec= vide"
        ((errors++))
    fi

    # Vérification Extensions=
    if ! grep -q "^Extensions=.*;" "$file"; then
        echo "⚠️ Extensions ne se termine pas par un ;"
    fi

    echo "✅ Syntaxe OK"
done

echo ""
if [[ $errors -gt 0 ]]; then
    echo "❌ $errors erreurs détectées"
    exit 1
else
    echo "🎉 Tous les fichiers .nemo_action sont valides"
fi
