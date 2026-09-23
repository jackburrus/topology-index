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
observed_in: []
path: /patterns/council.md
pattern: council
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - direction: helped
    url: https://arxiv.org/abs/2406.04692
  - direction: no_clear_gain
    url: https://arxiv.org/abs/2502.00674
  - direction: helped
    url: https://arxiv.org/abs/2404.18796
  - direction: mixed
    url: https://arxiv.org/abs/2306.05685
  - direction: hurt
    url: https://arxiv.org/abs/2404.13076
  - direction: mixed
    url: https://arxiv.org/abs/2403.02419
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

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-22.

- **Helped** — The authors report that a layered mixture of agents, where each model refines using all outputs from the previous layer, reached leading scores on instruction-following leaderboards and surpassed a strong single frontier model.
  Compared against: Single frontier models. Domain: Open-ended instruction following. Benchmarks: AlpacaEval 2.0, MT-Bench, FLASK.
  Caveat: Evaluated on LLM-judged preference benchmarks and uses many more model calls than the single-model baseline.
  Source: [Mixture-of-Agents Enhances Large Language Model Capabilities](https://arxiv.org/abs/2406.04692), Wang et al., 2024-06-07.
- **No clear gain** — The authors report that aggregating multiple outputs from only the single best model outperformed the standard mixture of different models in many scenarios, because mixing lowered average quality.
  Compared against: Standard mixture-of-agents mixing different models. Domain: Instruction following, knowledge, code reasoning and math. Benchmarks: AlpacaEval 2.0, MMLU, CRUX, MATH.
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
