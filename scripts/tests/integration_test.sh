#!/usr/bin/env bash
set -e

echo "=== NEMO-PROJECT — Test d'intégration complet ==="

echo ""
echo "➡️ Test des actions"
./tests/test_actions.sh

echo ""
echo "➡️ Validation modules.conf"
./tests/validate_modules.sh

echo ""
echo "➡️ Vérification des permissions"
find scripts -type f ! -perm -111 -exec chmod +x {} \;

echo ""
echo "➡️ Vérification de la structure"
[[ ! -d actions ]] && echo "❌ Dossier actions manquant" && exit 1
[[ ! -d scripts ]] && echo "❌ Dossier scripts manquant" && exit 1
[[ ! -d config ]] && echo "❌ Dossier config manquant" && exit 1

echo ""
echo "🎉 Tous les tests d'intégration sont validés"
