---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/dynamic_spawning/findings.md
description: 'What published studies found about dynamic_spawning, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/dynamic_spawning/findings.md
pattern: dynamic_spawning
pattern_index: /patterns/index.md
pattern_page: /patterns/dynamic_spawning.md
product_api_version: v1
published_findings:
  - benchmarks: []
    compared_against: 'A single agent using the stronger model alone'
    direction: helped
    source_id: web:anthropic.com/engineering/multi-agent-research-system
    task_domain: 'Open-ended web research'
    task_domains:
      - research
    url: https://www.anthropic.com/engineering/multi-agent-research-system
  - benchmarks: []
    compared_against: 'A single agent'
    direction: mixed
    source_id: arxiv:2308.10848
    task_domain: 'Text understanding, reasoning, coding, tool use and embodied tasks'
    task_domains:
      - coding
      - reasoning
      - operations
    url: https://arxiv.org/abs/2308.10848
  - benchmarks: []
    compared_against: 'Existing multi-agent methods with predefined agents'
    direction: helped
    source_id: arxiv:2309.17288
    task_domain: 'Open-ended question answering and creative writing'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2309.17288
  - benchmarks: []
    compared_against: 'A single-threaded linear agent sharing full context'
    direction: hurt
    source_id: web:cognition.com/blog/dont-build-multi-agents
    task_domain: 'Software engineering agents'
    task_domains:
      - coding
    url: https://cognition.com/blog/dont-build-multi-agents
  - benchmarks:
      - Bamboogle
      - Musique
      - HotpotQA
    compared_against: 'The same model without search, a ReAct-style search agent, and the ChatGPT-Web and Perplexity Pro products'
    direction: helped
    source_id: arxiv:2407.20183
    task_domain: 'Web information seeking and multi-hop question answering'
    task_domains:
      - research
    url: https://arxiv.org/abs/2407.20183
schema_version: v0.1
title: 'Published findings on the dynamic_spawning multi-agent pattern'
---

# Published findings on the dynamic_spawning multi-agent pattern

The findings filed under the [dynamic_spawning](/patterns/dynamic_spawning.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — Anthropic reports that its research system, in which a lead agent spawns parallel subagents, substantially outperformed a single-agent setup on its internal research evaluation.
  Compared against: A single agent using the stronger model alone. Domain: Open-ended web research.
  Caveat: Internal, vendor-run evaluation with no public benchmark for the headline comparison, and Anthropic notes the multi-agent system uses many times more tokens than chat.
  Source: [Anthropic Engineering: How we built our multi-agent research system](https://www.anthropic.com/engineering/multi-agent-research-system), Hadfield et al. (Anthropic), 2025-06-13.
- **Mixed** — AgentVerse reports that dynamically adjusting group composition by recruiting expert agents lets multi-agent groups outperform a single agent, while also documenting negative emergent social behaviors.
  Compared against: A single agent. Domain: Text understanding, reasoning, coding, tool use and embodied tasks.
  Caveat: Author-run evaluation of the proposed framework; the negative behaviors are described qualitatively.
  Source: [AgentVerse: Facilitating Multi-Agent Collaboration and Exploring Emergent Behaviors](https://arxiv.org/abs/2308.10848), Chen et al., 2023-08-21.
- **Helped** — AutoAgents reports that generating task-specific agents at runtime, with an observer reviewing plans, yields more coherent and accurate solutions than existing multi-agent methods.
  Compared against: Existing multi-agent methods with predefined agents. Domain: Open-ended question answering and creative writing.
  Caveat: Author-run comparison; the abstract gives no cost comparison against simpler single-agent baselines.
  Source: [AutoAgents: A Framework for Automatic Agent Generation](https://arxiv.org/abs/2309.17288), Chen et al., 2023-09-29.
- **Hurt** — Cognition argues against parallel subagents because subagents that cannot see each other's work make conflicting implicit decisions, recommending single-threaded agents by default.
  Compared against: A single-threaded linear agent sharing full context. Domain: Software engineering agents.
  Caveat: Vendor guidance based on an illustrative example, not a controlled experiment.
  Source: [Cognition blog: Don't Build Multi-Agents](https://cognition.com/blog/dont-build-multi-agents), Walden Yan (Cognition), 2025-06-12.
- **Helped** — Chen and colleagues report that a planner that grows a graph of sub-questions as results arrive, handing each new sub-question to its own searcher agent, beat both a model without search and a ReAct-style search agent on multi-hop question answering, and was preferred by human raters to two commercial AI search products.
  Compared against: The same model without search, a ReAct-style search agent, and the ChatGPT-Web and Perplexity Pro products. Domain: Web information seeking and multi-hop question answering. Benchmarks: Bamboogle, Musique, HotpotQA.
  Caveat: Proposing authors, with a ReAct agent ahead on some question subsets, and the authors note factuality improved less than depth and breadth in the human evaluation.
  Source: [MindSearch: Mimicking Human Minds Elicits Deep AI Searcher](https://arxiv.org/abs/2407.20183), Chen et al., 2024-07-29.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
