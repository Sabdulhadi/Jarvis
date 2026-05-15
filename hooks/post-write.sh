#!/usr/bin/env bash
# JARVIS — PostToolUse hook for Write/Edit
# Two jobs:
# 1. If a file under vault/raw/ was written, mark the inbox dirty so the next
#    /process-inbox or the periodic librarian sweep picks it up.
# 2. If brain/decisions.md was edited, append a notification line to the current
#    week's review-queue file so /review surfaces it.

set -euo pipefail

JARVIS_HOME="${JARVIS_HOME:-$(pwd)}"

# Read tool input from stdin (Claude Code passes a JSON blob)
INPUT=$(cat || echo '{}')

# Extract the file_path from the tool_input. Fall back gracefully if jq is missing.
if command -v jq >/dev/null 2>&1; then
    FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
else
    FILE_PATH=$(echo "$INPUT" | sed -n 's/.*"file_path"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
fi

[[ -z "${FILE_PATH:-}" ]] && exit 0

# Normalize: strip JARVIS_HOME prefix if present
REL_PATH="${FILE_PATH#$JARVIS_HOME/}"

# Inbox dirty marker
if [[ "$REL_PATH" == vault/raw/* ]] && [[ "$REL_PATH" != vault/raw/processed/* ]]; then
    mkdir -p "$JARVIS_HOME/vault/raw/.inbox"
    touch "$JARVIS_HOME/vault/raw/.inbox/dirty"
fi

# Decision review-queue notification
if [[ "$REL_PATH" == "brain/decisions.md" ]]; then
    WEEK_FILE="$JARVIS_HOME/logs/.review-queue-$(date '+%Y-W%V').md"
    echo "- $(date '+%Y-%m-%d %H:%M') — decisions.md updated" >> "$WEEK_FILE"
fi

exit 0
