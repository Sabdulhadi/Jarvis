---
name: log
description: Append a timestamped entry to the current month's log file. Usage — /log <entry>.
---

Append `<entry>` to the current month's log file.

### Steps

1. Determine the current month: `YYYY-MM`.
2. Target file: `logs/YYYY-MM.md`.
3. If the file doesn't exist, create it with a header:

```
# Log — <YYYY-MM>
```

4. Append a new line at the end of the file:

```
- HH:MM — <entry>
```

Use 24-hour time. If `<entry>` is multi-line, indent continuation lines with 2 spaces.

### Output
Print the appended line and the file path. Nothing else.

No need to log this action separately — the log entry IS the log.
