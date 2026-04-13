#!/usr/bin/env bash
set -e

PKG_DIR="packaging/deb"

echo "=== Construction du paquet .deb ==="

rm -rf "$PKG_DIR/usr"
mkdir -p "$PKG_DIR/usr/share/nemo/actions"
mkdir -p "$PKG_DIR/usr/share/nemo/scripts"

cp actions/*.nemo_action "$PKG_DIR/usr/share/nemo/actions/"
cp scripts/*.sh "$PKG_DIR/usr/share/nemo/scripts/"

dpkg-deb --build "$PKG_DIR" nemo-project.deb

echo "🎉 Paquet généré : nemo-project.deb"
