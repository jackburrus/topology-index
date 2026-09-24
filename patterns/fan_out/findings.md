---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/fan_out/findings.md
description: 'What published studies found about fan_out, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/fan_out/findings.md
pattern: fan_out
pattern_index: /patterns/index.md
pattern_page: /patterns/fan_out.md
product_api_version: v1
published_findings:
  - benchmarks:
      - GSM8K
      - SVAMP
      - AQuA
      - StrategyQA
      - ARC-Challenge
    compared_against: 'Single greedy-decoded chain-of-thought'
    direction: helped
    source_id: arxiv:2203.11171
    task_domain: 'Arithmetic and commonsense reasoning'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2203.11171
  - benchmarks:
      - GSM8K
      - MATH
      - MMLU
      - 'Chess State Tracking'
      - HumanEval
    compared_against: 'Single LLM call and more elaborate prompting or multi-agent methods'
    direction: helped
    source_id: arxiv:2402.05120
    task_domain: 'Reasoning and code generation'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2402.05120
  - benchmarks:
      - GSM8K
      - MATH
      - MiniF2F
      - CodeContests
      - 'SWE-bench Lite'
    compared_against: 'Single-sample attempts'
    direction: mixed
    source_id: arxiv:2407.21787
    task_domain: 'Math, formal proofs, competitive programming and software engineering'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2407.21787
  - benchmarks:
      - 'MMLU Physics'
      - TruthfulQA
      - GPQA
      - AVeriTeC
    compared_against: 'Vote and Filter-Vote systems at smaller call counts'
    direction: mixed
    source_id: arxiv:2403.02419
    task_domain: 'Multiple-choice question answering and fact verification'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2403.02419
  - benchmarks:
      - HumanEval
      - HumanEval+
      - MBPP
      - MBPP+
    compared_against: 'A single call to a stronger model'
    direction: hurt
    source_id: arxiv:2411.17501
    task_domain: 'Code generation with unit-test verification'
    task_domains:
      - coding
    url: https://arxiv.org/abs/2411.17501
  - benchmarks:
      - GSM8K
    compared_against: 'Fine-tuned model producing a single answer'
    direction: helped
    source_id: arxiv:2110.14168
    task_domain: 'Grade-school math word problems'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2110.14168
schema_version: v0.1
title: 'Published findings on the fan_out multi-agent pattern'
---

# Published findings on the fan_out multi-agent pattern

The findings filed under the [fan_out](/patterns/fan_out.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — The authors report that sampling diverse chain-of-thought reasoning paths and taking the most consistent answer by vote substantially improves accuracy over a single greedy chain.
  Compared against: Single greedy-decoded chain-of-thought. Domain: Arithmetic and commonsense reasoning. Benchmarks: GSM8K, SVAMP, AQuA, StrategyQA, ARC-Challenge.
  Caveat: Voting needs a short answer that can be matched across samples, so it does not directly apply to open-ended outputs.
  Source: [Self-Consistency Improves Chain of Thought Reasoning in Language Models (Wang et al.)](https://arxiv.org/abs/2203.11171), Xuezhi Wang et al., 2022-03-21.
- **Helped** — The authors report that a simple sample-and-vote method lets performance scale with the number of agents instantiated, with larger gains on harder tasks relative to the model.
  Compared against: Single LLM call and more elaborate prompting or multi-agent methods. Domain: Reasoning and code generation. Benchmarks: GSM8K, MATH, MMLU, Chess State Tracking, HumanEval.
  Caveat: The authors note token cost grows in proportion to agent count and gains taper off at the highest difficulty levels they tested.
  Source: [More Agents Is All You Need (Li et al.)](https://arxiv.org/abs/2402.05120), Junyou Li et al., 2024-02-03.
- **Mixed** — The authors report that coverage from repeated sampling keeps rising with sample count and converts into real gains where answers can be automatically verified, but majority voting and reward models plateau and fail to keep pace where no verifier exists.
  Compared against: Single-sample attempts. Domain: Math, formal proofs, competitive programming and software engineering. Benchmarks: GSM8K, MATH, MiniF2F, CodeContests, SWE-bench Lite.
  Caveat: Most of the upside is coverage, which only becomes accuracy when a reliable automatic verifier can pick the correct sample.
  Source: [Large Language Monkeys: scaling inference compute with repeated sampling (Brown et al.)](https://arxiv.org/abs/2407.21787), Bradley Brown et al., 2024-07-31.
- **Mixed** — The authors report that accuracy of majority-vote and filter-then-vote systems can first increase and then decrease as the number of LLM calls grows, because extra calls help easy queries but hurt hard ones.
  Compared against: Vote and Filter-Vote systems at smaller call counts. Domain: Multiple-choice question answering and fact verification. Benchmarks: MMLU Physics, TruthfulQA, GPQA, AVeriTeC.
  Caveat: The analysis covers only simple voting aggregators on multiple-choice style tasks, not richer selection or verification schemes.
  Source: [Are More LLM Calls All You Need? Towards Scaling Laws of Compound Inference Systems](https://arxiv.org/abs/2403.02419), Chen et al., 2024-03-04.
- **Hurt** — The authors report that when verifiers such as unit tests are imperfect, resampling cannot remove false positives, so weaker models cannot reach a strong model's single-attempt accuracy and the optimal number of attempts is small.
  Compared against: A single call to a stronger model. Domain: Code generation with unit-test verification. Benchmarks: HumanEval, HumanEval+, MBPP, MBPP+.
  Caveat: The study is limited to coding benchmarks where the gap between weak and full test suites can be measured.
  Source: [The Limits of Inference Scaling Through Resampling (Stroebl et al.)](https://arxiv.org/abs/2411.17501), Benedikt Stroebl et al., 2024-11-26.
- **Helped** — The authors report that generating many candidate solutions and selecting the one ranked highest by a trained verifier substantially improves accuracy and scales better with data than fine-tuning alone.
  Compared against: Fine-tuned model producing a single answer. Domain: Grade-school math word problems. Benchmarks: GSM8K.
  Caveat: The gain depends on training a task-specific verifier, which requires labelled correct and incorrect solutions.
  Source: [Training Verifiers to Solve Math Word Problems (Cobbe et al., OpenAI)](https://arxiv.org/abs/2110.14168), Karl Cobbe et al., 2021-10-27.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
