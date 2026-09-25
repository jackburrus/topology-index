---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'Language Agent Tree Search'
  - LATS
  - 'Monte Carlo tree search agent'
  - 'best-first tree search'
  - 'Tree of Thoughts'
  - 'beam search over reasoning steps'
canonical_url: https://topologyindex.com/patterns/tree_search.md
description: 'Partial attempts branch into a tree, an evaluator scores the branches, and the most promising one is extended next.'
executable_here: false
executor_requirements:
  - routing_on_unmeasured_conditions
  - aggregation_over_agent_opinions
family: adaptive
findings_page: /patterns/tree_search/findings.md
observed_in: []
path: /patterns/tree_search.md
pattern: tree_search
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks:
      - HumanEval
      - MBPP
      - HotpotQA
      - WebShop
      - 'Game of 24'
    compared_against: 'ReAct, Reflexion, and the tree-search methods Tree of Thoughts and RAP'
    direction: helped
    source_id: arxiv:2310.04406
    task_domain: 'Programming, interactive question answering, web shopping and math puzzles'
    task_domains:
      - coding
      - reasoning
      - operations
    url: https://arxiv.org/abs/2310.04406
  - benchmarks:
      - 'SWE-bench Lite'
    compared_against: 'The same open-source software agent without tree search'
    direction: helped
    source_id: arxiv:2410.20285
    task_domain: 'Repository-level software engineering: resolving GitHub issues'
    task_domains:
      - coding
    url: https://arxiv.org/abs/2410.20285
  - benchmarks:
      - VisualWebArena
      - WebArena
    compared_against: 'The same web agent without search'
    direction: helped
    source_id: arxiv:2407.01476
    task_domain: 'Web automation on realistic websites'
    task_domains:
      - operations
    url: https://arxiv.org/abs/2407.01476
  - benchmarks:
      - 'Game of 24'
      - 'Creative Writing'
      - 'Mini Crosswords'
    compared_against: 'Input-output and chain-of-thought prompting of the same model'
    direction: helped
    source_id: arxiv:2305.10601
    task_domain: 'Puzzles and constrained creative writing that need planning or search'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2305.10601
  - benchmarks:
      - MATH
    compared_against: 'Best-of-N sampling scored by the same verifier'
    direction: mixed
    source_id: arxiv:2408.03314
    task_domain: 'Competition mathematics'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2408.03314
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2305.10601
  - https://arxiv.org/abs/2310.04406
  - https://arxiv.org/abs/2407.01476
schema_version: v0.1
title: 'When to use the tree_search multi-agent pattern (Language Agent Tree Search, LATS)?'
unmet_executor_requirements:
  - routing_on_unmeasured_conditions
  - aggregation_over_agent_opinions
---

# When to use the tree_search multi-agent pattern (Language Agent Tree Search, LATS)?

**Short answer:** test it only when early decisions matter, a wrong turn can be recognised before the end, and the environment can be put back into an earlier state; otherwise start from the [decision guide](/patterns/index.md) row for your task. A hypothesis, not a ranking; [published findings](/patterns/tree_search/findings.md) keep the unfavourable ones.

The `tree_search` multi-agent pattern (family `adaptive`): partial attempts branch into a tree, an evaluator scores the branches, and the most promising one is extended next.

Also called: Language Agent Tree Search, LATS, Monte Carlo tree search agent, best-first tree search, Tree of Thoughts, beam search over reasoning steps.

## The arrangement

- Structure: An acting role that proposes next steps, an evaluating role that scores the states they reach, and a search rule over the tree of states.
- Control: The search rule picks which state to extend from the scores, and can go back to an earlier state when a branch looks worse than another.
- Shared state: The tree: every state explored, its score and the path back to the start.

## When it is hypothesised to fit

Hypothesised to fit when early decisions matter, a wrong turn can be recognised before the end, and the environment can be put back into an earlier state.

A hypothesis to test on a workload, not a finding: this service has not tested it.

## Failure modes to watch for

- The evaluator steers the whole search; a scorer with a blind spot sends every branch the same wrong way.
- Going back needs a way to restore an earlier state, which a live system, a shared database or an irreversible action does not offer.
- Cost grows with the branching and the depth, and a search that fails has still paid for every state it expanded.
- On easy tasks a strong search can do worse than plain sampling, because it optimises the evaluator’s mistakes.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/tree_search/findings.md](/patterns/tree_search/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [Language Agent Tree Search Unifies Reasoning Acting and Planning in Language Models](https://arxiv.org/abs/2310.04406)
- **Helped**: [SWE-Search: Enhancing Software Agents with Monte Carlo Tree Search and Iterative Refinement](https://arxiv.org/abs/2410.20285)
- **Helped**: [Tree Search for Language Model Agents](https://arxiv.org/abs/2407.01476)
- **Helped**: [Tree of Thoughts: Deliberate Problem Solving with Large Language Models](https://arxiv.org/abs/2305.10601)
- **Mixed**: [Scaling LLM Test-Time Compute Optimally can be More Effective than Scaling Model Parameters](https://arxiv.org/abs/2408.03314)

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [Tree of Thoughts: Deliberate Problem Solving with Large Language Models (Yao et al.)](https://arxiv.org/abs/2305.10601)
- [Language Agent Tree Search Unifies Reasoning Acting and Planning in Language Models (Zhou et al.)](https://arxiv.org/abs/2310.04406)
- [Tree Search for Language Model Agents (Koh et al.)](https://arxiv.org/abs/2407.01476)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `routing_on_unmeasured_conditions` (the next role chosen from conditions the executor does not measure): A condition outside the measured signal set is refused as an unsupported capability, and every adaptation rule in an execution lock is refused with it.
- `aggregation_over_agent_opinions` (a rule that combines what several roles judged into one outcome): The supervisor decides only from measured signals, so it cannot read a verdict, weigh it or count votes.

The runner gives each episode one fresh workspace and only moves forward through declared roles: it cannot save a state, return to it and try another branch, and it does not read a scorer’s judgement. A search scored by the public checks would still need those saved states.

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
