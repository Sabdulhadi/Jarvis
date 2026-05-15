---
name: review
description: Weekly review. Audits progress across all ventures and personal admin, flags stalled items, suggests reprioritization.
---

Run the weekly review.

1. Read `brain/tasks.md`, `brain/projects.md`, `brain/decisions.md`.
2. Scan the last 7 days of `logs/YYYY-MM.md` (and previous month if today is early in the month).
3. For each domain, compute:
   - Status: green (active progress), yellow (some movement, slowing), red (no movement in 7+ days)
   - What moved
   - What didn't move and why
4. Delegate to the `personal-cos` agent.

Output format:

```
# Weekly Review — week of <YYYY-MM-DD>

## Snapshot
| Domain | Status | Moved | Stuck |
|---|---|---|---|
| INDROX | 🟢/🟡/🔴 | <bullet> | <bullet> |
| LUXBUS | ... | ... | ... |
| Content | ... | ... | ... |
| Energy drink | ... | ... | ... |
| Book | ... | ... | ... |
| Immigration (FR / CA / UK) | ... | ... | ... |
| Family | ... | ... | ... |
| Legal/admin | ... | ... | ... |

## Items stalled > 14 days
- <task> — <suggested next move>

## Reprioritization recommendations
- Demote: <task> — <why>
- Promote: <task> — <why>

## Next week — top 3 across the portfolio
1. <task>
2. <task>
3. <task>
```

Append to `logs/YYYY-MM.md`:
`- HH:MM — weekly review — <one-line summary>`
