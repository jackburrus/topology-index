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
findings_page: /patterns/critic_loop/findings.md
observed_in: []
path: /patterns/critic_loop.md
pattern: critic_loop
pattern_index: /patterns/index.md
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

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/critic_loop/findings.md](/patterns/critic_loop/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [Self-Refine: Iterative Refinement with Self-Feedback](https://arxiv.org/abs/2303.17651)
- **Helped**: [Reflexion: Language Agents with Verbal Reinforcement Learning](https://arxiv.org/abs/2303.11366)
- **Helped**: [CRITIC: Large Language Models Can Self-Correct with Tool-Interactive Critiquing](https://arxiv.org/abs/2305.11738)
- **Hurt**: [Large Language Models Cannot Self-Correct Reasoning Yet](https://arxiv.org/abs/2310.01798)
- **Hurt**: [On the Self-Verification Limitations of Large Language Models on Reasoning and Planning Tasks](https://arxiv.org/abs/2402.08115)
- **Mixed**: [When Can LLMs Actually Correct Their Own Mistakes? A Critical Survey of Self-Correction of LLMs](https://arxiv.org/abs/2406.01297)
- **Helped**: [ResearchAgent: Iterative Research Idea Generation over Scientific Literature with Large Language Models](https://arxiv.org/abs/2404.07738)

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
