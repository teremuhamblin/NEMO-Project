#!/bin/bash

FILE="$1"

if command -v shred >/dev/null 2>&1; then
    shred -u -z "$FILE"
    notify-send "Suppression sécurisée" "Fichier détruit."
else
    rm -f "$FILE"
    notify-send "Suppression simple" "shred non disponible."
fi
