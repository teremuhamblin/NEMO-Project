#!/usr/bin/env bash
set -e

ACTIONS_DIR="actions"
SCRIPTS_DIR="scripts"

echo "=== NEMO-PROJECT — Test des actions Nemo ==="

# Vérifier que les dossiers existent
[[ ! -d "$ACTIONS_DIR" ]] && echo "❌ Dossier actions/ introuvable" && exit 1
[[ ! -d "$SCRIPTS_DIR" ]] && echo "❌ Dossier scripts/ introuvable" && exit 1

errors=0

for action in $ACTIONS_DIR/*.nemo_action; do
    echo ""
    echo "➡️  Test de l'action : $action"

    # Vérifier que le fichier existe
    [[ ! -f "$action" ]] && echo "❌ Fichier introuvable" && ((errors++)) && continue

    # Vérifier la présence du script associé
    script=$(grep "Exec=" "$action" | cut -d'=' -f2)

    if [[ -z "$script" ]]; then
        echo "❌ Aucun script Exec= trouvé"
        ((errors++))
        continue
    fi

    script_path="$SCRIPTS_DIR/$script"

    if [[ ! -f "$script_path" ]]; then
        echo "❌ Script manquant : $script_path"
        ((errors++))
        continue
    fi

    # Vérifier les permissions
    if [[ ! -x "$script_path" ]]; then
        echo "⚠️  Script non exécutable — correction automatique"
        chmod +x "$script_path"
    fi

    # Test d'exécution à blanc
    echo "🧪 Exécution du script en mode test"
    bash -n "$script_path" || { echo "❌ Erreur de syntaxe dans $script_path"; ((errors++)); continue; }

    echo "✅ Action OK"
done

echo ""
if [[ $errors -gt 0 ]]; then
    echo "❌ $errors erreurs détectées"
    exit 1
else
    echo "🎉 Tous les tests sont passés avec succès"
fi
