---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'leader election'
  - 'elected coordinator'
  - 'emergent leadership'
canonical_url: https://topologyindex.com/patterns/coordinator_election.md
description: 'The participants decide among themselves which of them coordinates.'
executable_here: false
executor_requirements:
  - authority_election_at_runtime
  - agent_to_agent_messages
  - concurrent_role_invocations
family: adaptive
observed_in: []
path: /patterns/coordinator_election.md
pattern: coordinator_election
pattern_index: /patterns/index.md
product_api_version: v1
qualifying_evidence: []
references: []
schema_version: v0.1
title: 'coordinator_election multi-agent pattern (leader election, elected coordinator)'
unmet_executor_requirements:
  - authority_election_at_runtime
  - agent_to_agent_messages
  - concurrent_role_invocations
---

# coordinator_election

The `coordinator_election` multi-agent pattern (family `adaptive`): the participants decide among themselves which of them coordinates.

Also called: leader election, elected coordinator, emergent leadership.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: Peers, one of which becomes the coordinator, with succession when it disappears.
- Control: An election or a claim, honoured by whoever saw it.
- Shared state: The claim itself and whatever the coordinator publishes.

## When it is hypothesised to fit

Hypothesised to fit when no authority can be assigned in advance and the participants outlive any one coordinator.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- A claim not seen by everyone splits authority, and both halves keep acting.
- An unauthenticated claim can be made by anyone, including something that is not a participant.
- The elected coordinator inherits every failure mode of a supervisor, plus the election’s own.

These are things to watch for, not outcomes anyone measured here.

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `authority_election_at_runtime` (participants choosing which of them holds authority): Execution and accounting authority belongs to the coordinator and arrives as a lease; no role can claim, transfer or vote on it.
- `agent_to_agent_messages` (a channel on which one agent addresses another): The adapter sees a single role invocation, and the tool surface offers no channel to another agent.
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
