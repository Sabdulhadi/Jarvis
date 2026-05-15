---
name: health-check
description: Audit the vault for contradictions, outdated info, broken backlinks, and stale entries (>90 days). Surface what needs refresh.
---

Run a health check on the vault and brain.

### 1. Backlink integrity
- Walk every `vault/wiki/*.md` file.
- Extract all `[[wiki/...]]` and `[[ventures/...]]` style links.
- For each link, verify the target file exists.
- Report broken links by source file.

### 2. Stale entries
- Find every `vault/wiki/*.md` whose frontmatter `updated:` is more than 90 days old.
- Group by tag.
- For each, output: path, last updated date, suggested refresh action (re-research / archive / merge).

### 3. Contradictions
- Search for `## Contradiction` headings across `vault/wiki/`.
- List each, with both pages involved.

### 4. Brain drift
- Compare `brain/memory.md` and `brain/projects.md` for any contradictions (e.g. a venture marked active in projects.md but missing from memory.md).
- Flag any `<!-- NEEDS_INPUT:` markers still present anywhere in the repo.

### 5. Task hygiene
- Read `brain/tasks.md`.
- Flag tasks that:
  - Have no priority tag
  - Have been "P1" for more than 2 weeks (priority inflation)
  - Reference a date that has passed without being marked done

### Output

```
# Vault Health Check — <YYYY-MM-DD>

## Broken links
<list or "none">

## Stale entries (>90 days)
<list or "none">

## Contradictions
<list or "none">

## Brain drift
<list or "none">

## NEEDS_INPUT markers
<list or "none">

## Task hygiene
<list or "none">

## Recommended actions
1. <action>
2. <action>
3. <action>
```

Append to `logs/YYYY-MM.md`:
`- HH:MM — health-check — <N issues found>`
