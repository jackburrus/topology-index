---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/implement_review/findings.md
description: 'What published studies found about implement_review, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/implement_review/findings.md
pattern: implement_review
pattern_index: /patterns/index.md
pattern_page: /patterns/implement_review.md
product_api_version: v1
published_findings:
  - benchmarks:
      - HumanEval
      - APPS
    compared_against: 'Sampling more initial programs at equal budget'
    direction: mixed
    source_id: arxiv:2306.09896
    task_domain: 'Code generation'
    task_domains:
      - coding
    url: https://arxiv.org/abs/2306.09896
  - benchmarks: []
    compared_against: 'Human contractors reviewing code without assistance'
    direction: helped
    source_id: arxiv:2407.00215
    task_domain: 'Code review of model-written code'
    task_domains:
      - coding
      - evaluation
    url: https://arxiv.org/abs/2407.00215
  - benchmarks:
      - HumanEval
      - MBPP
    compared_against: 'Single-model code generation and prompt-engineering enhancement methods'
    direction: helped
    source_id: arxiv:2312.13010
    task_domain: 'Function-level code generation'
    task_domains:
      - coding
    url: https://arxiv.org/abs/2312.13010
  - benchmarks:
      - HumanEval
      - MBPP
    compared_against: 'The same base model acting as a single agent'
    direction: helped
    source_id: arxiv:2304.07590
    task_domain: 'Code generation'
    task_domains:
      - coding
    url: https://arxiv.org/abs/2304.07590
  - benchmarks: []
    compared_against: 'Expectations of benefit from multi-agent frameworks with reviewer or verifier roles'
    direction: no_clear_gain
    source_id: arxiv:2503.13657
    task_domain: 'Coding, math and general agent tasks'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2503.13657
schema_version: v0.1
title: 'Published findings on the implement_review multi-agent pattern'
---

# Published findings on the implement_review multi-agent pattern

The findings filed under the [implement_review](/patterns/implement_review.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Mixed** — The authors report that self-repair gains for code generation were often modest or absent once repair cost was accounted for, but became substantially larger when feedback came from a stronger model or from humans.
  Compared against: Sampling more initial programs at equal budget. Domain: Code generation. Benchmarks: HumanEval, APPS.
  Caveat: Model generations tested are now dated, and the stronger-reviewer and human-feedback conditions were small-scale.
  Source: [Is Self-Repair a Silver Bullet for Code Generation?](https://arxiv.org/abs/2306.09896), Olausson et al., 2023-06-16.
- **Helped** — The authors report that trained LLM critics caught more bugs in model-written code than paid human contractors and their critiques were usually preferred, but critics also hallucinated bugs, and human-plus-critic teams hallucinated less.
  Compared against: Human contractors reviewing code without assistance. Domain: Code review of model-written code.
  Caveat: The critics were specially trained with reinforcement learning from human feedback rather than prompted, and results are self-reported by the vendor.
  Source: [LLM Critics Help Catch LLM Bugs](https://arxiv.org/abs/2407.00215), McAleese et al. (OpenAI), 2024-06-28.
- **Helped** — The authors report that a programmer agent refined by feedback from separate test-designer and test-executor agents outperformed single-model code generation and prior enhancement methods while using fewer tokens.
  Compared against: Single-model code generation and prompt-engineering enhancement methods. Domain: Function-level code generation. Benchmarks: HumanEval, MBPP.
  Caveat: Feedback comes from executing generated tests, so gains may reflect execution feedback more than LLM review, and benchmarks are short standalone functions.
  Source: [AgentCoder: Multi-Agent-based Code Generation with Iterative Testing and Optimisation](https://arxiv.org/abs/2312.13010), Huang et al., 2023-12-20.
- **Helped** — The authors report that a virtual team of analyst, coder and tester roles substantially improved pass rates over the same base model acting alone.
  Compared against: The same base model acting as a single agent. Domain: Code generation. Benchmarks: HumanEval, MBPP.
  Caveat: Evaluated mainly with an early ChatGPT model on function-level benchmarks, without compute-matched single-agent baselines.
  Source: [Self-collaboration Code Generation via ChatGPT](https://arxiv.org/abs/2304.07590), Dong et al., 2023-04-15.
- **No clear gain** — Across annotated traces from popular multi-agent frameworks, the authors identify task verification failures, such as missing or incorrect checking, as one of the main categories of multi-agent breakdowns, alongside design issues and inter-agent misalignment.
  Compared against: Expectations of benefit from multi-agent frameworks with reviewer or verifier roles. Domain: Coding, math and general agent tasks.
  Caveat: This is a failure taxonomy rather than a controlled comparison, so it shows how reviewer roles fail but not how often they help.
  Source: [Why Do Multi-Agent LLM Systems Fail?](https://arxiv.org/abs/2503.13657), Cemri et al., 2025-03-17.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
