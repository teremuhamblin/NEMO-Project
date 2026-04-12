#!/bin/bash

FILE="$1"
libreoffice --headless --convert-to pdf "$FILE"
notify-send "Conversion PDF" "Fichier converti : $(basename "$FILE").pdf"
