# ADR-0001: Flat Source Layout for Experiments

## Status

Accepted

## Context

C-sandbox is a personal playground, not a shipping product. We need a layout that
is obvious on day one, works with single-file `gcc` commands, and does not force
a build system before there is code to build.

Alternatives considered:

- **Flat repo root** — every `.c` file beside `README.md`. Simple, but mixes
  docs and source as the repo grows.
- **`src/` per experiment** — one folder per topic. Flexible, but heavy for tiny
  snippets.
- **Single `src/` folder** — all experiments in one place; docs stay at root.

## Decision

- All C source lives under **`src/`** at the repo root.
- Each experiment is typically **one `.c` file** named after the topic (e.g.
  `src/hello.c`, `src/pointers-demo.c`).
- Multi-file experiments stay in a **subfolder under `src/`** only when they
  genuinely need multiple translation units (e.g. `src/linked-list/`).
- Compiler output goes to **`build/`** or beside the source as a gitignored
  `.exe`; prefer `build/` when a script or Makefile is introduced.

## Consequences

- Agents and humans can find code quickly without learning a module map.
- Adding a new experiment is a single new file plus a compile command — no
  scaffolding ceremony.
- If the repo later outgrows this layout, supersede this ADR with one that
  defines a richer structure (e.g. libraries, tests tree).

## References

- Mechanics: [`reference/build-layout.ref.md`](../reference/build-layout.ref.md)
- Skill: [`skills/add-c-experiment`](../skills/add-c-experiment/SKILL.md)
