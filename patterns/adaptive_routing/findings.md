---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/adaptive_routing/findings.md
description: 'What published studies found about adaptive_routing, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/adaptive_routing/findings.md
pattern: adaptive_routing
pattern_index: /patterns/index.md
pattern_page: /patterns/adaptive_routing.md
product_api_version: v1
published_findings:
  - benchmarks:
      - 'MT Bench'
      - MMLU
      - GSM8K
    compared_against: 'Always using the strong model'
    direction: helped
    source_id: arxiv:2406.18665
    task_domain: 'General chat, knowledge and math questions'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2406.18665
  - benchmarks: []
    compared_against: 'The best individual LLM API'
    direction: helped
    source_id: arxiv:2305.05176
    task_domain: 'Classification and question answering tasks'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2305.05176
  - benchmarks:
      - MBPP
      - HumanEval
    compared_against: 'Prior multi-agent routing and system design methods'
    direction: helped
    source_id: arxiv:2502.11133
    task_domain: 'Code generation, math and reasoning'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2502.11133
  - benchmarks: []
    compared_against: 'State-of-the-art learned routers'
    direction: no_clear_gain
    source_id: arxiv:2505.12601
    task_domain: 'Model routing across diverse text and multimodal tasks'
    task_domains: []
    url: https://arxiv.org/abs/2505.12601
schema_version: v0.1
title: 'Published findings on the adaptive_routing multi-agent pattern'
---

# Published findings on the adaptive_routing multi-agent pattern

The findings filed under the [adaptive_routing](/patterns/adaptive_routing.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — RouteLLM reports that learned routers choosing between a strong and a weak model substantially reduced cost without compromising response quality and transferred when the model pair changed.
  Compared against: Always using the strong model. Domain: General chat, knowledge and math questions. Benchmarks: MT Bench, MMLU, GSM8K.
  Caveat: Routes between models for single queries rather than between agents, and gains vary by benchmark.
  Source: [RouteLLM: Learning to Route LLMs with Preference Data](https://arxiv.org/abs/2406.18665), Ong et al., 2024-06-26.
- **Helped** — FrugalGPT reports that a learned cascade over LLM APIs could match the best single model at a small fraction of the cost or improve accuracy at equal cost.
  Compared against: The best individual LLM API. Domain: Classification and question answering tasks.
  Caveat: Evaluated on older model APIs and pricing, and cascades are a sequential form of routing.
  Source: [FrugalGPT: How to Use Large Language Models While Reducing Cost and Improving Performance](https://arxiv.org/abs/2305.05176), Chen, Zaharia, Zou, 2023-05-09.
- **Helped** — MasRouter reports that jointly routing collaboration mode, roles and LLMs in a multi-agent system improved accuracy and reduced overhead versus prior methods.
  Compared against: Prior multi-agent routing and system design methods. Domain: Code generation, math and reasoning. Benchmarks: MBPP, HumanEval.
  Caveat: Author-run comparison with modest accuracy gains.
  Source: [MasRouter: Learning to Route LLMs for Multi-Agent Systems](https://arxiv.org/abs/2502.11133), Yue et al., 2025-02-16.
- **No clear gain** — Li reports that a well-tuned k-nearest-neighbors router matches and often beats complex learned routers.
  Compared against: State-of-the-art learned routers. Domain: Model routing across diverse text and multimodal tasks.
  Caveat: Addresses router complexity rather than whether routing beats a single strong model.
  Source: [Rethinking Predictive Modeling for LLM Routing: When Simple kNN Beats Complex Learned Routers](https://arxiv.org/abs/2505.12601), Yang Li, 2025-05-19.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
