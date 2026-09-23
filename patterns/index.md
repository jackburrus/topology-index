---
schema: formation.pattern_index/v0.1
kind: pattern_index
visibility: public
canonical_url: https://topologyindex.com/patterns/index.md
description: 'Catalogue of multi-agent LLM orchestration patterns (orchestrator-worker, planner-executor, evaluator-optimizer, map-reduce, fan-out, router, debate, council, blackboard, swarm, handoff) with a decision guide.'
executable_here:
  - single_agent
  - planner_worker
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

## Choosing a pattern

Where to start by the shape of the task. Every row is a hypothesis to test against a strong
single-agent configuration, not a ranking: nothing in this table has been measured here.

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
[/starters/index.md](/starters/index.md).

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.

Every pattern below is part of the closed vocabulary a formation may declare, grouped by its
family.

## baseline

- [single_agent](/patterns/single_agent.md): One agent works the task alone, with no second role and no shared state. Also called: single-agent baseline, augmented LLM, ReAct agent, tool-using agent loop.

## parallelism

- [fan_out](/patterns/fan_out.md): Several workers attempt the same task at once and one result is selected. Also called: best-of-N sampling, parallel attempts, self-consistency, parallelization by voting (Anthropic).
- [map_reduce](/patterns/map_reduce.md): The task is split into parts, worked in parallel, and the parts are combined. Also called: scatter-gather, parallelization by sectioning (Anthropic), divide and conquer, split-and-merge.
- [independent_workers](/patterns/independent_workers.md): Separate agents work separate tasks at the same time and never communicate. Also called: embarrassingly parallel agents, isolated parallel agents, batch of independent agents.
- [lane_swarm](/patterns/lane_swarm.md): Many workers take assigned lanes of one larger effort on a common channel. Also called: agent swarm, multi-agent swarm, lane-based parallel agents.

## hierarchy

- [supervisor](/patterns/supervisor.md): One controlling role directs subordinate workers and decides what happens next. Also called: orchestrator-worker (Anthropic), orchestrator-workers, supervisor agent (LangGraph), manager agent, hierarchical process (CrewAI), lead agent with subagents.
- [planner_worker](/patterns/planner_worker.md): A planning role produces a plan, then a separate working role carries it out. Also called: planner-executor, plan-and-execute, plan-then-act, architect-editor, nearest arrangement to prompt chaining.
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
- [implement_review](/patterns/implement_review.md)
- [critic_loop](/patterns/critic_loop.md)

Research records that motivate these arrangements are indexed at [/research/index.md](/research/index.md).
