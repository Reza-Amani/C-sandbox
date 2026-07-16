# Routing Guide

Single source of truth for discovering manifest documents. Maps a task to the
**specific** ADR, reference, skill, persona, plan, learning record, or action
that covers it.

**Context discipline:** Do not bulk-read the manifest. Open a specific file
**only when the current task touches its domain.** ADRs are the authority;
reference docs explain mechanics. ADRs > reference notes.

For project-wide mandates, see the root [`AGENTS.md`](../../AGENTS.md). For
project-wide terminology, see [`terms.rule.md`](terms.rule.md).

## Task → Rules

- Project-wide terminology → [`terms.rule.md`](terms.rule.md)
- Manifest structure; when editing manifest files → [`manifest-structure.rule.md`](manifest-structure.rule.md)

## Task → ADR (decisions)

- How and why we record decisions → [`adr/0000-record-architecture-decisions.adr.md`](../adr/0000-record-architecture-decisions.adr.md)
- Source layout and where experiments live → [`adr/0001-flat-source-layout.adr.md`](../adr/0001-flat-source-layout.adr.md)
- Primary Windows compiler and toolchain → [`adr/0002-mingw-gcc-toolchain.adr.md`](../adr/0002-mingw-gcc-toolchain.adr.md)

## Task → Reference (mechanics)

- Source folders, build outputs, and compile flow → [`reference/build-layout.ref.md`](../reference/build-layout.ref.md)

## Task → Skill (multi-step procedures)

- Add a new C experiment (source file, compile, run) → [`skills/add-c-experiment`](../skills/add-c-experiment/SKILL.md)

## Task → Learning (teach session records)

- Record or resume a `teach` skill session → under [`learning`](../learning); managed by the `teach` skill only.

## Task → Findings (analysis & investigation records)

- Record a finding or resume an investigation → [`findings/README.md`](../findings/README.md)

## Task → Action (one-step checks)

- Verify docs match code before declaring done → [`actions/verify-docs-in-sync.md`](../actions/verify-docs-in-sync.md)

## Task → Plan (multi-step work across sessions)

- Canonical backlog → [`plans/backlog.plan.md`](../plans/backlog.plan.md)
- When creating a plan per user request, save it under `plans/` with a `.plan.md`
  suffix. When continuing or editing a plan, look there first.

## Specialized agents

- `reviewer` — pre-commit reviewer for correctness, safety, and ADR compliance → [`personas/reviewer.agent.md`](../personas/reviewer.agent.md)
- `manifester` — manifest keeper for `.agents/` docs → [`personas/manifester.agent.md`](../personas/manifester.agent.md)

## Plans & actions

- Multi-session plans live in `plans/`. Backlog: [`plans/backlog.plan.md`](../plans/backlog.plan.md).
- Teach session records: [`learning/README.md`](../learning/README.md).
- Investigation records: [`findings/README.md`](../findings/README.md).
- One-step procedures: [`actions/`](../actions/).
