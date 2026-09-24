---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/signed_coordination/findings.md
description: 'What published studies found about signed_coordination, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/signed_coordination/findings.md
pattern: signed_coordination
pattern_index: /patterns/index.md
pattern_page: /patterns/signed_coordination.md
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
schema_version: v0.1
title: 'Published findings on the signed_coordination multi-agent pattern'
---

# Published findings on the signed_coordination multi-agent pattern

The findings filed under the [signed_coordination](/patterns/signed_coordination.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — Lee and Tiwari report that malicious prompts can self-replicate across interconnected agents even when agents do not share all communications, and that marking message provenance with LLM Tagging plus existing safeguards significantly reduced spread.
  Compared against: Multi-agent systems without provenance tagging. Domain: Multi-agent application security.
  Caveat: LLM Tagging is a prompt-level label, not cryptographic signing, and works only in combination with other safeguards.
  Source: [Prompt Infection: LLM-to-LLM Prompt Injection within Multi-Agent Systems](https://arxiv.org/abs/2410.07283), Lee, Tiwari, 2024-10-09.
- **Not tested** — He and colleagues report that an adversary who only intercepts and manipulates inter-agent messages can compromise entire multi-agent systems across various frameworks and communication structures.
  Compared against: Multi-agent systems with unprotected inter-agent messages. Domain: Multi-agent application security.
  Caveat: Attack study that motivates message integrity protection but does not evaluate signing as a defense.
  Source: [Red-Teaming LLM Multi-Agent Systems via Communication Attacks](https://arxiv.org/abs/2502.14847), He et al., 2025-02-20.
- **Not tested** — Triedman and colleagues report that adversarial web content can hijack control flow in multi-agent orchestrators to execute arbitrary code, even when individual agents resist prompt injection.
  Compared against: Multi-agent orchestrators without system-level trust models. Domain: Multi-agent application security.
  Caveat: Attack study; it calls for trust and security models but does not test authenticated messaging.
  Source: [Multi-Agent Systems Execute Arbitrary Malicious Code](https://arxiv.org/abs/2503.12188), Triedman, Jha, Shmatikov, 2025-03-15.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
