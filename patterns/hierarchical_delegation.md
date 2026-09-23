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
published_findings:
  - direction: helped
    url: https://arxiv.org/abs/2308.00352
  - direction: mixed
    url: https://arxiv.org/abs/2408.00989
  - direction: helped
    url: https://arxiv.org/abs/2502.11098
  - direction: hurt
    url: https://arxiv.org/abs/2603.26993
  - direction: no_clear_gain
    url: https://arxiv.org/abs/2503.13657
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

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-22.

- **Helped** — The authors report that encoding standardized operating procedures into an assembly line of role agents produced more coherent software solutions than earlier chat-based multi-agent systems and used fewer tokens per line of code than ChatDev, though more tokens in total.
  Compared against: Chat-based multi-agent frameworks such as ChatDev and AgentVerse, and single models. Domain: Software engineering and code generation. Benchmarks: HumanEval, MBPP, SoftwareDev.
  Caveat: Evaluated largely by the framework's authors, including on a self-constructed software task set.
  Source: [MetaGPT: Meta Programming for A Multi-Agent Collaborative Framework](https://arxiv.org/abs/2308.00352), Hong et al., 2023-08-01.
- **Mixed** — The authors report that a mixed hierarchical structure lost the least performance when faulty agents were injected, while one-way linear pipelines such as MetaGPT-style chains lost the most.
  Compared against: Linear and flat multi-agent structures. Domain: Code generation, math, translation and text evaluation. Benchmarks: HumanEval, CIAR, CommonMT, FairEval.
  Caveat: Structures were represented by a handful of existing systems that differ in more than topology, and robustness under injected errors is not the same as baseline accuracy.
  Source: [On the Resilience of LLM-Based Multi-Agent Collaboration with Faulty Agents](https://arxiv.org/abs/2408.00989), Huang et al., 2024-08-02.
- **Helped** — The authors report that a supervisor-led hierarchy with a nested evaluation team and structured messages outperformed strong single-model and multi-agent baselines across their tasks.
  Compared against: Strong reasoning models and multi-agent frameworks such as AgentVerse. Domain: Question answering and advertisement text generation. Benchmarks: MMLU, WikiQA, Camera.
  Caveat: The authors themselves flag a very high API cost for the experiments.
  Source: [Talk Structurally, Act Hierarchically: A Collaborative Framework for LLM Multi-Agent Systems](https://arxiv.org/abs/2502.11098), Wang et al., 2025-02-16.
- **Hurt** — The authors argue that multi-stage LLM planning networks that pass limited language messages lose information at each hand-off and, absent new external signals, cannot beat a single centralized decision-maker with the same information.
  Compared against: A single centralized decision-maker with equivalent information access. Domain: Multi-stage planning and decision making.
  Caveat: Primarily a theoretical technical note with small controlled experiments rather than a large empirical benchmark study.
  Source: [On the Reliability Limits of LLM-Based Multi-Agent Planning](https://arxiv.org/abs/2603.26993), Ao, Gao, Simchi-Levi, 2026-03-27.
- **No clear gain** — The authors report that improving role specifications in the role-hierarchy framework ChatDev produced only a modest gain in task success, and conclude that many failures stem from organizational design and coordination rather than individual agent ability.
  Compared against: The unmodified ChatDev configuration. Domain: Software development tasks. Benchmarks: MAST-Data.
  Caveat: A single intervention case study rather than a systematic comparison of hierarchy depths.
  Source: [Why Do Multi-Agent LLM Systems Fail?](https://arxiv.org/abs/2503.13657), Cemri et al., 2025-03-17.

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
