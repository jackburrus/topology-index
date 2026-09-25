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
findings_page: /patterns/fan_out/findings.md
observed_in: []
path: /patterns/fan_out.md
pattern: fan_out
pattern_index: /patterns/index.md
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
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2203.11171
  - https://arxiv.org/abs/2402.05120
schema_version: v0.1
title: 'When to use the fan_out multi-agent pattern (best-of-N sampling, parallel attempts)?'
unmet_executor_requirements:
  - concurrent_role_invocations
  - aggregation_over_agent_opinions
---

# When to use the fan_out multi-agent pattern (best-of-N sampling, parallel attempts)?

**Short answer:** start with it when the task often fails, but attempts vary; avoid it when nothing can cheaply pick the winning attempt. A hypothesis from the [decision guide](/patterns/index.md), not a ranking; [published findings](/patterns/fan_out/findings.md) keep the unfavourable ones.

The `fan_out` multi-agent pattern (family `parallelism`): several workers attempt the same task at once and one result is selected.

Also called: best-of-N sampling, parallel attempts, self-consistency, parallelization by voting (Anthropic).

## The arrangement

- Structure: Interchangeable workers with the same instructions and separate workspaces.
- Control: Workers start together; a selection step chooses among the finished attempts.
- Shared state: None between workers; only the selection step sees every output.

## When it is hypothesised to fit

Hypothesised to fit when attempts vary a lot, a single attempt often fails, and something outside the workers can decide cheaply which attempt is good.

A hypothesis to test on a workload, not a finding: this service has not tested it.

## Failure modes to watch for

- Cost multiplies with the workers whether or not any of them succeeds.
- If the selector is itself a model, the arrangement measures the selector as much as the workers.
- Workers that are not fully isolated can duplicate side effects on the same target.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/fan_out/findings.md](/patterns/fan_out/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [Self-Consistency Improves Chain of Thought Reasoning in Language Models (Wang et al.)](https://arxiv.org/abs/2203.11171)
- **Helped**: [More Agents Is All You Need (Li et al.)](https://arxiv.org/abs/2402.05120)
- **Mixed**: [Large Language Monkeys: scaling inference compute with repeated sampling (Brown et al.)](https://arxiv.org/abs/2407.21787)
- **Mixed**: [Are More LLM Calls All You Need? Towards Scaling Laws of Compound Inference Systems](https://arxiv.org/abs/2403.02419)
- **Hurt**: [The Limits of Inference Scaling Through Resampling (Stroebl et al.)](https://arxiv.org/abs/2411.17501)
- **Helped**: [Training Verifiers to Solve Math Word Problems (Cobbe et al., OpenAI)](https://arxiv.org/abs/2110.14168)

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
