# Build script for C-sandbox (Windows / MinGW gcc).
# Usage:
#   .\build.ps1              # build every src\*.c experiment
#   .\build.ps1 build hello  # build one experiment
#   .\build.ps1 run hello    # build (if needed) and run
#   .\build.ps1 clean        # remove build\
#   .\build.ps1 rebuild      # clean then build all

param(
    [Parameter(Position = 0)]
    [ValidateSet('build', 'clean', 'run', 'rebuild')]
    [string]$Action = 'build',

    [Parameter(Position = 1)]
    [string]$Target = ''
)

$ErrorActionPreference = 'Stop'

$BuildDir = 'build'
$SrcDir = 'src'
$CFlags = @('-std=c17', '-Wall', '-Wextra')

function Ensure-BuildDir {
    New-Item -ItemType Directory -Force -Path $BuildDir | Out-Null
}

function Get-SourceFiles {
    param([string]$Name)

    if ($Name) {
        $path = Join-Path $SrcDir "$Name.c"
        if (-not (Test-Path $path)) {
            throw "Source not found: $path"
        }
        return @(Get-Item $path)
    }

    $sources = Get-ChildItem -Path $SrcDir -Filter '*.c' -File
    if ($sources.Count -eq 0) {
        throw "No .c files found in $SrcDir"
    }
    return $sources
}

function Build-Target {
    param([string]$Name)

    $src = Join-Path $SrcDir "$Name.c"
    $exe = Join-Path $BuildDir "$Name.exe"
    & gcc @CFlags -o $exe $src
    if ($LASTEXITCODE -ne 0) {
        throw "gcc failed for $src"
    }
    Write-Host "Built $exe"
}

function Build-All {
    Ensure-BuildDir
    foreach ($file in Get-SourceFiles) {
        Build-Target $file.BaseName
    }
}

switch ($Action) {
    'build' {
        if ($Target) {
            Ensure-BuildDir
            Build-Target $Target
        } else {
            Build-All
        }
    }
    'clean' {
        if (Test-Path $BuildDir) {
            Remove-Item -Recurse -Force $BuildDir
            Write-Host "Removed $BuildDir\"
        }
    }
    'run' {
        if (-not $Target) {
            throw "run requires a target name, e.g. .\build.ps1 run hello"
        }
        $exe = Join-Path $BuildDir "$Target.exe"
        if (-not (Test-Path $exe)) {
            Ensure-BuildDir
            Build-Target $Target
        }
        & $exe
        if ($LASTEXITCODE -ne 0) {
            throw "Program exited with code $LASTEXITCODE"
        }
    }
    'rebuild' {
        if (Test-Path $BuildDir) {
            Remove-Item -Recurse -Force $BuildDir
        }
        Build-All
    }
}
