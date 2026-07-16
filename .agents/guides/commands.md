# Useful Commands

Quick reference for building and running C experiments on Windows. Primary
toolchain: MinGW-w64 `gcc` ([`adr/0002-mingw-gcc-toolchain.adr.md`](../adr/0002-mingw-gcc-toolchain.adr.md)).

Layout: [`reference/build-layout.ref.md`](../reference/build-layout.ref.md).

## Build (recommended)

From the repo root, use [`build.ps1`](../../build.ps1):

```powershell
.\build.ps1              # build every src\*.c → build\<name>.exe
.\build.ps1 build hello  # build one experiment
.\build.ps1 rebuild     # clean build\ then build all
.\build.ps1 clean        # remove build\
```

## Run

```powershell
.\build.ps1 run hello    # build if missing, then run
.\build\hello.exe        # run directly
```

## Manual compile (single file)

```powershell
# Pattern: gcc -std=c17 -Wall -Wextra -o build\<name>.exe src\<name>.c
gcc -std=c17 -Wall -Wextra -o build\hello.exe src\hello.c
```

## Multi-file experiment

List every `.c` file (or add a local script under `src\<topic>\`):

```powershell
gcc -std=c17 -Wall -Wextra -o build\mytool.exe src\mytool\main.c src\mytool\util.c
```

## Debug symbols (gdb / lldb)

```powershell
gcc -std=c17 -Wall -Wextra -g -o build\hello.exe src\hello.c
gdb build\hello.exe
```

## MSVC alternative (Developer PowerShell for VS)

```powershell
cl /W4 /std:c17 /Fe:build\hello.exe src\hello.c
.\build\hello.exe
```

> Keep this list short and current. When a command changes, update this file in
> the same change (see [`actions/verify-docs-in-sync.md`](../actions/verify-docs-in-sync.md)).
