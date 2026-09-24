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
findings_page: /patterns/coordinator_election/findings.md
observed_in: []
path: /patterns/coordinator_election.md
pattern: coordinator_election
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks: []
    compared_against: 'Teams without designated leadership or organizational structure'
    direction: helped
    source_id: arxiv:2403.12482
    task_domain: 'Embodied multi-agent cooperation'
    task_domains: []
    url: https://arxiv.org/abs/2403.12482
  - benchmarks:
      - AgentsNet
    compared_against: 'Different model families and network sizes'
    direction: mixed
    source_id: arxiv:2507.08616
    task_domain: 'Distributed coordination problems drawn from graph theory'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2507.08616
  - benchmarks: []
    compared_against: 'The same agent groups without elected leadership'
    direction: helped
    source_id: arxiv:2604.11721
    task_domain: 'Common-pool resource governance simulations'
    task_domains: []
    url: https://arxiv.org/abs/2604.11721
  - benchmarks: []
    compared_against: 'A shared initial majority vote without a leader'
    direction: no_clear_gain
    source_id: arxiv:2606.19111
    task_domain: 'Multi-agent LLM team reasoning'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2606.19111
  - benchmarks: []
    compared_against: 'Dictatorial and plurality collective decision rules'
    direction: mixed
    source_id: arxiv:2410.15168
    task_domain: 'Reasoning benchmarks'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2410.15168
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

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/coordinator_election/findings.md](/patterns/coordinator_election/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [Embodied LLM Agents Learn to Cooperate in Organized Teams](https://arxiv.org/abs/2403.12482)
- **Mixed**: [AgentsNet: Coordination and Collaborative Reasoning in Multi-Agent LLMs](https://arxiv.org/abs/2507.08616)
- **Helped**: [Evaluating Cooperation in LLM Social Groups through Elected Leadership](https://arxiv.org/abs/2604.11721)
- **No clear gain**: [Leadership as Coordination Control in Multi-Agent LLM Teams](https://arxiv.org/abs/2606.19111)
- **Mixed**: [An Electoral Approach to Diversify LLM-based Multi-Agent Collective Decision-Making](https://arxiv.org/abs/2410.15168)

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
