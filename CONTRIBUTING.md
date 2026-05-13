# Contributing

Thanks for contributing to `goal-todo`.

## Design Constraints

This repository is small on purpose. Do not add framework code or extra tooling unless the skill actually needs them.

The skill should continue to:

- ask structured, high-signal questions
- reduce ambiguity before writing the final `/goal` prompt
- prefer explicit tradeoffs over open-ended brainstorming
- keep the final user-facing output focused on a single `/goal` prompt

## Repository Rules

- keep `skills/goal-todo/SKILL.md` as the source of truth for behavior
- keep repository-level docs in `references/` and examples in `examples/`
- keep examples realistic and short
- preserve ASCII unless a file already needs another character set
- document user-visible behavior changes in `README.md`

## Testing

There is no executable test suite for this repository.

For changes, verify manually that:

1. the install path is still obvious
2. the invocation examples still match the skill behavior
3. the final output contract remains a single `/goal` prompt unless explicitly expanded
