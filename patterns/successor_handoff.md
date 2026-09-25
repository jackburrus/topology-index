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
findings_page: /patterns/successor_handoff/findings.md
observed_in:
  - /research/openai-hugging-face-agent-coordination.md
path: /patterns/successor_handoff.md
pattern: successor_handoff
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks: []
    compared_against: 'A coding agent looping across context windows with compaction only'
    direction: helped
    source_id: web:anthropic.com/engineering/effective-harnesses-for-long-running-agents
    task_domain: 'Long-running software development'
    task_domains:
      - coding
    url: https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents
  - benchmarks: []
    compared_against: 'The same agent without context management features'
    direction: helped
    source_id: web:claude.com/blog/context-management
    task_domain: 'Agentic web search'
    task_domains:
      - research
    url: https://claude.com/blog/context-management
  - benchmarks: []
    compared_against: 'Keeping all history in one context window'
    direction: mixed
    source_id: web:anthropic.com/engineering/effective-context-engineering-for-ai-agents
    task_domain: 'Long-horizon agent tasks'
    task_domains: []
    url: https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents
  - benchmarks:
      - 'Deep Memory Retrieval'
    compared_against: 'Fixed-context LLMs without memory management'
    direction: helped
    source_id: arxiv:2310.08560
    task_domain: 'Multi-session chat and long document analysis'
    task_domains:
      - documents
    url: https://arxiv.org/abs/2310.08560
  - benchmarks: []
    compared_against: 'Information spread across many conversation turns'
    direction: helped
    source_id: arxiv:2505.06120
    task_domain: 'Multi-turn generation tasks'
    task_domains: []
    url: https://arxiv.org/abs/2505.06120
qualifying_evidence: []
references: []
schema_version: v0.1
title: 'When to use the successor_handoff multi-agent pattern (context handoff, session handover)?'
unmet_executor_requirements:
  - context_carried_between_episodes
---

# When to use the successor_handoff multi-agent pattern (context handoff, session handover)?

**Short answer:** start with it when the task outlasts one context window or session; avoid it when rediscovery is cheaper than a handover. A hypothesis from the [decision guide](/patterns/index.md), not a ranking; [published findings](/patterns/successor_handoff/findings.md) keep the unfavourable ones.

The `successor_handoff` multi-agent pattern (family `continuity`): an agent hands its accumulated context to a later agent that continues the work.

Also called: context handoff, session handover, relay agents, long-running agent continuation.

## The arrangement

- Structure: A predecessor and a successor that never run at the same time.
- Control: The handover document is the control: what was done, what to do next.
- Shared state: The handed-over context, and nothing else.

## When it is hypothesised to fit

Hypothesised to fit when work outlasts one context window or one sandbox, and rediscovery costs more than writing the handover.

A hypothesis to test on a workload, not a finding: this service has not tested it.

## Failure modes to watch for

- A handover is a summary: it carries the predecessor’s mistakes and drops what the predecessor thought unimportant.
- The successor inherits confidence it did not earn, and usually cannot tell which claims were verified.
- Nothing in a handover separates a fact from an assumption unless the format forces it.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/successor_handoff/findings.md](/patterns/successor_handoff/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [Anthropic Engineering: Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)
- **Helped**: [Claude blog: Managing context on the Claude Developer Platform](https://claude.com/blog/context-management)
- **Mixed**: [Anthropic Engineering: Effective context engineering for AI agents](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
- **Helped**: [MemGPT: Towards LLMs as Operating Systems](https://arxiv.org/abs/2310.08560)
- **Helped**: [LLMs Get Lost In Multi-Turn Conversation](https://arxiv.org/abs/2505.06120)

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
