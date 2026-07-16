# Setup Guide

Environment setup for C-sandbox on Windows: compiler, repo layout, and optional
agent-tool wiring.

## 1. Install MinGW-w64 gcc

Pick one install path:

**MSYS2 (recommended)**

1. Install [MSYS2](https://www.msys2.org/).
2. In the MSYS2 UCRT64 terminal:

   ```bash
   pacman -S --needed mingw-w64-ucrt-x86_64-gcc
   ```

3. Add `C:\msys64\ucrt64\bin` to your user **PATH** (adjust if MSYS2 lives
   elsewhere).

**WinLibs or Chocolatey**

- WinLibs: download a UCRT64 zip and add its `bin` folder to PATH.
- Chocolatey: `choco install mingw` (verify `gcc --version` afterward).

Verify in **PowerShell**:

```powershell
gcc --version
```

## 2. Clone and open the repo

```powershell
git clone https://github.com/Reza-Amani/C-sandbox.git
cd C-sandbox
```

Create output folder once:

```powershell
New-Item -ItemType Directory -Force -Path build
```

## 3. Optional: MSVC (Visual Studio Build Tools)

If you prefer `cl`, install [Visual Studio Build Tools](https://visualstudio.microsoft.com/downloads/)
with the **Desktop development with C++** workload. Use **Developer PowerShell
for VS** when compiling. See [`commands.md`](commands.md) for an example `cl`
invocation. MinGW `gcc` remains the documented default per
[`adr/0002-mingw-gcc-toolchain.adr.md`](../adr/0002-mingw-gcc-toolchain.adr.md).

## 4. Wire the agent manifest into your IDE (optional)

`.agents/` is the canonical source. Mirror it into tool folders with symlinks.

**PowerShell (run as Administrator):**

```powershell
New-Item -ItemType Directory -Force -Path .github, .cursor | Out-Null
New-Item -ItemType SymbolicLink -Path .\.github\skills -Target .agents\skills -Force
New-Item -ItemType SymbolicLink -Path .\.github\agents -Target .agents\personas -Force
New-Item -ItemType SymbolicLink -Path .\.cursor\skills -Target .agents\skills -Force
```

These mirror paths are **gitignored**. Recreate them on each machine. Root
`AGENTS.md` is discovered automatically by most agent tools.

## 5. Verify

```powershell
gcc -std=c17 -Wall -Wextra -o build\hello.exe src\hello.c
.\build\hello.exe
```

(After you add `src/hello.c` — see the backlog.)

Ask your agent to "read routing and tell me how to add an experiment" to confirm
manifest discovery works.
