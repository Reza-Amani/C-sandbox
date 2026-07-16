# Build Layout Reference

How sources, outputs, and compile commands are organized in C-sandbox.

Authority: [`adr/0001-flat-source-layout.adr.md`](../adr/0001-flat-source-layout.adr.md),
[`adr/0002-mingw-gcc-toolchain.adr.md`](../adr/0002-mingw-gcc-toolchain.adr.md).

## Directory layout

```
C-sandbox/
├── src/                 # all C source (experiments)
│   └── hello.c          # example single-file experiment
├── build/               # gitignored compiler output (preferred)
├── build.ps1            # build / run / clean entry point
├── .agents/             # agent manifest (canonical)
├── AGENTS.md
├── README.md
└── LICENSE
```

## Build entry point

Use [`build.ps1`](../../build.ps1) from the repo root (see [`guides/commands.md`](../guides/commands.md)):

```powershell
.\build.ps1              # build all src\*.c
.\build.ps1 run hello    # build if needed, then run
```

## Single-file experiment flow (manual)

1. Create `src/<topic>.c` with a `main` function.
2. Compile to `build/<topic>.exe`:

   ```powershell
   gcc -std=c17 -Wall -Wextra -o build/hello.exe src/hello.c
   ```

3. Run:

   ```powershell
   .\build\hello.exe
   ```

## Multi-file experiment (exception)

When an experiment needs multiple `.c` files:

- Use `src/<topic>/` and list every `.c` on the `gcc` command line, or
- Add a small `Makefile` / `build.ps1` in that subfolder and document it in
  [`guides/commands.md`](../guides/commands.md).

## Gitignored artifacts

Per root `.gitignore`: `*.o`, `*.obj`, `*.exe`, `build/`, `dist/`. Do not
commit build artifacts.

## MSVC alternative (optional)

From a **Developer PowerShell for VS**:

```powershell
cl /W4 /Fe:build\hello.exe src\hello.c
.\build\hello.exe
```

Paths and flags differ from `gcc`; keep MSVC notes in setup, not scattered
across every skill.
