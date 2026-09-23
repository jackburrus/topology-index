---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - scatter-gather
  - 'parallelization by sectioning (Anthropic)'
  - 'divide and conquer'
  - split-and-merge
canonical_url: https://topologyindex.com/patterns/map_reduce.md
description: 'The task is split into parts, worked in parallel, and the parts are combined.'
executable_here: false
executor_requirements:
  - concurrent_role_invocations
  - aggregation_over_agent_opinions
family: parallelism
observed_in: []
path: /patterns/map_reduce.md
pattern: map_reduce
pattern_index: /patterns/index.md
product_api_version: v1
qualifying_evidence: []
references:
  - https://www.anthropic.com/engineering/building-effective-agents
schema_version: v0.1
title: 'map_reduce multi-agent pattern (scatter-gather, parallelization by sectioning)'
unmet_executor_requirements:
  - concurrent_role_invocations
  - aggregation_over_agent_opinions
---

# map_reduce

The `map_reduce` multi-agent pattern (family `parallelism`): the task is split into parts, worked in parallel, and the parts are combined.

Also called: scatter-gather, parallelization by sectioning (Anthropic), divide and conquer, split-and-merge.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: A splitting step, workers over disjoint parts, and a combining step.
- Control: Split, then parallel work, then combine; a worker sees only its own part.
- Shared state: The partition and the combined result; no worker writes another worker’s part.

## When it is hypothesised to fit

Hypothesised to fit when the work genuinely decomposes into parts whose results do not depend on one another, and combining them is mechanical.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- A wrong split dooms every part, and the parts cannot see that it was wrong.
- Dependencies between parts reappear as contradictions the combining step has to resolve.
- The combining step quietly becomes the hardest role while being described as bookkeeping.

These are things to watch for, not outcomes anyone measured here.

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Building effective agents (Anthropic)](https://www.anthropic.com/engineering/building-effective-agents)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `concurrent_role_invocations` (more than one agent acting at the same time): The supervisor runs one invocation at a time and refuses a declared active-agent count above one, rather than serializing a parallel policy and calling it the same thing.
- `aggregation_over_agent_opinions` (a rule that combines what several roles judged into one outcome): The supervisor decides only from measured signals, so it cannot read a verdict, weigh it or count votes.

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
