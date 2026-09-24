---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/blackboard/findings.md
description: 'What published studies found about blackboard, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/blackboard/findings.md
pattern: blackboard
pattern_index: /patterns/index.md
pattern_page: /patterns/blackboard.md
product_api_version: v1
published_findings:
  - benchmarks:
      - MMLU
      - ARC-Challenge
      - GPQA-Diamond
      - BBH
      - MATH
      - GSM8K
    compared_against: 'Chain-of-thought, static multi-agent systems and autonomous multi-agent systems such as GPTSwarm and AFlow'
    direction: helped
    source_id: arxiv:2507.01701
    task_domain: 'Knowledge, scientific, symbolic and math reasoning'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2507.01701
  - benchmarks:
      - KramaBench
      - DSBench
      - DA-Code
    compared_against: 'Master-slave multi-agent coordination, retrieval-augmented generation and a single agent'
    direction: helped
    source_id: arxiv:2510.01285
    task_domain: 'Data discovery in data-science question answering'
    task_domains:
      - research
    url: https://arxiv.org/abs/2510.01285
  - benchmarks:
      - GAIA
    compared_against: 'The full Magentic-One orchestrator with task and progress ledgers'
    direction: hurt
    source_id: arxiv:2411.04468
    task_domain: 'Generalist agentic tasks'
    task_domains:
      - operations
    url: https://arxiv.org/abs/2411.04468
  - benchmarks: []
    compared_against: 'Ungoverned shared memory and long-context retrieval'
    direction: mixed
    source_id: arxiv:2606.24535
    task_domain: 'Production multi-tenant agent memory'
    task_domains: []
    url: https://arxiv.org/abs/2606.24535
schema_version: v0.1
title: 'Published findings on the blackboard multi-agent pattern'
---

# Published findings on the blackboard multi-agent pattern

The findings filed under the [blackboard](/patterns/blackboard.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — The authors report that a blackboard system in which agents read and write a shared public space, with agents selected based on its contents, matched or beat static and autonomous multi-agent systems on average while using comparatively few tokens.
  Compared against: Chain-of-thought, static multi-agent systems and autonomous multi-agent systems such as GPTSwarm and AFlow. Domain: Knowledge, scientific, symbolic and math reasoning. Benchmarks: MMLU, ARC-Challenge, GPQA-Diamond, BBH, MATH, GSM8K.
  Caveat: The authors note limited agent types without tool use and few benchmarks, and 'competitive' is not a consistent win.
  Source: [Exploring Advanced LLM Multi-Agent Systems Based on Blackboard Architecture](https://arxiv.org/abs/2507.01701), Han and Zhang, 2025-07-02.
- **Helped** — The authors report that letting sub-agents volunteer answers to requests posted on a shared blackboard beat a central controller that assigns tasks, as well as retrieval and single-agent baselines, for finding relevant data, at a higher cost per question than the controller design.
  Compared against: Master-slave multi-agent coordination, retrieval-augmented generation and a single agent. Domain: Data discovery in data-science question answering. Benchmarks: KramaBench, DSBench, DA-Code.
  Caveat: Tested on data-lake discovery tasks by the proposing authors, and it cost more per question than the master-slave baseline.
  Source: [LLM-Based Multi-Agent Blackboard System for Information Discovery in Data Science](https://arxiv.org/abs/2510.01285), Salemi et al., 2025-09-30.
- **Hurt** — The authors report that replacing the Magentic-One orchestrator's ledgers with AutoGen's basic group chat, where a selector only picks the next speaker on a shared transcript, markedly lowered performance.
  Compared against: The full Magentic-One orchestrator with task and progress ledgers. Domain: Generalist agentic tasks. Benchmarks: GAIA.
  Caveat: A single ablation on one validation split with one model, run by the system's own authors.
  Source: [Magentic-One: A Generalist Multi-Agent System for Solving Complex Tasks](https://arxiv.org/abs/2411.04468), Fourney et al. (Microsoft Research), 2024-11-07.
- **Mixed** — The authors identify leakage, stale propagation, persistent contradictions and provenance collapse as failure modes of shared multi-agent memory and report that long-context retrieval alone is insufficient, with live testing exposing enforcement gaps.
  Compared against: Ungoverned shared memory and long-context retrieval. Domain: Production multi-tenant agent memory.
  Caveat: A systems paper evaluating its own production service rather than a controlled task-accuracy comparison.
  Source: [Governed Shared Memory for Multi-Agent LLM Systems](https://arxiv.org/abs/2606.24535), Margalit et al., 2026-06-23.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
