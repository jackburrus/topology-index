---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/debate/findings.md
description: 'What published studies found about debate, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/debate/findings.md
pattern: debate
pattern_index: /patterns/index.md
pattern_page: /patterns/debate.md
product_api_version: v1
published_findings:
  - benchmarks:
      - GSM8K
      - MMLU
    compared_against: 'A single model instance and single-model reflection'
    direction: helped
    source_id: arxiv:2305.14325
    task_domain: 'Arithmetic, grade-school math, strategy and factual biographies'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2305.14325
  - benchmarks:
      - CIAR
    compared_against: 'Self-reflection with a single model'
    direction: helped
    source_id: arxiv:2305.19118
    task_domain: 'Commonsense machine translation and counter-intuitive arithmetic reasoning'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2305.19118
  - benchmarks:
      - QuALITY
    compared_against: 'Naive baselines without debate, such as a single consultant'
    direction: helped
    source_id: arxiv:2402.06782
    task_domain: 'Reading comprehension with information asymmetry'
    task_domains:
      - documents
      - reasoning
    url: https://arxiv.org/abs/2402.06782
  - benchmarks: []
    compared_against: 'Self-consistency and ensembling over multiple reasoning paths'
    direction: no_clear_gain
    source_id: arxiv:2311.17371
    task_domain: 'Question answering across popular research datasets'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2311.17371
  - benchmarks: []
    compared_against: 'Majority voting over independent agent answers'
    direction: no_clear_gain
    source_id: arxiv:2508.17536
    task_domain: 'Natural language processing benchmarks'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2508.17536
  - benchmarks: []
    compared_against: 'Single-agent chain-of-thought and self-consistency'
    direction: no_clear_gain
    source_id: arxiv:2502.08788
    task_domain: 'Reasoning, knowledge and coding question answering'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2502.08788
  - benchmarks:
      - PrimeVul
    compared_against: 'Single-agent chain-of-thought prompting, fine-tuned code models and the GPTLens auditor-critic system'
    direction: helped
    source_id: arxiv:2505.10961
    task_domain: 'Security: detecting vulnerable code in paired vulnerable and patched functions'
    task_domains:
      - security
    url: https://arxiv.org/abs/2505.10961
schema_version: v0.1
title: 'Published findings on the debate multi-agent pattern'
---

# Published findings on the debate multi-agent pattern

The findings filed under the [debate](/patterns/debate.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — The authors report that multiple model instances debating over several rounds improved mathematical and strategic reasoning and reduced hallucinated facts compared with a single model.
  Compared against: A single model instance and single-model reflection. Domain: Arithmetic, grade-school math, strategy and factual biographies. Benchmarks: GSM8K, MMLU.
  Caveat: Uses earlier models and does not match compute against self-consistency sampling with the same number of calls.
  Source: [Improving Factuality and Reasoning in Language Models through Multiagent Debate](https://arxiv.org/abs/2305.14325), Du et al., 2023-05-23.
- **Helped** — The authors report that a judged tit-for-tat debate between agents countered the degeneration of thought seen in self-reflection and improved results, while noting a judge may be unfair when agents use different models.
  Compared against: Self-reflection with a single model. Domain: Commonsense machine translation and counter-intuitive arithmetic reasoning. Benchmarks: CIAR.
  Caveat: Evaluated on two narrow challenge datasets and sensitive to debate settings such as the level of disagreement.
  Source: [Encouraging Divergent Thinking in Large Language Models through Multi-Agent Debate](https://arxiv.org/abs/2305.19118), Liang et al., 2023-05-30.
- **Helped** — The authors report that debate between expert models consistently helped weaker model judges and humans pick correct answers, and that more persuasive debaters further improved judge accuracy.
  Compared against: Naive baselines without debate, such as a single consultant. Domain: Reading comprehension with information asymmetry. Benchmarks: QuALITY.
  Caveat: Tests a scalable-oversight setting with hidden information, not general accuracy improvement for a solver.
  Source: [Debating with More Persuasive LLMs Leads to More Truthful Answers](https://arxiv.org/abs/2402.06782), Khan et al., 2024-02-09.
- **No clear gain** — The authors report that multi-agent debate systems in their current form did not reliably outperform self-consistency and multi-path ensembling, though some became competitive after hyperparameter tuning.
  Compared against: Self-consistency and ensembling over multiple reasoning paths. Domain: Question answering across popular research datasets.
  Caveat: Debate methods proved sensitive to hyperparameters, so conclusions may shift with tuning effort.
  Source: [Should we be going MAD? A Look at Multi-Agent Debate Strategies for LLMs](https://arxiv.org/abs/2311.17371), Smit et al., 2023-11-29.
- **No clear gain** — The authors report that majority voting alone accounts for most of the gains usually attributed to multi-agent debate, and argue theoretically that debate by itself does not improve expected correctness.
  Compared against: Majority voting over independent agent answers. Domain: Natural language processing benchmarks.
  Caveat: The theoretical model idealizes the debate process, and the authors show targeted interventions can make debate more effective.
  Source: [Debate or Vote: Which Yields Better Decisions in Multi-Agent Large Language Models?](https://arxiv.org/abs/2508.17536), Choi et al., 2025-08-24.
- **No clear gain** — The authors report that multi-agent debate often failed to outperform chain-of-thought and self-consistency despite using more inference compute, and that using heterogeneous models improved debate frameworks.
  Compared against: Single-agent chain-of-thought and self-consistency. Domain: Reasoning, knowledge and coding question answering.
  Caveat: Results are for the debate methods and base models evaluated, and heterogeneity was proposed as a remedy rather than exhaustively tested.
  Source: [Stop Overvaluing Multi-Agent Debate: We Must Rethink Evaluation and Embrace Model Heterogeneity](https://arxiv.org/abs/2502.08788), Zhang et al., 2025-02-12.
- **Helped** — Widyasari and colleagues report that a courtroom-style arrangement of a security researcher, a code author, a moderator and a review board detected vulnerable functions markedly better than single-agent prompting and an auditor-critic system, but that extending discussion beyond one round lowered performance.
  Compared against: Single-agent chain-of-thought prompting, fine-tuned code models and the GPTLens auditor-critic system. Domain: Security: detecting vulnerable code in paired vulnerable and patched functions. Benchmarks: PrimeVul.
  Caveat: Author-run evaluation on function-level pairs, and the arrangement costs roughly three times the single-agent run with the stronger model.
  Source: [Let the Trial Begin: A Mock-Court Approach to Vulnerability Detection using LLM-Based Agents](https://arxiv.org/abs/2505.10961), Widyasari et al., 2025-05-16.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
