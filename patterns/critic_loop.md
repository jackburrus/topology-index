---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'evaluator-optimizer (Anthropic)'
  - reflection
  - self-refine
  - 'generator-critic loop'
  - 'actor-critic prompting'
canonical_url: https://topologyindex.com/patterns/critic_loop.md
description: 'Implementation and criticism alternate for a bounded number of rounds.'
executable_here: true
executor_requirements:
  - sequential_role_invocations
  - declared_handoff_on_measured_signal
  - review_only_role
  - bounded_repeat_activation
family: verification
observed_in: []
path: /patterns/critic_loop.md
pattern: critic_loop
pattern_index: /patterns/index.md
product_api_version: v1
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2303.17651
  - https://arxiv.org/abs/2303.11366
  - https://www.anthropic.com/engineering/building-effective-agents
schema_version: v0.1
title: 'critic_loop multi-agent pattern (evaluator-optimizer, reflection)'
unmet_executor_requirements: []
---

# critic_loop

The `critic_loop` multi-agent pattern (family `verification`): implementation and criticism alternate for a bounded number of rounds.

Also called: evaluator-optimizer (Anthropic), reflection, self-refine, generator-critic loop, actor-critic prompting.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: The implementing and review roles, with a declared handoff in each direction.
- Control: Both handoffs are declared and each carries its own activation limit.
- Shared state: The episode workspace, carried across rounds.

## When it is hypothesised to fit

Hypothesised to fit when one round of criticism is rarely enough and each further round is expected to remove more than it costs.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- Rounds that repeat without converging, which is why the activation bound exists and why crossing it is recorded.
- The loop can consume the budget before the validator ever runs.
- Later rounds can reopen questions the earlier rounds settled.

These are things to watch for, not outcomes anyone measured here.

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Self-Refine: Iterative Refinement with Self-Feedback (Madaan et al.)](https://arxiv.org/abs/2303.17651)
- [Reflexion: Language Agents with Verbal Reinforcement Learning (Shinn et al.)](https://arxiv.org/abs/2303.11366)
- [Building effective agents (Anthropic)](https://www.anthropic.com/engineering/building-effective-agents)

## Can this deployment execute it

Yes. The runner provides everything this arrangement needs:

- `sequential_role_invocations` (one role invocation at a time, in a declared order): The supervisor invokes exactly one role at a time and ends on the first crossed bound.
- `declared_handoff_on_measured_signal` (a handoff whose condition is a measured fact about the last invocation): Handoff conditions are evaluated from trusted instrumentation, never from role output.
- `review_only_role` (a role that can read the workspace but not write it): A role without the write tool is a review-only role, and its completion is a signal.
- `bounded_repeat_activation` (a handoff that may fire more than once under a declared bound): Each handoff carries its own activation limit; crossing it is a recorded observation.

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
