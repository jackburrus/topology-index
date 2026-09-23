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
