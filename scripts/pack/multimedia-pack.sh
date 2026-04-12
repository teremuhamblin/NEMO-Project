#!/bin/bash
set -e

CONFIG_DIR="/opt/nemo-project/config"
MODULES_FILE="$CONFIG_DIR/modules.conf"

echo "[NEMO-PROJECT] Multimedia Pack"

sudo apt-get update
sudo apt-get install -y \
  ffmpeg \
  imagemagick \
  webp \
  jpegoptim \
  optipng

# Active les modules conversion + images
sudo sed -i 's/^webp *= *.*/webp = true/' "$MODULES_FILE"
sudo sed -i 's/^mp3 *= *.*/mp3 = true/' "$MODULES_FILE"
sudo sed -i 's/^mp4 *= *.*/mp4 = true/' "$MODULES_FILE"
sudo sed -i 's/^png *= *.*/png = true/' "$MODULES_FILE"
sudo sed -i 's/^optimize *= *.*/optimize = true/' "$MODULES_FILE"
sudo sed -i 's/^resize *= *.*/resize = true/' "$MODULES_FILE"

echo "[OK] Multimedia Pack installé et modules activés."
