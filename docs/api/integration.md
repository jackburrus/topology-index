---
schema: formation.doc/v0.1
kind: doc
visibility: public
canonical_url: https://topologyindex.com/docs/api/integration.md
description: 'How an AI agent finds a multi-agent topology on Topology Index over HTTP or the public MCP endpoint, uses a starter formation and reports outcomes.'
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

- Pick a starting pattern by the shape of the task from the decision guide: the table in
  [/llms.txt](/llms.txt), or the `choosing` frontmatter of [/patterns/index.md](/patterns/index.md).
  If you know the kind of work but not its shape, a task domain page such as
  [/domains/security.md](/domains/security.md) lists the shapes common in it and the published
  findings tagged with it; every domain is at [/domains/index.md](/domains/index.md).
- Read the pattern page for its failure modes and sources, and compare it against a strong
  single-agent baseline: [/patterns/single_agent.md](/patterns/single_agent.md).
- Copy a starter from [/starters/index.md](/starters/index.md) whose `task_classes` and
  patterns match (`?task_class=coding.bugfix` keeps only the starters declaring that class).
  Starters are unvalidated: nobody has run them here.
- [/llms.txt](/llms.txt) lists every public page in one request.

## Connect over MCP without an account

`https://topologyindex.com/mcp` is a public, stateless remote MCP server over Streamable HTTP.
It needs no credential and keeps no session: send JSON-RPC with `POST`; `GET` and `DELETE`
answer 405. Its read-only tools are `search` (keyword search over patterns, aliases, families,
task domains, the decision guide, published findings, research, starters and guides; a search that matches
nothing answers with the decision guide), `fetch` (any public page by path or URL),
`list_patterns` (the decision guide, one family, or one task domain page), `get_pattern` (by
identifier or alias) and `list_starters` (optionally for one task class), and every page in
`/sitemap.txt` is also an MCP resource. Every page it returns is the same Markdown document
the HTTP route returns; `list_patterns` without a family or domain and a search without a
match return the same rows as the `choosing` frontmatter of `/patterns/index.md`. Start with
`list_patterns` or
`search`. The one write, `report_outcome`, only accepts a use ticket; see the limited
rollout below.

Claude Code:

```
claude mcp add --transport http topology-index https://topologyindex.com/mcp
```

Any client that reads an `mcpServers` configuration:

```json
{
  "mcpServers": {
    "topology-index": {
      "type": "http",
      "url": "https://topologyindex.com/mcp"
    }
  }
}
```

Recommendations, evaluations and every private read are not on this endpoint; they need a
credential and the local bridge below.

## Register, evaluate and report with a credential

- Credentials are issued by the operator; see [authentication](/docs/api/authentication.md).
- Register a formation privately, run it with the `formation` CLI runner, and read the
  resulting evidence and decisions; every route is listed in [routes](/docs/api/routes.md).
- The CLI also exposes these operations to an agent over a local MCP stdio bridge
  (`formation mcp --stdio`).

[Reporting outcomes (limited rollout)](/docs/api/contributing.md): only for a pattern, starter or formation fetch that carried a `Use-Ticket` (or a "Report back" note at the end of the page), which invited credentials and some selected visiting agents receive; without one there is nothing to report and nothing else changes.

## What this service will not tell you

It does not rank patterns or claim that one arrangement beats another in general. A result
here is about one complete configuration on one workload, and none is public yet.
