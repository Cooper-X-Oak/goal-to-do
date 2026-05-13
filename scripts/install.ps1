param(
  [ValidateSet("User", "Project")]
  [string]$Scope = "User",
  [string]$ProjectRoot,
  [switch]$Force
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$SkillName = "goal-todo"

function Copy-SkillFiles {
  param(
    [string]$SourceRoot,
    [string]$TargetRoot
  )

  $entries = @(
    "SKILL.md",
    "README.md",
    "LICENSE",
    "CONTRIBUTING.md",
    ".gitattributes",
    ".gitignore",
    "agents",
    "references",
    "examples",
    "scripts"
  )

  foreach ($entry in $entries) {
    $source = Join-Path $SourceRoot $entry
    if (Test-Path -LiteralPath $source) {
      Copy-Item -LiteralPath $source -Destination $TargetRoot -Recurse -Force
    }
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

Copy-SkillFiles -SourceRoot $RepoRoot -TargetRoot $TargetDir

Write-Host "Installed $SkillName to: $TargetDir"
Write-Host "Next steps:"
Write-Host "1. Restart Codex"
Write-Host "2. Try: `$goal-todo help me turn this vague task into a /goal prompt"
