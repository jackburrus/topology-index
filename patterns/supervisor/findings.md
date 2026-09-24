---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/supervisor/findings.md
description: 'What published studies found about supervisor, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/supervisor/findings.md
pattern: supervisor
pattern_index: /patterns/index.md
pattern_page: /patterns/supervisor.md
product_api_version: v1
published_findings:
  - benchmarks: []
    compared_against: 'A single agent using the same model as the lead agent'
    direction: helped
    source_id: web:anthropic.com/engineering/multi-agent-research-system
    task_domain: 'Open-ended web research'
    task_domains:
      - research
    url: https://www.anthropic.com/engineering/multi-agent-research-system
  - benchmarks:
      - GAIA
      - AssistantBench
      - WebArena
    compared_against: 'Published state-of-the-art agent systems on each benchmark'
    direction: no_clear_gain
    source_id: arxiv:2411.04468
    task_domain: 'Generalist web, file and coding tasks'
    task_domains:
      - coding
      - operations
    url: https://arxiv.org/abs/2411.04468
  - benchmarks:
      - Finance-Agent
      - PlanCraft
      - BrowseComp-Plus
      - Workbench
      - 'SWE-bench Verified'
      - Terminal-Bench
    compared_against: 'Single-agent systems and independent, decentralized and hybrid multi-agent architectures'
    direction: mixed
    source_id: arxiv:2512.08296
    task_domain: 'Agentic benchmarks spanning finance, web browsing, planning, workplace, software and terminal tasks'
    task_domains:
      - coding
      - research
      - reasoning
      - operations
    url: https://arxiv.org/abs/2512.08296
  - benchmarks: []
    compared_against: 'Single-agent approaches'
    direction: helped
    source_id: arxiv:2412.05449
    task_domain: 'Enterprise assistant scenarios'
    task_domains:
      - operations
    url: https://arxiv.org/abs/2412.05449
  - benchmarks:
      - MAST-Data
    compared_against: 'Expected task success of the same frameworks'
    direction: hurt
    source_id: arxiv:2503.13657
    task_domain: 'Coding, math and general agent tasks across several open-source multi-agent frameworks'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2503.13657
  - benchmarks:
      - AIxCC
    compared_against: 'A single-agent patcher, a fixed workflow and a general-purpose coding agent on the same tasks'
    direction: mixed
    source_id: arxiv:2603.01257
    task_domain: 'Security: repairing real-world vulnerabilities in large Java projects'
    task_domains:
      - coding
      - security
    url: https://arxiv.org/abs/2603.01257
schema_version: v0.1
title: 'Published findings on the supervisor multi-agent pattern'
---

# Published findings on the supervisor multi-agent pattern

The findings filed under the [supervisor](/patterns/supervisor.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — Anthropic reports that its lead-agent-plus-subagents research system substantially outperformed a single agent using the stronger lead model on its internal research evaluation.
  Compared against: A single agent using the same model as the lead agent. Domain: Open-ended web research.
  Caveat: Vendor self-report on an unpublished internal evaluation with no public replication.
  Source: [Anthropic Engineering: How we built our multi-agent research system](https://www.anthropic.com/engineering/multi-agent-research-system), Hadfield et al. (Anthropic), 2025-06-13.
- **No clear gain** — The authors report that their orchestrator-led team of specialist agents achieved performance statistically comparable to, not better than, state-of-the-art systems on general agentic benchmarks, and trailed the top entries on one web benchmark.
  Compared against: Published state-of-the-art agent systems on each benchmark. Domain: Generalist web, file and coding tasks. Benchmarks: GAIA, AssistantBench, WebArena.
  Caveat: First-party evaluation by the system's builders against heterogeneous published baselines rather than matched single-agent controls.
  Source: [Magentic-One: A Generalist Multi-Agent System for Solving Complex Tasks](https://arxiv.org/abs/2411.04468), Fourney et al. (Microsoft Research), 2024-11-07.
- **Mixed** — The authors report that centralized orchestration strongly helped on decomposable financial reasoning but degraded performance on sequential planning, while containing error amplification far better than independent agents at a large token overhead.
  Compared against: Single-agent systems and independent, decentralized and hybrid multi-agent architectures. Domain: Agentic benchmarks spanning finance, web browsing, planning, workplace, software and terminal tasks. Benchmarks: Finance-Agent, PlanCraft, BrowseComp-Plus, Workbench, SWE-bench Verified, Terminal-Bench.
  Caveat: Results depend on the chosen model families and benchmark set, and the fitted predictive model explains only part of the variance.
  Source: [Towards a Science of Scaling Agent Systems](https://arxiv.org/abs/2512.08296), Kim et al., 2025-12-09.
- **Helped** — The authors report that multi-agent collaboration with a supervisor agent raised goal success over single-agent setups and that a routing mode reduced latency.
  Compared against: Single-agent approaches. Domain: Enterprise assistant scenarios.
  Caveat: Vendor technical report on handcrafted scenarios from a few enterprise domains, evaluated on its own product.
  Source: [Towards Effective GenAI Multi-Agent Collaboration: Design and Evaluation for Enterprise Applications](https://arxiv.org/abs/2412.05449), Shu et al. (AWS), 2024-12-06.
- **Hurt** — The authors report that popular multi-agent frameworks, including orchestrator-led ones, fail often, with failures clustering into system design, inter-agent misalignment and task verification problems rather than only underlying model weakness.
  Compared against: Expected task success of the same frameworks. Domain: Coding, math and general agent tasks across several open-source multi-agent frameworks. Benchmarks: MAST-Data.
  Caveat: A failure taxonomy built from annotated traces, not a controlled comparison of topologies against a single-agent baseline.
  Source: [Why Do Multi-Agent LLM Systems Fail?](https://arxiv.org/abs/2503.13657), Cemri et al., 2025-03-17.
- **Mixed** — Xu and colleagues report that a multi-agent patching system did not consistently beat a well-designed single agent, winning with one model and losing with another at higher overhead, while a general-purpose coding agent patched the most vulnerabilities.
  Compared against: A single-agent patcher, a fixed workflow and a general-purpose coding agent on the same tasks. Domain: Security: repairing real-world vulnerabilities in large Java projects. Benchmarks: AIxCC.
  Caveat: A small set of vulnerabilities from one competition, with each architecture reimplemented by the authors.
  Source: [A Systematic Study of LLM-Based Architectures for Automated Patching](https://arxiv.org/abs/2603.01257), Xu, Sheng, Chen, Huang, 2026-03-01.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
