# Project Terms

Project-wide terminology for C-sandbox. Use one name for one concept everywhere
in code, comments, docs, and agent output.

## Sandbox

A **sandbox** is a self-contained C experiment in this repo — usually one or a
few `.c` files with a narrow learning goal. Sandboxes are disposable; they do
not need production-grade error handling or packaging.

## Experiment

An **experiment** is a sandbox program you are actively building or running.
Name source files after the topic (e.g. `pointers-demo.c`), not `main.c`, unless
it is the only file in a tiny hello-world.

## Build artifact

A **build artifact** is compiler output: `.exe`, `.o`, `.obj`, or files under
`build/`. Artifacts are gitignored; never commit them.

## Toolchain

**Toolchain** means the compiler plus the commands used to build and run on
Windows. The primary toolchain here is **MinGW-w64 `gcc`** (see
[`adr/0002-mingw-gcc-toolchain.adr.md`](../adr/0002-mingw-gcc-toolchain.adr.md)).
**MSVC** (`cl`) is a documented alternative, not the default in guides.

## Compile vs build

- **Compile** — turn one or more `.c` files into an executable (or object files)
  with a single command or short script.
- **Build** — same as compile in this repo unless a Makefile or script is added
  later; then **build** means running that entry point (`make`, `build.ps1`, etc.).
