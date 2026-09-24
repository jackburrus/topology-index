---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/role_pipeline/findings.md
description: 'What published studies found about role_pipeline, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/role_pipeline/findings.md
pattern: role_pipeline
pattern_index: /patterns/index.md
pattern_page: /patterns/role_pipeline.md
product_api_version: v1
published_findings:
  - benchmarks:
      - SRDD
    compared_against: 'GPT-Engineer, a single-agent approach, and the MetaGPT multi-agent framework'
    direction: helped
    source_id: arxiv:2307.07924
    task_domain: 'Software development from natural-language requirements'
    task_domains:
      - coding
    url: https://arxiv.org/abs/2307.07924
  - benchmarks:
      - HumanEval
      - MBPP
      - APPS
      - CodeContests
      - xCodeEval
    compared_against: 'Direct, chain-of-thought, self-planning, analogical and Reflexion prompting, and the Self-collaboration and AlphaCodium frameworks'
    direction: helped
    source_id: arxiv:2405.11403
    task_domain: 'Competitive programming and program synthesis'
    task_domains:
      - coding
    url: https://arxiv.org/abs/2405.11403
  - benchmarks:
      - HumanEval
      - CIAR
      - CommonMT
      - FairEval
    compared_against: 'Flat and hierarchical multi-agent structures under the same injected faults'
    direction: hurt
    source_id: arxiv:2408.00989
    task_domain: 'Code generation, math, translation and text evaluation'
    task_domains:
      - coding
      - reasoning
      - evaluation
    url: https://arxiv.org/abs/2408.00989
schema_version: v0.1
title: 'Published findings on the role_pipeline multi-agent pattern'
---

# Published findings on the role_pipeline multi-agent pattern

The findings filed under the [role_pipeline](/patterns/role_pipeline.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — The authors report that a chat chain moving specialised agents through design, coding and testing phases produced more complete, executable and consistent software than a single-agent tool and than MetaGPT, and that removing the agents’ roles caused the largest drop in their ablation.
  Compared against: GPT-Engineer, a single-agent approach, and the MetaGPT multi-agent framework. Domain: Software development from natural-language requirements. Benchmarks: SRDD.
  Caveat: Evaluated on the authors’ own requirement dataset with proxy metrics and pairwise preference judgements rather than executed test suites.
  Source: [ChatDev: Communicative Agents for Software Development](https://arxiv.org/abs/2307.07924), Qian et al., 2023-07-16.
- **Helped** — The authors report that a pipeline of agents that recall similar problems, plan, write code and debug it outperformed direct, chain-of-thought, planning and reflection prompting and earlier multi-agent frameworks across several models, and that removing any one agent lowered the result, the debugging agent most.
  Compared against: Direct, chain-of-thought, self-planning, analogical and Reflexion prompting, and the Self-collaboration and AlphaCodium frameworks. Domain: Competitive programming and program synthesis. Benchmarks: HumanEval, MBPP, APPS, CodeContests, xCodeEval.
  Caveat: The authors note that it generates many tokens, the comparison is not matched for compute, and a failed debugging stage loops back to the next plan, so the chain is not strictly one-way.
  Source: [MapCoder: Multi-Agent Code Generation for Competitive Problem Solving](https://arxiv.org/abs/2405.11403), Islam et al., 2024-05-18.
- **Hurt** — The authors report that one-way linear chains of agents lost the most performance when faulty agents were injected, while a structure in which a leader directs two peers that talk to each other lost the least.
  Compared against: Flat and hierarchical multi-agent structures under the same injected faults. Domain: Code generation, math, translation and text evaluation. Benchmarks: HumanEval, CIAR, CommonMT, FairEval.
  Caveat: Structures were represented by a handful of existing systems that differ in more than topology, and robustness under injected errors is not the same as baseline accuracy.
  Source: [On the Resilience of LLM-Based Multi-Agent Collaboration with Faulty Agents](https://arxiv.org/abs/2408.00989), Huang et al., 2024-08-02.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
