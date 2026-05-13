param(
  [ValidateSet("User", "Project")]
  [string]$Scope = "User",
  [string]$ProjectRoot,
  [switch]$Force
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$SkillName = "goal-todo"
$SkillSourceRoot = Join-Path $RepoRoot "skills\$SkillName"

function Copy-SkillFiles {
  param(
    [string]$SourceRoot,
    [string]$TargetRoot
  )

  Get-ChildItem -LiteralPath $SourceRoot -Force | ForEach-Object {
    Copy-Item -LiteralPath $_.FullName -Destination $TargetRoot -Recurse -Force
  }
}

if ($Scope -eq "User") {
  if ($env:CODEX_HOME) {
    $BaseDir = Join-Path $env:CODEX_HOME "skills"
  } else {
    $BaseDir = Join-Path $HOME ".codex\skills"
  }
} else {
  if (-not $ProjectRoot) {
    throw "Project scope requires -ProjectRoot."
  }
  $ResolvedProjectRoot = (Resolve-Path -LiteralPath $ProjectRoot).Path
  $BaseDir = Join-Path $ResolvedProjectRoot ".agents\skills"
}

$TargetDir = Join-Path $BaseDir $SkillName

if ((Test-Path -LiteralPath $TargetDir) -and (-not $Force)) {
  throw "Target already exists: $TargetDir. Re-run with -Force to overwrite."
}

New-Item -ItemType Directory -Force -Path $BaseDir | Out-Null
if (Test-Path -LiteralPath $TargetDir) {
  Remove-Item -LiteralPath $TargetDir -Recurse -Force
}
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null

Copy-SkillFiles -SourceRoot $SkillSourceRoot -TargetRoot $TargetDir

Write-Host "Installed $SkillName to: $TargetDir"
Write-Host "Next steps:"
Write-Host "1. Restart Codex"
Write-Host "2. Try: `$goal-todo help me turn this vague task into a /goal prompt"
