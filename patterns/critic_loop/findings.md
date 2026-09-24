---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/critic_loop/findings.md
description: 'What published studies found about critic_loop, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/critic_loop/findings.md
pattern: critic_loop
pattern_index: /patterns/index.md
pattern_page: /patterns/critic_loop.md
product_api_version: v1
published_findings:
  - benchmarks:
      - GSM8K
    compared_against: 'One-step generation with the same model'
    direction: helped
    source_id: arxiv:2303.17651
    task_domain: 'Dialogue, code optimization, math reasoning and other generation tasks'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2303.17651
  - benchmarks:
      - HumanEval
      - ALFWorld
      - HotpotQA
    compared_against: 'The same agent without reflection'
    direction: helped
    source_id: arxiv:2303.11366
    task_domain: 'Sequential decision-making, coding and language reasoning'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2303.11366
  - benchmarks:
      - TriviaQA
      - HotpotQA
      - GSM8K
    compared_against: 'The same model without tool-interactive critiquing'
    direction: helped
    source_id: arxiv:2305.11738
    task_domain: 'Free-form question answering, math program synthesis and toxicity reduction'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2305.11738
  - benchmarks:
      - GSM8K
      - CommonSenseQA
      - HotpotQA
    compared_against: 'The model''s initial answers before intrinsic self-correction'
    direction: hurt
    source_id: arxiv:2310.01798
    task_domain: 'Math, commonsense and multi-hop question answering'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2310.01798
  - benchmarks:
      - 'Game of 24'
      - 'Graph Coloring'
      - 'STRIPS planning'
    compared_against: 'Iterative prompting with a sound external verifier and one-shot generation'
    direction: hurt
    source_id: arxiv:2402.08115
    task_domain: 'Reasoning and planning puzzles'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2402.08115
  - benchmarks: []
    compared_against: 'Various self-correction baselines across surveyed studies'
    direction: mixed
    source_id: arxiv:2406.01297
    task_domain: 'Survey of self-correction research'
    task_domains: []
    url: https://arxiv.org/abs/2406.01297
  - benchmarks: []
    compared_against: 'The same idea generator with fewer or no rounds of reviewing-agent feedback'
    direction: helped
    source_id: arxiv:2404.07738
    task_domain: 'Research idea generation over scientific literature'
    task_domains:
      - research
    url: https://arxiv.org/abs/2404.07738
schema_version: v0.1
title: 'Published findings on the critic_loop multi-agent pattern'
---

# Published findings on the critic_loop multi-agent pattern

The findings filed under the [critic_loop](/patterns/critic_loop.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — The authors report that iterative self-feedback and refinement by the same model improved outputs over one-step generation across a diverse set of tasks, as judged by humans and automatic metrics.
  Compared against: One-step generation with the same model. Domain: Dialogue, code optimization, math reasoning and other generation tasks. Benchmarks: GSM8K.
  Caveat: Gains were concentrated in open-ended generation tasks, and later work found intrinsic self-correction on reasoning tasks to be much weaker.
  Source: [Self-Refine: Iterative Refinement with Self-Feedback](https://arxiv.org/abs/2303.17651), Madaan et al., 2023-03-30.
- **Helped** — The authors report that agents reflecting verbally on task feedback and storing reflections in memory improved significantly over a baseline agent on sequential decision-making, coding and reasoning tasks.
  Compared against: The same agent without reflection. Domain: Sequential decision-making, coding and language reasoning. Benchmarks: HumanEval, ALFWorld, HotpotQA.
  Caveat: Improvements rely on external feedback signals such as unit tests or environment rewards across multiple trials, not on self-critique alone.
  Source: [Reflexion: Language Agents with Verbal Reinforcement Learning](https://arxiv.org/abs/2303.11366), Shinn et al., 2023-03-20.
- **Helped** — The authors report that letting a model verify and revise its output using external tools such as search and code interpreters consistently improved performance, and they stress that external feedback is crucial for self-improvement.
  Compared against: The same model without tool-interactive critiquing. Domain: Free-form question answering, math program synthesis and toxicity reduction. Benchmarks: TriviaQA, HotpotQA, GSM8K.
  Caveat: The benefit depends on reliable tool feedback, so it does not show that critique without external grounding works.
  Source: [CRITIC: Large Language Models Can Self-Correct with Tool-Interactive Critiquing](https://arxiv.org/abs/2305.11738), Gou et al., 2023-05-19.
- **Hurt** — The authors report that models struggled to self-correct their reasoning without external feedback, and that performance sometimes degraded after self-correction.
  Compared against: The model's initial answers before intrinsic self-correction. Domain: Math, commonsense and multi-hop question answering. Benchmarks: GSM8K, CommonSenseQA, HotpotQA.
  Caveat: Covers intrinsic self-correction with earlier models on reasoning tasks, and does not address correction driven by external feedback.
  Source: [Large Language Models Cannot Self-Correct Reasoning Yet](https://arxiv.org/abs/2310.01798), Huang et al., 2023-10-03.
- **Hurt** — The authors report significant performance collapse when a model critiqued its own answers, contrasted with significant gains when a sound external verifier checked solutions.
  Compared against: Iterative prompting with a sound external verifier and one-shot generation. Domain: Reasoning and planning puzzles. Benchmarks: Game of 24, Graph Coloring, STRIPS planning.
  Caveat: Evaluated a single model on puzzle-like domains where exact verifiers exist, which may not represent open-ended tasks.
  Source: [On the Self-Verification Limitations of Large Language Models on Reasoning and Planning Tasks](https://arxiv.org/abs/2402.08115), Stechly et al., 2024-02-12.
- **Mixed** — In a critical survey, the authors conclude that no prior work shows successful self-correction with feedback from prompted models except on tasks exceptionally suited to it, while self-correction works well with reliable external feedback or large-scale fine-tuning.
  Compared against: Various self-correction baselines across surveyed studies. Domain: Survey of self-correction research.
  Caveat: This is a literature survey whose conclusions depend on the studies available at the time of writing.
  Source: [When Can LLMs Actually Correct Their Own Mistakes? A Critical Survey of Self-Correction of LLMs](https://arxiv.org/abs/2406.01297), Kamoi et al., 2024-06-03.
- **Helped** — Baek and colleagues report that iteratively refining research ideas with feedback from LLM reviewing agents improved the ideas under both human and model-based judgment, with gains saturating after a few rounds.
  Compared against: The same idea generator with fewer or no rounds of reviewing-agent feedback. Domain: Research idea generation over scientific literature.
  Caveat: Idea quality was judged by an LLM and a small panel of researchers rather than by carrying the ideas out, and returns diminished with further rounds.
  Source: [ResearchAgent: Iterative Research Idea Generation over Scientific Literature with Large Language Models](https://arxiv.org/abs/2404.07738), Baek et al., 2024-04-11.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
