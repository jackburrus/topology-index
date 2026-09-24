---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/hierarchical_delegation/findings.md
description: 'What published studies found about hierarchical_delegation, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/hierarchical_delegation/findings.md
pattern: hierarchical_delegation
pattern_index: /patterns/index.md
pattern_page: /patterns/hierarchical_delegation.md
product_api_version: v1
published_findings:
  - benchmarks:
      - HumanEval
      - MBPP
      - SoftwareDev
    compared_against: 'Chat-based multi-agent frameworks such as ChatDev and AgentVerse, and single models'
    direction: helped
    source_id: arxiv:2308.00352
    task_domain: 'Software engineering and code generation'
    task_domains:
      - coding
    url: https://arxiv.org/abs/2308.00352
  - benchmarks:
      - HumanEval
      - CIAR
      - CommonMT
      - FairEval
    compared_against: 'Linear and flat multi-agent structures'
    direction: helped
    source_id: arxiv:2408.00989
    task_domain: 'Code generation, math, translation and text evaluation'
    task_domains:
      - coding
      - reasoning
      - evaluation
    url: https://arxiv.org/abs/2408.00989
  - benchmarks:
      - MMLU
      - WikiQA
      - Camera
    compared_against: 'Strong reasoning models and multi-agent frameworks such as AgentVerse'
    direction: helped
    source_id: arxiv:2502.11098
    task_domain: 'Question answering and advertisement text generation'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2502.11098
  - benchmarks: []
    compared_against: 'A single centralized decision-maker with equivalent information access'
    direction: hurt
    source_id: arxiv:2603.26993
    task_domain: 'Multi-stage planning and decision making'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2603.26993
  - benchmarks:
      - MAST-Data
    compared_against: 'The unmodified ChatDev configuration'
    direction: no_clear_gain
    source_id: arxiv:2503.13657
    task_domain: 'Software development tasks'
    task_domains:
      - coding
    url: https://arxiv.org/abs/2503.13657
  - benchmarks: []
    compared_against: 'A single agent with the same model and no vulnerability description, and ablations without the task-specific agents or the hierarchy'
    direction: helped
    source_id: arxiv:2406.01637
    task_domain: 'Offensive security: exploiting unknown real-world web vulnerabilities'
    task_domains:
      - security
    url: https://arxiv.org/abs/2406.01637
  - benchmarks:
      - CVE-Bench
    compared_against: 'The Cybench single agent and AutoGPT under the same model and iteration budget'
    direction: mixed
    source_id: arxiv:2503.17332
    task_domain: 'Offensive security: exploiting real-world web application vulnerabilities'
    task_domains:
      - security
    url: https://arxiv.org/abs/2503.17332
schema_version: v0.1
title: 'Published findings on the hierarchical_delegation multi-agent pattern'
---

# Published findings on the hierarchical_delegation multi-agent pattern

The findings filed under the [hierarchical_delegation](/patterns/hierarchical_delegation.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — The authors report that encoding standardized operating procedures into an assembly line of role agents produced more coherent software solutions than earlier chat-based multi-agent systems and used fewer tokens per line of code than ChatDev, though more tokens in total.
  Compared against: Chat-based multi-agent frameworks such as ChatDev and AgentVerse, and single models. Domain: Software engineering and code generation. Benchmarks: HumanEval, MBPP, SoftwareDev.
  Caveat: Evaluated largely by the framework's authors, including on a self-constructed software task set.
  Source: [MetaGPT: Meta Programming for A Multi-Agent Collaborative Framework](https://arxiv.org/abs/2308.00352), Hong et al., 2023-08-01.
- **Helped** — The authors report that a mixed hierarchical structure lost the least performance when faulty agents were injected, while one-way linear pipelines such as MetaGPT-style chains lost the most.
  Compared against: Linear and flat multi-agent structures. Domain: Code generation, math, translation and text evaluation. Benchmarks: HumanEval, CIAR, CommonMT, FairEval.
  Caveat: Structures were represented by a handful of existing systems that differ in more than topology, and robustness under injected errors is not the same as baseline accuracy.
  Source: [On the Resilience of LLM-Based Multi-Agent Collaboration with Faulty Agents](https://arxiv.org/abs/2408.00989), Huang et al., 2024-08-02.
- **Helped** — The authors report that a supervisor-led hierarchy with a nested evaluation team and structured messages outperformed strong single-model and multi-agent baselines across their tasks.
  Compared against: Strong reasoning models and multi-agent frameworks such as AgentVerse. Domain: Question answering and advertisement text generation. Benchmarks: MMLU, WikiQA, Camera.
  Caveat: The authors themselves flag a very high API cost for the experiments.
  Source: [Talk Structurally, Act Hierarchically: A Collaborative Framework for LLM Multi-Agent Systems](https://arxiv.org/abs/2502.11098), Wang et al., 2025-02-16.
- **Hurt** — The authors argue that multi-stage LLM planning networks that pass limited language messages lose information at each hand-off and, absent new external signals, cannot beat a single centralized decision-maker with the same information.
  Compared against: A single centralized decision-maker with equivalent information access. Domain: Multi-stage planning and decision making.
  Caveat: Primarily a theoretical technical note with small controlled experiments rather than a large empirical benchmark study.
  Source: [On the Reliability Limits of LLM-Based Multi-Agent Planning](https://arxiv.org/abs/2603.26993), Ao, Gao, Simchi-Levi, 2026-03-27.
- **No clear gain** — The authors report that improving role specifications in the role-hierarchy framework ChatDev produced only a modest gain in task success, and conclude that many failures stem from organizational design and coordination rather than individual agent ability.
  Compared against: The unmodified ChatDev configuration. Domain: Software development tasks. Benchmarks: MAST-Data.
  Caveat: A single intervention case study rather than a systematic comparison of hierarchy depths.
  Source: [Why Do Multi-Agent LLM Systems Fail?](https://arxiv.org/abs/2503.13657), Cemri et al., 2025-03-17.
- **Helped** — Zhu and colleagues report that a hierarchical planner dispatching task-specific expert agents exploited real-world web vulnerabilities without being told what they were far more often than a single agent, and that removing the expert agents or the hierarchy sharply reduced success.
  Compared against: A single agent with the same model and no vulnerability description, and ablations without the task-specific agents or the hierarchy. Domain: Offensive security: exploiting unknown real-world web vulnerabilities.
  Caveat: Author-built benchmark of a small set of reproducible open-source web vulnerabilities, which the authors note may be a biased sample.
  Source: [Teams of LLM Agents can Exploit Zero-Day Vulnerabilities](https://arxiv.org/abs/2406.01637), Zhu et al., 2024-06-02.
- **Mixed** — Zhu and colleagues report that a hierarchical team of specialised agents exploited more real-world web vulnerabilities than an agent built for capture-the-flag tasks, while a general single agent with self-criticism achieved the highest success rate.
  Compared against: The Cybench single agent and AutoGPT under the same model and iteration budget. Domain: Offensive security: exploiting real-world web application vulnerabilities. Benchmarks: CVE-Bench.
  Caveat: The team framework comes from the same research group, and all success rates are low.
  Source: [CVE-Bench: A Benchmark for AI Agents' Ability to Exploit Real-World Web Application Vulnerabilities](https://arxiv.org/abs/2503.17332), Zhu et al., 2025-03-21.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
