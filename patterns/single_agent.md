---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'single-agent baseline'
  - 'augmented LLM'
  - 'ReAct agent'
  - 'tool-using agent loop'
canonical_url: https://topologyindex.com/patterns/single_agent.md
description: 'One agent works the task alone, with no second role and no shared state.'
executable_here: true
executor_requirements:
  - sequential_role_invocations
family: baseline
observed_in: []
path: /patterns/single_agent.md
pattern: single_agent
pattern_index: /patterns/index.md
product_api_version: v1
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2210.03629
  - https://www.anthropic.com/engineering/building-effective-agents
schema_version: v0.1
title: 'single_agent multi-agent pattern (single-agent baseline, augmented LLM)'
unmet_executor_requirements: []
---

# single_agent

The `single_agent` multi-agent pattern (family `baseline`): one agent works the task alone, with no second role and no shared state.

Also called: single-agent baseline, augmented LLM, ReAct agent, tool-using agent loop.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: One role, one model binding, one workspace.
- Control: The executor invokes the role and ends on a stop condition or a crossed bound.
- Shared state: Only the episode workspace, which no other agent reads or writes.

## When it is hypothesised to fit

Hypothesised to fit when a task is small enough that a second role would add cost without changing the outcome. It is also the arrangement every comparison needs, because a claim about any other arrangement is only meaningful against a strong single-agent configuration.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- An agent asked to judge its own work has nothing to contradict it; only a validator outside the agent can.
- It looks cheap, so it is the arrangement most often given an unexamined budget.

These are things to watch for, not outcomes anyone measured here.

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [ReAct: Synergizing Reasoning and Acting in Language Models (Yao et al.)](https://arxiv.org/abs/2210.03629)
- [Building effective agents (Anthropic)](https://www.anthropic.com/engineering/building-effective-agents)

## Can this deployment execute it

Yes. The runner provides everything this arrangement needs:

- `sequential_role_invocations` (one role invocation at a time, in a declared order): The supervisor invokes exactly one role at a time and ends on the first crossed bound.

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
