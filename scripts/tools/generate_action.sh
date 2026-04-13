#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 nom_action"
    exit 1
fi

NAME="$1"
ACTION_FILE="actions/$NAME.nemo_action"
SCRIPT_FILE="scripts/$NAME.sh"

echo "➡️ Génération de l'action : $ACTION_FILE"
echo "➡️ Génération du script : $SCRIPT_FILE"

cat > "$ACTION_FILE" <<EOF
[Nemo Action]
Name=$NAME
Comment=Action générée automatiquement
Exec=$NAME.sh %F
Icon=utilities-terminal
Selection=Any
Extensions=any;
EOF

cat > "$SCRIPT_FILE" <<EOF
#!/usr/bin/env bash
echo "Action $NAME exécutée avec : \$@"
EOF

chmod +x "$SCRIPT_FILE"

echo "🎉 Action générée avec succès"
