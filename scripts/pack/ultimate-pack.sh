#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[NEMO-PROJECT] Ultimate Pack"

bash "$SCRIPT_DIR/security-pack.sh"
bash "$SCRIPT_DIR/multimedia-pack.sh"
bash "$SCRIPT_DIR/dev-pack.sh"
bash "$SCRIPT_DIR/network-pack.sh"

echo "[OK] Ultimate Pack : tous les packs installés."
