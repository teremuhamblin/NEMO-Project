#!/bin/bash

FILE="$1"
EXT="${FILE##*.}"

case "$EXT" in
  jpg|jpeg)
    jpegoptim --strip-all "$FILE"
    ;;
  png)
    optipng -o7 "$FILE"
    ;;
esac

notify-send "Optimisation terminée" "$(basename "$FILE")"
