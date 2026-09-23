---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'orchestrator-worker (Anthropic)'
  - orchestrator-workers
  - 'supervisor agent (LangGraph)'
  - 'manager agent'
  - 'hierarchical process (CrewAI)'
  - 'lead agent with subagents'
canonical_url: https://topologyindex.com/patterns/supervisor.md
description: 'One controlling role directs subordinate workers and decides what happens next.'
executable_here: false
executor_requirements:
  - agent_to_agent_messages
  - routing_on_unmeasured_conditions
family: hierarchy
observed_in:
  - /research/openai-hugging-face-agent-coordination.md
path: /patterns/supervisor.md
pattern: supervisor
pattern_index: /patterns/index.md
product_api_version: v1
qualifying_evidence: []
references:
  - https://www.anthropic.com/engineering/building-effective-agents
  - https://www.anthropic.com/engineering/multi-agent-research-system
  - https://arxiv.org/abs/2308.08155
schema_version: v0.1
title: 'supervisor multi-agent pattern (orchestrator-worker, orchestrator-workers)'
unmet_executor_requirements:
  - agent_to_agent_messages
  - routing_on_unmeasured_conditions
---

# supervisor

The `supervisor` multi-agent pattern (family `hierarchy`): one controlling role directs subordinate workers and decides what happens next.

Also called: orchestrator-worker (Anthropic), orchestrator-workers, supervisor agent (LangGraph), manager agent, hierarchical process (CrewAI), lead agent with subagents.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: A supervisor role plus workers that act only when directed.
- Control: The supervisor assigns work, inspects what comes back, and redirects or stops.
- Shared state: Whatever the supervisor passes down; workers do not address each other.

## When it is hypothesised to fit

Hypothesised to fit when the work needs one place that holds the plan, and the workers can be narrower and cheaper than the role directing them.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- Every result is filtered through one context window, which is both a bottleneck and a single point of failure.
- A supervisor that is itself a model can be argued out of its own instructions by the work it is reading.
- Subordinates report upward as summaries, so the supervisor sees a tidier run than the one that happened.

These are things to watch for, not outcomes anyone measured here.

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Building effective agents (Anthropic)](https://www.anthropic.com/engineering/building-effective-agents)
- [How we built our multi-agent research system (Anthropic)](https://www.anthropic.com/engineering/multi-agent-research-system)
- [AutoGen: Enabling Next-Gen LLM Applications via Multi-Agent Conversation (Wu et al.)](https://arxiv.org/abs/2308.08155)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `agent_to_agent_messages` (a channel on which one agent addresses another): The adapter sees a single role invocation, and the tool surface offers no channel to another agent.
- `routing_on_unmeasured_conditions` (the next role chosen from conditions the executor does not measure): A condition outside the measured signal set is refused as an unsupported capability, and every adaptation rule in an execution lock is refused with it.

Supervision itself is not missing here: the runner supervises every episode, asks a guard before each invocation and holds the bounds. What cannot run is supervision by a role, where a model decides what another agent does next.

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
