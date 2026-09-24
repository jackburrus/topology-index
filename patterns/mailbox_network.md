---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'peer-to-peer agents'
  - 'agent network'
  - 'direct agent messaging'
  - 'network of agents (LangGraph)'
canonical_url: https://topologyindex.com/patterns/mailbox_network.md
description: 'Agents address each other through per-agent mailboxes instead of one open board.'
executable_here: false
executor_requirements:
  - concurrent_role_invocations
  - agent_to_agent_messages
family: shared_state
findings_page: /patterns/mailbox_network/findings.md
observed_in:
  - /research/openai-hugging-face-agent-coordination.md
path: /patterns/mailbox_network.md
pattern: mailbox_network
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks:
      - MATH
      - GSM8K
      - MathVista
      - Anthropic-HH
    compared_against: 'Fully connected multi-agent debate'
    direction: helped
    source_id: arxiv:2406.11776
    task_domain: 'Math reasoning, multimodal reasoning and alignment labeling'
    task_domains:
      - reasoning
      - evaluation
    url: https://arxiv.org/abs/2406.11776
  - benchmarks:
      - MMLU
      - GSM8K
      - MultiArith
      - SVAMP
      - AQuA
      - HumanEval
    compared_against: 'Chain, tree, star, complete, layered and random topologies and frameworks such as AutoGen and GPTSwarm'
    direction: helped
    source_id: arxiv:2410.02506
    task_domain: 'General, math reasoning and code generation'
    task_domains:
      - coding
      - reasoning
    url: https://arxiv.org/abs/2410.02506
  - benchmarks:
      - MedQA
      - PubMedQA
      - MMLU
      - CosmosQA
      - CIAR
      - GPQA
    compared_against: 'Self-consistency and ensembling over multiple reasoning paths'
    direction: no_clear_gain
    source_id: arxiv:2311.17371
    task_domain: 'Medical and general reasoning question answering'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2311.17371
  - benchmarks:
      - ECQA
      - GSM8K
      - FOLIO-wiki
    compared_against: 'A single agent with strong prompts and demonstrations'
    direction: no_clear_gain
    source_id: arxiv:2402.18272
    task_domain: 'Commonsense, math and deductive reasoning'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2402.18272
  - benchmarks:
      - MMLU
      - MATH
      - 'Chess Move Validity'
    compared_against: 'Different numbers of agents, rounds and debate or reflection strategies'
    direction: mixed
    source_id: arxiv:2310.02124
    task_domain: 'Knowledge, math and state-tracking reasoning'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2310.02124
  - benchmarks:
      - BrowseComp-Plus
      - Finance-Agent
      - PlanCraft
    compared_against: 'A single agent and centralized, independent and hybrid multi-agent architectures'
    direction: mixed
    source_id: arxiv:2512.08296
    task_domain: 'Agentic benchmarks spanning finance, web browsing and planning'
    task_domains:
      - research
      - reasoning
      - operations
    url: https://arxiv.org/abs/2512.08296
qualifying_evidence: []
references: []
schema_version: v0.1
title: 'mailbox_network multi-agent pattern (peer-to-peer agents, agent network)'
unmet_executor_requirements:
  - concurrent_role_invocations
  - agent_to_agent_messages
---

# mailbox_network

The `mailbox_network` multi-agent pattern (family `shared_state`): agents address each other through per-agent mailboxes instead of one open board.

Also called: peer-to-peer agents, agent network, direct agent messaging, network of agents (LangGraph).

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: One mailbox per agent; messages are addressed rather than broadcast.
- Control: Point to point. A recipient decides when, or whether, to read.
- Shared state: Only what a sender leaves in a recipient’s mailbox.

## When it is hypothesised to fit

Hypothesised to fit when a common channel has grown too large to scan and most traffic concerns two participants. The record below reports this is how mailboxes appeared there.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- Addressing conventions have to be invented and agreed, and they drift.
- A message sits unread if the recipient never comes back; the record below reports a mailbox that received nothing at all.
- Sender identity is only as good as the naming convention.
- State fragments across mailboxes, so no participant holds the whole picture any more.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/mailbox_network/findings.md](/patterns/mailbox_network/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [Improving Multi-Agent Debate with Sparse Communication Topology](https://arxiv.org/abs/2406.11776)
- **Helped**: [Cut the Crap: An Economical Communication Pipeline for LLM-based Multi-Agent Systems](https://arxiv.org/abs/2410.02506)
- **No clear gain**: [Should we be going MAD? A Look at Multi-Agent Debate Strategies for LLMs](https://arxiv.org/abs/2311.17371)
- **No clear gain**: [Rethinking the Bounds of LLM Reasoning: Are Multi-Agent Discussions the Key?](https://arxiv.org/abs/2402.18272)
- **Mixed**: [Exploring Collaboration Mechanisms for LLM Agents: A Social Psychology View](https://arxiv.org/abs/2310.02124)
- **Mixed**: [Towards a Science of Scaling Agent Systems](https://arxiv.org/abs/2512.08296)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `concurrent_role_invocations` (more than one agent acting at the same time): The supervisor runs one invocation at a time and refuses a declared active-agent count above one, rather than serializing a parallel policy and calling it the same thing.
- `agent_to_agent_messages` (a channel on which one agent addresses another): The adapter sees a single role invocation, and the tool surface offers no channel to another agent.

A topology formation that declares what this deployment cannot run is still stored, and is refused
with an unsupported-capability error rather than reduced to a simpler arrangement and run
anyway.

## Evidence for this pattern

None. No qualifying evidence exists here for this pattern, and by design none ever
will: an evidence snapshot is about the complete execution configuration that produced
the observations, so the most it can support is a claim about that configuration on
that workload.

## Observed in

Reports that describe this arrangement. A report is a reason to test an arrangement, never a
result for it.

- [Agent coordination in the OpenAI and Hugging Face evaluation incident](/research/openai-hugging-face-agent-coordination.md) (descriptive_only)

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
