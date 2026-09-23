---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'context handoff'
  - 'session handover'
  - 'relay agents'
  - 'long-running agent continuation'
canonical_url: https://topologyindex.com/patterns/successor_handoff.md
description: 'An agent hands its accumulated context to a later agent that continues the work.'
executable_here: false
executor_requirements:
  - context_carried_between_episodes
family: continuity
observed_in:
  - /research/openai-hugging-face-agent-coordination.md
path: /patterns/successor_handoff.md
pattern: successor_handoff
pattern_index: /patterns/index.md
product_api_version: v1
qualifying_evidence: []
references: []
schema_version: v0.1
title: 'successor_handoff multi-agent pattern (context handoff, session handover)'
unmet_executor_requirements:
  - context_carried_between_episodes
---

# successor_handoff

The `successor_handoff` multi-agent pattern (family `continuity`): an agent hands its accumulated context to a later agent that continues the work.

Also called: context handoff, session handover, relay agents, long-running agent continuation.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: A predecessor and a successor that never run at the same time.
- Control: The handover document is the control: what was done, what to do next.
- Shared state: The handed-over context, and nothing else.

## When it is hypothesised to fit

Hypothesised to fit when work outlasts one context window or one sandbox, and rediscovery costs more than writing the handover.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- A handover is a summary: it carries the predecessor’s mistakes and drops what the predecessor thought unimportant.
- The successor inherits confidence it did not earn, and usually cannot tell which claims were verified.
- Nothing in a handover separates a fact from an assumption unless the format forces it.

These are things to watch for, not outcomes anyone measured here.

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `context_carried_between_episodes` (what one episode learned carried into a later one): Every episode starts in a fresh isolated workspace, which is also what keeps one episode from advantaging the next.

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
