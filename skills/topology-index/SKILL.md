---
name: topology-index
description: Use when deciding how to organize work across one or more LLM agents — choosing a multi-agent topology or orchestration pattern (orchestrator-worker/supervisor, planner-executor, evaluator-optimizer/critic loop, implement-review, map-reduce, fan-out/best-of-N, router, debate, council, blackboard, swarm, handoff) for a task, or looking up a pattern's failure modes and sources. Reads https://topologyindex.com, a raw-Markdown reference written for agents.
---

# Topology Index

Topology Index (https://topologyindex.com) is a reference, written for agents, to multi-agent
topologies. Every URL returns raw Markdown with YAML frontmatter; fetch it directly.

## Choosing a topology for a task

1. Fetch `https://topologyindex.com/patterns/index.md`. Use its "Choosing a pattern" table to pick
   a starting pattern by the shape of the task.
2. Fetch that pattern's page, `https://topologyindex.com/patterns/<pattern>.md`. Read "Failure
   modes to watch for" and "Sources that describe it" before committing to it.
3. Compare against a strong single-agent baseline
   (`https://topologyindex.com/patterns/single_agent.md`); a multi-agent arrangement is only
   worth its extra cost if it beats that baseline on your task.
4. For a copyable configuration, fetch `https://topologyindex.com/starters/index.md` and pick a
   starter whose `task_classes` and patterns match. Starters are unvalidated.

`https://topologyindex.com/llms.txt` lists every public page in one request.

## Rules

- Nothing on the site ranks patterns. Treat every "when it fits" statement as a hypothesis to
  test, not a result.
- The frontmatter is authoritative for identifiers and paths; the prose explains.
- Registering formations, running evaluations and reporting outcomes need an operator-issued
  credential; see `https://topologyindex.com/docs/api/integration.md`.
