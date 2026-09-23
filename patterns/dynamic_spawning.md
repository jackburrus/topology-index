---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'dynamic subagents'
  - 'spawn-on-demand workers'
  - 'runtime agent creation'
  - 'subagent spawning'
canonical_url: https://topologyindex.com/patterns/dynamic_spawning.md
description: 'New workers are created during the run in response to what the run finds.'
executable_here: false
executor_requirements:
  - role_creation_at_runtime
  - concurrent_role_invocations
family: adaptive
observed_in: []
path: /patterns/dynamic_spawning.md
pattern: dynamic_spawning
pattern_index: /patterns/index.md
product_api_version: v1
qualifying_evidence: []
references:
  - https://www.anthropic.com/engineering/multi-agent-research-system
schema_version: v0.1
title: 'dynamic_spawning multi-agent pattern (dynamic subagents, spawn-on-demand workers)'
unmet_executor_requirements:
  - role_creation_at_runtime
  - concurrent_role_invocations
---

# dynamic_spawning

The `dynamic_spawning` multi-agent pattern (family `adaptive`): new workers are created during the run in response to what the run finds.

Also called: dynamic subagents, spawn-on-demand workers, runtime agent creation, subagent spawning.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: Roles that do not exist until something in the run asks for them.
- Control: A spawning decision taken inside the run.
- Shared state: Whatever the spawning role hands to what it spawned.

## When it is hypothesised to fit

Hypothesised to fit when the shape of the work is unknown until it starts, so a fixed role set is either wasteful or too small.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- A spawn decision is a spending decision; if a model makes it, something else must hold the budget.
- What ran is no longer what was registered, so an evaluation cannot say which arrangement produced the result.
- Runaway spawning is the failure this arrangement is bounded against.

These are things to watch for, not outcomes anyone measured here.

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [How we built our multi-agent research system (Anthropic)](https://www.anthropic.com/engineering/multi-agent-research-system)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `role_creation_at_runtime` (roles that do not exist until the work asks for them): Roles come from the registered formation; the supervisor can only move between declared roles.
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
