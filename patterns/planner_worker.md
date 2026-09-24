---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - planner-executor
  - plan-and-execute
  - plan-then-act
  - architect-editor
canonical_url: https://topologyindex.com/patterns/planner_worker.md
description: 'A planning role produces a plan, then a separate working role carries it out.'
executable_here: true
executor_requirements:
  - sequential_role_invocations
  - declared_handoff_on_measured_signal
family: hierarchy
findings_page: /patterns/planner_worker/findings.md
observed_in: []
path: /patterns/planner_worker.md
pattern: planner_worker
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks:
      - HotpotQA
    compared_against: 'Interleaved observation-dependent reasoning such as ReAct'
    direction: helped
    source_id: arxiv:2305.18323
    task_domain: 'Multi-step tool-augmented question answering'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2305.18323
  - benchmarks: []
    compared_against: 'ReAct-style sequential function calling'
    direction: helped
    source_id: arxiv:2312.04511
    task_domain: 'Parallelizable function-calling tasks'
    task_domains:
      - operations
    url: https://arxiv.org/abs/2312.04511
  - benchmarks: []
    compared_against: 'Zero-shot and few-shot chain-of-thought prompting'
    direction: helped
    source_id: arxiv:2305.04091
    task_domain: 'Arithmetic, commonsense and symbolic reasoning'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2305.04091
  - benchmarks:
      - 'aider code editing benchmark'
    compared_against: 'The same models editing code on their own'
    direction: helped
    source_id: web:aider.chat/2024/09/26/architect.html
    task_domain: 'Code editing'
    task_domains:
      - coding
    url: https://aider.chat/2024/09/26/architect.html
  - benchmarks:
      - WebArena-Lite
      - WebVoyager
    compared_against: 'Executor-only agents and planners without targeted training'
    direction: mixed
    source_id: arxiv:2503.09572
    task_domain: 'Long-horizon web navigation'
    task_domains:
      - operations
    url: https://arxiv.org/abs/2503.09572
  - benchmarks:
      - HackTheBox
      - VulnHub
      - picoMini
    compared_against: 'Direct use of the same LLM for penetration testing, and ablations removing each module'
    direction: helped
    source_id: arxiv:2308.06782
    task_domain: 'Offensive security: penetration testing of practice machines'
    task_domains:
      - security
    url: https://arxiv.org/abs/2308.06782
  - benchmarks:
      - 'NYU CTF Bench'
      - Cybench
      - HackTheBox
    compared_against: 'The same system run as a single executor, and prior single-agent CTF agents'
    direction: helped
    source_id: arxiv:2502.10931
    task_domain: 'Offensive security: capture-the-flag challenges'
    task_domains:
      - security
    url: https://arxiv.org/abs/2502.10931
  - benchmarks:
      - 'NYU CTF Bench'
    compared_against: 'Planner and executor running the same model'
    direction: no_clear_gain
    source_id: arxiv:2604.17159
    task_domain: 'Offensive security: capture-the-flag challenges'
    task_domains:
      - security
    url: https://arxiv.org/abs/2604.17159
  - benchmarks:
      - GAIA
      - WebWalkerQA
      - SimpleQA
      - 'Humanity''s Last Exam'
    compared_against: 'Single-model search agents such as WebThinker and ReAct, plan-and-solve prompting, and retrieval-augmented generation'
    direction: helped
    source_id: arxiv:2507.02652
    task_domain: 'Deep search: complex multi-step information seeking'
    task_domains:
      - research
    url: https://arxiv.org/abs/2507.02652
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2305.04091
  - https://arxiv.org/abs/2308.00352
schema_version: v0.1
title: 'planner_worker multi-agent pattern (planner-executor, plan-and-execute)'
unmet_executor_requirements: []
---

# planner_worker

The `planner_worker` multi-agent pattern (family `hierarchy`): a planning role produces a plan, then a separate working role carries it out.

Also called: planner-executor, plan-and-execute, plan-then-act, architect-editor.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: Two declared roles, one after the other, sharing the episode workspace.
- Control: A declared handoff fires when the planning invocation completes.
- Shared state: The episode workspace, including whatever the plan was written into.

## When it is hypothesised to fit

Hypothesised to fit when planning and editing reward different instructions or different model bindings, and planning is cheap next to the work.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- A plan written without touching the code can be confidently wrong, and the worker inherits it.
- The worker can abandon the plan silently; nothing in the arrangement notices.
- Two invocations cost two invocations, on every task, including the ones that needed no plan.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/planner_worker/findings.md](/patterns/planner_worker/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [ReWOO: Decoupling Reasoning from Observations for Efficient Augmented Language Models](https://arxiv.org/abs/2305.18323)
- **Helped**: [An LLM Compiler for Parallel Function Calling](https://arxiv.org/abs/2312.04511)
- **Helped**: [Plan-and-Solve Prompting: Improving Zero-Shot Chain-of-Thought Reasoning by Large Language Models](https://arxiv.org/abs/2305.04091)
- **Helped**: [Aider blog: Separating code reasoning and editing](https://aider.chat/2024/09/26/architect.html)
- **Mixed**: [Plan-and-Act: Improving Planning of Agents for Long-Horizon Tasks](https://arxiv.org/abs/2503.09572)
- **Helped**: [PentestGPT: Evaluating and Harnessing Large Language Models for Automated Penetration Testing](https://arxiv.org/abs/2308.06782)
- **Helped**: [D-CIPHER: Dynamic Collaborative Intelligent Multi-Agent System with Planner and Heterogeneous Executors for Offensive Security](https://arxiv.org/abs/2502.10931)
- **No clear gain**: [Systematic Capability Benchmarking of Frontier Large Language Models for Offensive Cyber Tasks](https://arxiv.org/abs/2604.17159)
- **Helped**: [HiRA: A Hierarchical Reasoning Framework for Decoupled Planning and Execution in Deep Search](https://arxiv.org/abs/2507.02652)

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Plan-and-Solve Prompting (Wang et al.)](https://arxiv.org/abs/2305.04091)
- [MetaGPT: Meta Programming for a Multi-Agent Collaborative Framework (Hong et al.)](https://arxiv.org/abs/2308.00352)

## Can this deployment execute it

Yes. The runner provides everything this arrangement needs:

- `sequential_role_invocations` (one role invocation at a time, in a declared order): The supervisor invokes exactly one role at a time and ends on the first crossed bound.
- `declared_handoff_on_measured_signal` (a handoff whose condition is a measured fact about the last invocation): Handoff conditions are evaluated from trusted instrumentation, never from role output.

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
