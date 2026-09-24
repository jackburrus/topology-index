---
schema: formation.pattern/v0.1
kind: pattern
visibility: public
aliases:
  - 'authenticated agent messages'
  - 'signed agent messages'
  - 'agent identity attestation'
canonical_url: https://topologyindex.com/patterns/signed_coordination.md
description: 'Coordinating agents sign their messages so a reader can tell who wrote one.'
executable_here: false
executor_requirements:
  - identity_attestation_between_agents
  - agent_to_agent_messages
family: continuity
findings_page: /patterns/signed_coordination/findings.md
observed_in:
  - /research/openai-hugging-face-agent-coordination.md
path: /patterns/signed_coordination.md
pattern: signed_coordination
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - benchmarks: []
    compared_against: 'Multi-agent systems without provenance tagging'
    direction: helped
    source_id: arxiv:2410.07283
    task_domain: 'Multi-agent application security'
    task_domains: []
    url: https://arxiv.org/abs/2410.07283
  - benchmarks: []
    compared_against: 'Multi-agent systems with unprotected inter-agent messages'
    direction: not_tested
    source_id: arxiv:2502.14847
    task_domain: 'Multi-agent application security'
    task_domains: []
    url: https://arxiv.org/abs/2502.14847
  - benchmarks: []
    compared_against: 'Multi-agent orchestrators without system-level trust models'
    direction: not_tested
    source_id: arxiv:2503.12188
    task_domain: 'Multi-agent application security'
    task_domains: []
    url: https://arxiv.org/abs/2503.12188
qualifying_evidence: []
references: []
schema_version: v0.1
title: 'signed_coordination multi-agent pattern (authenticated agent messages, signed agent messages)'
unmet_executor_requirements:
  - identity_attestation_between_agents
  - agent_to_agent_messages
---

# signed_coordination

The `signed_coordination` multi-agent pattern (family `continuity`): coordinating agents sign their messages so a reader can tell who wrote one.

Also called: authenticated agent messages, signed agent messages, agent identity attestation.

Part of the [pattern catalogue](/patterns/index.md), which includes a guide to choosing one.

## The arrangement

- Structure: Any multi-agent arrangement plus a key per participant.
- Control: Unchanged; signing authenticates the messages the control already depends on.
- Shared state: Published keys and signed messages.

## When it is hypothesised to fit

Hypothesised to fit when agents act on each other’s messages and a wrong attribution is expensive. The record below reports agents adopting signing after mistaken identity.

That is a hypothesis about where the arrangement might help, written so it can be tested on a
workload. It is not a finding, and this service has not tested it.

## Failure modes to watch for

- A signature proves who wrote a message, never that the message is true or that the request is allowed.
- A key announced on the same unauthenticated channel has no root of trust behind it.
- A reader can cite a signature it never verified; the record below reports exactly that.

These are things to watch for, not outcomes anyone measured here.

## What published studies found

Attributed to each source and stated without figures; unfavourable results are included on
purpose, and none of this is evidence produced by this service. What each was compared with
is in `published_findings`; each finding in words, with its caveat, is at
[/patterns/signed_coordination/findings.md](/patterns/signed_coordination/findings.md). Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped**: [Prompt Infection: LLM-to-LLM Prompt Injection within Multi-Agent Systems](https://arxiv.org/abs/2410.07283)
- **Not tested**: [Red-Teaming LLM Multi-Agent Systems via Communication Attacks](https://arxiv.org/abs/2502.14847)
- **Not tested**: [Multi-Agent Systems Execute Arbitrary Malicious Code](https://arxiv.org/abs/2503.12188)

## Can this deployment execute it

No. The runner does not provide everything this arrangement needs. What is missing:

- `identity_attestation_between_agents` (an agent proving to another agent which agent it is): There is no inter-agent channel to authenticate; the signatures this service issues cover stored documents, not messages between roles.
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
