---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/map_reduce/findings.md
description: 'What published studies found about map_reduce, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/map_reduce/findings.md
pattern: map_reduce
pattern_index: /patterns/index.md
pattern_page: /patterns/map_reduce.md
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
schema_version: v0.1
title: 'Published findings on the map_reduce multi-agent pattern'
---

# Published findings on the map_reduce multi-agent pattern

The findings filed under the [map_reduce](/patterns/map_reduce.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

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
- **Helped** — Wong and colleagues report that a main agent decomposing a broad collection task, with sub-agents searching the parts in parallel and the main agent aggregating their results, consistently outperformed a single agent with the same model and tools.
  Compared against: A single agent with the same model, search and web-reading tools. Domain: Broad information seeking: collecting many verifiable facts from the web into a table. Benchmarks: WideSearch.
  Caveat: The advantage shows in partial-correctness scores; almost every system, split or not, still failed nearly every task outright.
  Source: [WideSearch: Benchmarking Agentic Broad Info-Seeking](https://arxiv.org/abs/2508.07999), Wong et al., 2025-08-11.
- **Helped** — Go and colleagues report that a literature-review workflow that outlines, drafts subsections in parallel, then edits and reviews the combined article scored higher on writing and citation quality than direct prompting and the AutoSurvey and MASS-Survey pipelines.
  Compared against: Direct prompting and the AutoSurvey and MASS-Survey pipelines. Domain: Literature review generation from a set of references. Benchmarks: SciReviewGen.
  Caveat: Every run used one unseeded model, and the authors’ own ablations found that the editor agent slightly lowered most scores and that adding a researcher agent lowered them further.
  Source: [LiRA: A Multi-Agent Framework for Reliable and Readable Literature Review Generation](https://arxiv.org/abs/2510.05138), Go et al., 2025-10-01.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
