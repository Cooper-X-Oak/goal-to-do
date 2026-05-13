# Session Example

This example shows how `goal-todo` should feel in practice.

## User Request

```text
I want Codex to help me modernize our internal deployment workflow, but I do not want it to start changing code until the scope and stop points are clear.
```

## Alignment Round 1

Possible structured choices:

- Goal Shape: `Ship a Change`
- Autonomy Style: `Tight Then Loose`
- Finish Line: `Milestone Sequence`

## Alignment Round 2

Possible structured choices:

- Scope Level: `Balanced Scope`
- Risk Posture: `Conservative`
- Decision Checkpoints: `Scope + Review Gate`

## Final Output

```text
/goal Define and execute a bounded modernization of the internal deployment workflow. Start by confirming the current workflow boundaries, stakeholders, and success criteria. Keep scope focused on the deployment path itself; do not expand into unrelated infrastructure cleanup unless it is required to complete the workflow safely. Work in a tight-then-loose autonomy curve: align closely at the start, then execute autonomously once direction is stable. Stop for input at two checkpoints: after scope confirmation and before finalizing the delivered workflow changes. Success means the deployment workflow is documented or implemented as agreed, validation steps are clear, risks are called out, and the result is ready for handoff without requiring a separate planning memo.
```

## Plain-Text Fallback Variant

If clickable choices are unavailable, the user can reply:

```text
shape=ship_change
autonomy=tight_then_loose
finish=milestone_sequence

scope=balanced
risk=conservative
checkpoints=scope_and_review
```
