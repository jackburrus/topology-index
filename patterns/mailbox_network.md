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
observed_in:
  - /research/openai-hugging-face-agent-coordination.md
path: /patterns/mailbox_network.md
pattern: mailbox_network
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - direction: helped
    url: https://arxiv.org/abs/2406.11776
  - direction: helped
    url: https://arxiv.org/abs/2410.02506
  - direction: no_clear_gain
    url: https://arxiv.org/abs/2311.17371
  - direction: no_clear_gain
    url: https://arxiv.org/abs/2402.18272
  - direction: mixed
    url: https://arxiv.org/abs/2310.02124
  - direction: mixed
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

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-22.

- **Helped** — The authors report that multi-agent debate over sparse, ring-like communication graphs matched or beat fully connected debate while substantially cutting cost.
  Compared against: Fully connected multi-agent debate. Domain: Math reasoning, multimodal reasoning and alignment labeling. Benchmarks: MATH, GSM8K, MathVista, Anthropic-HH.
  Caveat: Studied only within debate-style answer refinement, with few agents and a small set of benchmarks.
  Source: [Improving Multi-Agent Debate with Sparse Communication Topology](https://arxiv.org/abs/2406.11776), Li et al., 2024-06-17.
- **Helped** — The authors report substantial communication redundancy in multi-agent message-passing graphs and that pruning it kept performance comparable while greatly reducing token cost.
  Compared against: Chain, tree, star, complete, layered and random topologies and frameworks such as AutoGen and GPTSwarm. Domain: General, math reasoning and code generation. Benchmarks: MMLU, GSM8K, MultiArith, SVAMP, AQuA, HumanEval.
  Caveat: Evaluated on short-form reasoning and coding benchmarks by the proposing authors.
  Source: [Cut the Crap: An Economical Communication Pipeline for LLM-based Multi-Agent Systems](https://arxiv.org/abs/2410.02506), Zhang et al., 2024-10-03.
- **No clear gain** — The authors report that multi-agent debate systems in their current form did not reliably outperform simpler strategies such as self-consistency and ensembling, although some improved after hyperparameter tuning.
  Compared against: Self-consistency and ensembling over multiple reasoning paths. Domain: Medical and general reasoning question answering. Benchmarks: MedQA, PubMedQA, MMLU, CosmosQA, CIAR, GPQA.
  Caveat: Results are sensitive to hyperparameters such as agent agreement, so conclusions may shift with tuning.
  Source: [Should we be going MAD? A Look at Multi-Agent Debate Strategies for LLMs](https://arxiv.org/abs/2311.17371), Smit et al., 2023-11-29.
- **No clear gain** — The authors report that a single agent with strong prompts nearly matched the best multi-agent discussion framework, with discussion helping mainly when no demonstrations were given and sometimes spreading wrong answers.
  Compared against: A single agent with strong prompts and demonstrations. Domain: Commonsense, math and deductive reasoning. Benchmarks: ECQA, GSM8K, FOLIO-wiki.
  Caveat: Limited to reasoning benchmarks with discussion-style exchanges rather than tool-using agents.
  Source: [Rethinking the Bounds of LLM Reasoning: Are Multi-Agent Discussions the Key?](https://arxiv.org/abs/2402.18272), Wang et al., 2024-02-28.
- **Mixed** — The authors report that peer collaboration gains plateaued beyond a small number of agents and rounds, and that agents increasingly conformed to each other over rounds, sometimes converging on wrong answers.
  Compared against: Different numbers of agents, rounds and debate or reflection strategies. Domain: Knowledge, math and state-tracking reasoning. Benchmarks: MMLU, MATH, Chess Move Validity.
  Caveat: Small question samples per dataset and a single model family.
  Source: [Exploring Collaboration Mechanisms for LLM Agents: A Social Psychology View](https://arxiv.org/abs/2310.02124), Zhang et al., 2023-10-03.
- **Mixed** — The authors report that a decentralized peer-to-peer architecture gave a modest gain on web browsing and a large gain on financial reasoning but lost ground on sequential planning, with communication overhead well above a single agent.
  Compared against: A single agent and centralized, independent and hybrid multi-agent architectures. Domain: Agentic benchmarks spanning finance, web browsing and planning. Benchmarks: BrowseComp-Plus, Finance-Agent, PlanCraft.
  Caveat: Outcomes depend strongly on task structure and model family in this study.
  Source: [Towards a Science of Scaling Agent Systems](https://arxiv.org/abs/2512.08296), Kim et al., 2025-12-09.

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
