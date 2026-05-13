# Quickstart

This file is the human-facing install and verification guide for `goal-todo`.

## Install Paths

### Codex user-level install

Preferred target:

```text
$CODEX_HOME/skills/goal-todo
```

Fallback when `CODEX_HOME` is unset:

```text
~/.codex/skills/goal-todo
```

### Project-local install for Agent Skills clients

Common community layout:

```text
<project>/.agents/skills/goal-todo
```

## Install Commands

### Manual clone

```bash
git clone https://github.com/Cooper-X-Oak/goal-to-do.git "${CODEX_HOME:-$HOME/.codex}/skills/goal-todo"
```

### PowerShell installer

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

### PowerShell installer for project-local layout

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 -Scope Project -ProjectRoot C:\path\to\repo
```

## Restart

After installing, restart Codex so it can discover the new skill.

## Verification

Use either an explicit or natural-language trigger.

Explicit:

```text
$goal-todo help me turn this vague task into a /goal prompt
```

Natural-language:

```text
Turn this long-running task into a /goal prompt
```

Expected result:

1. Codex asks an alignment round
2. the user chooses from structured options
3. Codex returns one final `/goal ...` prompt
