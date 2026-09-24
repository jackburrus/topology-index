---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/tree_search/findings.md
description: 'What published studies found about tree_search, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/tree_search/findings.md
pattern: tree_search
pattern_index: /patterns/index.md
pattern_page: /patterns/tree_search.md
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
schema_version: v0.1
title: 'Published findings on the tree_search multi-agent pattern'
---

# Published findings on the tree_search multi-agent pattern

The findings filed under the [tree_search](/patterns/tree_search.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — The authors report that Monte Carlo tree search over an agent’s actions, with a language-model value function and self-reflection, outperformed acting and reflection baselines and earlier tree-search methods on programming, question answering and web shopping.
  Compared against: ReAct, Reflexion, and the tree-search methods Tree of Thoughts and RAP. Domain: Programming, interactive question answering, web shopping and math puzzles. Benchmarks: HumanEval, MBPP, HotpotQA, WebShop, Game of 24.
  Caveat: It assumes the environment can be reverted to an earlier state, and it costs more than a single acting agent.
  Source: [Language Agent Tree Search Unifies Reasoning Acting and Planning in Language Models](https://arxiv.org/abs/2310.04406), Zhou et al., 2023-10-06.
- **Helped** — The authors report that adding Monte Carlo tree search, a value agent and a discriminator agent to a software agent resolved more issues than the same agent without search across five models, and that results improved with deeper search.
  Compared against: The same open-source software agent without tree search. Domain: Repository-level software engineering: resolving GitHub issues. Benchmarks: SWE-bench Lite.
  Caveat: Author-run comparison under a capped search budget, and the value function often failed to pick the correct solution, which the authors name as the main room for improvement.
  Source: [SWE-Search: Enhancing Software Agents with Monte Carlo Tree Search and Iterative Refinement](https://arxiv.org/abs/2410.20285), Antoniades et al., 2024-10-26.
- **Helped** — The authors report that best-first tree search in the real environment, on top of a strong web agent, raised task success markedly over the same agent without search, and that success kept rising with more search compute.
  Compared against: The same web agent without search. Domain: Web automation on realistic websites. Benchmarks: VisualWebArena, WebArena.
  Caveat: Search multiplies the actions taken in the environment and depends on returning to earlier states, and absolute success rates stay low.
  Source: [Tree Search for Language Model Agents](https://arxiv.org/abs/2407.01476), Koh, McAleer, Fried, Salakhutdinov, 2024-07-01.
- **Helped** — The authors report that letting a model propose, evaluate and backtrack over intermediate thoughts solved far more planning puzzles than chain-of-thought prompting of the same model.
  Compared against: Input-output and chain-of-thought prompting of the same model. Domain: Puzzles and constrained creative writing that need planning or search. Benchmarks: Game of 24, Creative Writing, Mini Crosswords.
  Caveat: One model plays every role, on a few small tasks built by the authors, at many times the cost of a single chain of thought.
  Source: [Tree of Thoughts: Deliberate Problem Solving with Large Language Models](https://arxiv.org/abs/2305.10601), Yao et al., 2023-05-17.
- **Mixed** — The authors report that beam search guided by a process reward model beat best-of-N sampling on harder questions and at small budgets, but degraded on easy questions as the budget grew, because the search exploited the verifier’s errors.
  Compared against: Best-of-N sampling scored by the same verifier. Domain: Competition mathematics. Benchmarks: MATH.
  Caveat: One model family on one math benchmark, and a search over reasoning steps within one model rather than between agents.
  Source: [Scaling LLM Test-Time Compute Optimally can be More Effective than Scaling Model Parameters](https://arxiv.org/abs/2408.03314), Snell, Lee, Xu, Kumar, 2024-08-06.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
