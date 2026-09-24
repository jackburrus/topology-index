---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'append-only log coordination'
  - 'shared task log'
  - 'event log coordination'
  - 'progress ledger'
canonical_url: https://topologyindex.com/patterns/shared_ledger.md
description: 'Agents append to a common ordered log and read it to learn what already happened.'
executable_here: false
executor_requirements:
  - concurrent_role_invocations
  - shared_writable_state_between_agents
family: shared_state
findings_page: /patterns/shared_ledger/findings.md
observed_in: []
path: /patterns/shared_ledger.md
pattern: shared_ledger
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks:
      - GAIA
    compared_against: 'The same agents coordinated by a basic group chat without ledgers'
    direction: helped
    source_id: arxiv:2411.04468
    task_domain: 'Generalist agentic tasks'
    task_domains:
      - operations
    url: https://arxiv.org/abs/2411.04468
  - benchmarks:
      - ALFWorld
    compared_against: 'LangGraph and Flock multi-agent baselines'
    direction: helped
    source_id: arxiv:2605.29313
    task_domain: 'Embodied household tasks'
    task_domains: []
    url: https://arxiv.org/abs/2605.29313
  - benchmarks: []
    compared_against: 'Agents working without persistent progress artifacts'
    direction: mixed
    source_id: web:anthropic.com/engineering/effective-harnesses-for-long-running-agents
    task_domain: 'Long-running software development'
    task_domains:
      - coding
    url: https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents
qualifying_evidence: []
references: []
schema_version: v0.1
title: 'shared_ledger multi-agent pattern (append-only log coordination, shared task log)'
unmet_executor_requirements:
  - concurrent_role_invocations
  - shared_writable_state_between_agents
---

# shared_ledger

The `shared_ledger` multi-agent pattern (family `shared_state`): agents append to a common ordered log and read it to learn what already happened.

Also called: append-only log coordination, shared task log, event log coordination, progress ledger.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: Workers plus an append-only log with an agreed entry format.
- Control: The log is the record of what has been claimed and done; entries are not removed.
- Shared state: The log, ordered and append-only.

## When it is hypothesised to fit

Hypothesised to fit when the expensive thing is not doing the work but knowing what has already been done or claimed.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- Ordering has to be enforced by something outside the agents, or the log only looks ordered.
- An agent can read a stale prefix and act on a world that has moved.
- Without an authenticated writer, an entry proves only that somebody could write.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/shared_ledger/findings.md](/patterns/shared_ledger/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [Magentic-One: A Generalist Multi-Agent System for Solving Complex Tasks](https://arxiv.org/abs/2411.04468)
- **Helped**: [PatchBoard: Schema-Grounded State Mutation for Reliable and Auditable LLM Multi-Agent Collaboration](https://arxiv.org/abs/2605.29313)
- **Mixed**: [Anthropic Engineering: Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `concurrent_role_invocations` (more than one agent acting at the same time): The supervisor runs one invocation at a time and refuses a declared active-agent count above one, rather than serializing a parallel policy and calling it the same thing.
- `shared_writable_state_between_agents` (a store several agents read and write while they run): The only shared surface is one episode workspace, reachable by one role invocation at a time; there is no store two agents can write.

Successive roles in one episode do share the episode workspace, so a sequential note file passed from role to role is representable. What cannot run is a log shared between agents acting at the same time.

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
