#!/usr/bin/env bash
# Quick helper — create a timestamped raw note and open it in $EDITOR.
#
# Usage:  ./scripts/new-raw.sh "indrox-thoughts"
#         ./scripts/new-raw.sh                    # prompts for topic

set -euo pipefail

JARVIS_HOME="${JARVIS_HOME:-$(pwd)}"
RAW_DIR="$JARVIS_HOME/vault/raw"
mkdir -p "$RAW_DIR"

TOPIC="${1:-}"
if [[ -z "$TOPIC" ]]; then
    read -rp "Topic (kebab-case): " TOPIC
fi

# Sanitize: lowercase, replace spaces with dashes, strip non-alphanumeric except dash
TOPIC=$(echo "$TOPIC" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | sed 's/[^a-z0-9-]//g')
[[ -z "$TOPIC" ]] && TOPIC="note"

FILE="$RAW_DIR/$(date '+%Y-%m-%d')_${TOPIC}.md"

if [[ ! -f "$FILE" ]]; then
    {
        echo "# $TOPIC — $(date '+%Y-%m-%d %H:%M')"
        echo ""
    } > "$FILE"
fi

echo "$FILE"
${EDITOR:-vi} "$FILE"
