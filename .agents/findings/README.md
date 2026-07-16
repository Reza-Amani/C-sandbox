# Findings

Durable records of **discoveries, analyses, and investigations** — what question
was asked, how it was answered, and what the result was.

Examples in C-sandbox: comparing `gcc` vs `cl` warning output, measuring struct
padding, or documenting undefined behavior observed in an experiment.

> Findings are **not** decisions and **not** mechanics. A decision goes in
> [`../adr/`](../adr/); how the repo is laid out goes in
> [`../reference/`](../reference/). A finding records a specific question and its
> answer at a point in time.

## Naming

Use dated, descriptive Markdown files:

- `YYYY-MM-DD-topic.md`

Example-only placeholder material may live under `example/`. Do not put real
findings there.

## What belongs in a finding

- **Question:** what was asked and why.
- **Method:** the code, flags, or tools used.
- **Result:** what you observed.
- **Caveats:** compiler version, assumptions, open questions.

## What does not belong here

- Decisions → [`../adr/`](../adr/)
- Repo layout / compile flow → [`../reference/`](../reference/)
- Backlog work → [`../plans/`](../plans/)
- Teach sessions → [`../learning/`](../learning/)

## Promote durable insights

If a finding leads to a lasting decision, write an ADR and link back.
