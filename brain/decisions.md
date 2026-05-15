# Decisions

Append-only decision log. Heading format: `## YYYY-MM-DD — Decision title`.

Each entry must include: **Context**, **Options considered**, **Chose**, **Why**.

Use this when:
- The choice is hard to reverse
- The reasoning will be useful in 6 months
- You'll forget why you decided what you decided

---

## 2026-05-15 — Bootstrap JARVIS as a file-system-native AI OS

**Context:** Operating across four ventures plus heavy personal admin (immigration, family, legal). Information was scattered across notes apps, email, brain. No single source of truth, no agentic execution layer.

**Options considered:**
1. **Notion + Zapier** — pretty, but locked into a vendor and weak at agentic automation.
2. **Obsidian + plugins** — file-system-native, strong vault model, weaker at agentic execution.
3. **Custom Claude Code repo (chosen)** — file-system-native, version-controlled, agentic-first, fully owned.

**Chose:** Option 3.

**Why:** Plain text + git + Claude Code gives lossless ownership, agentic execution out of the box, and zero vendor lock-in. Trades some UI polish for total control and composability. Aligns with the long-term posture of being principal of a deep-tech company.

---

<!-- Future entries go below. Newest at top, oldest at bottom. -->
