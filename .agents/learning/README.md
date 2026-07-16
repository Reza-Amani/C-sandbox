# Learning

Records of `teach` skill sessions. Use this folder to preserve what was taught,
what examples were used, and what follow-up practice or open questions remain.

## The `teach` skill

These records pair with Matt Pocock's `teach` skill, a stateful, multi-session
teaching workflow. See it on [skills.sh](https://www.skills.sh/mattpocock/skills/teach).

Install:

```sh
npx skills add https://github.com/mattpocock/skills --skill teach
```

Invoke by asking your agent to teach a C topic, for example:

> Use the `teach` skill to teach me pointers in C.

## Naming

Use dated, descriptive Markdown files:

- `YYYY-MM-DD-topic.md`

Example-only placeholder material may live under `example/`. Do not put real
teach session records there.

## What belongs here

- The topic and goal of a teach session.
- Key explanations, examples, and exercises used in the session.
- Follow-up prompts, practice tasks, or questions to revisit.

## What does not belong here

- Project decisions → [`../adr/`](../adr/)
- Build layout and compile mechanics → [`../reference/`](../reference/)
- Multi-session project work → [`../plans/`](../plans/)
- Investigation results → [`../findings/`](../findings/)
- Scratch notes → [`../guides/notes.md`](../guides/notes.md)
