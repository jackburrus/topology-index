---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'best-of-N sampling'
  - 'parallel attempts'
  - self-consistency
  - 'parallelization by voting (Anthropic)'
canonical_url: https://topologyindex.com/patterns/fan_out.md
description: 'Several workers attempt the same task at once and one result is selected.'
executable_here: false
executor_requirements:
  - concurrent_role_invocations
  - aggregation_over_agent_opinions
family: parallelism
observed_in: []
path: /patterns/fan_out.md
pattern: fan_out
pattern_index: /patterns/index.md
product_api_version: v1
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2203.11171
  - https://arxiv.org/abs/2402.05120
schema_version: v0.1
title: 'fan_out multi-agent pattern (best-of-N sampling, parallel attempts)'
unmet_executor_requirements:
  - concurrent_role_invocations
  - aggregation_over_agent_opinions
---

# fan_out

The `fan_out` multi-agent pattern (family `parallelism`): several workers attempt the same task at once and one result is selected.

Also called: best-of-N sampling, parallel attempts, self-consistency, parallelization by voting (Anthropic).

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: Interchangeable workers with the same instructions and separate workspaces.
- Control: Workers start together; a selection step chooses among the finished attempts.
- Shared state: None between workers; only the selection step sees every output.

## When it is hypothesised to fit

Hypothesised to fit when attempts vary a lot, a single attempt often fails, and something outside the workers can decide cheaply which attempt is good.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- Cost multiplies with the workers whether or not any of them succeeds.
- If the selector is itself a model, the arrangement measures the selector as much as the workers.
- Workers that are not fully isolated can duplicate side effects on the same target.

These are things to watch for, not outcomes anyone measured here.

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Self-Consistency Improves Chain of Thought Reasoning in Language Models (Wang et al.)](https://arxiv.org/abs/2203.11171)
- [More Agents Is All You Need (Li et al.)](https://arxiv.org/abs/2402.05120)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `concurrent_role_invocations` (more than one agent acting at the same time): The supervisor runs one invocation at a time and refuses a declared active-agent count above one, rather than serializing a parallel policy and calling it the same thing.
- `aggregation_over_agent_opinions` (a rule that combines what several roles judged into one outcome): The supervisor decides only from measured signals, so it cannot read a verdict, weigh it or count votes.

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
