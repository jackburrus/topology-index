---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'evaluator-optimizer (Anthropic)'
  - reflection
  - self-refine
  - 'generator-critic loop'
  - 'actor-critic prompting'
canonical_url: https://topologyindex.com/patterns/critic_loop.md
description: 'Implementation and criticism alternate for a bounded number of rounds.'
executable_here: true
executor_requirements:
  - sequential_role_invocations
  - declared_handoff_on_measured_signal
  - review_only_role
  - bounded_repeat_activation
family: verification
observed_in: []
path: /patterns/critic_loop.md
pattern: critic_loop
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - direction: helped
    url: https://arxiv.org/abs/2303.17651
  - direction: helped
    url: https://arxiv.org/abs/2303.11366
  - direction: helped
    url: https://arxiv.org/abs/2305.11738
  - direction: hurt
    url: https://arxiv.org/abs/2310.01798
  - direction: hurt
    url: https://arxiv.org/abs/2402.08115
  - direction: mixed
    url: https://arxiv.org/abs/2406.01297
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2303.17651
  - https://arxiv.org/abs/2303.11366
  - https://www.anthropic.com/engineering/building-effective-agents
schema_version: v0.1
title: 'critic_loop multi-agent pattern (evaluator-optimizer, reflection)'
unmet_executor_requirements: []
---

# critic_loop

The `critic_loop` multi-agent pattern (family `verification`): implementation and criticism alternate for a bounded number of rounds.

Also called: evaluator-optimizer (Anthropic), reflection, self-refine, generator-critic loop, actor-critic prompting.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: The implementing and review roles, with a declared handoff in each direction.
- Control: Both handoffs are declared and each carries its own activation limit.
- Shared state: The episode workspace, carried across rounds.

## When it is hypothesised to fit

Hypothesised to fit when one round of criticism is rarely enough and each further round is expected to remove more than it costs.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- Rounds that repeat without converging, which is why the activation bound exists and why crossing it is recorded.
- The loop can consume the budget before the validator ever runs.
- Later rounds can reopen questions the earlier rounds settled.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-22.

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

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Self-Refine: Iterative Refinement with Self-Feedback (Madaan et al.)](https://arxiv.org/abs/2303.17651)
- [Reflexion: Language Agents with Verbal Reinforcement Learning (Shinn et al.)](https://arxiv.org/abs/2303.11366)
- [Building effective agents (Anthropic)](https://www.anthropic.com/engineering/building-effective-agents)

## Can this deployment execute it

Yes. The runner provides everything this arrangement needs:

- `sequential_role_invocations` (one role invocation at a time, in a declared order): The supervisor invokes exactly one role at a time and ends on the first crossed bound.
- `declared_handoff_on_measured_signal` (a handoff whose condition is a measured fact about the last invocation): Handoff conditions are evaluated from trusted instrumentation, never from role output.
- `review_only_role` (a role that can read the workspace but not write it): A role without the write tool is a review-only role, and its completion is a signal.
- `bounded_repeat_activation` (a handoff that may fire more than once under a declared bound): Each handoff carries its own activation limit; crossing it is a recorded observation.

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
