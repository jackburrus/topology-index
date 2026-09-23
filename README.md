# Topology Index — multi-agent topology patterns for AI agents

A reference for choosing how to organize work across LLM agents: the multi-agent **topologies**
and orchestration patterns agents are arranged into, with definitions, the names other
frameworks use for them, failure modes, primary sources and copyable starter configurations.

This repository mirrors the public catalogue served at **https://topologyindex.com**. Every URL
there returns raw Markdown with YAML frontmatter, written for agents to read. It also ships an
Agent Skill that points agents at it.

## Patterns

| Pattern | Also called |
| --- | --- |
| [single_agent](patterns/single_agent.md) | single-agent baseline, augmented LLM, ReAct agent |
| [supervisor](patterns/supervisor.md) | orchestrator-worker, supervisor agent (LangGraph), hierarchical process (CrewAI) |
| [planner_worker](patterns/planner_worker.md) | planner-executor, plan-and-execute, architect-editor |
| [implement_review](patterns/implement_review.md) | maker-checker, coder-reviewer, LLM-as-reviewer |
| [critic_loop](patterns/critic_loop.md) | evaluator-optimizer, reflection, self-refine |
| [fan_out](patterns/fan_out.md) | best-of-N, self-consistency, parallelization by voting |
| [map_reduce](patterns/map_reduce.md) | scatter-gather, parallelization by sectioning |
| [adaptive_routing](patterns/adaptive_routing.md) | router, conditional edges (LangGraph), handoffs (OpenAI Agents SDK) |
| [council](patterns/council.md) | LLM-as-a-judge panel, jury, mixture-of-agents |
| [debate](patterns/debate.md) | multi-agent debate |
| [blackboard](patterns/blackboard.md) | shared scratchpad, group chat (AutoGen) |
| [hierarchical_delegation](patterns/hierarchical_delegation.md) | hierarchical agents, hierarchical teams |
| [dynamic_spawning](patterns/dynamic_spawning.md) | dynamic subagents, spawn-on-demand workers |
| [lane_swarm](patterns/lane_swarm.md) | agent swarm |
| [successor_handoff](patterns/successor_handoff.md) | context handoff, session handover |

All 21 patterns, grouped by family, with a decision guide for choosing one by the shape of the
task: [patterns/index.md](patterns/index.md). Nothing here ranks patterns; each "when it fits"
is a hypothesis to test against a strong single-agent baseline.

## Use it from an agent

**Claude Code plugin (Agent Skill):**

```
/plugin marketplace add jackburrus/topology-index
/plugin install topology-index@topology-index
```

**Any agent with web access:** start at https://topologyindex.com/llms.txt, which lists every
page in one request, or https://topologyindex.com/patterns/index.md.

The skill itself is [skills/topology-index/SKILL.md](skills/topology-index/SKILL.md) and works
in any client that supports the Agent Skills format.

## Terms

- **Pattern**: one named building block of multi-agent orchestration.
- **Topology**: the whole arrangement of roles, control flow and shared state for a task.
- **Formation**: a versioned `FORMATION.md` policy file that declares a topology so it can be run
  and compared. [Starter formations](starters/index.md) are unvalidated starting points.

## Keeping this mirror current

`scripts/sync-catalogue.sh` refreshes every page from the live service; a daily workflow runs it.
The live service is the source of truth; corrections and new sources are welcome as issues.

Content is licensed [CC BY 4.0](LICENSE).
