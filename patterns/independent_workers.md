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
