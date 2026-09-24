---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/architecture_search/findings.md
description: 'What published studies found about architecture_search, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/architecture_search/findings.md
pattern: architecture_search
pattern_index: /patterns/index.md
pattern_page: /patterns/architecture_search.md
product_api_version: v1
published_findings:
  - benchmarks:
      - DROP
      - MGSM
    compared_against: 'State-of-the-art hand-designed agents'
    direction: helped
    source_id: arxiv:2408.08435
    task_domain: 'Reading comprehension, math, science and coding'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2408.08435
  - benchmarks: []
    compared_against: 'Human-designed agents, accounting for design plus deployment cost'
    direction: hurt
    source_id: arxiv:2510.06711
    task_domain: 'Automated agent design across several datasets'
    task_domains: []
    url: https://arxiv.org/abs/2510.06711
  - benchmarks: []
    compared_against: 'Manually designed workflows and prior automated methods'
    direction: helped
    source_id: arxiv:2410.10762
    task_domain: 'Question answering, code generation and math'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2410.10762
  - benchmarks: []
    compared_against: 'Handcrafted and automated multi-agent systems'
    direction: helped
    source_id: arxiv:2502.04180
    task_domain: 'Math, coding and tool use'
    task_domains:
      - coding
      - reasoning
      - operations
    url: https://arxiv.org/abs/2502.04180
  - benchmarks:
      - MATH
      - DROP
      - HotpotQA
      - MuSiQue
      - '2WikiMQA'
      - MBPP
      - HumanEval
      - LiveCodeBench
    compared_against: 'Unoptimized topologies and agent-scaling strategies such as self-consistency and debate'
    direction: mixed
    source_id: arxiv:2502.02533
    task_domain: 'Reasoning, multi-hop question answering and coding'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2502.02533
schema_version: v0.1
title: 'Published findings on the architecture_search multi-agent pattern'
---

# Published findings on the architecture_search multi-agent pattern

The findings filed under the [architecture_search](/patterns/architecture_search.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — ADAS reports that agents discovered by a meta agent programming new designs in code outperformed hand-designed agents and kept their advantage when transferred across domains and models.
  Compared against: State-of-the-art hand-designed agents. Domain: Reading comprehension, math, science and coding. Benchmarks: DROP, MGSM.
  Caveat: Search cost is not weighed against the gains in the abstract, and later work questions its cost-effectiveness.
  Source: [Automated Design of Agentic Systems](https://arxiv.org/abs/2408.08435), Hu, Lu, Clune, 2024-08-15.
- **Hurt** — El and colleagues report that meta-agent design pays for itself against human-designed agents only on a small minority of datasets, and that feeding all prior designs into context performs worse than ignoring them.
  Compared against: Human-designed agents, accounting for design plus deployment cost. Domain: Automated agent design across several datasets.
  Caveat: Analyzes a particular family of meta-agent methods; conclusions depend on deployment volume assumptions.
  Source: [Inefficiencies of Meta Agents for Agent Design](https://arxiv.org/abs/2510.06711), El, Yuksekgonul, Zou, 2025-10-08.
- **Helped** — AFlow reports that Monte Carlo tree search over code-represented workflows beat prior baselines and let smaller models outperform a much larger model on some tasks at a fraction of its inference cost.
  Compared against: Manually designed workflows and prior automated methods. Domain: Question answering, code generation and math.
  Caveat: Author-run evaluation; the cheaper-model result holds only on specific tasks.
  Source: [AFlow: Automating Agentic Workflow Generation](https://arxiv.org/abs/2410.10762), Zhang et al., 2024-10-14.
- **Helped** — MaAS reports that sampling query-dependent agent architectures from a learned supernet matched or beat existing systems while using only a fraction of their inference cost, with cross-dataset and cross-model transfer.
  Compared against: Handcrafted and automated multi-agent systems. Domain: Math, coding and tool use.
  Caveat: Author-run comparison; some reported accuracy gains are small.
  Source: [Multi-agent Architecture Search via Agentic Supernet](https://arxiv.org/abs/2502.04180), Zhang et al., 2025-02-06.
- **Mixed** — MASS reports that only a small fraction of topologies improved performance, with most failing to help or degrading it, and that prompt optimization was more token-effective than scaling agent count.
  Compared against: Unoptimized topologies and agent-scaling strategies such as self-consistency and debate. Domain: Reasoning, multi-hop question answering and coding. Benchmarks: MATH, DROP, HotpotQA, MuSiQue, 2WikiMQA, MBPP, HumanEval, LiveCodeBench.
  Caveat: Findings come from one search framework and a limited set of model backbones.
  Source: [Multi-Agent Design: Optimizing Agents with Better Prompts and Topologies](https://arxiv.org/abs/2502.02533), Zhou et al., 2025-02-04.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
