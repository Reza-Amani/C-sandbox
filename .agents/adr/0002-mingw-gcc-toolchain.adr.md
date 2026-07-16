# ADR-0002: MinGW-w64 gcc as Primary Windows Toolchain

## Status

Accepted

## Context

The repo must be **buildable and runnable on Windows**. Windows offers several C
toolchains:

- **MinGW-w64 `gcc`** — open source, works from PowerShell/cmd once on `PATH`,
  familiar Unix-style flags.
- **Microsoft `cl`** — ships with Visual Studio Build Tools; excellent Windows
  integration but requires a Developer shell or environment setup.
- **Clang on Windows** — viable, but adds a third path to document for little
  gain in a personal sandbox.

For a playground, we want the path of least friction for quick compile-run loops.

## Decision

- **Primary toolchain:** MinGW-w64 **`gcc`** and **`g++`** when needed.
- **Guides and skills** document `gcc` commands first. MSVC (`cl`) may appear as
  an optional alternative in [`guides/setup.md`](../guides/setup.md), not as the
  default in every example.
- **Standard:** C17 (`-std=c17`) unless an experiment explicitly needs another
  dialect.
- **Warnings:** compile with `-Wall -Wextra` by default in documented commands.

## Consequences

- Contributors install MinGW-w64 (e.g. via MSYS2, WinLibs, or Chocolatey) and
  ensure `gcc` is on `PATH`.
- CI is out of scope until requested; local Windows builds are the reference
  environment.
- If the owner later standardizes on MSVC only, write a new ADR that supersedes
  this one — do not silently switch defaults in guides.

## References

- Setup: [`guides/setup.md`](../guides/setup.md)
- Commands: [`guides/commands.md`](../guides/commands.md)
