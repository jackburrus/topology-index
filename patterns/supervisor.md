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
findings_page: /patterns/supervisor/findings.md
observed_in:
  - /research/openai-hugging-face-agent-coordination.md
path: /patterns/supervisor.md
pattern: supervisor
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks: []
    compared_against: 'A single agent using the same model as the lead agent'
    direction: helped
    source_id: web:anthropic.com/engineering/multi-agent-research-system
    task_domain: 'Open-ended web research'
    task_domains:
      - research
    url: https://www.anthropic.com/engineering/multi-agent-research-system
  - benchmarks:
      - GAIA
      - AssistantBench
      - WebArena
    compared_against: 'Published state-of-the-art agent systems on each benchmark'
    direction: no_clear_gain
    source_id: arxiv:2411.04468
    task_domain: 'Generalist web, file and coding tasks'
    task_domains:
      - coding
      - operations
    url: https://arxiv.org/abs/2411.04468
  - benchmarks:
      - Finance-Agent
      - PlanCraft
      - BrowseComp-Plus
      - Workbench
      - 'SWE-bench Verified'
      - Terminal-Bench
    compared_against: 'Single-agent systems and independent, decentralized and hybrid multi-agent architectures'
    direction: mixed
    source_id: arxiv:2512.08296
    task_domain: 'Agentic benchmarks spanning finance, web browsing, planning, workplace, software and terminal tasks'
    task_domains:
      - coding
      - research
      - reasoning
      - operations
    url: https://arxiv.org/abs/2512.08296
  - benchmarks: []
    compared_against: 'Single-agent approaches'
    direction: helped
    source_id: arxiv:2412.05449
    task_domain: 'Enterprise assistant scenarios'
    task_domains:
      - operations
    url: https://arxiv.org/abs/2412.05449
  - benchmarks:
      - MAST-Data
    compared_against: 'Expected task success of the same frameworks'
    direction: hurt
    source_id: arxiv:2503.13657
    task_domain: 'Coding, math and general agent tasks across several open-source multi-agent frameworks'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2503.13657
  - benchmarks:
      - AIxCC
    compared_against: 'A single-agent patcher, a fixed workflow and a general-purpose coding agent on the same tasks'
    direction: mixed
    source_id: arxiv:2603.01257
    task_domain: 'Security: repairing real-world vulnerabilities in large Java projects'
    task_domains:
      - coding
      - security
    url: https://arxiv.org/abs/2603.01257
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

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/supervisor/findings.md](/patterns/supervisor/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [Anthropic Engineering: How we built our multi-agent research system](https://www.anthropic.com/engineering/multi-agent-research-system)
- **No clear gain**: [Magentic-One: A Generalist Multi-Agent System for Solving Complex Tasks](https://arxiv.org/abs/2411.04468)
- **Mixed**: [Towards a Science of Scaling Agent Systems](https://arxiv.org/abs/2512.08296)
- **Helped**: [Towards Effective GenAI Multi-Agent Collaboration: Design and Evaluation for Enterprise Applications](https://arxiv.org/abs/2412.05449)
- **Hurt**: [Why Do Multi-Agent LLM Systems Fail?](https://arxiv.org/abs/2503.13657)
- **Mixed**: [A Systematic Study of LLM-Based Architectures for Automated Patching](https://arxiv.org/abs/2603.01257)

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
