---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'peer-to-peer agents'
  - 'agent network'
  - 'direct agent messaging'
  - 'network of agents (LangGraph)'
canonical_url: https://topologyindex.com/patterns/mailbox_network.md
description: 'Agents address each other through per-agent mailboxes instead of one open board.'
executable_here: false
executor_requirements:
  - concurrent_role_invocations
  - agent_to_agent_messages
family: shared_state
observed_in:
  - /research/openai-hugging-face-agent-coordination.md
path: /patterns/mailbox_network.md
pattern: mailbox_network
pattern_index: /patterns/index.md
product_api_version: v1
qualifying_evidence: []
references: []
schema_version: v0.1
title: 'mailbox_network multi-agent pattern (peer-to-peer agents, agent network)'
unmet_executor_requirements:
  - concurrent_role_invocations
  - agent_to_agent_messages
---

# mailbox_network

The `mailbox_network` multi-agent pattern (family `shared_state`): agents address each other through per-agent mailboxes instead of one open board.

Also called: peer-to-peer agents, agent network, direct agent messaging, network of agents (LangGraph).

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: One mailbox per agent; messages are addressed rather than broadcast.
- Control: Point to point. A recipient decides when, or whether, to read.
- Shared state: Only what a sender leaves in a recipient’s mailbox.

## When it is hypothesised to fit

Hypothesised to fit when a common channel has grown too large to scan and most traffic concerns two participants. The record below reports this is how mailboxes appeared there.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- Addressing conventions have to be invented and agreed, and they drift.
- A message sits unread if the recipient never comes back; the record below reports a mailbox that received nothing at all.
- Sender identity is only as good as the naming convention.
- State fragments across mailboxes, so no participant holds the whole picture any more.

These are things to watch for, not outcomes anyone measured here.

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `concurrent_role_invocations` (more than one agent acting at the same time): The supervisor runs one invocation at a time and refuses a declared active-agent count above one, rather than serializing a parallel policy and calling it the same thing.
- `agent_to_agent_messages` (a channel on which one agent addresses another): The adapter sees a single role invocation, and the tool surface offers no channel to another agent.

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
