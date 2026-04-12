#!/bin/bash

CONFIG_DIR="/opt/nemo-project/config"

load_config() {
    local file="$1"
    local key="$2"

    grep -E "^$key" "$CONFIG_DIR/$file" | awk -F '=' '{print $2}' | xargs
}

# Exemple d'utilisation :
# PROJECT_NAME=$(load_config nemo.conf "project_name")
# ENABLE_ZIP=$(load_config preferences.conf "enable_zip")
