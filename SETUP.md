# JARVIS — Manual Setup Checklist

Everything Claude couldn't do for you in the bootstrap. Work through this top-to-bottom.

---

## 1. MCP servers

Edit `.claude/mcp_servers.json` (already scaffolded with placeholders).

### 1a. Filesystem (already scoped to `~/jarvis`)
No setup needed beyond having Claude Code installed.

### 1b. Web search + fetch
- [ ] Decide between Brave Search MCP, Tavily, or Perplexity. Tavily recommended (cheapest, decent quality).
- [ ] Get API key.
- [ ] `export TAVILY_API_KEY=...` in your shell profile.
- [ ] Replace `<TAVILY_API_KEY>` placeholder in `.claude/mcp_servers.json`.

### 1c. Gmail
- [ ] Go to https://console.cloud.google.com → create project "jarvis".
- [ ] Enable Gmail API.
- [ ] OAuth consent screen → external → add yourself as test user.
- [ ] Create OAuth client ID (Desktop app) → download `credentials.json`.
- [ ] Place at `.claude/secrets/gmail-credentials.json` (gitignored).
- [ ] First run will trigger browser auth and cache token.

### 1d. Google Calendar
Same Google Cloud project as Gmail. Enable Calendar API. Reuse credentials.

### 1e. Google Drive
Same project. Enable Drive API. Scope: `drive.file` (only files Jarvis creates) for sanity.

---

## 2. Environment variables

Add to your shell profile (`~/.zshrc` or `~/.bashrc`):

```bash
export JARVIS_HOME="$HOME/jarvis"
export TAVILY_API_KEY="..."           # web search
export ELEVENLABS_API_KEY="..."        # voice TTS
export ANTHROPIC_API_KEY="..."         # if using API directly outside Claude Code
export OPENAI_API_KEY="..."            # only if using Whisper API instead of local
```

---

## 3. Voice layer (deferred — wire when ready)

### Speech-to-text (Whisper)
Two options:
- **Local:** `brew install whisper-cpp` then download a `ggml-medium.en.bin` model.
- **API:** Use OpenAI Whisper endpoint (faster, costs ~$0.006/min).

### Text-to-speech (ElevenLabs)
Already have an account for the content business. Pick a voice ID (suggest one of the deeper, calm British voices to match the JARVIS persona).

### Wire-up
The skeleton `scripts/jarvis-voice.sh` records → transcribes → pipes to Claude Code → speaks. Open it, fill in:
- Whisper invocation (local or API)
- ElevenLabs voice ID
- Audio output device

Then bind to a global keyboard shortcut (macOS: Karabiner-Elements; Linux: `xbindkeys`).

---

## 4. Hooks

Hooks are scaffolded in `hooks/` with a sample `settings.json` snippet you can copy into `.claude/settings.json`. Review and adjust before enabling.

---

## 5. First-run validation

- [ ] Open Claude Code in `~/jarvis/`.
- [ ] Confirm it reads `CLAUDE.md` (it will mention "JARVIS" in its first response).
- [ ] Run `/standup`. Should produce top 3 from `brain/tasks.md`.
- [ ] Drop a test note in `vault/raw/2026-05-15_test.md`. Run `/process-inbox`. Confirm a wiki entry appears.
- [ ] Run `/health-check`. Should return clean (no contradictions yet).

---

## 6. Things to fill in yourself

Search the repo for `<!-- NEEDS_INPUT:` and answer those inline. They mark places I didn't have the data to populate.

```bash
grep -rn "NEEDS_INPUT" --include="*.md" .
```

---

## 7. Recommended next reads (after setup)

- `CLAUDE.md` — master context
- `brain/personality.md` — JARVIS operating rules
- `brain/projects.md` — venture status
- `brain/tasks.md` — what's open
