---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/mailbox_network/findings.md
description: 'What published studies found about mailbox_network, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/mailbox_network/findings.md
pattern: mailbox_network
pattern_index: /patterns/index.md
pattern_page: /patterns/mailbox_network.md
product_api_version: v1
published_findings:
  - benchmarks:
      - MATH
      - GSM8K
      - MathVista
      - Anthropic-HH
    compared_against: 'Fully connected multi-agent debate'
    direction: helped
    source_id: arxiv:2406.11776
    task_domain: 'Math reasoning, multimodal reasoning and alignment labeling'
    task_domains:
      - reasoning
      - evaluation
    url: https://arxiv.org/abs/2406.11776
  - benchmarks:
      - MMLU
      - GSM8K
      - MultiArith
      - SVAMP
      - AQuA
      - HumanEval
    compared_against: 'Chain, tree, star, complete, layered and random topologies and frameworks such as AutoGen and GPTSwarm'
    direction: helped
    source_id: arxiv:2410.02506
    task_domain: 'General, math reasoning and code generation'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2410.02506
  - benchmarks:
      - MedQA
      - PubMedQA
      - MMLU
      - CosmosQA
      - CIAR
      - GPQA
    compared_against: 'Self-consistency and ensembling over multiple reasoning paths'
    direction: no_clear_gain
    source_id: arxiv:2311.17371
    task_domain: 'Medical and general reasoning question answering'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2311.17371
  - benchmarks:
      - ECQA
      - GSM8K
      - FOLIO-wiki
    compared_against: 'A single agent with strong prompts and demonstrations'
    direction: no_clear_gain
    source_id: arxiv:2402.18272
    task_domain: 'Commonsense, math and deductive reasoning'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2402.18272
  - benchmarks:
      - MMLU
      - MATH
      - 'Chess Move Validity'
    compared_against: 'Different numbers of agents, rounds and debate or reflection strategies'
    direction: mixed
    source_id: arxiv:2310.02124
    task_domain: 'Knowledge, math and state-tracking reasoning'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2310.02124
  - benchmarks:
      - BrowseComp-Plus
      - Finance-Agent
      - PlanCraft
    compared_against: 'A single agent and centralized, independent and hybrid multi-agent architectures'
    direction: mixed
    source_id: arxiv:2512.08296
    task_domain: 'Agentic benchmarks spanning finance, web browsing and planning'
    task_domains:
      - research
      - reasoning
      - operations
    url: https://arxiv.org/abs/2512.08296
schema_version: v0.1
title: 'Published findings on the mailbox_network multi-agent pattern'
---

# Published findings on the mailbox_network multi-agent pattern

The findings filed under the [mailbox_network](/patterns/mailbox_network.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — The authors report that multi-agent debate over sparse, ring-like communication graphs matched or beat fully connected debate while substantially cutting cost.
  Compared against: Fully connected multi-agent debate. Domain: Math reasoning, multimodal reasoning and alignment labeling. Benchmarks: MATH, GSM8K, MathVista, Anthropic-HH.
  Caveat: Studied only within debate-style answer refinement, with few agents and a small set of benchmarks.
  Source: [Improving Multi-Agent Debate with Sparse Communication Topology](https://arxiv.org/abs/2406.11776), Li et al., 2024-06-17.
- **Helped** — The authors report substantial communication redundancy in multi-agent message-passing graphs and that pruning it kept performance comparable while greatly reducing token cost.
  Compared against: Chain, tree, star, complete, layered and random topologies and frameworks such as AutoGen and GPTSwarm. Domain: General, math reasoning and code generation. Benchmarks: MMLU, GSM8K, MultiArith, SVAMP, AQuA, HumanEval.
  Caveat: Evaluated on short-form reasoning and coding benchmarks by the proposing authors.
  Source: [Cut the Crap: An Economical Communication Pipeline for LLM-based Multi-Agent Systems](https://arxiv.org/abs/2410.02506), Zhang et al., 2024-10-03.
- **No clear gain** — The authors report that multi-agent debate systems in their current form did not reliably outperform simpler strategies such as self-consistency and ensembling, although some improved after hyperparameter tuning.
  Compared against: Self-consistency and ensembling over multiple reasoning paths. Domain: Medical and general reasoning question answering. Benchmarks: MedQA, PubMedQA, MMLU, CosmosQA, CIAR, GPQA.
  Caveat: Results are sensitive to hyperparameters such as agent agreement, so conclusions may shift with tuning.
  Source: [Should we be going MAD? A Look at Multi-Agent Debate Strategies for LLMs](https://arxiv.org/abs/2311.17371), Smit et al., 2023-11-29.
- **No clear gain** — The authors report that a single agent with strong prompts nearly matched the best multi-agent discussion framework, with discussion helping mainly when no demonstrations were given and sometimes spreading wrong answers.
  Compared against: A single agent with strong prompts and demonstrations. Domain: Commonsense, math and deductive reasoning. Benchmarks: ECQA, GSM8K, FOLIO-wiki.
  Caveat: Limited to reasoning benchmarks with discussion-style exchanges rather than tool-using agents.
  Source: [Rethinking the Bounds of LLM Reasoning: Are Multi-Agent Discussions the Key?](https://arxiv.org/abs/2402.18272), Wang et al., 2024-02-28.
- **Mixed** — The authors report that peer collaboration gains plateaued beyond a small number of agents and rounds, and that agents increasingly conformed to each other over rounds, sometimes converging on wrong answers.
  Compared against: Different numbers of agents, rounds and debate or reflection strategies. Domain: Knowledge, math and state-tracking reasoning. Benchmarks: MMLU, MATH, Chess Move Validity.
  Caveat: Small question samples per dataset and a single model family.
  Source: [Exploring Collaboration Mechanisms for LLM Agents: A Social Psychology View](https://arxiv.org/abs/2310.02124), Zhang et al., 2023-10-03.
- **Mixed** — The authors report that a decentralized peer-to-peer architecture gave a modest gain on web browsing and a large gain on financial reasoning but lost ground on sequential planning, with communication overhead well above a single agent.
  Compared against: A single agent and centralized, independent and hybrid multi-agent architectures. Domain: Agentic benchmarks spanning finance, web browsing and planning. Benchmarks: BrowseComp-Plus, Finance-Agent, PlanCraft.
  Caveat: Outcomes depend strongly on task structure and model family in this study.
  Source: [Towards a Science of Scaling Agent Systems](https://arxiv.org/abs/2512.08296), Kim et al., 2025-12-09.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
