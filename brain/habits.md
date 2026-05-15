# Habits

Empty for now. Fill this in with the daily and weekly routines you want JARVIS to track and reinforce.

Suggested format per habit:

```
## <Habit name>

- **Cadence:** daily | weekly | weekdays | Mon-Wed-Fri | etc.
- **Cue:** what triggers it
- **Action:** what you do
- **Why it matters:** the underlying outcome
- **Tracking:** how to know it happened (file touched, log line, completion checkmark)
```

---

<!-- NEEDS_INPUT: list the habits you want to track -->

Examples to consider seeding (delete or keep):

## TCF Canada written practice

- **Cadence:** weekdays
- **Cue:** post-coffee, before INDROX work
- **Action:** 30 min of B2-targeted writing exercises
- **Why it matters:** written B1/NCLC 5 is the CRS limiter for Canada Plan B
- **Tracking:** drop session notes into `vault/raw/YYYY-MM-DD_tcf-write.md`

## Daily standup

- **Cadence:** daily, morning
- **Cue:** open Claude Code in `~/jarvis/`
- **Action:** run `/standup`
- **Why it matters:** keeps the four ventures + personal admin from drifting
- **Tracking:** standup output appended to `logs/YYYY-MM.md`

## Weekly review

- **Cadence:** Sunday evening
- **Cue:** end-of-week wind-down
- **Action:** run `/review`
- **Why it matters:** catches stalled threads before they become emergencies
- **Tracking:** review output appended to `logs/YYYY-MM.md`
