#!/bin/bash

FILE="$1"
SUM=$(sha256sum "$FILE" | awk '{print $1}')

echo "$SUM" | xclip -selection clipboard
notify-send "SHA256 copié" "$SUM"
