---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/independent_workers/findings.md
description: 'What published studies found about independent_workers, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/independent_workers/findings.md
pattern: independent_workers
pattern_index: /patterns/index.md
pattern_page: /patterns/independent_workers.md
product_api_version: v1
published_findings:
  - benchmarks:
      - BrowseComp-Plus
      - 'Finance Agent'
      - PlanCraft
      - WorkBench
      - 'SWE-bench Verified'
      - Terminal-Bench
    compared_against: 'Single-agent systems and centralized, decentralized and hybrid multi-agent architectures'
    direction: mixed
    source_id: arxiv:2512.08296
    task_domain: 'Agentic web browsing, finance, planning, workplace, software engineering and terminal tasks'
    task_domains:
      - coding
      - research
      - reasoning
      - operations
    url: https://arxiv.org/abs/2512.08296
  - benchmarks:
      - BrowseComp
    compared_against: 'Single-agent Claude on the same research tasks'
    direction: mixed
    source_id: web:anthropic.com/engineering/multi-agent-research-system
    task_domain: 'Open-ended web research'
    task_domains:
      - research
    url: https://www.anthropic.com/engineering/multi-agent-research-system
  - benchmarks:
      - 'SWE-bench Verified'
    compared_against: 'Oracle selection, random selection and single trajectories'
    direction: mixed
    source_id: arxiv:2501.14723
    task_domain: 'Resolving real GitHub issues'
    task_domains:
      - coding
    url: https://arxiv.org/abs/2501.14723
schema_version: v0.1
title: 'Published findings on the independent_workers multi-agent pattern'
---

# Published findings on the independent_workers multi-agent pattern

The findings filed under the [independent_workers](/patterns/independent_workers.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Mixed** — The authors report that independent multi-agent setups without centralized verification propagate and amplify errors far more than centralized coordination, and that multi-agent gains vanish or reverse once the single-agent baseline is already strong.
  Compared against: Single-agent systems and centralized, decentralized and hybrid multi-agent architectures. Domain: Agentic web browsing, finance, planning, workplace, software engineering and terminal tasks. Benchmarks: BrowseComp-Plus, Finance Agent, PlanCraft, WorkBench, SWE-bench Verified, Terminal-Bench.
  Caveat: The fitted predictive model explains only a modest share of performance variance, so the patterns are tendencies rather than guarantees.
  Source: [Towards a Science of Scaling Agent Systems](https://arxiv.org/abs/2512.08296), Kim et al., 2025-12-09.
- **Mixed** — Anthropic reports that a lead agent spawning parallel subagents with separate context windows far outperformed a single agent on its internal breadth-first research eval, while using many times more tokens and fitting poorly to tasks that need shared context, such as most coding.
  Compared against: Single-agent Claude on the same research tasks. Domain: Open-ended web research. Benchmarks: BrowseComp.
  Caveat: The headline comparison uses an internal eval, and the authors attribute much of the gain to spending more tokens rather than to the topology itself.
  Source: [Anthropic Engineering: How we built our multi-agent research system](https://www.anthropic.com/engineering/multi-agent-research-system), Hadfield et al. (Anthropic), 2025-06-13.
- **Mixed** — The authors report that running many independent multi-turn editing trajectories per issue and then selecting among them raises resolved-issue rates, but their selection step recovers only part of the gap between random pick and an oracle choice.
  Compared against: Oracle selection, random selection and single trajectories. Domain: Resolving real GitHub issues. Benchmarks: SWE-bench Verified.
  Caveat: The approach is expensive and its final score is capped by selection quality rather than by how many candidates are generated.
  Source: [CodeMonkeys: scaling test-time compute for software engineering (Ehrlich et al.)](https://arxiv.org/abs/2501.14723), Ryan Ehrlich et al., 2025-01-24.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
