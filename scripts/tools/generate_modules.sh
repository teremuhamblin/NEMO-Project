#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 nom_module"
    exit 1
fi

NAME="$1"
MODULES_CONF="config/modules.conf"
SCRIPT_FILE="scripts/$NAME.sh"
DOC_FILE="docs/modules/$NAME.md"

echo "➡️ Ajout du module dans modules.conf"
echo "$NAME=enabled" >> "$MODULES_CONF"

echo "➡️ Création du script : $SCRIPT_FILE"
cat > "$SCRIPT_FILE" <<EOF
#!/usr/bin/env bash
echo "Module $NAME exécuté avec : \$@"
EOF
chmod +x "$SCRIPT_FILE"

echo "➡️ Création de la documentation : $DOC_FILE"
mkdir -p docs/modules
cat > "$DOC_FILE" <<EOF
# Module : $NAME

## Description
Module généré automatiquement.

## Script associé
- \`scripts/$NAME.sh\`

## Activation
Défini dans \`config/modules.conf\` :
\`\`\`
$NAME=enabled
\`\`\`
EOF

echo "🎉 Module généré avec succès"
