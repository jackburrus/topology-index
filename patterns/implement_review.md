---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - maker-checker
  - coder-reviewer
  - generate-and-review
  - LLM-as-reviewer
  - author-reviewer
canonical_url: https://topologyindex.com/patterns/implement_review.md
description: 'An implementing role hands work to a review-only role within a bounded cycle.'
executable_here: true
executor_requirements:
  - sequential_role_invocations
  - declared_handoff_on_measured_signal
  - review_only_role
family: verification
observed_in: []
path: /patterns/implement_review.md
pattern: implement_review
pattern_index: /patterns/index.md
product_api_version: v1
qualifying_evidence: []
references:
  - https://www.anthropic.com/engineering/building-effective-agents
schema_version: v0.1
title: 'implement_review multi-agent pattern (maker-checker, coder-reviewer)'
unmet_executor_requirements: []
---

# implement_review

The `implement_review` multi-agent pattern (family `verification`): an implementing role hands work to a review-only role within a bounded cycle.

Also called: maker-checker, coder-reviewer, generate-and-review, LLM-as-reviewer, author-reviewer.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: Two declared roles, one with write access and one without, sharing the workspace.
- Control: A declared handoff on a measured signal, with the review cycle bounded.
- Shared state: The episode workspace.

## When it is hypothesised to fit

Hypothesised to fit when mistakes are easier to spot than to avoid, and a reviewer that cannot write cannot quietly paper over what it finds.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- A reviewer reading the same context can agree with the implementer for the same wrong reason.
- Review costs on every task, including the ones that were already correct.
- A review verdict is an opinion until a validator outside both roles decides.

These are things to watch for, not outcomes anyone measured here.

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Building effective agents (Anthropic)](https://www.anthropic.com/engineering/building-effective-agents)

## Can this deployment execute it

Yes. The runner provides everything this arrangement needs:

- `sequential_role_invocations` (one role invocation at a time, in a declared order): The supervisor invokes exactly one role at a time and ends on the first crossed bound.
- `declared_handoff_on_measured_signal` (a handoff whose condition is a measured fact about the last invocation): Handoff conditions are evaluated from trusted instrumentation, never from role output.
- `review_only_role` (a role that can read the workspace but not write it): A role without the write tool is a review-only role, and its completion is a signal.

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
