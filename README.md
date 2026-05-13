# Goal Todo

`goal-todo` is a Codex skill for turning a vague, long-running objective into a tight `/goal` prompt.

It is designed for cases where the user wants Codex to keep driving work forward, but the task still needs alignment on scope, autonomy, constraints, and finish line before the long-running goal starts.

## What It Does

- runs a structured alignment round before drafting the final `/goal` prompt
- prefers clickable `request_user_input` choices when the environment supports them
- falls back to concise plain-text templates when structured input is unavailable
- compresses the result into a single paste-ready `/goal` prompt

## Repository Layout

```text
.
├─ SKILL.md
├─ agents/
│  └─ openai.yaml
└─ examples/
   └─ plain-text-fallback.txt
```

## Install

Copy this directory into your Codex skills directory.

Typical location:

```text
$CODEX_HOME/skills/goal-todo
```

On this machine the local source skill lives at:

```text
C:\Users\luoxu\.codex\skills\goal-todo
```

## Usage

Invoke the skill when you want Codex to define the goal before execution starts.

Example prompts:

- `帮我把这个任务整理成一个 /goal prompt`
- `I want Codex to drive this, but first define the boundaries`
- `先别执行，先把目标和完成标准定清楚`

## Interaction Model

The skill is opinionated about sequencing:

1. clarify goal shape, autonomy style, and finish line
2. clarify scope level, risk posture, and checkpoint frequency
3. synthesize a final `/goal` prompt with explicit boundaries and done criteria

The default deliverable is the final `/goal` prompt itself, not a long explanatory memo.

## Example Fallback Reply

When structured input is unavailable, the skill can ask the user to reply like this:

```text
shape=ship_change
autonomy=tight_then_loose
finish=single_clear_deliverable

scope=balanced
risk=conservative
checkpoints=scope_and_review
```

## License

MIT
