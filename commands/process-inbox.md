---
name: process-inbox
description: Process all unprocessed notes in vault/raw/ via the second-brain-librarian. Distill, file, backlink, flag contradictions.
---

Process the raw inbox.

1. List everything in `vault/raw/` (excluding `vault/raw/processed/` and `vault/raw/quoted/`).
2. Compare against the last librarian log entry to determine what's new.
3. Delegate to the `second-brain-librarian` agent.

The librarian will:
- Read each raw file
- Decide: distill / append / quote-hold / discard
- Write or update wiki entries in `vault/wiki/`
- Add backlinks
- Flag contradictions
- Optionally move processed raw files to `vault/raw/processed/YYYY-MM/`

Output format:

```
# Inbox processed — <YYYY-MM-DD HH:MM>

## Files processed
- vault/raw/<file> → vault/wiki/<entry>
- ...

## Wiki entries created/updated
- vault/wiki/<entry> — <one-line summary>

## Contradictions flagged
- <wiki page A> vs <wiki page B> — <conflict>

## Punted
- <file> — <reason>
```

Append to `logs/YYYY-MM.md`:
`- HH:MM — librarian: processed N raw → M wiki (K contradictions)`
