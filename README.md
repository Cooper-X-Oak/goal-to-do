# Goal Todo

`goal-todo` is a single skill repository organized in the common community layout:

```text
skills/<skill-name>/SKILL.md
```

In this repository, the runtime skill lives at:

```text
skills/goal-todo/
```

That makes the repo easier to understand for people already using community skill collections, while still allowing direct installation into Codex.

## Repository Layout

```text
goal-to-do/
|- README.md
|- LICENSE
|- CONTRIBUTING.md
|- references/
|- examples/
|- scripts/
\- skills/
   \- goal-todo/
      |- SKILL.md
      |- LICENSE.txt
      \- agents/
         \- openai.yaml
```

## Install

### Recommended: install the skill directory directly

If your client supports GitHub directory installs, use the skill subdirectory URL:

```text
https://github.com/Cooper-X-Oak/goal-to-do/tree/main/skills/goal-todo
```

For Codex environments that support `$skill-installer`, the command is:

```text
$skill-installer install https://github.com/Cooper-X-Oak/goal-to-do/tree/main/skills/goal-todo
```

### Codex user-level install

From a checkout of this repository:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

This installs the contents of `skills/goal-todo/` to:

```text
$CODEX_HOME/skills/goal-todo
```

If `CODEX_HOME` is not set, the installer uses:

```text
~/.codex/skills/goal-todo
```

### Project-local install

For community clients that use project-local skills:

```text
<project>/.agents/skills/goal-todo
```

Install with:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 -Scope Project -ProjectRoot C:\path\to\project
```

## Verify

After installation:

1. restart Codex or your skill host
2. start a new session
3. try one of these prompts

Explicit:

```text
$goal-todo help me turn this vague multi-step task into a /goal prompt
```

Natural-language:

```text
Turn this long-running task into a /goal prompt before we execute
```

Expected behavior:

1. the agent asks a short alignment round
2. you choose shape, autonomy, scope, risk, and checkpoints
3. the agent returns one final `/goal ...` prompt

## When To Use This Skill

Use `goal-todo` when:

- the task is long-running or ambiguous
- the user wants autonomy with clear boundaries
- the best deliverable is a compact `/goal` prompt rather than a planning memo

Do not use it when the user already has a final `/goal` prompt and does not need alignment.

## More Detail

- install and verification: [references/quickstart.md](./references/quickstart.md)
- trigger examples: [references/prompt-patterns.md](./references/prompt-patterns.md)
- full example session: [examples/session-example.md](./examples/session-example.md)

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

MIT
