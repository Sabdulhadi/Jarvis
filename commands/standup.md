---
name: standup
description: Daily morning standup. Reads tasks.md and the latest log entry. Outputs yesterday's wins, today's top 3, blockers, and one strategic question.
---

Run the daily standup for Syed.

1. Read `brain/tasks.md`.
2. Read the most recent entries in the current month's `logs/YYYY-MM.md` file.
3. Read `brain/projects.md` for cross-venture context.
4. Delegate to the `personal-cos` agent.

Output format:

```
# Standup — <YYYY-MM-DD>

## Yesterday
- <win 1>
- <win 2>
- <win 3>

## Today's top 3 (P1 only)
1. <task> — <why it matters today>
2. <task> — <why it matters today>
3. <task> — <why it matters today>

## Blockers
- <blocker> — <suggested unblock>

## Strategic question of the day
> <one sharp question Syed should sit with>
```

Then append a one-liner to `logs/YYYY-MM.md`:
`- HH:MM — standup completed — top P1: <task>`
