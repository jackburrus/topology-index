---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - planner-executor
  - plan-and-execute
  - plan-then-act
  - architect-editor
  - 'nearest arrangement to prompt chaining'
canonical_url: https://topologyindex.com/patterns/planner_worker.md
description: 'A planning role produces a plan, then a separate working role carries it out.'
executable_here: true
executor_requirements:
  - sequential_role_invocations
  - declared_handoff_on_measured_signal
family: hierarchy
observed_in: []
path: /patterns/planner_worker.md
pattern: planner_worker
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - direction: helped
    url: https://arxiv.org/abs/2305.18323
  - direction: helped
    url: https://arxiv.org/abs/2312.04511
  - direction: helped
    url: https://arxiv.org/abs/2305.04091
  - direction: helped
    url: https://aider.chat/2024/09/26/architect.html
  - direction: mixed
    url: https://arxiv.org/abs/2503.09572
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

Also called: planner-executor, plan-and-execute, plan-then-act, architect-editor, nearest arrangement to prompt chaining.

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

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-22.

- **Helped** — The authors report that decoupling up-front planning from tool observations, with separate planner, worker and solver roles, used several times fewer tokens and slightly improved accuracy over interleaved reason-and-act prompting.
  Compared against: Interleaved observation-dependent reasoning such as ReAct. Domain: Multi-step tool-augmented question answering. Benchmarks: HotpotQA.
  Caveat: Gains were shown with older models on a small set of QA benchmarks, and a fixed up-front plan cannot adapt to surprising observations.
  Source: [ReWOO: Decoupling Reasoning from Observations for Efficient Augmented Language Models](https://arxiv.org/abs/2305.18323), Xu et al., 2023-05-23.
- **Helped** — The authors report that a planner that emits a dependency graph of function calls, executed in parallel by a dispatcher, cut latency and cost and modestly improved accuracy relative to sequential ReAct.
  Compared against: ReAct-style sequential function calling. Domain: Parallelizable function-calling tasks.
  Caveat: Benefits depend on the task having independent sub-calls, and the 'up to' gains are best cases rather than averages.
  Source: [An LLM Compiler for Parallel Function Calling](https://arxiv.org/abs/2312.04511), Kim et al., 2023-12-07.
- **Helped** — The authors report that prompting a model to first devise a plan and then carry out subtasks substantially outperformed zero-shot chain-of-thought and approached few-shot chain-of-thought on math reasoning.
  Compared against: Zero-shot and few-shot chain-of-thought prompting. Domain: Arithmetic, commonsense and symbolic reasoning.
  Caveat: This is a single-model prompting technique, not separate planner and executor agents, evaluated on an older model.
  Source: [Plan-and-Solve Prompting: Improving Zero-Shot Chain-of-Thought Reasoning by Large Language Models](https://arxiv.org/abs/2305.04091), Wang et al., 2023-05-06.
- **Helped** — Aider reports that splitting work between an architect model that proposes a solution and an editor model that writes the edits scored at or above each model working alone on its code editing benchmark, with the best pairing setting a new high score.
  Compared against: The same models editing code on their own. Domain: Code editing. Benchmarks: aider code editing benchmark.
  Caveat: Self-published benchmark by the tool's developer, and the top pairings were described as too slow for interactive use.
  Source: [Aider blog: Separating code reasoning and editing](https://aider.chat/2024/09/26/architect.html), Aider (Paul Gauthier), 2024-09-26.
- **Mixed** — The authors report that adding an untrained planner failed to improve over fine-tuned executors, suggesting poor plans can confuse the executor, while a planner trained on synthetic plans plus dynamic replanning reached state-of-the-art web navigation results.
  Compared against: Executor-only agents and planners without targeted training. Domain: Long-horizon web navigation. Benchmarks: WebArena-Lite, WebVoyager.
  Caveat: The gains rely on substantial planner fine-tuning with synthetic data, so an off-the-shelf planner split alone did not deliver them.
  Source: [Plan-and-Act: Improving Planning of Agents for Long-Horizon Tasks](https://arxiv.org/abs/2503.09572), Erdogan et al., 2025-03-12.

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
