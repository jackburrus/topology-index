---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'agent swarm'
  - 'multi-agent swarm'
  - 'lane-based parallel agents'
canonical_url: https://topologyindex.com/patterns/lane_swarm.md
description: 'Many workers take assigned lanes of one larger effort on a common channel.'
executable_here: false
executor_requirements:
  - concurrent_role_invocations
  - agent_to_agent_messages
  - shared_writable_state_between_agents
family: parallelism
observed_in:
  - /research/openai-hugging-face-agent-coordination.md
path: /patterns/lane_swarm.md
pattern: lane_swarm
pattern_index: /patterns/index.md
product_api_version: v1
qualifying_evidence: []
references: []
schema_version: v0.1
title: 'lane_swarm multi-agent pattern (agent swarm, multi-agent swarm)'
unmet_executor_requirements:
  - concurrent_role_invocations
  - agent_to_agent_messages
  - shared_writable_state_between_agents
---

# lane_swarm

The `lane_swarm` multi-agent pattern (family `parallelism`): many workers take assigned lanes of one larger effort on a common channel.

Also called: agent swarm, multi-agent swarm, lane-based parallel agents.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: A large worker set plus one or more coordinating roles that hand out lanes.
- Control: Lanes are assigned or claimed, and control messages such as hold, veto and stop keep workers out of each other’s lanes.
- Shared state: A common channel carrying assignments, claims, findings and control messages.

## When it is hypothesised to fit

Hypothesised to fit when an effort is too large for one agent, splits into lanes that rarely touch, and a finding in one lane is directly useful in the others.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- Assignment becomes the bottleneck, and the coordinating role becomes a single point of failure.
- Overlapping lanes lead to interference, duplicated work and overwritten results.
- The channel grows until reading it costs more than the work; the record below reports agents inventing private mailboxes for exactly that reason.
- Control conventions invented by the participants are enforced by nothing, so they are followed unevenly.

These are things to watch for, not outcomes anyone measured here.

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `concurrent_role_invocations` (more than one agent acting at the same time): The supervisor runs one invocation at a time and refuses a declared active-agent count above one, rather than serializing a parallel policy and calling it the same thing.
- `agent_to_agent_messages` (a channel on which one agent addresses another): The adapter sees a single role invocation, and the tool surface offers no channel to another agent.
- `shared_writable_state_between_agents` (a store several agents read and write while they run): The only shared surface is one episode workspace, reachable by one role invocation at a time; there is no store two agents can write.

A topology formation that declares what this deployment cannot run is still stored, and is refused
with an unsupported-capability error rather than reduced to a simpler arrangement and run
anyway.

## Evidence for this pattern

None. No qualifying evidence exists here for this pattern, and by design none ever
will: an evidence snapshot is about the complete execution configuration that produced
the observations, so the most it can support is a claim about that configuration on
that workload.

## Observed in

Reports that describe this arrangement. A report is a reason to test an arrangement, never a
result for it.

- [Agent coordination in the OpenAI and Hugging Face evaluation incident](/research/openai-hugging-face-agent-coordination.md) (descriptive_only)

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
