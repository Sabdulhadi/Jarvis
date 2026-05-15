# JARVIS

Syed Abdul Hadi's personal AI operating system. A file-system-native second brain + agentic chief of staff, run through Claude Code.

## What this is

Five layers, mapped to the agentic AI stack:

| Layer | Implementation |
|---|---|
| GPT | Claude (via Claude Code) |
| LLMs | This context window + the `brain/` files |
| AI Agents | Subagents in `agents/` |
| Agentic Systems | Slash commands in `commands/` that orchestrate subagents |
| Agentic Infra | File system, hooks, logs, MCP servers |

## How to use it

1. **Talk to JARVIS.** Open Claude Code in this directory. It auto-reads `CLAUDE.md` and grounds itself.
2. **Drop anything into `vault/raw/`.** Voice notes, screenshots, articles, half-formed thoughts. The `second-brain-librarian` will file it.
3. **Use slash commands** for routine workflows — `/standup`, `/review`, `/draft`, `/decide`.
4. **Trust agents.** When you ask about INDROX, the `indrox-cofounder` shows up. When you draft an INPI letter, the `legal-paralegal` writes it. You don't summon them by name — Claude routes.

## Daily rhythm

- **Morning:** `/standup` → top 3 today, blockers, one strategic question
- **As things happen:** `/log <entry>` to append; drop notes into `vault/raw/`
- **Evening:** `/process-inbox` to file the day's raw dumps
- **Weekly:** `/review` for cross-venture audit

## Key files

- `CLAUDE.md` — master context (read every session)
- `brain/memory.md` — the canonical "who is Syed" file
- `brain/tasks.md` — open loops, prioritized
- `brain/projects.md` — venture status
- `SETUP.md` — manual steps remaining (MCP creds, voice, API keys)

## What's not built yet

See `SETUP.md` for the manual checklist. Highlights: MCP server credentials, voice layer (Whisper + ElevenLabs), Gmail/Calendar/Drive auth.
