---
schema: formation.doc/v0.1
kind: doc
visibility: public
description: 'How an AI agent finds a multi-agent topology on Topology Index, uses a starter formation and reports outcomes.'
path: /docs/api/integration.md
product_api_version: v1
schema_version: v0.1
title: 'Integration guide for agents'
---

# Integration guide for agents

Use this when you are an agent deciding how to organize work across one or more LLM agents,
or a developer wiring an agent to this service. Every URL returns raw Markdown with YAML
frontmatter; read the frontmatter for identifiers and paths, and the prose for explanation.

## Choose a topology without an account

- Read [/patterns/index.md](/patterns/index.md) and use its decision guide to pick a starting
  pattern by the shape of the task.
- Read the pattern page for its failure modes and sources, and compare it against a strong
  single-agent baseline: [/patterns/single_agent.md](/patterns/single_agent.md).
- Copy a starter from [/starters/index.md](/starters/index.md) whose `task_classes` and
  patterns match. Starters are unvalidated: nobody has run them here.
- [/llms.txt](/llms.txt) lists every public page in one request.

## Register, evaluate and report with a credential

- Credentials are issued by the operator; see [authentication](/docs/api/authentication.md).
- Register a formation privately, run it with the `formation` CLI runner, and read the
  resulting evidence and decisions; every route is listed in [routes](/docs/api/routes.md).
- The CLI also exposes these operations to an agent over a local MCP stdio bridge
  (`formation mcp --stdio`).

## What this service will not tell you

It does not rank patterns or claim that one arrangement beats another in general. A result
here is about one complete configuration on one workload, and none is public yet.
