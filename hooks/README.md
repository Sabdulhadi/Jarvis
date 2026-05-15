# Hooks

Shell scripts wired into Claude Code's lifecycle via `.claude/settings.json`.

| Script | Trigger | What it does |
|---|---|---|
| `session-start.sh` | `SessionStart` | Prints a one-line summary: last log date, open P1 count, top P1 task |
| `post-write.sh` | `PostToolUse` on `Write` / `Edit` | (a) marks `vault/raw/` inbox dirty when a raw note is added; (b) appends a notification to the current week's review queue when `brain/decisions.md` changes |

## Adding a new hook

1. Write the script in this folder. Keep it idempotent and silent on the happy path (no spurious stdout).
2. Make it executable: `chmod +x hooks/<name>.sh`.
3. Register it in `.claude/settings.json` under the appropriate `hooks` event.
4. Test by triggering the event manually before relying on it.

## Hook events Claude Code supports

- `SessionStart` — once per session
- `UserPromptSubmit` — every user message
- `PreToolUse` / `PostToolUse` — bracket every tool call (filter with `matcher`)
- `Stop` — when Claude finishes responding

See: https://docs.claude.com/en/docs/claude-code/hooks
