---
name: add-c-experiment
description: >-
  Adds a new C experiment under src/, compiles with gcc on Windows, and runs it.
  Use when the user asks to try a C snippet, add a demo, or scaffold a new
  playground program.
---

# Add a C Experiment

Runbook for a new self-contained C program in this playground.

**Persona:** plain English, smallest useful change ([`manifester`](../personas/manifester.agent.md)).

## Before coding

1. Read [`adr/0001-flat-source-layout.adr.md`](../adr/0001-flat-source-layout.adr.md)
   and [`reference/build-layout.ref.md`](../reference/build-layout.ref.md).
2. Confirm the experiment name against [`rules/terms.rule.md`](../rules/terms.rule.md).
3. Use `gcc` per [`adr/0002-mingw-gcc-toolchain.adr.md`](../adr/0002-mingw-gcc-toolchain.adr.md).

## Procedure

```
Task progress:
- [ ] 1. Pick a short topic name (e.g. hello, pointers-demo)
- [ ] 2. Create src/<topic>.c with main()
- [ ] 3. Ensure build/ exists
- [ ] 4. Compile with gcc -std=c17 -Wall -Wextra
- [ ] 5. Run build/<topic>.exe and confirm output
- [ ] 6. Update guides/commands.md if you introduced a new pattern
```

1. **Name** — one kebab or single-word topic; file is `src/<topic>.c`.
2. **Source** — minimal `main`, `#include` only what you need. No build artifacts
   in `src/`.
3. **Output dir** — `New-Item -ItemType Directory -Force -Path build` if missing.
4. **Compile:**

   ```powershell
   gcc -std=c17 -Wall -Wextra -o build\<topic>.exe src\<topic>.c
   ```

5. **Run** — `.\build\<topic>.exe`. Fix warnings unless intentionally exploring UB
   (note that in a comment if so).
6. **Docs** — if the compile line differs from [`guides/commands.md`](../guides/commands.md),
   update that guide in the same change.

## Completion checks

- Source lives under `src/` only.
- Executable is under `build/` and gitignored.
- No new ADR required for a one-off experiment unless it changes repo-wide policy.
