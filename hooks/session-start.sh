#!/usr/bin/env bash
# JARVIS — SessionStart hook
# Prints a one-line summary at the top of each session: last log date,
# open P1 task count, top P1.

set -euo pipefail

JARVIS_HOME="${JARVIS_HOME:-$(pwd)}"
TASKS="$JARVIS_HOME/brain/tasks.md"
LOGS_DIR="$JARVIS_HOME/logs"

# Last session date — derive from most recent log file mtime
if [[ -d "$LOGS_DIR" ]] && compgen -G "$LOGS_DIR/*.md" > /dev/null; then
    LAST_LOG=$(ls -1t "$LOGS_DIR"/*.md 2>/dev/null | head -n1)
    LAST_DATE=$(date -r "$LAST_LOG" '+%Y-%m-%d' 2>/dev/null || echo "unknown")
else
    LAST_DATE="never"
fi

# P1 count and top P1
if [[ -f "$TASKS" ]]; then
    P1_COUNT=$(grep -c '^\- \[ \] \[P1\]' "$TASKS" 2>/dev/null || echo 0)
    TOP_P1=$(grep -m1 '^\- \[ \] \[P1\]' "$TASKS" 2>/dev/null | sed 's/^\- \[ \] \[P1\] //' | cut -c1-80 || echo "none")
else
    P1_COUNT=0
    TOP_P1="(tasks.md missing)"
fi

echo "JARVIS — Last session: $LAST_DATE | Open P1: $P1_COUNT | Top: $TOP_P1"
