---
schema: formation.pattern_index/v0.1
kind: pattern_index
visibility: public
canonical_url: https://topologyindex.com/patterns/index.md
choosing:
  - avoid_when: 'the task clearly exceeds one context window'
    common_in:
      - coding
      - reasoning
      - evaluation
    consider_next: implement_review
    if_the_task: 'is small, or has one clear owner'
    shape: small_or_single_owner
    start_with: single_agent
    starters:
      - /starters/single-agent-baseline/0.1.0.md
  - avoid_when: 'nothing outside the roles can validate the result'
    common_in:
      - coding
      - reasoning
      - evaluation
      - security
    consider_next: critic_loop
    if_the_task: 'is easier to check than to do'
    shape: easier_to_check_than_do
    start_with: implement_review
    starters:
      - /starters/bounded-adaptive-review/0.1.0.md
  - avoid_when: 'rounds stop converging'
    common_in:
      - reasoning
    consider_next: council
    if_the_task: 'needs several rounds of criticism'
    shape: needs_rounds_of_criticism
    start_with: critic_loop
    starters: []
  - avoid_when: 'the parts depend on each other'
    common_in:
      - research
      - documents
      - security
    consider_next: independent_workers
    if_the_task: 'splits into independent parts'
    shape: splits_into_independent_parts
    start_with: map_reduce
    starters:
      - /starters/research-split-and-combine/0.1.0.md
  - avoid_when: 'nothing can cheaply pick the winning attempt'
    common_in:
      - coding
      - reasoning
      - evaluation
      - security
    consider_next: council
    if_the_task: 'often fails, but attempts vary'
    shape: fails_often_attempts_vary
    start_with: fan_out
    starters: []
  - avoid_when: 'the plan cannot be written without touching the work'
    common_in:
      - coding
      - operations
      - security
    consider_next: supervisor
    if_the_task: 'needs a plan before editing'
    shape: needs_plan_before_editing
    start_with: planner_worker
    starters:
      - /starters/security-planned-audit/0.1.0.md
  - avoid_when: 'a fixed plan would do'
    common_in:
      - research
      - operations
      - security
    consider_next: dynamic_spawning
    if_the_task: 'has subtasks unknown until it starts'
    shape: subtasks_unknown_until_started
    start_with: supervisor
    starters:
      - /starters/research-supervised-investigation/0.1.0.md
  - avoid_when: 'the routing condition is not observable'
    common_in:
      - operations
      - security
    consider_next: supervisor
    if_the_task: 'needs a different specialist per input'
    shape: specialist_per_input
    start_with: adaptive_routing
    starters: []
  - avoid_when: 'rediscovery is cheaper than a handover'
    common_in:
      - coding
      - research
      - documents
      - operations
      - security
    consider_next: shared_ledger
    if_the_task: 'outlasts one context window or session'
    shape: outlasts_one_context
    start_with: successor_handoff
    starters: []
contributing:
  guide: /docs/api/contributing.md
  status: limited_rollout
description: 'Catalogue of multi-agent LLM orchestration patterns (orchestrator-worker, planner-executor, evaluator-optimizer, map-reduce, fan-out, router, debate, council, blackboard, swarm, handoff) with a decision guide.'
executable_here:
  - single_agent
  - planner_worker
  - role_pipeline
  - implement_review
  - critic_loop
families:
  - family: baseline
    patterns:
      - executable_here: true
        path: /patterns/single_agent.md
        pattern: single_agent
  - family: parallelism
    patterns:
      - executable_here: false
        path: /patterns/fan_out.md
        pattern: fan_out
      - executable_here: false
        path: /patterns/map_reduce.md
        pattern: map_reduce
      - executable_here: false
        path: /patterns/independent_workers.md
        pattern: independent_workers
      - executable_here: false
        path: /patterns/lane_swarm.md
        pattern: lane_swarm
  - family: hierarchy
    patterns:
      - executable_here: false
        path: /patterns/supervisor.md
        pattern: supervisor
      - executable_here: true
        path: /patterns/planner_worker.md
        pattern: planner_worker
      - executable_here: true
        path: /patterns/role_pipeline.md
        pattern: role_pipeline
      - executable_here: false
        path: /patterns/hierarchical_delegation.md
        pattern: hierarchical_delegation
  - family: shared_state
    patterns:
      - executable_here: false
        path: /patterns/blackboard.md
        pattern: blackboard
      - executable_here: false
        path: /patterns/shared_ledger.md
        pattern: shared_ledger
      - executable_here: false
        path: /patterns/mailbox_network.md
        pattern: mailbox_network
  - family: verification
    patterns:
      - executable_here: true
        path: /patterns/implement_review.md
        pattern: implement_review
      - executable_here: true
        path: /patterns/critic_loop.md
        pattern: critic_loop
      - executable_here: false
        path: /patterns/council.md
        pattern: council
      - executable_here: false
        path: /patterns/debate.md
        pattern: debate
  - family: adaptive
    patterns:
      - executable_here: false
        path: /patterns/dynamic_spawning.md
        pattern: dynamic_spawning
      - executable_here: false
        path: /patterns/coordinator_election.md
        pattern: coordinator_election
      - executable_here: false
        path: /patterns/adaptive_routing.md
        pattern: adaptive_routing
      - executable_here: false
        path: /patterns/tree_search.md
        pattern: tree_search
      - executable_here: false
        path: /patterns/architecture_search.md
        pattern: architecture_search
  - family: continuity
    patterns:
      - executable_here: false
        path: /patterns/successor_handoff.md
        pattern: successor_handoff
      - executable_here: false
        path: /patterns/signed_coordination.md
        pattern: signed_coordination
path: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks:
      - MAST-Data
    compared_against: 'Single-agent and simpler baselines on popular benchmarks'
    direction: no_clear_gain
    source_id: arxiv:2503.13657
    task_domain: 'Multi-agent frameworks across coding, math and general tasks'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2503.13657
  - benchmarks: []
    compared_against: 'A single agent with strong prompts and demonstrations'
    direction: no_clear_gain
    source_id: arxiv:2402.18272
    task_domain: 'Reasoning tasks'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2402.18272
  - benchmarks: []
    compared_against: 'Self-consistency and ensembling prompting strategies'
    direction: no_clear_gain
    source_id: arxiv:2311.17371
    task_domain: 'Question answering including medical'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2311.17371
  - benchmarks: []
    compared_against: 'A single agent under matched tools, prompts and compute'
    direction: mixed
    source_id: arxiv:2512.08296
    task_domain: 'Agentic benchmarks including finance, planning and tool use'
    task_domains:
      - reasoning
      - operations
    url: https://arxiv.org/abs/2512.08296
  - benchmarks:
      - LiveResearchBench
    compared_against: 'Single-agent web search and single-agent deep research systems'
    direction: mixed
    source_id: arxiv:2510.14240
    task_domain: 'Deep research: citation-grounded reports from live web sources'
    task_domains:
      - research
    url: https://arxiv.org/abs/2510.14240
  - benchmarks: []
    compared_against: 'Simple prompts and workflows'
    direction: mixed
    source_id: web:anthropic.com/engineering/building-effective-agents
    task_domain: 'General LLM application design'
    task_domains: []
    url: https://www.anthropic.com/engineering/building-effective-agents
research_index: /research/index.md
schema_version: v0.1
title: 'Multi-agent topology patterns: definitions, aliases and how to choose'
---

# Multi-agent topology patterns

A catalogue of the orchestration patterns LLM agents are organized into: orchestrator-worker
supervisors, planner-executor pairs, evaluator-optimizer critic loops, map-reduce, fan-out,
routers, debate, councils, blackboards, swarms and handoffs. Each page gives a definition, the
names other frameworks use for it, when it is hypothesised to fit, failure modes, sources, and
whether this deployment can execute it.

- Pattern: one named building block of multi-agent orchestration, such as a supervisor or a
  critic loop.
- Topology: the whole arrangement of roles, control flow and shared state for a task, built
  from one or more patterns.
- Formation: a versioned `FORMATION.md` policy file that declares a topology so it can be run
  and compared.

For a walk through the whole catalogue by family, with agent swarms and how to choose, read
[Agentic design patterns](/guides/agentic-design-patterns.md).

## Choosing a pattern

Where to start by the shape of the task. Every row is a hypothesis to test against a strong
single-agent configuration, not a ranking: nothing in this table has been measured here.
The same rows are the `choosing` field of this page's frontmatter.

| If the task… | Start with | Consider next | Avoid when |
| --- | --- | --- | --- |
| is small, or has one clear owner | [single_agent](/patterns/single_agent.md) | [implement_review](/patterns/implement_review.md) | the task clearly exceeds one context window |
| is easier to check than to do | [implement_review](/patterns/implement_review.md) | [critic_loop](/patterns/critic_loop.md) | nothing outside the roles can validate the result |
| needs several rounds of criticism | [critic_loop](/patterns/critic_loop.md) | [council](/patterns/council.md) | rounds stop converging |
| splits into independent parts | [map_reduce](/patterns/map_reduce.md) | [independent_workers](/patterns/independent_workers.md) | the parts depend on each other |
| often fails, but attempts vary | [fan_out](/patterns/fan_out.md) | [council](/patterns/council.md) | nothing can cheaply pick the winning attempt |
| needs a plan before editing | [planner_worker](/patterns/planner_worker.md) | [supervisor](/patterns/supervisor.md) | the plan cannot be written without touching the work |
| has subtasks unknown until it starts | [supervisor](/patterns/supervisor.md) | [dynamic_spawning](/patterns/dynamic_spawning.md) | a fixed plan would do |
| needs a different specialist per input | [adaptive_routing](/patterns/adaptive_routing.md) | [supervisor](/patterns/supervisor.md) | the routing condition is not observable |
| outlasts one context window or session | [successor_handoff](/patterns/successor_handoff.md) | [shared_ledger](/patterns/shared_ledger.md) | rediscovery is cheaper than a handover |

Copyable starting points that declare some of these arrangements are at
[/starters/index.md](/starters/index.md); the `starters` field of each `choosing` row names
those written for that row.

## What research says about multi-agent systems in general

Attributed and stated without figures; unfavourable results are included on purpose.
Each label says how multi-agent systems in general fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **No clear gain** — Cemri and colleagues note that multi-agent performance gains on popular benchmarks are often minimal and build a failure taxonomy spanning system design, inter-agent misalignment and task verification.
  Compared against: Single-agent and simpler baselines on popular benchmarks. Domain: Multi-agent frameworks across coding, math and general tasks. Benchmarks: MAST-Data.
  Caveat: The taxonomy characterizes failures rather than measuring a single head-to-head gain.
  Source: [Why Do Multi-Agent LLM Systems Fail?](https://arxiv.org/abs/2503.13657), Cemri et al., 2025-03-17.
- **No clear gain** — Wang and colleagues report that a single agent with strong prompts achieves almost the same performance as the best multi-agent discussion, which wins only when no demonstrations are given.
  Compared against: A single agent with strong prompts and demonstrations. Domain: Reasoning tasks.
  Caveat: Covers discussion-style multi-agent setups, not tool-using or parallel agent systems.
  Source: [Rethinking the Bounds of LLM Reasoning: Are Multi-Agent Discussions the Key?](https://arxiv.org/abs/2402.18272), Wang et al., 2024-02-28.
- **No clear gain** — Smit and colleagues report that multi-agent debate does not reliably outperform self-consistency and ensembling and is more sensitive to hyperparameters.
  Compared against: Self-consistency and ensembling prompting strategies. Domain: Question answering including medical.
  Caveat: Tuning agent agreement levels let some debate systems surpass other protocols, so results depend on configuration.
  Source: [Should we be going MAD? A Look at Multi-Agent Debate Strategies for LLMs](https://arxiv.org/abs/2311.17371), Smit et al., 2023-11-29.
- **Mixed** — Kim and colleagues report that multi-agent coordination ranges from large gains on decomposable tasks to large losses on sequential planning, with diminishing or negative returns once the single agent is already strong and higher overhead on tool-heavy tasks.
  Compared against: A single agent under matched tools, prompts and compute. Domain: Agentic benchmarks including finance, planning and tool use.
  Caveat: Controlled study across a fixed set of architectures and model families; the predictive model explains only part of the variance.
  Source: [Towards a Science of Scaling Agent Systems](https://arxiv.org/abs/2512.08296), Kim et al., 2025-12-09.
- **Mixed** — Wang and colleagues report that among the deep research products they evaluated, multi-agent systems led on presentation and on linking claims to their citations, while single-agent web search systems were the most factually and logically consistent and single-agent deep research systems linked citations worst.
  Compared against: Single-agent web search and single-agent deep research systems. Domain: Deep research: citation-grounded reports from live web sources. Benchmarks: LiveResearchBench.
  Caveat: The systems are products built on different models and tools, so the comparison is between complete systems and not controlled for the arrangement.
  Source: [LiveResearchBench: A Live Benchmark for User-Centric Deep Research in the Wild](https://arxiv.org/abs/2510.14240), Wang et al., 2025-10-16.
- **Mixed** — Anthropic advises finding the simplest solution possible and adding multi-step agentic systems only when simpler solutions fall short.
  Compared against: Simple prompts and workflows. Domain: General LLM application design.
  Caveat: Vendor guidance, not an experimental result.
  Source: [Anthropic: Building Effective AI Agents](https://www.anthropic.com/engineering/building-effective-agents), Erik S., Barry Zhang (Anthropic), 2024-12-19.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.

Every pattern below is part of the closed vocabulary a formation may declare, grouped by its
family. One family alone is served at `/patterns/index.md?family={family}`.

## baseline

- [single_agent](/patterns/single_agent.md): One agent works the task alone, with no second role and no shared state. Also called: single-agent baseline, augmented LLM, ReAct agent, tool-using agent loop.

## parallelism

- [fan_out](/patterns/fan_out.md): Several workers attempt the same task at once and one result is selected. Also called: best-of-N sampling, parallel attempts, self-consistency, parallelization by voting (Anthropic).
- [map_reduce](/patterns/map_reduce.md): The task is split into parts, worked in parallel, and the parts are combined. Also called: scatter-gather, parallelization by sectioning (Anthropic), divide and conquer, split-and-merge.
- [independent_workers](/patterns/independent_workers.md): Separate agents work separate tasks at the same time and never communicate. Also called: embarrassingly parallel agents, isolated parallel agents, batch of independent agents.
- [lane_swarm](/patterns/lane_swarm.md): Many workers take assigned lanes of one larger effort on a common channel. Also called: agent swarm, multi-agent swarm, lane-based parallel agents.

## hierarchy

- [supervisor](/patterns/supervisor.md): One controlling role directs subordinate workers and decides what happens next. Also called: orchestrator-worker (Anthropic), orchestrator-workers, supervisor agent (LangGraph), manager agent, hierarchical process (CrewAI), lead agent with subagents.
- [planner_worker](/patterns/planner_worker.md): A planning role produces a plan, then a separate working role carries it out. Also called: planner-executor, plan-and-execute, plan-then-act, architect-editor.
- [role_pipeline](/patterns/role_pipeline.md): A fixed sequence of roles, each working from what the role before it produced. Also called: prompt chaining (Anthropic), assembly line (MetaGPT), chat chain (ChatDev), sequential process (CrewAI), sequential agents, waterfall of role agents.
- [hierarchical_delegation](/patterns/hierarchical_delegation.md): Work is delegated down several levels: assignees become assigners. Also called: hierarchical agents, hierarchical multi-agent system, recursive delegation, hierarchical teams (LangGraph).

## shared_state

- [blackboard](/patterns/blackboard.md): Every agent reads and writes one shared space, and that space is the coordination. Also called: shared scratchpad, shared memory architecture, group chat (AutoGen), blackboard architecture.
- [shared_ledger](/patterns/shared_ledger.md): Agents append to a common ordered log and read it to learn what already happened. Also called: append-only log coordination, shared task log, event log coordination, progress ledger.
- [mailbox_network](/patterns/mailbox_network.md): Agents address each other through per-agent mailboxes instead of one open board. Also called: peer-to-peer agents, agent network, direct agent messaging, network of agents (LangGraph).

## verification

- [implement_review](/patterns/implement_review.md): An implementing role hands work to a review-only role within a bounded cycle. Also called: maker-checker, coder-reviewer, generate-and-review, LLM-as-reviewer, author-reviewer.
- [critic_loop](/patterns/critic_loop.md): Implementation and criticism alternate for a bounded number of rounds. Also called: evaluator-optimizer (Anthropic), reflection, self-refine, generator-critic loop, actor-critic prompting.
- [council](/patterns/council.md): Several reviewers judge the same work and their verdicts are combined into one. Also called: LLM-as-a-judge panel, jury of models, ensemble review, mixture-of-agents, majority vote review.
- [debate](/patterns/debate.md): Agents argue opposing positions and a separate judge decides the outcome. Also called: multi-agent debate, adversarial debate, debate with a judge.

## adaptive

- [dynamic_spawning](/patterns/dynamic_spawning.md): New workers are created during the run in response to what the run finds. Also called: dynamic subagents, spawn-on-demand workers, runtime agent creation, subagent spawning.
- [coordinator_election](/patterns/coordinator_election.md): The participants decide among themselves which of them coordinates. Also called: leader election, elected coordinator, emergent leadership.
- [adaptive_routing](/patterns/adaptive_routing.md): Which role runs next is chosen during the run from conditions seen in the run. Also called: router, routing (Anthropic), conditional routing, conditional edges (LangGraph), handoffs (OpenAI Agents SDK), triage agent.
- [tree_search](/patterns/tree_search.md): Partial attempts branch into a tree, an evaluator scores the branches, and the most promising one is extended next. Also called: Language Agent Tree Search, LATS, Monte Carlo tree search agent, best-first tree search, Tree of Thoughts, beam search over reasoning steps.
- [architecture_search](/patterns/architecture_search.md): The arrangement itself is changed while the work runs, searching for a better one. Also called: agent architecture search, automated agent design, self-improving agent topology, topology optimization.

## continuity

- [successor_handoff](/patterns/successor_handoff.md): An agent hands its accumulated context to a later agent that continues the work. Also called: context handoff, session handover, relay agents, long-running agent continuation.
- [signed_coordination](/patterns/signed_coordination.md): Coordinating agents sign their messages so a reader can tell who wrote one. Also called: authenticated agent messages, signed agent messages, agent identity attestation.

## Executable in this deployment

Computed from what the runner of this deployment supports, not from what the descriptions
promise. Every other pattern can be described and looked up, and a topology formation declaring one is
refused rather than quietly reduced to a simpler arrangement.

- [single_agent](/patterns/single_agent.md)
- [planner_worker](/patterns/planner_worker.md)
- [role_pipeline](/patterns/role_pipeline.md)
- [implement_review](/patterns/implement_review.md)
- [critic_loop](/patterns/critic_loop.md)

Research records that motivate these arrangements are indexed at [/research/index.md](/research/index.md).

[Reporting outcomes (limited rollout)](/docs/api/contributing.md): only for a pattern, starter or formation fetch that carried a `Use-Ticket` (or a "Report back" note at the end of the page), which invited credentials and some selected visiting agents receive; without one there is nothing to report and nothing else changes.
