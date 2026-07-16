---
name: Project Backlog
overview: Canonical backlog for C-sandbox — a Windows C playground. Agents should check here before proposing new work.
todos:
  - id: manifest-bootstrap
    content: Bootstrap .agents/ manifest from manifest-template
    status: completed
  - id: hello-world
    content: Add src/hello.c and verify gcc build/run on Windows
    status: completed
  - id: build-script
    content: Optional build.ps1 or Makefile when experiments multiply
    status: completed
isProject: true
---

# Project Backlog

> **Multi-session tracker.** Keep the YAML `todos` block and checklists in sync.
> ADRs remain authoritative when a tracker item conflicts with architecture.

## Purpose

- **Role:** Personal playground for C code — buildable and runnable on Windows.
- **Tracking scope:** First programs, tooling improvements, and learning experiments.

## Immediate Work

- [x] Bootstrap `.agents/` manifest (routing, ADRs, guides, add-c-experiment skill).
- [x] Add `src/hello.c` and confirm `gcc` compile + run (see [`guides/setup.md`](../guides/setup.md)).

## Long-Term Backlog

- [x] Add `build.ps1` or a minimal `Makefile` when manual `gcc` lines get repetitive.
- [ ] Try a multi-file experiment under `src/<topic>/` to validate the exception path in [`adr/0001-flat-source-layout.adr.md`](../adr/0001-flat-source-layout.adr.md).

## Active Context

- **Primary goal:** Get the first hello-world experiment building on Windows with MinGW `gcc`.
- **Toolchain:** MinGW-w64 gcc ([`adr/0002-mingw-gcc-toolchain.adr.md`](../adr/0002-mingw-gcc-toolchain.adr.md)).
