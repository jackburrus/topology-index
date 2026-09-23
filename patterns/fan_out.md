---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'best-of-N sampling'
  - 'parallel attempts'
  - self-consistency
  - 'parallelization by voting (Anthropic)'
canonical_url: https://topologyindex.com/patterns/fan_out.md
description: 'Several workers attempt the same task at once and one result is selected.'
executable_here: false
executor_requirements:
  - concurrent_role_invocations
  - aggregation_over_agent_opinions
family: parallelism
observed_in: []
path: /patterns/fan_out.md
pattern: fan_out
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - direction: helped
    url: https://arxiv.org/abs/2203.11171
  - direction: helped
    url: https://arxiv.org/abs/2402.05120
  - direction: mixed
    url: https://arxiv.org/abs/2407.21787
  - direction: mixed
    url: https://arxiv.org/abs/2403.02419
  - direction: no_clear_gain
    url: https://arxiv.org/abs/2411.17501
  - direction: helped
    url: https://arxiv.org/abs/2110.14168
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2203.11171
  - https://arxiv.org/abs/2402.05120
schema_version: v0.1
title: 'fan_out multi-agent pattern (best-of-N sampling, parallel attempts)'
unmet_executor_requirements:
  - concurrent_role_invocations
  - aggregation_over_agent_opinions
---

# fan_out

The `fan_out` multi-agent pattern (family `parallelism`): several workers attempt the same task at once and one result is selected.

Also called: best-of-N sampling, parallel attempts, self-consistency, parallelization by voting (Anthropic).

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: Interchangeable workers with the same instructions and separate workspaces.
- Control: Workers start together; a selection step chooses among the finished attempts.
- Shared state: None between workers; only the selection step sees every output.

## When it is hypothesised to fit

Hypothesised to fit when attempts vary a lot, a single attempt often fails, and something outside the workers can decide cheaply which attempt is good.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- Cost multiplies with the workers whether or not any of them succeeds.
- If the selector is itself a model, the arrangement measures the selector as much as the workers.
- Workers that are not fully isolated can duplicate side effects on the same target.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-22.

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
  Source: [Are More LLM Calls All You Need? Scaling laws of compound inference systems (Chen et al.)](https://arxiv.org/abs/2403.02419), Lingjiao Chen et al., 2024-03-04.
- **No clear gain** — The authors report that when verifiers such as unit tests are imperfect, resampling cannot remove false positives, so weaker models cannot reach a strong model's single-attempt accuracy and the optimal number of attempts is small.
  Compared against: A single call to a stronger model. Domain: Code generation with unit-test verification. Benchmarks: HumanEval, HumanEval+, MBPP, MBPP+.
  Caveat: The study is limited to coding benchmarks where the gap between weak and full test suites can be measured.
  Source: [The Limits of Inference Scaling Through Resampling (Stroebl et al.)](https://arxiv.org/abs/2411.17501), Benedikt Stroebl et al., 2024-11-26.
- **Helped** — The authors report that generating many candidate solutions and selecting the one ranked highest by a trained verifier substantially improves accuracy and scales better with data than fine-tuning alone.
  Compared against: Fine-tuned model producing a single answer. Domain: Grade-school math word problems. Benchmarks: GSM8K.
  Caveat: The gain depends on training a task-specific verifier, which requires labelled correct and incorrect solutions.
  Source: [Training Verifiers to Solve Math Word Problems (Cobbe et al., OpenAI)](https://arxiv.org/abs/2110.14168), Karl Cobbe et al., 2021-10-27.

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Self-Consistency Improves Chain of Thought Reasoning in Language Models (Wang et al.)](https://arxiv.org/abs/2203.11171)
- [More Agents Is All You Need (Li et al.)](https://arxiv.org/abs/2402.05120)

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
