---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'single-agent baseline'
  - 'augmented LLM'
  - 'ReAct agent'
  - 'tool-using agent loop'
canonical_url: https://topologyindex.com/patterns/single_agent.md
description: 'One agent works the task alone, with no second role and no shared state.'
executable_here: true
executor_requirements:
  - sequential_role_invocations
family: baseline
observed_in: []
path: /patterns/single_agent.md
pattern: single_agent
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - direction: no_clear_gain
    url: https://arxiv.org/abs/2402.18272
  - direction: no_clear_gain
    url: https://arxiv.org/abs/2502.08788
  - direction: mixed
    url: https://arxiv.org/abs/2512.08296
  - direction: no_clear_gain
    url: https://arxiv.org/abs/2407.01489
  - direction: no_clear_gain
    url: https://arxiv.org/abs/2407.01502
  - direction: helped
    url: https://www.anthropic.com/engineering/multi-agent-research-system
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2210.03629
  - https://www.anthropic.com/engineering/building-effective-agents
schema_version: v0.1
title: 'single_agent multi-agent pattern (single-agent baseline, augmented LLM)'
unmet_executor_requirements: []
---

# single_agent

The `single_agent` multi-agent pattern (family `baseline`): one agent works the task alone, with no second role and no shared state.

Also called: single-agent baseline, augmented LLM, ReAct agent, tool-using agent loop.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: One role, one model binding, one workspace.
- Control: The executor invokes the role and ends on a stop condition or a crossed bound.
- Shared state: Only the episode workspace, which no other agent reads or writes.

## When it is hypothesised to fit

Hypothesised to fit when a task is small enough that a second role would add cost without changing the outcome. It is also the arrangement every comparison needs, because a claim about any other arrangement is only meaningful against a strong single-agent configuration.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- An agent asked to judge its own work has nothing to contradict it; only a validator outside the agent can.
- It looks cheap, so it is the arrangement most often given an unexamined budget.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-22.

- **No clear gain** — The authors report that a single agent with strong prompts reached nearly the same performance as the best existing multi-agent discussion method, with discussion only pulling ahead when no demonstrations were in the prompt.
  Compared against: Multi-agent discussion frameworks using the same backbone models. Domain: General reasoning tasks.
  Caveat: Results come from earlier model generations and prompt-based discussion setups, so they may not transfer to tool-using agents.
  Source: [Rethinking the Bounds of LLM Reasoning: Are Multi-Agent Discussions the Key?](https://arxiv.org/abs/2402.18272), Wang et al., 2024-02-28.
- **No clear gain** — The authors report that multi-agent debate methods often failed to beat simple single-agent baselines such as chain-of-thought and self-consistency, even while using considerably more inference compute.
  Compared against: Single-agent chain-of-thought and self-consistency sampling. Domain: Reasoning, knowledge and coding question answering.
  Caveat: The study covers a fixed set of debate methods and base models, and the authors find that mixing heterogeneous models can recover some gains.
  Source: [Stop Overvaluing Multi-Agent Debate: We Must Rethink Evaluation and Embrace Model Heterogeneity](https://arxiv.org/abs/2502.08788), Zhang et al., 2025-02-12.
- **Mixed** — In controlled comparisons with tools, prompts and compute standardized, the authors report that multi-agent coordination helped on decomposable tasks, hurt on sequential planning, and showed diminishing returns once the single-agent baseline was already strong.
  Compared against: Single-agent systems with matched tools, prompts and compute. Domain: Agentic benchmarks spanning financial reasoning, web browsing, planning and tool use.
  Caveat: The fitted predictive model explains only part of the variance, and findings depend on the specific benchmarks and model families studied.
  Source: [Towards a Science of Scaling Agent Systems](https://arxiv.org/abs/2512.08296), Kim et al., 2025-12-09.
- **No clear gain** — The authors report that a simple fixed three-phase pipeline of localization, repair and patch validation outperformed all existing open-source autonomous software agents on SWE-bench Lite at low cost.
  Compared against: Open-source autonomous software engineering agents. Domain: Repository-level bug fixing. Benchmarks: SWE-bench Lite.
  Caveat: The comparison is against agents available at the time and on a single benchmark family, and later agent systems have moved the frontier.
  Source: [Agentless: Demystifying LLM-based Software Engineering Agents](https://arxiv.org/abs/2407.01489), Xia et al., 2024-07-01.
- **No clear gain** — The authors argue that state-of-the-art agents are often needlessly complex and costly, and that ignoring cost has led the community to mistaken conclusions about where accuracy gains come from.
  Compared against: Simple cost-aware baselines. Domain: Agent benchmarking practice, including code generation. Benchmarks: HumanEval.
  Caveat: This is primarily a methodological critique of benchmarking rather than a broad controlled study of multi-agent topologies.
  Source: [AI Agents That Matter](https://arxiv.org/abs/2407.01502), Kapoor et al., 2024-07-01.
- **Helped** — The authors report that a multi-agent research system with a lead agent and parallel subagents substantially outperformed a single agent on their internal research evaluation, while consuming far more tokens and fitting poorly on tightly coupled tasks such as most coding.
  Compared against: A single-agent system using the lead model alone. Domain: Open-ended web research.
  Caveat: Self-reported by the vendor on an internal evaluation, and the authors note token usage alone explains most of the performance variance, so compute was not matched.
  Source: [Anthropic engineering: How we built our multi-agent research system](https://www.anthropic.com/engineering/multi-agent-research-system), Hadfield et al. (Anthropic), 2025-06-13.

## Sources that describe it

Where the arrangement is described. A source is a reason to test it, never a result for it.

- [ReAct: Synergizing Reasoning and Acting in Language Models (Yao et al.)](https://arxiv.org/abs/2210.03629)
- [Building effective agents (Anthropic)](https://www.anthropic.com/engineering/building-effective-agents)

## Can this deployment execute it

Yes. The runner provides everything this arrangement needs:

- `sequential_role_invocations` (one role invocation at a time, in a declared order): The supervisor invokes exactly one role at a time and ends on the first crossed bound.

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
