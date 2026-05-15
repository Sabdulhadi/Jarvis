---
name: brief
description: Produce a briefing document on any topic, combining vault content with web research, with citations. Usage — /brief <topic>.
---

Produce a briefing document on `<topic>`.

### 1. Vault scan
- Search `vault/wiki/`, `vault/raw/`, and any relevant `ventures/<x>/` or `operations/<x>/` directory for existing content on the topic.
- Note what's already known and where it lives.

### 2. Web research
- Delegate to the `research-agent` for any external information needed.
- The agent will drop sources in `vault/raw/` and synthesize into `vault/wiki/`.

### 3. Synthesize the brief
Structure:

```
# Brief — <topic>
*Prepared <YYYY-MM-DD> for Syed*

## Bottom line
<2-3 sentences. The answer Syed needs if he reads nothing else.>

## What we know
- <fact> [[source]]
- <fact> [[source]]

## What's contested or unclear
- <claim> — <conflicting evidence> [[source A]] vs [[source B]]

## Implications for Syed
- <implication for which venture / domain>
- <implication>

## Recommended next actions
1. <action>
2. <action>

## Sources
- [[wiki/...]]
- <URL>
- <URL>
```

### 4. Save
Output path: `output/briefs/<YYYY-MM-DD>_<topic-slug>.md`.

### 5. Log
Append to `logs/YYYY-MM.md`:
`- HH:MM — brief: <topic> → output/briefs/<file>`
