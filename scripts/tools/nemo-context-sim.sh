#!/usr/bin/env bash

echo "=== NEMO-PROJECT — Simulateur de contexte Nemo ==="
echo ""

read -p "Chemin du fichier sélectionné : " FILE
read -p "Chemin du dossier courant : " DIR

echo ""
echo "➡️ Variables Nemo simulées :"
echo "FILE=$FILE"
echo "DIR=$DIR"
echo ""

export NEMO_SELECTED_FILE="$FILE"
export NEMO_CURRENT_DIR="$DIR"

echo "Ces variables sont maintenant disponibles pour les scripts."
