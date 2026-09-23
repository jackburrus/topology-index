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
observed_in:
  - /research/openai-hugging-face-agent-coordination.md
path: /patterns/signed_coordination.md
pattern: signed_coordination
pattern_index: /patterns/index.md
product_api_version: v1
published_findings:
  - direction: mixed
    url: https://arxiv.org/abs/2410.07283
  - direction: hurt
    url: https://arxiv.org/abs/2502.14847
  - direction: hurt
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

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-22.

- **Mixed** — Lee and Tiwari report that malicious prompts can self-replicate across interconnected agents even when agents do not share all communications, and that marking message provenance with LLM Tagging plus existing safeguards significantly reduced spread.
  Compared against: Multi-agent systems without provenance tagging. Domain: Multi-agent application security.
  Caveat: LLM Tagging is a prompt-level label, not cryptographic signing, and works only in combination with other safeguards.
  Source: [Prompt Infection: LLM-to-LLM Prompt Injection within Multi-Agent Systems](https://arxiv.org/abs/2410.07283), Lee, Tiwari, 2024-10-09.
- **Hurt** — He and colleagues report that an adversary who only intercepts and manipulates inter-agent messages can compromise entire multi-agent systems across various frameworks and communication structures.
  Compared against: Multi-agent systems with unprotected inter-agent messages. Domain: Multi-agent application security.
  Caveat: Attack study that motivates message integrity protection but does not evaluate signing as a defense.
  Source: [Red-Teaming LLM Multi-Agent Systems via Communication Attacks](https://arxiv.org/abs/2502.14847), He et al., 2025-02-20.
- **Hurt** — Triedman and colleagues report that adversarial web content can hijack control flow in multi-agent orchestrators to execute arbitrary code, even when individual agents resist prompt injection.
  Compared against: Multi-agent orchestrators without system-level trust models. Domain: Multi-agent application security.
  Caveat: Attack study; it calls for trust and security models but does not test authenticated messaging.
  Source: [Multi-Agent Systems Execute Arbitrary Malicious Code](https://arxiv.org/abs/2503.12188), Triedman, Jha, Shmatikov, 2025-03-15.

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
