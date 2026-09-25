---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'prompt chaining (Anthropic)'
  - 'assembly line (MetaGPT)'
  - 'chat chain (ChatDev)'
  - 'sequential process (CrewAI)'
  - 'sequential agents'
  - 'waterfall of role agents'
canonical_url: https://topologyindex.com/patterns/role_pipeline.md
description: 'A fixed sequence of roles, each working from what the role before it produced.'
executable_here: true
executor_requirements:
  - sequential_role_invocations
  - declared_handoff_on_measured_signal
family: hierarchy
findings_page: /patterns/role_pipeline/findings.md
observed_in: []
path: /patterns/role_pipeline.md
pattern: role_pipeline
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks:
      - SRDD
    compared_against: 'GPT-Engineer, a single-agent approach, and the MetaGPT multi-agent framework'
    direction: helped
    source_id: arxiv:2307.07924
    task_domain: 'Software development from natural-language requirements'
    task_domains:
      - coding
    url: https://arxiv.org/abs/2307.07924
  - benchmarks:
      - HumanEval
      - MBPP
      - APPS
      - CodeContests
      - xCodeEval
    compared_against: 'Direct, chain-of-thought, self-planning, analogical and Reflexion prompting, and the Self-collaboration and AlphaCodium frameworks'
    direction: helped
    source_id: arxiv:2405.11403
    task_domain: 'Competitive programming and program synthesis'
    task_domains:
      - coding
    url: https://arxiv.org/abs/2405.11403
  - benchmarks:
      - HumanEval
      - CIAR
      - CommonMT
      - FairEval
    compared_against: 'Flat and hierarchical multi-agent structures under the same injected faults'
    direction: hurt
    source_id: arxiv:2408.00989
    task_domain: 'Code generation, math, translation and text evaluation'
    task_domains:
      - coding
      - reasoning
      - evaluation
    url: https://arxiv.org/abs/2408.00989
qualifying_evidence: []
references:
  - https://www.anthropic.com/engineering/building-effective-agents
  - https://arxiv.org/abs/2308.00352
  - https://arxiv.org/abs/2307.07924
schema_version: v0.1
title: 'When to use the role_pipeline multi-agent pattern (prompt chaining, assembly line)?'
unmet_executor_requirements: []
---

# When to use the role_pipeline multi-agent pattern (prompt chaining, assembly line)?

**Short answer:** test it only when the work has a known sequence of stages that reward different instructions, and each stage can leave an artifact the next one can start from; otherwise start from the [decision guide](/patterns/index.md) row for your task. A hypothesis, not a ranking; [published findings](/patterns/role_pipeline/findings.md) keep the unfavourable ones.

The `role_pipeline` multi-agent pattern (family `hierarchy`): a fixed sequence of roles, each working from what the role before it produced.

Also called: prompt chaining (Anthropic), assembly line (MetaGPT), chat chain (ChatDev), sequential process (CrewAI), sequential agents, waterfall of role agents.

## The arrangement

- Structure: Three or more declared roles in a set order, each with its own instructions, sharing the episode workspace.
- Control: Each role hands off when its invocation completes; the order is declared, not decided during the run.
- Shared state: The artifacts each role leaves for the next: a specification, a design, code, a test report.

## When it is hypothesised to fit

Hypothesised to fit when the work has a known sequence of stages that reward different instructions, and each stage can leave an artifact the next one can start from.

A hypothesis to test on a workload, not a finding: this service has not tested it.

## Failure modes to watch for

- A mistake made early flows downstream, and later roles usually build on it rather than question it.
- A one-way chain has nowhere to send a problem back to; a role that finds a fault upstream can only work around it.
- Every stage runs on every task, including the stages a small task did not need.
- Each handoff is a rewrite of the task, so the last role can be working from a version that has drifted from what was asked.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/role_pipeline/findings.md](/patterns/role_pipeline/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [ChatDev: Communicative Agents for Software Development](https://arxiv.org/abs/2307.07924)
- **Helped**: [MapCoder: Multi-Agent Code Generation for Competitive Problem Solving](https://arxiv.org/abs/2405.11403)
- **Hurt**: [On the Resilience of LLM-Based Multi-Agent Collaboration with Faulty Agents](https://arxiv.org/abs/2408.00989)

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Building effective agents (Anthropic)](https://www.anthropic.com/engineering/building-effective-agents)
- [MetaGPT: Meta Programming for a Multi-Agent Collaborative Framework (Hong et al.)](https://arxiv.org/abs/2308.00352)
- [ChatDev: Communicative Agents for Software Development (Qian et al.)](https://arxiv.org/abs/2307.07924)

## Can this deployment execute it

Yes. The runner provides everything this arrangement needs:

- `sequential_role_invocations` (one role invocation at a time, in a declared order): The supervisor invokes exactly one role at a time and ends on the first crossed bound.
- `declared_handoff_on_measured_signal` (a handoff whose condition is a measured fact about the last invocation): Handoff conditions are evaluated from trusted instrumentation, never from role output.

Roles whose handoffs fire on a completed invocation, or on the outcome of the public checks, run here as declared. A role that chooses from its own judgement which role runs next is adaptive routing, and that does not run here.

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
