# Goal Todo

`goal-todo` is a single Codex skill for turning a vague long-running task into a concrete, paste-ready `/goal` prompt.

This repository is intentionally organized as a portable skill folder, not as an application project. The important distinction is:

- the agent runtime needs `SKILL.md` and any bundled resources
- human users need a short, explicit install path, restart step, verification step, and invocation examples

This repository includes both.

## Quick Start

### Option 1: Install as a user-level Codex skill

Clone this repository directly into your Codex skills directory:

```bash
git clone https://github.com/Cooper-X-Oak/goal-to-do.git "${CODEX_HOME:-$HOME/.codex}/skills/goal-todo"
```

On Windows PowerShell:

```powershell
git clone https://github.com/Cooper-X-Oak/goal-to-do.git "$HOME\.codex\skills\goal-todo"
```

Then restart Codex so it picks up the new skill.

### Option 2: Run the bundled installer

From a checkout of this repository:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

The default target is:

```text
$CODEX_HOME/skills/goal-todo
```

When `CODEX_HOME` is not set, the installer falls back to:

```text
~/.codex/skills/goal-todo
```

### Option 3: Install into a project-local Agent Skills directory

Some Agent Skills clients and community repos use a workspace-local layout:

```text
<project>/.agents/skills/goal-todo
```

To install this repository in that layout:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 -Scope Project -ProjectRoot C:\path\to\your\project
```

## Verify The Install

After installation:

1. restart Codex
2. open a session in any repo
3. try one of these prompts

Explicit invocation:

```text
$goal-todo help me turn this vague multi-step task into a /goal prompt
```

Natural-language invocation:

```text
Turn this vague task into a /goal prompt before we execute
```

```text
I want Codex to drive this, but first define the boundaries
```

Expected behavior:

1. Codex asks a short alignment round
2. you choose shape, autonomy, scope, risk, and checkpoints
3. Codex returns one final `/goal ...` prompt

## Repository Layout

```text
goal-to-do/
|- SKILL.md
|- README.md
|- LICENSE
|- CONTRIBUTING.md
|- agents/
|  \- openai.yaml
|- references/
|  |- quickstart.md
|  \- prompt-patterns.md
|- examples/
|  |- plain-text-fallback.txt
|  \- session-example.md
\- scripts/
   |- install.ps1
   \- install.sh
```

## Why This Structure

This layout follows the current Codex and Agent Skills conventions:

- `SKILL.md` is the required runtime entry point
- `agents/openai.yaml` is recommended metadata for Codex surfaces
- `references/` holds docs that can be loaded only when needed
- `scripts/` holds deterministic helper tooling such as installers
- `examples/` gives humans a fast way to understand expected interaction shape

The repo root is the skill root. That means users can either:

- clone it directly into their skills directory
- copy the whole repository into a compatible skills directory
- install it project-locally under `.agents/skills/goal-todo`

## Usage Notes

This skill is for defining the goal before execution starts. It is not a task runner by itself.

Use it when:

- the work is multi-step or long-running
- the user wants autonomy but with explicit boundaries
- a clean `/goal` prompt is more useful than a long planning memo

Do not use it when the user already gave a fully specified `/goal` prompt and does not need alignment.

## More Detail

- Install and verification details: [references/quickstart.md](./references/quickstart.md)
- Prompt patterns and activation examples: [references/prompt-patterns.md](./references/prompt-patterns.md)
- Full interaction example: [examples/session-example.md](./examples/session-example.md)

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

MIT
