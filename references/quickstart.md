# Quickstart

This repository follows the common community layout where the runtime skill lives under:

```text
skills/goal-todo/
```

## Install Paths

### Codex user-level

The final installed path should be:

```text
$CODEX_HOME/skills/goal-todo
```

Fallback when `CODEX_HOME` is unset:

```text
~/.codex/skills/goal-todo
```

### Project-local community layout

Common project-local target:

```text
<project>/.agents/skills/goal-todo
```

## Install Options

### GitHub directory URL

```text
https://github.com/Cooper-X-Oak/goal-to-do/tree/main/skills/goal-todo
```

### `$skill-installer`

```text
$skill-installer install https://github.com/Cooper-X-Oak/goal-to-do/tree/main/skills/goal-todo
```

### PowerShell installer from a repo checkout

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

### Project-local install from a repo checkout

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 -Scope Project -ProjectRoot C:\path\to\repo
```

## Restart

After installing, restart Codex or your skill host.

## Verification

Explicit invocation:

```text
$goal-todo help me turn this vague task into a /goal prompt
```

Natural-language invocation:

```text
Turn this long-running task into a /goal prompt
```

Expected result:

1. the agent asks an alignment round
2. the user selects structured options
3. the final output is one `/goal ...` prompt
