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
published_findings:
  - direction: mixed
    url: https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents
  - direction: helped
    url: https://claude.com/blog/context-management
  - direction: mixed
    url: https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents
  - direction: helped
    url: https://arxiv.org/abs/2310.08560
  - direction: mixed
    url: https://arxiv.org/abs/2505.06120
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

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-22.

- **Mixed** — Anthropic reports that compaction alone was not enough for a frontier coding agent working across many context windows, and that an initializer agent plus structured progress notes for each new session addressed failures like premature completion.
  Compared against: A coding agent looping across context windows with compaction only. Domain: Long-running software development.
  Caveat: Engineering guidance from qualitative experience without a controlled benchmark.
  Source: [Anthropic Engineering: Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents), Justin Young et al. (Anthropic), 2025-11-26.
- **Helped** — Anthropic reports that combining a memory tool with context editing improved performance on an internal agentic search evaluation and let long workflows finish that otherwise failed from context exhaustion.
  Compared against: The same agent without context management features. Domain: Agentic web search.
  Caveat: Vendor-run internal evaluation with no public benchmark.
  Source: [Claude blog: Managing context on the Claude Developer Platform](https://claude.com/blog/context-management), Anthropic, 2025-09-29.
- **Mixed** — Anthropic describes compaction, structured note-taking and subagents returning condensed summaries as techniques for carrying work across context limits, motivated by context rot.
  Compared against: Keeping all history in one context window. Domain: Long-horizon agent tasks.
  Caveat: Guidance, not a result; the post provides no quantitative comparison.
  Source: [Anthropic Engineering: Effective context engineering for AI agents](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents), Rajasekaran, Dixon, Ryan, Hadfield (Anthropic), 2025-09-29.
- **Helped** — MemGPT reports that paging information between a limited context window and external memory tiers substantially outperformed fixed-context baselines at recalling facts from earlier sessions.
  Compared against: Fixed-context LLMs without memory management. Domain: Multi-session chat and long document analysis. Benchmarks: Deep Memory Retrieval.
  Caveat: A single agent managing its own memory rather than a handoff between agents, evaluated on older models.
  Source: [MemGPT: Towards LLMs as Operating Systems](https://arxiv.org/abs/2310.08560), Packer et al., 2023-10-12.
- **Mixed** — Laban and colleagues report that LLMs degrade sharply when information arrives across many turns, that recap strategies only partly help, and suggest consolidating requirements into a fresh conversation.
  Compared against: Single-turn fully specified instructions. Domain: Multi-turn generation tasks.
  Caveat: Studies user-to-model conversation rather than agent-to-agent handoff; the fresh-conversation advice is a recommendation, not a measured intervention.
  Source: [LLMs Get Lost In Multi-Turn Conversation](https://arxiv.org/abs/2505.06120), Laban et al., 2025-05-09.

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
