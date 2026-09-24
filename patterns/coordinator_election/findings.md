---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/coordinator_election/findings.md
description: 'What published studies found about coordinator_election, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/coordinator_election/findings.md
pattern: coordinator_election
pattern_index: /patterns/index.md
pattern_page: /patterns/coordinator_election.md
product_api_version: v1
published_findings:
  - benchmarks: []
    compared_against: 'Teams without designated leadership or organizational structure'
    direction: helped
    source_id: arxiv:2403.12482
    task_domain: 'Embodied multi-agent cooperation'
    task_domains: []
    url: https://arxiv.org/abs/2403.12482
  - benchmarks:
      - AgentsNet
    compared_against: 'Different model families and network sizes'
    direction: mixed
    source_id: arxiv:2507.08616
    task_domain: 'Distributed coordination problems drawn from graph theory'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2507.08616
  - benchmarks: []
    compared_against: 'The same agent groups without elected leadership'
    direction: helped
    source_id: arxiv:2604.11721
    task_domain: 'Common-pool resource governance simulations'
    task_domains: []
    url: https://arxiv.org/abs/2604.11721
  - benchmarks: []
    compared_against: 'A shared initial majority vote without a leader'
    direction: no_clear_gain
    source_id: arxiv:2606.19111
    task_domain: 'Multi-agent LLM team reasoning'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2606.19111
  - benchmarks: []
    compared_against: 'Dictatorial and plurality collective decision rules'
    direction: mixed
    source_id: arxiv:2410.15168
    task_domain: 'Reasoning benchmarks'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2410.15168
schema_version: v0.1
title: 'Published findings on the coordinator_election multi-agent pattern'
---

# Published findings on the coordinator_election multi-agent pattern

The findings filed under the [coordinator_election](/patterns/coordinator_election.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — Guo and colleagues report that imposing designated leadership on embodied LLM agent teams affects team efficiency, and that LLM-proposed organizational prompts reduced communication costs.
  Compared against: Teams without designated leadership or organizational structure. Domain: Embodied multi-agent cooperation.
  Caveat: Leadership is assigned by prompt rather than elected, and results come from a small set of embodied simulations.
  Source: [Embodied LLM Agents Learn to Cooperate in Organized Teams](https://arxiv.org/abs/2403.12482), Guo et al., 2024-03-19.
- **Mixed** — AgentsNet reports that frontier models can solve coordination problems including leader election in small networks, but performance falls off sharply as network size grows.
  Compared against: Different model families and network sizes. Domain: Distributed coordination problems drawn from graph theory. Benchmarks: AgentsNet.
  Caveat: Synthetic graph tasks may not reflect leader selection in practical agent systems.
  Source: [AgentsNet: Coordination and Collaborative Reasoning in Multi-Agent LLMs](https://arxiv.org/abs/2507.08616), Grötschla et al., 2025-07-11.
- **Helped** — Faulkner and colleagues report that elected leadership improved social welfare and survival time in LLM agent societies managing common-pool resources.
  Compared against: The same agent groups without elected leadership. Domain: Common-pool resource governance simulations.
  Caveat: Social-simulation setting; the gains are about cooperation outcomes, not task accuracy.
  Source: [Evaluating Cooperation in LLM Social Groups through Elected Leadership](https://arxiv.org/abs/2604.11721), Faulkner et al., 2026-04-13.
- **No clear gain** — Kwak reports that no leadership controller dominated on accuracy, with transactional control roughly matching a simple initial vote, and advantages appearing only under narrow conditions.
  Compared against: A shared initial majority vote without a leader. Domain: Multi-agent LLM team reasoning.
  Caveat: A recent single-author preprint; the conditions under which leaders help are specific and measured on limited task regimes.
  Source: [Leadership as Coordination Control in Multi-Agent LLM Teams](https://arxiv.org/abs/2606.19111), Haewoon Kwak, 2026-06-17.
- **Mixed** — Zhao and colleagues report that most surveyed LLM multi-agent systems rely on dictatorial or plurality decision rules, and that alternative ordinal voting methods can improve reasoning and robustness for some leading models.
  Compared against: Dictatorial and plurality collective decision rules. Domain: Reasoning benchmarks.
  Caveat: Studies collective voting rather than leader election, and gains held only for some models.
  Source: [An Electoral Approach to Diversify LLM-based Multi-Agent Collective Decision-Making](https://arxiv.org/abs/2410.15168), Zhao, Wang, Peng, 2024-10-19.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
