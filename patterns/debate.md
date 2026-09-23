---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'multi-agent debate'
  - 'adversarial debate'
  - 'debate with a judge'
canonical_url: https://topologyindex.com/patterns/debate.md
description: 'Agents argue opposing positions and a separate judge decides the outcome.'
executable_here: false
executor_requirements:
  - agent_to_agent_messages
  - aggregation_over_agent_opinions
family: verification
observed_in: []
path: /patterns/debate.md
pattern: debate
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - direction: helped
    url: https://arxiv.org/abs/2305.14325
  - direction: helped
    url: https://arxiv.org/abs/2305.19118
  - direction: helped
    url: https://arxiv.org/abs/2402.06782
  - direction: no_clear_gain
    url: https://arxiv.org/abs/2311.17371
  - direction: no_clear_gain
    url: https://arxiv.org/abs/2508.17536
  - direction: no_clear_gain
    url: https://arxiv.org/abs/2502.08788
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2305.14325
  - https://arxiv.org/abs/2305.19118
schema_version: v0.1
title: 'debate multi-agent pattern (multi-agent debate, adversarial debate)'
unmet_executor_requirements:
  - agent_to_agent_messages
  - aggregation_over_agent_opinions
---

# debate

The `debate` multi-agent pattern (family `verification`): agents argue opposing positions and a separate judge decides the outcome.

Also called: multi-agent debate, adversarial debate, debate with a judge.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: Two or more opposing roles plus a judging role.
- Control: Turn-taking between the opponents, then a judgement.
- Shared state: The transcript of the argument.

## When it is hypothesised to fit

Hypothesised to fit when disagreement surfaces something neither side would volunteer, and the judge can tell a sound argument from a persuasive one.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- Persuasiveness is not correctness, and the more fluent side is not the more careful one.
- The transcript grows quickly, and every round is paid for.
- The judge is the whole result and usually the least examined role.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-22.

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

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Improving Factuality and Reasoning in Language Models through Multiagent Debate (Du et al.)](https://arxiv.org/abs/2305.14325)
- [Encouraging Divergent Thinking in Large Language Models through Multi-Agent Debate (Liang et al.)](https://arxiv.org/abs/2305.19118)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `agent_to_agent_messages` (a channel on which one agent addresses another): The adapter sees a single role invocation, and the tool surface offers no channel to another agent.
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
