---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'dynamic subagents'
  - 'spawn-on-demand workers'
  - 'runtime agent creation'
  - 'subagent spawning'
canonical_url: https://topologyindex.com/patterns/dynamic_spawning.md
description: 'New workers are created during the run in response to what the run finds.'
executable_here: false
executor_requirements:
  - role_creation_at_runtime
  - concurrent_role_invocations
family: adaptive
findings_page: /patterns/dynamic_spawning/findings.md
observed_in: []
path: /patterns/dynamic_spawning.md
pattern: dynamic_spawning
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks: []
    compared_against: 'A single agent using the stronger model alone'
    direction: helped
    source_id: web:anthropic.com/engineering/multi-agent-research-system
    task_domain: 'Open-ended web research'
    task_domains:
      - research
    url: https://www.anthropic.com/engineering/multi-agent-research-system
  - benchmarks: []
    compared_against: 'A single agent'
    direction: mixed
    source_id: arxiv:2308.10848
    task_domain: 'Text understanding, reasoning, coding, tool use and embodied tasks'
    task_domains:
      - coding
      - reasoning
      - operations
    url: https://arxiv.org/abs/2308.10848
  - benchmarks: []
    compared_against: 'Existing multi-agent methods with predefined agents'
    direction: helped
    source_id: arxiv:2309.17288
    task_domain: 'Open-ended question answering and creative writing'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2309.17288
  - benchmarks: []
    compared_against: 'A single-threaded linear agent sharing full context'
    direction: hurt
    source_id: web:cognition.com/blog/dont-build-multi-agents
    task_domain: 'Software engineering agents'
    task_domains:
      - coding
    url: https://cognition.com/blog/dont-build-multi-agents
  - benchmarks:
      - Bamboogle
      - Musique
      - HotpotQA
    compared_against: 'The same model without search, a ReAct-style search agent, and the ChatGPT-Web and Perplexity Pro products'
    direction: helped
    source_id: arxiv:2407.20183
    task_domain: 'Web information seeking and multi-hop question answering'
    task_domains:
      - research
    url: https://arxiv.org/abs/2407.20183
qualifying_evidence: []
references:
  - https://www.anthropic.com/engineering/multi-agent-research-system
schema_version: v0.1
title: 'When to use the dynamic_spawning multi-agent pattern (dynamic subagents, spawn-on-demand workers)?'
unmet_executor_requirements:
  - role_creation_at_runtime
  - concurrent_role_invocations
---

# When to use the dynamic_spawning multi-agent pattern (dynamic subagents, spawn-on-demand workers)?

**Short answer:** when the task has subtasks unknown until it starts, start with [supervisor](/patterns/supervisor.md) and consider it next. A hypothesis from the [decision guide](/patterns/index.md), not a ranking; [published findings](/patterns/dynamic_spawning/findings.md) keep the unfavourable ones.

The `dynamic_spawning` multi-agent pattern (family `adaptive`): new workers are created during the run in response to what the run finds.

Also called: dynamic subagents, spawn-on-demand workers, runtime agent creation, subagent spawning.

## The arrangement

- Structure: Roles that do not exist until something in the run asks for them.
- Control: A spawning decision taken inside the run.
- Shared state: Whatever the spawning role hands to what it spawned.

## When it is hypothesised to fit

Hypothesised to fit when the shape of the work is unknown until it starts, so a fixed role set is either wasteful or too small.

A hypothesis to test on a workload, not a finding: this service has not tested it.

## Failure modes to watch for

- A spawn decision is a spending decision; if a model makes it, something else must hold the budget.
- What ran is no longer what was registered, so an evaluation cannot say which arrangement produced the result.
- Runaway spawning is the failure this arrangement is bounded against.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/dynamic_spawning/findings.md](/patterns/dynamic_spawning/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [Anthropic Engineering: How we built our multi-agent research system](https://www.anthropic.com/engineering/multi-agent-research-system)
- **Mixed**: [AgentVerse: Facilitating Multi-Agent Collaboration and Exploring Emergent Behaviors](https://arxiv.org/abs/2308.10848)
- **Helped**: [AutoAgents: A Framework for Automatic Agent Generation](https://arxiv.org/abs/2309.17288)
- **Hurt**: [Cognition blog: Don't Build Multi-Agents](https://cognition.com/blog/dont-build-multi-agents)
- **Helped**: [MindSearch: Mimicking Human Minds Elicits Deep AI Searcher](https://arxiv.org/abs/2407.20183)

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [How we built our multi-agent research system (Anthropic)](https://www.anthropic.com/engineering/multi-agent-research-system)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `role_creation_at_runtime` (roles that do not exist until the work asks for them): Roles come from the registered formation; the supervisor can only move between declared roles.
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
