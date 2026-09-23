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
published_findings:
  - direction: helped
    url: https://arxiv.org/abs/2403.12482
  - direction: mixed
    url: https://arxiv.org/abs/2507.08616
  - direction: helped
    url: https://arxiv.org/abs/2604.11721
  - direction: no_clear_gain
    url: https://arxiv.org/abs/2606.19111
  - direction: mixed
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

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-22.

- **Helped** — Guo and colleagues report that imposing designated leadership on embodied LLM agent teams affects team efficiency, and that LLM-proposed organizational prompts reduced communication costs.
  Compared against: Teams without designated leadership or organizational structure. Domain: Embodied multi-agent cooperation.
  Caveat: Leadership is assigned by prompt rather than elected, and results come from a small set of embodied simulations.
  Source: [Embodied LLM Agents Learn to Cooperate in Organized Teams](https://arxiv.org/abs/2403.12482), Guo et al., 2024-03-19.
- **Mixed** — AgentsNet reports that frontier models can solve coordination problems including leader election in small networks, but performance falls off sharply as network size grows.
  Compared against: Different model families and network sizes. Domain: Distributed coordination problems drawn from graph theory. Benchmarks: AgentsNet.
  Caveat: Synthetic graph tasks may not reflect leader selection in practical agent systems.
  Source: [AgentsNet: Coordination and Collaborative Reasoning in Multi-Agent LLMs](https://arxiv.org/abs/2507.08616), Grötschla et al., 2025-07-11.
- **Helped** — Faulkner and colleagues report that elected leadership improved social welfare and survival time in LLM agent societies managing common-pool resources.
  Compared against: The same agent groups without elected leadership. Domain: Common-pool resource governance simulations.
  Caveat: Social-simulation setting; the gains are about cooperation outcomes, not task accuracy.
  Source: [Evaluating Cooperation in LLM Social Groups through Elected Leadership](https://arxiv.org/abs/2604.11721), Faulkner et al., 2026-04-13.
- **No clear gain** — Kwak reports that no leadership controller dominated on accuracy, with transactional control roughly matching a simple initial vote, and advantages appearing only under narrow conditions.
  Compared against: A shared initial majority vote without a leader. Domain: Multi-agent LLM team reasoning.
  Caveat: A recent single-author preprint; the conditions under which leaders help are specific and measured on limited task regimes.
  Source: [Leadership as Coordination Control in Multi-Agent LLM Teams](https://arxiv.org/abs/2606.19111), Haewoon Kwak, 2026-06-17.
- **Mixed** — Zhao and colleagues report that most surveyed LLM multi-agent systems rely on dictatorial or plurality decision rules, and that alternative ordinal voting methods can improve reasoning and robustness for some leading models.
  Compared against: Dictatorial and plurality collective decision rules. Domain: Reasoning benchmarks.
  Caveat: Studies collective voting rather than leader election, and gains held only for some models.
  Source: [An Electoral Approach to Diversify LLM-based Multi-Agent Collective Decision-Making](https://arxiv.org/abs/2410.15168), Zhao, Wang, Peng, 2024-10-19.

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
