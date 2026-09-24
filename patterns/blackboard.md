---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'shared scratchpad'
  - 'shared memory architecture'
  - 'group chat (AutoGen)'
  - 'blackboard architecture'
canonical_url: https://topologyindex.com/patterns/blackboard.md
description: 'Every agent reads and writes one shared space, and that space is the coordination.'
executable_here: false
executor_requirements:
  - concurrent_role_invocations
  - shared_writable_state_between_agents
family: shared_state
findings_page: /patterns/blackboard/findings.md
observed_in:
  - /research/openai-hugging-face-agent-coordination.md
path: /patterns/blackboard.md
pattern: blackboard
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks:
      - MMLU
      - ARC-Challenge
      - GPQA-Diamond
      - BBH
      - MATH
      - GSM8K
    compared_against: 'Chain-of-thought, static multi-agent systems and autonomous multi-agent systems such as GPTSwarm and AFlow'
    direction: helped
    source_id: arxiv:2507.01701
    task_domain: 'Knowledge, scientific, symbolic and math reasoning'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2507.01701
  - benchmarks:
      - KramaBench
      - DSBench
      - DA-Code
    compared_against: 'Master-slave multi-agent coordination, retrieval-augmented generation and a single agent'
    direction: helped
    source_id: arxiv:2510.01285
    task_domain: 'Data discovery in data-science question answering'
    task_domains:
      - research
    url: https://arxiv.org/abs/2510.01285
  - benchmarks:
      - GAIA
    compared_against: 'The full Magentic-One orchestrator with task and progress ledgers'
    direction: hurt
    source_id: arxiv:2411.04468
    task_domain: 'Generalist agentic tasks'
    task_domains:
      - operations
    url: https://arxiv.org/abs/2411.04468
  - benchmarks: []
    compared_against: 'Ungoverned shared memory and long-context retrieval'
    direction: mixed
    source_id: arxiv:2606.24535
    task_domain: 'Production multi-tenant agent memory'
    task_domains: []
    url: https://arxiv.org/abs/2606.24535
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2308.08155
schema_version: v0.1
title: 'blackboard multi-agent pattern (shared scratchpad, shared memory architecture)'
unmet_executor_requirements:
  - concurrent_role_invocations
  - shared_writable_state_between_agents
---

# blackboard

The `blackboard` multi-agent pattern (family `shared_state`): every agent reads and writes one shared space, and that space is the coordination.

Also called: shared scratchpad, shared memory architecture, group chat (AutoGen), blackboard architecture.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: A set of agents and one common writable store; no direct addressing.
- Control: Emergent: an agent picks up what it finds useful. Nothing schedules the work.
- Shared state: All of it. Postings, partial results and claims live on the board.

## When it is hypothesised to fit

Hypothesised to fit when contributors are interchangeable, work is opportunistic, and a partial result from one agent is immediately usable by another.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- The board grows until scanning it dominates the work it was meant to speed up.
- Conflicting writes, overwritten entries and deletions of other agents’ work.
- No ordering guarantee, so two agents can act on states that contradict each other.
- Anyone who can write can post as anyone; the record below reports agents adopting signatures after mistaken identity.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/blackboard/findings.md](/patterns/blackboard/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [Exploring Advanced LLM Multi-Agent Systems Based on Blackboard Architecture](https://arxiv.org/abs/2507.01701)
- **Helped**: [LLM-Based Multi-Agent Blackboard System for Information Discovery in Data Science](https://arxiv.org/abs/2510.01285)
- **Hurt**: [Magentic-One: A Generalist Multi-Agent System for Solving Complex Tasks](https://arxiv.org/abs/2411.04468)
- **Mixed**: [Governed Shared Memory for Multi-Agent LLM Systems](https://arxiv.org/abs/2606.24535)

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [AutoGen: Enabling Next-Gen LLM Applications via Multi-Agent Conversation (Wu et al.)](https://arxiv.org/abs/2308.08155)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `concurrent_role_invocations` (more than one agent acting at the same time): The supervisor runs one invocation at a time and refuses a declared active-agent count above one, rather than serializing a parallel policy and calling it the same thing.
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
