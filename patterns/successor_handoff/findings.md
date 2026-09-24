---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/successor_handoff/findings.md
description: 'What published studies found about successor_handoff, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/successor_handoff/findings.md
pattern: successor_handoff
pattern_index: /patterns/index.md
pattern_page: /patterns/successor_handoff.md
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
schema_version: v0.1
title: 'Published findings on the successor_handoff multi-agent pattern'
---

# Published findings on the successor_handoff multi-agent pattern

The findings filed under the [successor_handoff](/patterns/successor_handoff.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — Anthropic reports that compaction alone was not enough for a frontier coding agent working across many context windows, and that an initializer agent plus structured progress notes for each new session addressed failures like premature completion.
  Compared against: A coding agent looping across context windows with compaction only. Domain: Long-running software development.
  Caveat: Engineering guidance from qualitative experience without a controlled benchmark.
  Source: [Anthropic Engineering: Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents), Justin Young (Anthropic), 2025-11-26.
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
- **Helped** — Laban and colleagues report that LLMs degrade sharply when information arrives across many turns, that recap strategies only partly help, and suggest consolidating requirements into a fresh conversation.
  Compared against: Information spread across many conversation turns. Domain: Multi-turn generation tasks.
  Caveat: Studies user-to-model conversation rather than agent-to-agent handoff; the fresh-conversation advice is a recommendation, not a measured intervention.
  Source: [LLMs Get Lost In Multi-Turn Conversation](https://arxiv.org/abs/2505.06120), Laban et al., 2025-05-09.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
