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
findings_page: /patterns/debate/findings.md
observed_in: []
path: /patterns/debate.md
pattern: debate
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks:
      - GSM8K
      - MMLU
    compared_against: 'A single model instance and single-model reflection'
    direction: helped
    source_id: arxiv:2305.14325
    task_domain: 'Arithmetic, grade-school math, strategy and factual biographies'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2305.14325
  - benchmarks:
      - CIAR
    compared_against: 'Self-reflection with a single model'
    direction: helped
    source_id: arxiv:2305.19118
    task_domain: 'Commonsense machine translation and counter-intuitive arithmetic reasoning'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2305.19118
  - benchmarks:
      - QuALITY
    compared_against: 'Naive baselines without debate, such as a single consultant'
    direction: helped
    source_id: arxiv:2402.06782
    task_domain: 'Reading comprehension with information asymmetry'
    task_domains:
      - documents
      - reasoning
    url: https://arxiv.org/abs/2402.06782
  - benchmarks: []
    compared_against: 'Self-consistency and ensembling over multiple reasoning paths'
    direction: no_clear_gain
    source_id: arxiv:2311.17371
    task_domain: 'Question answering across popular research datasets'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2311.17371
  - benchmarks: []
    compared_against: 'Majority voting over independent agent answers'
    direction: no_clear_gain
    source_id: arxiv:2508.17536
    task_domain: 'Natural language processing benchmarks'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2508.17536
  - benchmarks: []
    compared_against: 'Single-agent chain-of-thought and self-consistency'
    direction: no_clear_gain
    source_id: arxiv:2502.08788
    task_domain: 'Reasoning, knowledge and coding question answering'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2502.08788
  - benchmarks:
      - PrimeVul
    compared_against: 'Single-agent chain-of-thought prompting, fine-tuned code models and the GPTLens auditor-critic system'
    direction: helped
    source_id: arxiv:2505.10961
    task_domain: 'Security: detecting vulnerable code in paired vulnerable and patched functions'
    task_domains:
      - security
    url: https://arxiv.org/abs/2505.10961
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2305.14325
  - https://arxiv.org/abs/2305.19118
schema_version: v0.1
title: 'When to use the debate multi-agent pattern (multi-agent debate, adversarial debate)?'
unmet_executor_requirements:
  - agent_to_agent_messages
  - aggregation_over_agent_opinions
---

# When to use the debate multi-agent pattern (multi-agent debate, adversarial debate)?

**Short answer:** test it only when disagreement surfaces something neither side would volunteer, and the judge can tell a sound argument from a persuasive one; otherwise start from the [decision guide](/patterns/index.md) row for your task. A hypothesis, not a ranking; [published findings](/patterns/debate/findings.md) keep the unfavourable ones.

The `debate` multi-agent pattern (family `verification`): agents argue opposing positions and a separate judge decides the outcome.

Also called: multi-agent debate, adversarial debate, debate with a judge.

## The arrangement

- Structure: Two or more opposing roles plus a judging role.
- Control: Turn-taking between the opponents, then a judgement.
- Shared state: The transcript of the argument.

## When it is hypothesised to fit

Hypothesised to fit when disagreement surfaces something neither side would volunteer, and the judge can tell a sound argument from a persuasive one.

A hypothesis to test on a workload, not a finding: this service has not tested it.

## Failure modes to watch for

- Persuasiveness is not correctness, and the more fluent side is not the more careful one.
- The transcript grows quickly, and every round is paid for.
- The judge is the whole result and usually the least examined role.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/debate/findings.md](/patterns/debate/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [Improving Factuality and Reasoning in Language Models through Multiagent Debate](https://arxiv.org/abs/2305.14325)
- **Helped**: [Encouraging Divergent Thinking in Large Language Models through Multi-Agent Debate](https://arxiv.org/abs/2305.19118)
- **Helped**: [Debating with More Persuasive LLMs Leads to More Truthful Answers](https://arxiv.org/abs/2402.06782)
- **No clear gain**: [Should we be going MAD? A Look at Multi-Agent Debate Strategies for LLMs](https://arxiv.org/abs/2311.17371)
- **No clear gain**: [Debate or Vote: Which Yields Better Decisions in Multi-Agent Large Language Models?](https://arxiv.org/abs/2508.17536)
- **No clear gain**: [Stop Overvaluing Multi-Agent Debate: We Must Rethink Evaluation and Embrace Model Heterogeneity](https://arxiv.org/abs/2502.08788)
- **Helped**: [Let the Trial Begin: A Mock-Court Approach to Vulnerability Detection using LLM-Based Agents](https://arxiv.org/abs/2505.10961)

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
