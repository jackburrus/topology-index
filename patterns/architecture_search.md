---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'agent architecture search'
  - 'automated agent design'
  - 'self-improving agent topology'
  - 'topology optimization'
canonical_url: https://topologyindex.com/patterns/architecture_search.md
description: 'The arrangement itself is changed while the work runs, searching for a better one.'
executable_here: false
executor_requirements:
  - configuration_change_during_run
  - role_creation_at_runtime
family: adaptive
observed_in: []
path: /patterns/architecture_search.md
pattern: architecture_search
pattern_index: /patterns/index.md
product_api_version: v1
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2408.08435
  - https://arxiv.org/abs/2402.16823
schema_version: v0.1
title: 'architecture_search multi-agent pattern (agent architecture search, automated agent design)'
unmet_executor_requirements:
  - configuration_change_during_run
  - role_creation_at_runtime
---

# architecture_search

The `architecture_search` multi-agent pattern (family `adaptive`): the arrangement itself is changed while the work runs, searching for a better one.

Also called: agent architecture search, automated agent design, self-improving agent topology, topology optimization.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: A configuration under test plus a mechanism that rewrites it between rounds.
- Control: An outer loop edits roles, handoffs or bindings and runs again.
- Shared state: The configuration being searched.

## When it is hypothesised to fit

Hypothesised to fit when the space of arrangements is large, a round is cheap, and the search is kept strictly away from the tasks any later claim will rest on.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- Searching and measuring on the same tasks produces a number about the search, not about the arrangement.
- Every mutation is a new configuration, so anything observed before the mutation describes something that no longer exists.

These are things to watch for, not outcomes anyone measured here.

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Automated Design of Agentic Systems (Hu et al.)](https://arxiv.org/abs/2408.08435)
- [GPTSwarm: Language Agents as Optimizable Graphs (Zhuge et al.)](https://arxiv.org/abs/2402.16823)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `configuration_change_during_run` (the arrangement itself edited while the work runs): The execution lock is pinned for the run; a changed arrangement is a different lock and a different comparison.
- `role_creation_at_runtime` (roles that do not exist until the work asks for them): Roles come from the registered formation; the supervisor can only move between declared roles.

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
