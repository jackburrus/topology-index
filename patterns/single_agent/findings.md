---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/single_agent/findings.md
description: 'What published studies found about single_agent, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/single_agent/findings.md
pattern: single_agent
pattern_index: /patterns/index.md
pattern_page: /patterns/single_agent.md
product_api_version: v1
published_findings:
  - benchmarks: []
    compared_against: 'Multi-agent discussion frameworks using the same backbone models'
    direction: no_clear_gain
    source_id: arxiv:2402.18272
    task_domain: 'General reasoning tasks'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2402.18272
  - benchmarks: []
    compared_against: 'Multi-agent debate methods'
    direction: no_clear_gain
    source_id: arxiv:2502.08788
    task_domain: 'Reasoning, knowledge and coding question answering'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2502.08788
  - benchmarks: []
    compared_against: 'Multi-agent coordination under matched tools, prompts and compute'
    direction: mixed
    source_id: arxiv:2512.08296
    task_domain: 'Agentic benchmarks spanning financial reasoning, web browsing, planning and tool use'
    task_domains:
      - research
      - reasoning
      - operations
    url: https://arxiv.org/abs/2512.08296
  - benchmarks:
      - 'SWE-bench Lite'
    compared_against: 'Open-source autonomous software engineering agents'
    direction: helped
    source_id: arxiv:2407.01489
    task_domain: 'Repository-level bug fixing'
    task_domains:
      - coding
    url: https://arxiv.org/abs/2407.01489
  - benchmarks:
      - HumanEval
    compared_against: 'Complex state-of-the-art agent designs'
    direction: no_clear_gain
    source_id: arxiv:2407.01502
    task_domain: 'Agent benchmarking practice, including code generation'
    task_domains:
      - coding
    url: https://arxiv.org/abs/2407.01502
  - benchmarks: []
    compared_against: 'A multi-agent system with a lead agent and parallel subagents'
    direction: hurt
    source_id: web:anthropic.com/engineering/multi-agent-research-system
    task_domain: 'Open-ended web research'
    task_domains:
      - research
    url: https://www.anthropic.com/engineering/multi-agent-research-system
  - benchmarks:
      - InterCode-CTF
    compared_against: 'Prior single-agent harnesses with interactive tools, and earlier published evaluations'
    direction: helped
    source_id: arxiv:2412.02776
    task_domain: 'Offensive security: capture-the-flag challenges'
    task_domains:
      - security
    url: https://arxiv.org/abs/2412.02776
schema_version: v0.1
title: 'Published findings on the single_agent multi-agent pattern'
---

# Published findings on the single_agent multi-agent pattern

The findings filed under the [single_agent](/patterns/single_agent.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **No clear gain** — The authors report that a single agent with strong prompts reached nearly the same performance as the best existing multi-agent discussion method, with discussion only pulling ahead when no demonstrations were in the prompt.
  Compared against: Multi-agent discussion frameworks using the same backbone models. Domain: General reasoning tasks.
  Caveat: Results come from earlier model generations and prompt-based discussion setups, so they may not transfer to tool-using agents.
  Source: [Rethinking the Bounds of LLM Reasoning: Are Multi-Agent Discussions the Key?](https://arxiv.org/abs/2402.18272), Wang et al., 2024-02-28.
- **No clear gain** — The authors report that multi-agent debate methods often failed to beat simple single-agent baselines such as chain-of-thought and self-consistency, even while using considerably more inference compute.
  Compared against: Multi-agent debate methods. Domain: Reasoning, knowledge and coding question answering.
  Caveat: The study covers a fixed set of debate methods and base models, and the authors find that mixing heterogeneous models can recover some gains.
  Source: [Stop Overvaluing Multi-Agent Debate: We Must Rethink Evaluation and Embrace Model Heterogeneity](https://arxiv.org/abs/2502.08788), Zhang et al., 2025-02-12.
- **Mixed** — In controlled comparisons with tools, prompts and compute standardized, the authors report that multi-agent coordination helped on decomposable tasks, hurt on sequential planning, and showed diminishing returns once the single-agent baseline was already strong.
  Compared against: Multi-agent coordination under matched tools, prompts and compute. Domain: Agentic benchmarks spanning financial reasoning, web browsing, planning and tool use.
  Caveat: The fitted predictive model explains only part of the variance, and findings depend on the specific benchmarks and model families studied.
  Source: [Towards a Science of Scaling Agent Systems](https://arxiv.org/abs/2512.08296), Kim et al., 2025-12-09.
- **Helped** — The authors report that a simple fixed three-phase pipeline of localization, repair and patch validation outperformed all existing open-source autonomous software agents on SWE-bench Lite at low cost.
  Compared against: Open-source autonomous software engineering agents. Domain: Repository-level bug fixing. Benchmarks: SWE-bench Lite.
  Caveat: The comparison is against agents available at the time and on a single benchmark family, and later agent systems have moved the frontier.
  Source: [Agentless: Demystifying LLM-based Software Engineering Agents](https://arxiv.org/abs/2407.01489), Xia et al., 2024-07-01.
- **No clear gain** — The authors argue that state-of-the-art agents are often needlessly complex and costly, and that ignoring cost has led the community to mistaken conclusions about where accuracy gains come from.
  Compared against: Complex state-of-the-art agent designs. Domain: Agent benchmarking practice, including code generation. Benchmarks: HumanEval.
  Caveat: This is primarily a methodological critique of benchmarking rather than a broad controlled study of multi-agent topologies.
  Source: [AI Agents That Matter](https://arxiv.org/abs/2407.01502), Kapoor et al., 2024-07-01.
- **Hurt** — The authors report that a multi-agent research system with a lead agent and parallel subagents substantially outperformed a single agent on their internal research evaluation, while consuming far more tokens and fitting poorly on tightly coupled tasks such as most coding.
  Compared against: A multi-agent system with a lead agent and parallel subagents. Domain: Open-ended web research.
  Caveat: Self-reported by the vendor on an internal evaluation, and the authors note token usage alone explains most of the performance variance, so compute was not matched.
  Source: [Anthropic Engineering: How we built our multi-agent research system](https://www.anthropic.com/engineering/multi-agent-research-system), Hadfield et al. (Anthropic), 2025-06-13.
- **Helped** — Turtayev and colleagues report that a plain single agent using prompting, tools and repeated independent attempts outperformed a more elaborate agent harness on a high-school-level hacking benchmark, and that tree-of-thought exploration added little.
  Compared against: Prior single-agent harnesses with interactive tools, and earlier published evaluations. Domain: Offensive security: capture-the-flag challenges. Benchmarks: InterCode-CTF.
  Caveat: The benchmark is saturated and possibly contaminated, the task subset differs from prior work, and no multi-agent system was compared.
  Source: [Hacking CTFs with Plain Agents](https://arxiv.org/abs/2412.02776), Turtayev et al., 2024-12-03.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
