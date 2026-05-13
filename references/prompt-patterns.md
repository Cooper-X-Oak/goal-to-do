# Prompt Patterns

Use these examples when you want to trigger `goal-todo` explicitly or naturally.

## Good Trigger Prompts

- `Turn this task into a /goal prompt`
- `This objective is long-running, so define it clearly first`
- `I want Codex to drive this, but align the boundaries first`
- `Before we execute, turn this into a proper long-running goal`
- `I want Codex to drive this, but first define the boundaries`

## Plain-Text Fallback Replies

If structured clickable input is unavailable, reply in two short blocks.

Round 1:

```text
shape=ship_change
autonomy=tight_then_loose
finish=single_clear_deliverable
```

Round 2:

```text
scope=balanced
risk=conservative
checkpoints=scope_and_review
```

## Typical Use Cases

- turn a vague repository task into a bounded delivery goal
- define autonomy and stop points before a long-running task starts
- produce a final `/goal` prompt without making the user copy a long brief
