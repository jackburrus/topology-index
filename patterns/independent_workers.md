---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'embarrassingly parallel agents'
  - 'isolated parallel agents'
  - 'batch of independent agents'
canonical_url: https://topologyindex.com/patterns/independent_workers.md
description: 'Separate agents work separate tasks at the same time and never communicate.'
executable_here: false
executor_requirements:
  - concurrent_role_invocations
family: parallelism
findings_page: /patterns/independent_workers/findings.md
observed_in: []
path: /patterns/independent_workers.md
pattern: independent_workers
pattern_index: /patterns/index.md
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
qualifying_evidence: []
references: []
schema_version: v0.1
title: 'When to use the independent_workers multi-agent pattern (embarrassingly parallel agents, isolated parallel agents)?'
unmet_executor_requirements:
  - concurrent_role_invocations
---

# When to use the independent_workers multi-agent pattern (embarrassingly parallel agents, isolated parallel agents)?

**Short answer:** when the task splits into independent parts, start with [map_reduce](/patterns/map_reduce.md) and consider it next. A hypothesis from the [decision guide](/patterns/index.md), not a ranking; [published findings](/patterns/independent_workers/findings.md) keep the unfavourable ones.

The `independent_workers` multi-agent pattern (family `parallelism`): separate agents work separate tasks at the same time and never communicate.

Also called: embarrassingly parallel agents, isolated parallel agents, batch of independent agents.

## The arrangement

- Structure: Workers with no channel between them and no common store.
- Control: Each worker is bounded on its own; nothing schedules the set.
- Shared state: None, by construction.

## When it is hypothesised to fit

Hypothesised to fit when tasks are really separate, so coordination would only add overhead and new failure modes.

A hypothesis to test on a workload, not a finding: this service has not tested it.

## Failure modes to watch for

- Shared resources — one repository, one rate limit, one cache — reintroduce the coupling the arrangement claims not to have.
- With no channel, nobody can notice that two workers are doing the same work.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/independent_workers/findings.md](/patterns/independent_workers/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Mixed**: [Towards a Science of Scaling Agent Systems](https://arxiv.org/abs/2512.08296)
- **Mixed**: [Anthropic Engineering: How we built our multi-agent research system](https://www.anthropic.com/engineering/multi-agent-research-system)
- **Mixed**: [CodeMonkeys: scaling test-time compute for software engineering (Ehrlich et al.)](https://arxiv.org/abs/2501.14723)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `concurrent_role_invocations` (more than one agent acting at the same time): The supervisor runs one invocation at a time and refuses a declared active-agent count above one, rather than serializing a parallel policy and calling it the same thing.

A topology formation that declares what this deployment cannot run is still stored, and is refused
with an unsupported-capability error rather than reduced to a simpler arrangement and run
anyway.

## Evidence for this pattern

None. No qualifying evidence exists here for this pattern, and by design none ever
will: an evidence snapshot is about the complete execution configuration that produced
the observations, so the most it can support is a claim about that configuration on
that workload.

## Observed in

No research record on this service reports observing this arrangement.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
