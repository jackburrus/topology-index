---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'LLM-as-a-judge panel'
  - 'jury of models'
  - 'ensemble review'
  - mixture-of-agents
  - 'majority vote review'
canonical_url: https://topologyindex.com/patterns/council.md
description: 'Several reviewers judge the same work and their verdicts are combined into one.'
executable_here: false
executor_requirements:
  - aggregation_over_agent_opinions
family: verification
findings_page: /patterns/council/findings.md
observed_in: []
path: /patterns/council.md
pattern: council
pattern_index: /patterns/index.md
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
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2406.04692
  - https://arxiv.org/abs/2404.18796
schema_version: v0.1
title: 'council multi-agent pattern (LLM-as-a-judge panel, jury of models)'
unmet_executor_requirements:
  - aggregation_over_agent_opinions
---

# council

The `council` multi-agent pattern (family `verification`): several reviewers judge the same work and their verdicts are combined into one.

Also called: LLM-as-a-judge panel, jury of models, ensemble review, mixture-of-agents, majority vote review.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: One implementing role, several reviewing roles, and an aggregation rule.
- Control: The aggregation rule decides: a vote, a quorum or a veto.
- Shared state: The work under review; verdicts are combined rather than negotiated.

## When it is hypothesised to fit

Hypothesised to fit when reviewer mistakes are uncorrelated, so combining verdicts cancels some of them.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- Reviewers sharing a model and a prompt make correlated mistakes and can be confidently wrong together.
- The aggregation rule is a design decision with no safe default, and it decides the outcome.
- Cost scales with the council on every task.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/council/findings.md](/patterns/council/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [Mixture-of-Agents Enhances Large Language Model Capabilities](https://arxiv.org/abs/2406.04692)
- **Mixed**: [Rethinking Mixture-of-Agents: Is Mixing Different Large Language Models Beneficial?](https://arxiv.org/abs/2502.00674)
- **Helped**: [Replacing Judges with Juries: Evaluating LLM Generations with a Panel of Diverse Models](https://arxiv.org/abs/2404.18796)
- **Mixed**: [Judging LLM-as-a-Judge with MT-Bench and Chatbot Arena](https://arxiv.org/abs/2306.05685)
- **Hurt**: [LLM Evaluators Recognize and Favor Their Own Generations](https://arxiv.org/abs/2404.13076)
- **Mixed**: [Are More LLM Calls All You Need? Towards Scaling Laws of Compound Inference Systems](https://arxiv.org/abs/2403.02419)
- **Helped**: [Systematic Literature Reviews With Two Multi-Agentic Systems And Human-In-The-Loop](https://arxiv.org/abs/2607.21920)

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Mixture-of-Agents Enhances Large Language Model Capabilities (Wang et al.)](https://arxiv.org/abs/2406.04692)
- [Replacing Judges with Juries (Verga et al.)](https://arxiv.org/abs/2404.18796)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `aggregation_over_agent_opinions` (a rule that combines what several roles judged into one outcome): The supervisor decides only from measured signals, so it cannot read a verdict, weigh it or count votes.

Several review roles can be declared and run one after another. What cannot run is the part that makes it a council: combining their verdicts, which the executor would have to read as opinions rather than measure as signals.

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
