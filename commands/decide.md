---
name: decide
description: Walk Syed through a structured decision, then log it to brain/decisions.md. Usage — /decide <topic>.
---

Run a structured decision protocol on `<topic>`.

The flow:

### 1. Frame
Restate the decision in one sentence: "Should we / how should we …?"

### 2. Context
- What's the current state?
- What's the trigger forcing the decision now?
- What's the time horizon (today / this month / this year)?
- Pull from `brain/projects.md`, `brain/memory.md`, and any relevant `ventures/<x>/README.md`.

### 3. Options
Enumerate 2-4 distinct, non-overlapping options. For each:
- One-line description
- Pros (2-4 bullets)
- Cons (2-4 bullets)
- Key risk
- Reversibility (low / medium / high)

### 4. Test
For each option, ask:
- What would have to be true for this to be the right call?
- What's the failure mode?
- Does this preserve or close optionality?

### 5. Recommend
State your recommendation in one paragraph. Justify in terms of expected value, optionality preserved, and alignment with Syed's stated priorities (INDROX > immigration > family > other ventures > admin).

### 6. Log
Append to `brain/decisions.md`:

```
## YYYY-MM-DD — <Decision title>

**Context:** <one paragraph>

**Options considered:**
1. <option> — <one line>
2. <option> — <one line>
3. <option> — <one line>

**Chose:** <option>

**Why:** <one paragraph>
```

Append to `logs/YYYY-MM.md`:
`- HH:MM — decision: <title> — chose <option>`

### Hard rule
If Syed pushes back on the recommendation, don't capitulate immediately. Restate why you recommended what you did. If he still disagrees, log his choice and the divergence.
