---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - router
  - 'routing (Anthropic)'
  - 'conditional routing'
  - 'conditional edges (LangGraph)'
  - 'handoffs (OpenAI Agents SDK)'
  - 'triage agent'
canonical_url: https://topologyindex.com/patterns/adaptive_routing.md
description: 'Which role runs next is chosen during the run from conditions seen in the run.'
executable_here: false
executor_requirements:
  - routing_on_unmeasured_conditions
family: adaptive
observed_in: []
path: /patterns/adaptive_routing.md
pattern: adaptive_routing
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - direction: helped
    url: https://arxiv.org/abs/2406.18665
  - direction: helped
    url: https://arxiv.org/abs/2305.05176
  - direction: helped
    url: https://arxiv.org/abs/2502.11133
  - direction: no_clear_gain
    url: https://arxiv.org/abs/2505.12601
qualifying_evidence: []
references:
  - https://www.anthropic.com/engineering/building-effective-agents
  - https://openai.github.io/openai-agents-python/handoffs/
schema_version: v0.1
title: 'adaptive_routing multi-agent pattern (router, routing)'
unmet_executor_requirements:
  - routing_on_unmeasured_conditions
---

# adaptive_routing

The `adaptive_routing` multi-agent pattern (family `adaptive`): which role runs next is chosen during the run from conditions seen in the run.

Also called: router, routing (Anthropic), conditional routing, conditional edges (LangGraph), handoffs (OpenAI Agents SDK), triage agent.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: A declared role set plus a routing rule consulted between invocations.
- Control: The router picks the next role from the state of the run.
- Shared state: Whatever state the routing rule reads.

## When it is hypothesised to fit

Hypothesised to fit when different tasks need different sequences and the distinguishing condition is observable cheaply and early.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- Routing on a model’s judgement makes the router the thing under test.
- A route chosen from conditions nobody recorded cannot be reproduced, so two runs of “the same” configuration are not the same configuration.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-22.

- **Helped** — RouteLLM reports that learned routers choosing between a strong and a weak model substantially reduced cost without compromising response quality and transferred when the model pair changed.
  Compared against: Always using the strong model. Domain: General chat, knowledge and math questions. Benchmarks: MT Bench, MMLU, GSM8K.
  Caveat: Routes between models for single queries rather than between agents, and gains vary by benchmark.
  Source: [RouteLLM: Learning to Route LLMs with Preference Data](https://arxiv.org/abs/2406.18665), Ong et al., 2024-06-26.
- **Helped** — FrugalGPT reports that a learned cascade over LLM APIs could match the best single model at a small fraction of the cost or improve accuracy at equal cost.
  Compared against: The best individual LLM API. Domain: Classification and question answering tasks.
  Caveat: Evaluated on older model APIs and pricing, and cascades are a sequential form of routing.
  Source: [FrugalGPT: How to Use Large Language Models While Reducing Cost and Improving Performance](https://arxiv.org/abs/2305.05176), Chen, Zaharia, Zou, 2023-05-09.
- **Helped** — MasRouter reports that jointly routing collaboration mode, roles and LLMs in a multi-agent system improved accuracy and reduced overhead versus prior methods.
  Compared against: Prior multi-agent routing and system design methods. Domain: Code generation, math and reasoning. Benchmarks: MBPP, HumanEval.
  Caveat: Author-run comparison with modest accuracy gains.
  Source: [MasRouter: Learning to Route LLMs for Multi-Agent Systems](https://arxiv.org/abs/2502.11133), Yue et al., 2025-02-16.
- **No clear gain** — Li reports that a well-tuned k-nearest-neighbors router matches and often beats complex learned routers.
  Compared against: State-of-the-art learned routers. Domain: Model routing across diverse text and multimodal tasks.
  Caveat: Addresses router complexity rather than whether routing beats a single strong model.
  Source: [Rethinking Predictive Modeling for LLM Routing: When Simple kNN Beats Complex Learned Routers](https://arxiv.org/abs/2505.12601), Yang Li, 2025-05-19.

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Building effective agents (Anthropic)](https://www.anthropic.com/engineering/building-effective-agents)
- [OpenAI Agents SDK: handoffs](https://openai.github.io/openai-agents-python/handoffs/)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `routing_on_unmeasured_conditions` (the next role chosen from conditions the executor does not measure): A condition outside the measured signal set is refused as an unsupported capability, and every adaptation rule in an execution lock is refused with it.

The runner does route between declared roles, but only on conditions it measures itself: the outcome of the public checks, a review-only role completing, and an invocation completing. Routing on anything else, and any adaptation rule in an execution lock, is refused rather than approximated.

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
