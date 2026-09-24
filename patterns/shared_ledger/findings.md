---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/shared_ledger/findings.md
description: 'What published studies found about shared_ledger, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/shared_ledger/findings.md
pattern: shared_ledger
pattern_index: /patterns/index.md
pattern_page: /patterns/shared_ledger.md
product_api_version: v1
published_findings:
  - benchmarks:
      - GAIA
    compared_against: 'The same agents coordinated by a basic group chat without ledgers'
    direction: helped
    source_id: arxiv:2411.04468
    task_domain: 'Generalist agentic tasks'
    task_domains:
      - operations
    url: https://arxiv.org/abs/2411.04468
  - benchmarks:
      - ALFWorld
    compared_against: 'LangGraph and Flock multi-agent baselines'
    direction: helped
    source_id: arxiv:2605.29313
    task_domain: 'Embodied household tasks'
    task_domains: []
    url: https://arxiv.org/abs/2605.29313
  - benchmarks: []
    compared_against: 'Agents working without persistent progress artifacts'
    direction: mixed
    source_id: web:anthropic.com/engineering/effective-harnesses-for-long-running-agents
    task_domain: 'Long-running software development'
    task_domains:
      - coding
    url: https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents
schema_version: v0.1
title: 'Published findings on the shared_ledger multi-agent pattern'
---

# Published findings on the shared_ledger multi-agent pattern

The findings filed under the [shared_ledger](/patterns/shared_ledger.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — The authors report that Magentic-One's orchestrator, which maintains a task ledger of facts and plans and a progress ledger checked each step, performed markedly better than a variant with both ledgers removed.
  Compared against: The same agents coordinated by a basic group chat without ledgers. Domain: Generalist agentic tasks. Benchmarks: GAIA.
  Caveat: The ablation removes planning, loop detection and explicit instructions along with the ledgers, so the ledger's own contribution is not isolated.
  Source: [Magentic-One: A Generalist Multi-Agent System for Solving Complex Tasks](https://arxiv.org/abs/2411.04468), Fourney et al. (Microsoft Research), 2024-11-07.
- **Helped** — The authors report that coordinating agents through validated, attributable patch mutations to a shared structured state achieved higher success with far fewer tokens per solved task than graph-based and dialogue-based framework baselines.
  Compared against: LangGraph and Flock multi-agent baselines. Domain: Embodied household tasks. Benchmarks: ALFWorld.
  Caveat: Recent single-benchmark result from the proposing authors that has not been independently replicated.
  Source: [PatchBoard: Schema-Grounded State Mutation for Reliable and Auditable LLM Multi-Agent Collaboration](https://arxiv.org/abs/2605.29313), Zhang et al., 2026-05-28.
- **Mixed** — Anthropic reports that a progress log, a feature list and git history shared across successive agent sessions helped long-running coding agents resume work, but agents still declared victory early or marked features complete without end-to-end testing.
  Compared against: Agents working without persistent progress artifacts. Domain: Long-running software development.
  Caveat: Vendor engineering report with qualitative observations only and no measured comparison.
  Source: [Anthropic Engineering: Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents), Justin Young (Anthropic), 2025-11-26.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
