---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/council/findings.md
description: 'What published studies found about council, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/council/findings.md
pattern: council
pattern_index: /patterns/index.md
pattern_page: /patterns/council.md
product_api_version: v1
published_findings:
  - benchmarks:
      - 'AlpacaEval 2.0'
      - MT-Bench
      - FLASK
    compared_against: 'Single frontier models'
    direction: helped
    source_id: arxiv:2406.04692
    task_domain: 'Open-ended instruction following'
    task_domains: []
    url: https://arxiv.org/abs/2406.04692
  - benchmarks:
      - 'AlpacaEval 2.0'
      - MMLU
      - CRUX
      - MATH
    compared_against: 'Aggregating several outputs of the single best model'
    direction: mixed
    source_id: arxiv:2502.00674
    task_domain: 'Instruction following, knowledge, code reasoning and math'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2502.00674
  - benchmarks: []
    compared_against: 'A single large LLM judge'
    direction: helped
    source_id: arxiv:2404.18796
    task_domain: 'LLM output evaluation across question answering and chat settings'
    task_domains:
      - evaluation
    url: https://arxiv.org/abs/2404.18796
  - benchmarks:
      - MT-Bench
      - 'Chatbot Arena'
    compared_against: 'Human expert and crowdsourced preference judgments'
    direction: mixed
    source_id: arxiv:2306.05685
    task_domain: 'Chat assistant evaluation'
    task_domains:
      - evaluation
    url: https://arxiv.org/abs/2306.05685
  - benchmarks:
      - XSUM
      - CNN/DailyMail
    compared_against: 'Human annotator judgments of equal-quality outputs'
    direction: hurt
    source_id: arxiv:2404.13076
    task_domain: 'Self-evaluation of summaries'
    task_domains:
      - documents
      - evaluation
    url: https://arxiv.org/abs/2404.13076
  - benchmarks: []
    compared_against: 'Voting systems with fewer model calls'
    direction: mixed
    source_id: arxiv:2403.02419
    task_domain: 'Language tasks aggregated by majority vote'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2403.02419
  - benchmarks: []
    compared_against: 'A single LLM screening with the same model'
    direction: helped
    source_id: arxiv:2607.21920
    task_domain: 'Screening clinical trials for systematic literature reviews'
    task_domains:
      - research
    url: https://arxiv.org/abs/2607.21920
schema_version: v0.1
title: 'Published findings on the council multi-agent pattern'
---

# Published findings on the council multi-agent pattern

The findings filed under the [council](/patterns/council.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — The authors report that a layered mixture of agents, where each model refines using all outputs from the previous layer, reached leading scores on instruction-following leaderboards and surpassed a strong single frontier model.
  Compared against: Single frontier models. Domain: Open-ended instruction following. Benchmarks: AlpacaEval 2.0, MT-Bench, FLASK.
  Caveat: Evaluated on LLM-judged preference benchmarks and uses many more model calls than the single-model baseline.
  Source: [Mixture-of-Agents Enhances Large Language Model Capabilities](https://arxiv.org/abs/2406.04692), Wang et al., 2024-06-07.
- **Mixed** — The authors report that aggregating multiple outputs from only the single best model outperformed the standard mixture of different models in many scenarios, because mixing lowered average quality.
  Compared against: Aggregating several outputs of the single best model. Domain: Instruction following, knowledge, code reasoning and math. Benchmarks: AlpacaEval 2.0, MMLU, CRUX, MATH.
  Caveat: The authors also identify scenarios where mixing different models helps, so the result is about diversity versus quality rather than ensembling in general.
  Source: [Rethinking Mixture-of-Agents: Is Mixing Different Large Language Models Beneficial?](https://arxiv.org/abs/2502.00674), Li et al., 2025-02-02.
- **Helped** — The authors report that a panel of smaller judges from disjoint model families outperformed a single large judge, showed less intra-model bias, and cost considerably less.
  Compared against: A single large LLM judge. Domain: LLM output evaluation across question answering and chat settings.
  Caveat: Evaluated on a limited set of judge settings and datasets, and agreement with humans is the target metric rather than downstream task quality.
  Source: [Replacing Judges with Juries: Evaluating LLM Generations with a Panel of Diverse Models](https://arxiv.org/abs/2404.18796), Verga et al., 2024-04-29.
- **Mixed** — The authors report that strong LLM judges agreed with human preferences about as well as humans agree with each other, while documenting position, verbosity and self-enhancement biases.
  Compared against: Human expert and crowdsourced preference judgments. Domain: Chat assistant evaluation. Benchmarks: MT-Bench, Chatbot Arena.
  Caveat: Concerns single-judge setups with earlier models, and the identified biases are only partly mitigated by the proposed fixes.
  Source: [Judging LLM-as-a-Judge with MT-Bench and Chatbot Arena](https://arxiv.org/abs/2306.05685), Zheng et al., 2023-06-09.
- **Hurt** — The authors report that LLM evaluators can recognize their own generations and that this self-recognition correlates with a bias toward scoring their own outputs higher than humans would.
  Compared against: Human annotator judgments of equal-quality outputs. Domain: Self-evaluation of summaries. Benchmarks: XSUM, CNN/DailyMail.
  Caveat: Studied on summarization with a small set of models, so the size of the bias in other domains is uncertain.
  Source: [LLM Evaluators Recognize and Favor Their Own Generations](https://arxiv.org/abs/2404.13076), Panickssery et al., 2024-04-15.
- **Mixed** — The authors report that majority-vote systems can first improve and then degrade as more model calls are added, because extra calls help on easy queries but hurt on hard ones.
  Compared against: Voting systems with fewer model calls. Domain: Language tasks aggregated by majority vote.
  Caveat: Analyzes simple vote and filter-vote designs rather than richer judge panels or deliberating councils.
  Source: [Are More LLM Calls All You Need? Towards Scaling Laws of Compound Inference Systems](https://arxiv.org/abs/2403.02419), Chen et al., 2024-03-04.
- **Helped** — Ren and colleagues report that screening trials for a systematic review with several agents given different personas, which cross-review until they agree, uniformly improved accuracy over a single model screening with the same underlying model.
  Compared against: A single LLM screening with the same model. Domain: Screening clinical trials for systematic literature reviews.
  Caveat: Evaluated only on oncology trial registries by the proposing authors, and the cases the agents could not agree on were escalated to human reviewers.
  Source: [Systematic Literature Reviews With Two Multi-Agentic Systems And Human-In-The-Loop](https://arxiv.org/abs/2607.21920), Ren et al., 2026-07-24.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
