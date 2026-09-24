---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - scatter-gather
  - 'parallelization by sectioning (Anthropic)'
  - 'divide and conquer'
  - split-and-merge
canonical_url: https://topologyindex.com/patterns/map_reduce.md
description: 'The task is split into parts, worked in parallel, and the parts are combined.'
executable_here: false
executor_requirements:
  - concurrent_role_invocations
  - aggregation_over_agent_opinions
family: parallelism
findings_page: /patterns/map_reduce/findings.md
observed_in: []
path: /patterns/map_reduce.md
pattern: map_reduce
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks:
      - InfiniteBench
      - Needle-in-a-Haystack
    compared_against: 'Open-source and commercial long-context LLMs reading the full input'
    direction: helped
    source_id: arxiv:2410.09342
    task_domain: 'Extremely long document understanding'
    task_domains:
      - documents
    url: https://arxiv.org/abs/2410.09342
  - benchmarks:
      - BookSum
      - NarrativeQA
    compared_against: 'Prior book-length summarization systems'
    direction: helped
    source_id: arxiv:2109.10862
    task_domain: 'Book-length abstractive summarization'
    task_domains:
      - documents
    url: https://arxiv.org/abs/2109.10862
  - benchmarks:
      - BooookScore
    compared_against: 'Incremental updating of a running summary'
    direction: mixed
    source_id: arxiv:2310.00785
    task_domain: 'Book-length summarization'
    task_domains:
      - documents
    url: https://arxiv.org/abs/2310.00785
  - benchmarks:
      - Vicuna-80
      - WizardLM
    compared_against: 'Standard sequential decoding'
    direction: mixed
    source_id: arxiv:2307.15337
    task_domain: 'Open-ended question answering'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2307.15337
  - benchmarks:
      - HotpotQA
      - MuSiQue
      - NarrativeQA
      - Qasper
      - QuALITY
      - QMSum
      - GovReport
      - RepoBench-P
    compared_against: 'Sequential Chain-of-Agents over the same chunks'
    direction: hurt
    source_id: arxiv:2406.02818
    task_domain: 'Long-context question answering, summarization and code completion'
    task_domains:
      - coding
      - documents
    url: https://arxiv.org/abs/2406.02818
  - benchmarks:
      - WideSearch
    compared_against: 'A single agent with the same model, search and web-reading tools'
    direction: helped
    source_id: arxiv:2508.07999
    task_domain: 'Broad information seeking: collecting many verifiable facts from the web into a table'
    task_domains:
      - research
    url: https://arxiv.org/abs/2508.07999
  - benchmarks:
      - SciReviewGen
    compared_against: 'Direct prompting and the AutoSurvey and MASS-Survey pipelines'
    direction: helped
    source_id: arxiv:2510.05138
    task_domain: 'Literature review generation from a set of references'
    task_domains:
      - research
    url: https://arxiv.org/abs/2510.05138
qualifying_evidence: []
references:
  - https://www.anthropic.com/engineering/building-effective-agents
schema_version: v0.1
title: 'map_reduce multi-agent pattern (scatter-gather, parallelization by sectioning)'
unmet_executor_requirements:
  - concurrent_role_invocations
  - aggregation_over_agent_opinions
---

# map_reduce

The `map_reduce` multi-agent pattern (family `parallelism`): the task is split into parts, worked in parallel, and the parts are combined.

Also called: scatter-gather, parallelization by sectioning (Anthropic), divide and conquer, split-and-merge.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: A splitting step, workers over disjoint parts, and a combining step.
- Control: Split, then parallel work, then combine; a worker sees only its own part.
- Shared state: The partition and the combined result; no worker writes another worker’s part.

## When it is hypothesised to fit

Hypothesised to fit when the work genuinely decomposes into parts whose results do not depend on one another, and combining them is mechanical.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- A wrong split dooms every part, and the parts cannot see that it was wrong.
- Dependencies between parts reappear as contradictions the combining step has to resolve.
- The combining step quietly becomes the hardest role while being described as bookkeeping.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/map_reduce/findings.md](/patterns/map_reduce/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [LLM×MapReduce: simplified long-sequence processing (Zhou et al.)](https://arxiv.org/abs/2410.09342)
- **Helped**: [Recursively Summarizing Books with Human Feedback (Wu et al., OpenAI)](https://arxiv.org/abs/2109.10862)
- **Mixed**: [BooookScore: book-length summarization in the era of LLMs (Chang et al.)](https://arxiv.org/abs/2310.00785)
- **Mixed**: [Skeleton-of-Thought: prompting LLMs for efficient parallel generation (Ning et al.)](https://arxiv.org/abs/2307.15337)
- **Hurt**: [Chain of Agents: LLMs collaborating on long-context tasks (Zhang et al.)](https://arxiv.org/abs/2406.02818)
- **Helped**: [WideSearch: Benchmarking Agentic Broad Info-Seeking](https://arxiv.org/abs/2508.07999)
- **Helped**: [LiRA: A Multi-Agent Framework for Reliable and Readable Literature Review Generation](https://arxiv.org/abs/2510.05138)

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Building effective agents (Anthropic)](https://www.anthropic.com/engineering/building-effective-agents)

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
