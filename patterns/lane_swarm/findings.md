---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/lane_swarm/findings.md
description: 'What published studies found about lane_swarm, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/lane_swarm/findings.md
pattern: lane_swarm
pattern_index: /patterns/index.md
pattern_page: /patterns/lane_swarm.md
product_api_version: v1
published_findings:
  - benchmarks:
      - MMLU
      - HumanEval
      - SRDD
      - CommonGen-Hard
    compared_against: 'Smaller agent networks and regular topologies such as chains and meshes'
    direction: mixed
    source_id: arxiv:2406.07155
    task_domain: 'Reasoning, code generation, software development and constrained text generation'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2406.07155
  - benchmarks:
      - FED
      - Commongen-Challenge
      - MGSM
      - 'Logic Grid Puzzles'
      - HumanEval
    compared_against: 'Single-agent solo setups'
    direction: mixed
    source_id: arxiv:2308.10848
    task_domain: 'Reasoning, coding, tool use and embodied Minecraft tasks'
    task_domains:
      - coding
      - reasoning
      - operations
    url: https://arxiv.org/abs/2308.10848
  - benchmarks: []
    compared_against: 'Ablations of the agent architecture and human-authored behavior'
    direction: mixed
    source_id: arxiv:2304.03442
    task_domain: 'Simulated social behavior in a sandbox town'
    task_domains: []
    url: https://arxiv.org/abs/2304.03442
schema_version: v0.1
title: 'Published findings on the lane_swarm multi-agent pattern'
---

# Published findings on the lane_swarm multi-agent pattern

The findings filed under the [lane_swarm](/patterns/lane_swarm.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Mixed** — The authors report that organizing up to over a thousand agents in a directed acyclic graph yields performance that grows logistically with agent count, with irregular topologies outperforming regular ones.
  Compared against: Smaller agent networks and regular topologies such as chains and meshes. Domain: Reasoning, code generation, software development and constrained text generation. Benchmarks: MMLU, HumanEval, SRDD, CommonGen-Hard.
  Caveat: The authors report most topologies saturate at around a hundred agents, that dense interaction can overload agents, and that context cost grows quadratically without their memory control.
  Source: [Scaling LLM-based multi-agent collaboration, MacNet (Qian et al.)](https://arxiv.org/abs/2406.07155), Chen Qian et al., 2024-06-11.
- **Mixed** — The authors report that dynamically composed agent groups can outperform a single agent, but also document cases where group discussion hurt a weaker model and negative emergent behaviors such as destructive actions.
  Compared against: Single-agent solo setups. Domain: Reasoning, coding, tool use and embodied Minecraft tasks. Benchmarks: FED, Commongen-Challenge, MGSM, Logic Grid Puzzles, HumanEval.
  Caveat: Groups in these experiments are small, so the results say little about large swarms.
  Source: [AgentVerse: Facilitating Multi-Agent Collaboration and Exploring Emergent Behaviors](https://arxiv.org/abs/2308.10848), Chen et al., 2023-08-21.
- **Mixed** — The authors report that a sandbox society of LLM agents with memory, reflection and planning produced believable individual and emergent social behavior, such as spontaneously organizing a party.
  Compared against: Ablations of the agent architecture and human-authored behavior. Domain: Simulated social behavior in a sandbox town.
  Caveat: This is a behavioral simulation judged on believability, not a measure of task performance from adding agents.
  Source: [Generative Agents: interactive simulacra of human behavior (Park et al.)](https://arxiv.org/abs/2304.03442), Joon Sung Park et al., 2023-04-07.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
