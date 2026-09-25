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
findings_page: /patterns/single_agent/findings.md
observed_in: []
path: /patterns/single_agent.md
pattern: single_agent
pattern_index: /patterns/index.md
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
qualifying_evidence: []
references:
  - https://arxiv.org/abs/2210.03629
  - https://www.anthropic.com/engineering/building-effective-agents
schema_version: v0.1
title: 'When to use the single_agent multi-agent pattern (single-agent baseline, augmented LLM)?'
unmet_executor_requirements: []
---

# When to use the single_agent multi-agent pattern (single-agent baseline, augmented LLM)?

**Short answer:** start with it when the task is small, or has one clear owner; avoid it when the task clearly exceeds one context window. A hypothesis from the [decision guide](/patterns/index.md), not a ranking; [published findings](/patterns/single_agent/findings.md) keep the unfavourable ones.

The `single_agent` multi-agent pattern (family `baseline`): one agent works the task alone, with no second role and no shared state.

Also called: single-agent baseline, augmented LLM, ReAct agent, tool-using agent loop.

## The arrangement

- Structure: One role, one model binding, one workspace.
- Control: The executor invokes the role and ends on a stop condition or a crossed bound.
- Shared state: Only the episode workspace, which no other agent reads or writes.

## When it is hypothesised to fit

Hypothesised to fit when a task is small enough that a second role would add cost without changing the outcome. It is also the arrangement every comparison needs, because a claim about any other arrangement is only meaningful against a strong single-agent configuration.

A hypothesis to test on a workload, not a finding: this service has not tested it.

## Failure modes to watch for

- An agent asked to judge its own work has nothing to contradict it; only a validator outside the agent can.
- It looks cheap, so it is the arrangement most often given an unexamined budget.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/single_agent/findings.md](/patterns/single_agent/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **No clear gain**: [Rethinking the Bounds of LLM Reasoning: Are Multi-Agent Discussions the Key?](https://arxiv.org/abs/2402.18272)
- **No clear gain**: [Stop Overvaluing Multi-Agent Debate: We Must Rethink Evaluation and Embrace Model Heterogeneity](https://arxiv.org/abs/2502.08788)
- **Mixed**: [Towards a Science of Scaling Agent Systems](https://arxiv.org/abs/2512.08296)
- **Helped**: [Agentless: Demystifying LLM-based Software Engineering Agents](https://arxiv.org/abs/2407.01489)
- **No clear gain**: [AI Agents That Matter](https://arxiv.org/abs/2407.01502)
- **Hurt**: [Anthropic Engineering: How we built our multi-agent research system](https://www.anthropic.com/engineering/multi-agent-research-system)
- **Helped**: [Hacking CTFs with Plain Agents](https://arxiv.org/abs/2412.02776)

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
