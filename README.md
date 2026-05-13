# Goal Todo

`goal-todo` is a Codex skill that turns a vague long-running task into a concrete, paste-ready `/goal` prompt.

This repository is intentionally small because a Codex skill is mostly prompt and behavior, not executable application code. The core of this skill is:

- [SKILL.md](./SKILL.md): the full behavior definition
- [agents/openai.yaml](./agents/openai.yaml): the display metadata and default prompt

Everything else in this repository exists to make the skill installable, understandable, and reusable by other people.

## Who This Is For

Use this skill when:

- a task is large or ambiguous and needs boundaries before execution
- you want Codex to work autonomously, but not blindly
- you want a final `/goal` prompt instead of a long planning memo
- you need a repeatable way to define scope, risk, checkpoints, and finish line

## What The Skill Does

The skill runs a short alignment workflow before drafting the final `/goal` prompt.

It is opinionated about sequence:

1. align on goal shape, autonomy style, and finish line
2. align on scope level, risk posture, and checkpoint frequency
3. compress the result into one execution-ready `/goal` prompt

It prefers structured clickable input through `request_user_input`. If the environment does not support that, it falls back to a compact plain-text reply format.

## Repository Layout

```text
.
|- SKILL.md
|- README.md
|- LICENSE
|- CONTRIBUTING.md
|- agents/
|  \- openai.yaml
\- examples/
   |- plain-text-fallback.txt
   \- session-example.md
```

## Install

Copy or clone this repository into your Codex skills directory under the folder name `goal-todo`.

Expected target path:

```text
$CODEX_HOME/skills/goal-todo
```

### Option 1: Clone directly

```bash
git clone https://github.com/Cooper-X-Oak/goal-to-do.git "$CODEX_HOME/skills/goal-todo"
```

### Option 2: Copy an existing checkout

```text
goal-to-do/
  SKILL.md
  agents/openai.yaml
```

As long as those files exist under `$CODEX_HOME/skills/goal-todo`, Codex can load the skill.

## How To Use

Ask for the skill by name, or use language that clearly matches its purpose.

Example prompts:

- `帮我把这个任务整理成一个 /goal prompt`
- `这个目标很长期，先帮我定义清楚`
- `I want Codex to drive this, but first define the boundaries`
- `Before we execute, turn this into a proper long-running goal`

## What A Good First Run Looks Like

Expected flow:

1. Codex asks structured questions about the kind of goal you want
2. you choose options for autonomy, finish line, scope, and risk
3. Codex returns one final `/goal ...` prompt

The default deliverable is the `/goal` prompt itself, not a report around it.

## Plain-Text Fallback

If `request_user_input` is unavailable, the skill can ask for a reply like this:

```text
shape=ship_change
autonomy=tight_then_loose
finish=single_clear_deliverable

scope=balanced
risk=conservative
checkpoints=scope_and_review
```

See [examples/plain-text-fallback.txt](./examples/plain-text-fallback.txt).

## Full Example

See [examples/session-example.md](./examples/session-example.md) for a realistic end-to-end interaction, from vague task to final `/goal` prompt.

## What Makes This A Complete Skill

For a Codex skill, the complete portable unit is usually:

1. `SKILL.md`
2. any agent metadata under `agents/`
3. enough documentation for installation and invocation
4. examples that show expected interaction shape

This repository includes all four.

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

MIT
