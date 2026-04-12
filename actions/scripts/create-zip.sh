#!/bin/bash

TARGET="$1"
NAME=$(basename "$TARGET")
ZIP="${NAME}.zip"

zip -r "$ZIP" "$TARGET"
notify-send "Archive ZIP créée" "$ZIP"
