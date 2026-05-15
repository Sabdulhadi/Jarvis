---
name: draft
description: Draft an email, letter, or document. Routes to the appropriate specialist agent. Usage — /draft <type> <target>. Examples — /draft email investor, /draft letter inpi, /draft chapter vitamin-d, /draft script niche-3.
---

Draft a document.

Parse the arguments: `<type>` and `<target>`.

Route by `<type> <target>`:

| Pattern | Agent | Output location |
|---|---|---|
| `email investor` | `indrox-cofounder` | `output/indrox/<YYYY-MM-DD>_<recipient>.md` |
| `email partner` | `indrox-cofounder` (or `personal-cos` if non-INDROX) | `output/<domain>/...` |
| `letter inpi` | `legal-paralegal` | `output/legal/<YYYY-MM-DD>_inpi.md` |
| `letter visa` | `legal-paralegal` | `output/legal/<YYYY-MM-DD>_visa-<target>.md` |
| `letter cancellation` | `legal-paralegal` | `output/legal/<YYYY-MM-DD>_cancel-<target>.md` |
| `letter clara` | `legal-paralegal` | `output/legal/<YYYY-MM-DD>_clara.md` |
| `chapter <name>` | `book-editor` | `ventures/book-project/chapters/<NN>_<name>.md` |
| `script <niche>` | `content-producer` | `ventures/content-business/niches/<niche>/scripts/<YYYY-MM-DD>.md` |
| `pitch <audience>` | `indrox-cofounder` | `output/indrox/<YYYY-MM-DD>_pitch-<audience>.md` |
| `brief <topic>` | `research-agent` then `personal-cos` | `output/briefs/<YYYY-MM-DD>_<topic>.md` |

If the pattern doesn't match, ask which agent should handle it — but only once, and propose your best guess.

Always:
- Save the draft to a file (don't only print it).
- Mark the body `**DRAFT**` until Syed approves.
- Print the path to the saved draft and a one-paragraph summary of what's in it.

Append to `logs/YYYY-MM.md`:
`- HH:MM — draft: <type> <target> → <path>`
