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
