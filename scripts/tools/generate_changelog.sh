#!/usr/bin/env bash

LAST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
NEW_TAG="$1"

if [[ -z "$NEW_TAG" ]]; then
    echo "Usage: $0 vX.Y.Z"
    exit 1
fi

echo "=== Génération du changelog ==="
echo "Dernier tag : $LAST_TAG"
echo "Nouveau tag : $NEW_TAG"
echo ""

echo "# Changelog $NEW_TAG" > CHANGELOG.md
echo "" >> CHANGELOG.md

git log "$LAST_TAG"..HEAD --pretty=format:"- %s" >> CHANGELOG.md

echo ""
echo "🎉 Changelog généré dans CHANGELOG.md"
