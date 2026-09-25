---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'agent architecture search'
  - 'automated agent design'
  - 'self-improving agent topology'
  - 'topology optimization'
canonical_url: https://topologyindex.com/patterns/architecture_search.md
description: 'The arrangement itself is changed while the work runs, searching for a better one.'
executable_here: false
executor_requirements:
  - configuration_change_during_run
  - role_creation_at_runtime
family: adaptive
findings_page: /patterns/architecture_search/findings.md
observed_in: []
path: /patterns/architecture_search.md
pattern: architecture_search
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks:
      - DROP
      - MGSM
    compared_against: 'State-of-the-art hand-designed agents'
    direction: helped
    source_id: arxiv:2408.08435
    task_domain: 'Reading comprehension, math, science and coding'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2408.08435
  - benchmarks: []
    compared_against: 'Human-designed agents, accounting for design plus deployment cost'
    direction: hurt
    source_id: arxiv:2510.06711
    task_domain: 'Automated agent design across several datasets'
    task_domains: []
    url: https://arxiv.org/abs/2510.06711
  - benchmarks: []
    compared_against: 'Manually designed workflows and prior automated methods'
    direction: helped
    source_id: arxiv:2410.10762
    task_domain: 'Question answering, code generation and math'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2410.10762
  - benchmarks: []
    compared_against: 'Handcrafted and automated multi-agent systems'
    direction: helped
    source_id: arxiv:2502.04180
    task_domain: 'Math, coding and tool use'
    task_domains:
      - coding
      - reasoning
      - operations
    url: https://arxiv.org/abs/2502.04180
  - benchmarks:
      - MATH
      - DROP
      - HotpotQA
      - MuSiQue
      - '2WikiMQA'
      - MBPP
      - HumanEval
      - LiveCodeBench
    compared_against: 'Unoptimized topologies and agent-scaling strategies such as self-consistency and debate'
    direction: mixed
    source_id: arxiv:2502.02533
    task_domain: 'Reasoning, multi-hop question answering and coding'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2502.02533
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2408.08435
  - https://arxiv.org/abs/2402.16823
schema_version: v0.1
title: 'When to use the architecture_search multi-agent pattern (agent architecture search, automated agent design)?'
unmet_executor_requirements:
  - configuration_change_during_run
  - role_creation_at_runtime
---

# When to use the architecture_search multi-agent pattern (agent architecture search, automated agent design)?

**Short answer:** test it only when the space of arrangements is large, a round is cheap, and the search is kept strictly away from the tasks any later claim will rest on; otherwise start from the [decision guide](/patterns/index.md) row for your task. A hypothesis, not a ranking; [published findings](/patterns/architecture_search/findings.md) keep the unfavourable ones.

The `architecture_search` multi-agent pattern (family `adaptive`): the arrangement itself is changed while the work runs, searching for a better one.

Also called: agent architecture search, automated agent design, self-improving agent topology, topology optimization.

## The arrangement

- Structure: A configuration under test plus a mechanism that rewrites it between rounds.
- Control: An outer loop edits roles, handoffs or bindings and runs again.
- Shared state: The configuration being searched.

## When it is hypothesised to fit

Hypothesised to fit when the space of arrangements is large, a round is cheap, and the search is kept strictly away from the tasks any later claim will rest on.

A hypothesis to test on a workload, not a finding: this service has not tested it.

## Failure modes to watch for

- Searching and measuring on the same tasks produces a number about the search, not about the arrangement.
- Every mutation is a new configuration, so anything observed before the mutation describes something that no longer exists.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/architecture_search/findings.md](/patterns/architecture_search/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [Automated Design of Agentic Systems](https://arxiv.org/abs/2408.08435)
- **Hurt**: [Inefficiencies of Meta Agents for Agent Design](https://arxiv.org/abs/2510.06711)
- **Helped**: [AFlow: Automating Agentic Workflow Generation](https://arxiv.org/abs/2410.10762)
- **Helped**: [Multi-agent Architecture Search via Agentic Supernet](https://arxiv.org/abs/2502.04180)
- **Mixed**: [Multi-Agent Design: Optimizing Agents with Better Prompts and Topologies](https://arxiv.org/abs/2502.02533)

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Automated Design of Agentic Systems (Hu et al.)](https://arxiv.org/abs/2408.08435)
- [GPTSwarm: Language Agents as Optimizable Graphs (Zhuge et al.)](https://arxiv.org/abs/2402.16823)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `configuration_change_during_run` (the arrangement itself edited while the work runs): The execution lock is pinned for the run; a changed arrangement is a different lock and a different comparison.
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

No research record on this service reports observing this arrangement.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
