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
findings_page: /patterns/adaptive_routing/findings.md
observed_in: []
path: /patterns/adaptive_routing.md
pattern: adaptive_routing
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks:
      - 'MT Bench'
      - MMLU
      - GSM8K
    compared_against: 'Always using the strong model'
    direction: helped
    source_id: arxiv:2406.18665
    task_domain: 'General chat, knowledge and math questions'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2406.18665
  - benchmarks: []
    compared_against: 'The best individual LLM API'
    direction: helped
    source_id: arxiv:2305.05176
    task_domain: 'Classification and question answering tasks'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2305.05176
  - benchmarks:
      - MBPP
      - HumanEval
    compared_against: 'Prior multi-agent routing and system design methods'
    direction: helped
    source_id: arxiv:2502.11133
    task_domain: 'Code generation, math and reasoning'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2502.11133
  - benchmarks: []
    compared_against: 'State-of-the-art learned routers'
    direction: no_clear_gain
    source_id: arxiv:2505.12601
    task_domain: 'Model routing across diverse text and multimodal tasks'
    task_domains: []
    url: https://arxiv.org/abs/2505.12601
qualifying_evidence: []
references:
  - https://www.anthropic.com/engineering/building-effective-agents
  - https://openai.github.io/openai-agents-python/handoffs/
schema_version: v0.1
title: 'When to use the adaptive_routing multi-agent pattern (router, routing)?'
unmet_executor_requirements:
  - routing_on_unmeasured_conditions
---

# When to use the adaptive_routing multi-agent pattern (router, routing)?

**Short answer:** start with it when the task needs a different specialist per input; avoid it when the routing condition is not observable. A hypothesis from the [decision guide](/patterns/index.md), not a ranking; [published findings](/patterns/adaptive_routing/findings.md) keep the unfavourable ones.

The `adaptive_routing` multi-agent pattern (family `adaptive`): which role runs next is chosen during the run from conditions seen in the run.

Also called: router, routing (Anthropic), conditional routing, conditional edges (LangGraph), handoffs (OpenAI Agents SDK), triage agent.

## The arrangement

- Structure: A declared role set plus a routing rule consulted between invocations.
- Control: The router picks the next role from the state of the run.
- Shared state: Whatever state the routing rule reads.

## When it is hypothesised to fit

Hypothesised to fit when different tasks need different sequences and the distinguishing condition is observable cheaply and early.

A hypothesis to test on a workload, not a finding: this service has not tested it.

## Failure modes to watch for

- Routing on a model’s judgement makes the router the thing under test.
- A route chosen from conditions nobody recorded cannot be reproduced, so two runs of “the same” configuration are not the same configuration.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/adaptive_routing/findings.md](/patterns/adaptive_routing/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [RouteLLM: Learning to Route LLMs with Preference Data](https://arxiv.org/abs/2406.18665)
- **Helped**: [FrugalGPT: How to Use Large Language Models While Reducing Cost and Improving Performance](https://arxiv.org/abs/2305.05176)
- **Helped**: [MasRouter: Learning to Route LLMs for Multi-Agent Systems](https://arxiv.org/abs/2502.11133)
- **No clear gain**: [Rethinking Predictive Modeling for LLM Routing: When Simple kNN Beats Complex Learned Routers](https://arxiv.org/abs/2505.12601)

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
