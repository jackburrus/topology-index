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
observed_in: []
path: /patterns/independent_workers.md
pattern: independent_workers
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - direction: mixed
    url: https://arxiv.org/abs/2512.08296
  - direction: mixed
    url: https://www.anthropic.com/engineering/multi-agent-research-system
  - direction: mixed
    url: https://arxiv.org/abs/2501.14723
qualifying_evidence: []
references: []
schema_version: v0.1
title: 'independent_workers multi-agent pattern (embarrassingly parallel agents, isolated parallel agents)'
unmet_executor_requirements:
  - concurrent_role_invocations
---

# independent_workers

The `independent_workers` multi-agent pattern (family `parallelism`): separate agents work separate tasks at the same time and never communicate.

Also called: embarrassingly parallel agents, isolated parallel agents, batch of independent agents.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: Workers with no channel between them and no common store.
- Control: Each worker is bounded on its own; nothing schedules the set.
- Shared state: None, by construction.

## When it is hypothesised to fit

Hypothesised to fit when tasks are really separate, so coordination would only add overhead and new failure modes.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- Shared resources — one repository, one rate limit, one cache — reintroduce the coupling the arrangement claims not to have.
- With no channel, nobody can notice that two workers are doing the same work.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-22.

- **Mixed** — The authors report that independent multi-agent setups without centralized verification propagate and amplify errors far more than centralized coordination, and that multi-agent gains vanish or reverse once the single-agent baseline is already strong.
  Compared against: Single-agent systems and centralized, decentralized and hybrid multi-agent architectures. Domain: Agentic web browsing, finance, planning, workplace, software engineering and terminal tasks. Benchmarks: BrowseComp-Plus, Finance Agent, PlanCraft, WorkBench, SWE-bench Verified, Terminal-Bench.
  Caveat: The fitted predictive model explains only a modest share of performance variance, so the patterns are tendencies rather than guarantees.
  Source: [Towards a Science of Scaling Agent Systems (Kim et al., Google Research)](https://arxiv.org/abs/2512.08296), Yubin Kim et al., 2025-12-09.
- **Mixed** — Anthropic reports that a lead agent spawning parallel subagents with separate context windows far outperformed a single agent on its internal breadth-first research eval, while using many times more tokens and fitting poorly to tasks that need shared context, such as most coding.
  Compared against: Single-agent Claude on the same research tasks. Domain: Open-ended web research. Benchmarks: BrowseComp.
  Caveat: The headline comparison uses an internal eval, and the authors attribute much of the gain to spending more tokens rather than to the topology itself.
  Source: [How we built our multi-agent research system (Anthropic Engineering)](https://www.anthropic.com/engineering/multi-agent-research-system), Jeremy Hadfield et al., 2025-06-13.
- **Mixed** — The authors report that running many independent multi-turn editing trajectories per issue and then selecting among them raises resolved-issue rates, but their selection step recovers only part of the gap between random pick and an oracle choice.
  Compared against: Oracle selection, random selection and single trajectories. Domain: Resolving real GitHub issues. Benchmarks: SWE-bench Verified.
  Caveat: The approach is expensive and its final score is capped by selection quality rather than by how many candidates are generated.
  Source: [CodeMonkeys: scaling test-time compute for software engineering (Ehrlich et al.)](https://arxiv.org/abs/2501.14723), Ryan Ehrlich et al., 2025-01-24.

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
