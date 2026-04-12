#!/bin/bash

TARGET="$1"

if [ -d "$TARGET" ]; then
    cd "$TARGET" || exit 1
fi

TERMINAL=$(command -v x-terminal-emulator || command -v gnome-terminal || command -v xfce4-terminal)

$TERMINAL &
