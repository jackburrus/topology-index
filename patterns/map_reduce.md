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
observed_in: []
path: /patterns/map_reduce.md
pattern: map_reduce
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - direction: helped
    url: https://arxiv.org/abs/2410.09342
  - direction: helped
    url: https://arxiv.org/abs/2109.10862
  - direction: mixed
    url: https://arxiv.org/abs/2310.00785
  - direction: mixed
    url: https://arxiv.org/abs/2307.15337
  - direction: hurt
    url: https://arxiv.org/abs/2406.02818
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

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-22.

- **Helped** — The authors report that splitting a long document into chunks, answering per chunk and aggregating with a structured protocol and confidence calibration can outperform representative long-context LLMs.
  Compared against: Open-source and commercial long-context LLMs reading the full input. Domain: Extremely long document understanding. Benchmarks: InfiniteBench, Needle-in-a-Haystack.
  Caveat: Their ablations show that naive chunk-and-aggregate performs markedly worse, so the gain depends on the added mechanisms for cross-chunk dependencies and conflicts.
  Source: [LLM×MapReduce: simplified long-sequence processing (Zhou et al.)](https://arxiv.org/abs/2410.09342), Zihan Zhou et al., 2024-10-12.
- **Helped** — The authors report that summarizing book sections and then recursively summarizing those summaries produced sensible whole-book summaries and state-of-the-art results at the time.
  Compared against: Prior book-length summarization systems. Domain: Book-length abstractive summarization. Benchmarks: BookSum, NarrativeQA.
  Caveat: The authors report that only a small fraction of summaries matched human quality, and the method relied on extensive human-feedback fine-tuning.
  Source: [Recursively Summarizing Books with Human Feedback (Wu et al., OpenAI)](https://arxiv.org/abs/2109.10862), Jeff Wu et al., 2021-09-22.
- **Mixed** — The authors report that hierarchical merging of chunk summaries scored higher on coherence than incremental updating, while incremental updating retained more detail.
  Compared against: Incremental updating of a running summary. Domain: Book-length summarization. Benchmarks: BooookScore.
  Caveat: The comparison measures coherence errors with an automatic metric and does not settle faithfulness or overall usefulness.
  Source: [BooookScore: book-length summarization in the era of LLMs (Chang et al.)](https://arxiv.org/abs/2310.00785), Yapei Chang et al., 2023-10-01.
- **Mixed** — The authors report that first drafting an answer skeleton and then expanding each point in parallel gives considerable speed-ups across many LLMs and can improve quality on some question categories.
  Compared against: Standard sequential decoding. Domain: Open-ended question answering. Benchmarks: Vicuna-80, WizardLM.
  Caveat: The authors report weak results on math, coding, writing and estimation questions where later points depend on earlier ones.
  Source: [Skeleton-of-Thought: prompting LLMs for efficient parallel generation (Ning et al.)](https://arxiv.org/abs/2307.15337), Xuefei Ning et al., 2023-07-28.
- **Hurt** — The authors report that their sequential chain of worker agents outperformed parallel merge-by-vote and hierarchical worker-to-manager baselines on every dataset tested, attributing the gap to parallel workers being unable to communicate.
  Compared against: Sequential Chain-of-Agents over the same chunks. Domain: Long-context question answering, summarization and code completion. Benchmarks: HotpotQA, MuSiQue, NarrativeQA, Qasper, QuALITY, QMSum, GovReport, RepoBench-P.
  Caveat: The parallel baselines were built by the authors of the competing sequential method, so they may not be tuned as strongly as dedicated map-reduce systems.
  Source: [Chain of Agents: LLMs collaborating on long-context tasks (Zhang et al.)](https://arxiv.org/abs/2406.02818), Yusen Zhang et al., 2024-06-04.

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
