---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'hierarchical agents'
  - 'hierarchical multi-agent system'
  - 'recursive delegation'
  - 'hierarchical teams (LangGraph)'
canonical_url: https://topologyindex.com/patterns/hierarchical_delegation.md
description: 'Work is delegated down several levels: assignees become assigners.'
executable_here: false
executor_requirements:
  - agent_to_agent_messages
  - role_creation_at_runtime
family: hierarchy
observed_in:
  - /research/openai-hugging-face-agent-coordination.md
path: /patterns/hierarchical_delegation.md
pattern: hierarchical_delegation
pattern_index: /patterns/index.md
product_api_version: v1
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2308.00352
schema_version: v0.1
title: 'hierarchical_delegation multi-agent pattern (hierarchical agents, hierarchical multi-agent system)'
unmet_executor_requirements:
  - agent_to_agent_messages
  - role_creation_at_runtime
---

# hierarchical_delegation

The `hierarchical_delegation` multi-agent pattern (family `hierarchy`): work is delegated down several levels: assignees become assigners.

Also called: hierarchical agents, hierarchical multi-agent system, recursive delegation, hierarchical teams (LangGraph).

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: A tree of roles that deepens as the work is broken down.
- Control: Each level assigns to the level below and reports to the level above.
- Shared state: Per-branch context; siblings share nothing.

## When it is hypothesised to fit

Hypothesised to fit when work decomposes recursively and each level can state an acceptance condition for the level below it.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- Instructions lose fidelity at every level, and so does what comes back.
- Depth multiplies cost in a way that is easy to miss while authoring.
- A failure deep in the tree reaches the top as a summary of a summary.

These are things to watch for, not outcomes anyone measured here.

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [MetaGPT: Meta Programming for a Multi-Agent Collaborative Framework (Hong et al.)](https://arxiv.org/abs/2308.00352)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `agent_to_agent_messages` (a channel on which one agent addresses another): The adapter sees a single role invocation, and the tool surface offers no channel to another agent.
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

Reports that describe this arrangement. A report is a reason to test an arrangement, never a
result for it.

- [Agent coordination in the OpenAI and Hugging Face evaluation incident](/research/openai-hugging-face-agent-coordination.md) (descriptive_only)

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
