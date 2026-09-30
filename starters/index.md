---
schema: formation.starter_index/v0.1
kind: starter_index
visibility: public
canonical_url: https://topologyindex.com/starters/index.md
contributing:
  guide: /docs/api/contributing.md
  status: limited_rollout
formation_schema: formation.policy/v0.2
label_extension: topologyindex.com.catalog
path: /starters/index.md
product_api_version: v1
public_catalog: /formations/index.md
qualifies_as_evidence: false
research_index: /research/index.md
schema_version: v0.1
signed: false
starters:
  - name: single-agent-baseline
    path: /starters/single-agent-baseline/0.1.0.md
    pattern_paths:
      - /patterns/single_agent.md
    patterns:
      - single_agent
    provenance: synthetic
    research_record: null
    status: unvalidated
    task_classes:
      - coding.bugfix
    topology: single
    topology_id: null
    version: '0.1.0'
  - name: bounded-adaptive-review
    path: /starters/bounded-adaptive-review/0.1.0.md
    pattern_paths:
      - /patterns/implement_review.md
    patterns:
      - implement_review
    provenance: synthetic
    research_record: null
    status: unvalidated
    task_classes:
      - coding.bugfix
    topology: adaptive_review
    topology_id: null
    version: '0.1.0'
  - name: board-coordinated-collective
    path: /starters/board-coordinated-collective/0.1.0.md
    pattern_paths:
      - /patterns/blackboard.md
      - /patterns/lane_swarm.md
      - /patterns/supervisor.md
      - /patterns/hierarchical_delegation.md
      - /patterns/mailbox_network.md
      - /patterns/successor_handoff.md
      - /patterns/signed_coordination.md
    patterns:
      - blackboard
      - lane_swarm
      - supervisor
      - hierarchical_delegation
      - mailbox_network
      - successor_handoff
      - signed_coordination
    provenance: reconstructed
    research_record: /research/openai-hugging-face-agent-coordination.md
    status: proposed
    task_classes:
      - operations.shared_project
    topology: custom
    topology_id: board_coordinated_collective
    version: '0.1.0'
  - name: research-split-and-combine
    path: /starters/research-split-and-combine/0.1.0.md
    pattern_paths:
      - /patterns/map_reduce.md
    patterns:
      - map_reduce
    provenance: synthetic
    research_record: null
    status: unvalidated
    task_classes:
      - research.broad_question
    topology: custom
    topology_id: split_and_combine
    version: '0.1.0'
  - name: research-supervised-investigation
    path: /starters/research-supervised-investigation/0.1.0.md
    pattern_paths:
      - /patterns/supervisor.md
    patterns:
      - supervisor
    provenance: synthetic
    research_record: null
    status: unvalidated
    task_classes:
      - research.open_investigation
    topology: custom
    topology_id: lead_with_researcher
    version: '0.1.0'
  - name: security-planned-audit
    path: /starters/security-planned-audit/0.1.0.md
    pattern_paths:
      - /patterns/planner_worker.md
    patterns:
      - planner_worker
    provenance: synthetic
    research_record: null
    status: unvalidated
    task_classes:
      - security.code_audit
    topology: custom
    topology_id: plan_then_audit
    version: '0.1.0'
  - name: reasoning-critic-loop
    path: /starters/reasoning-critic-loop/0.1.0.md
    pattern_paths:
      - /patterns/critic_loop.md
    patterns:
      - critic_loop
    provenance: synthetic
    research_record: null
    status: unvalidated
    task_classes:
      - reasoning.proof_review
    topology: custom
    topology_id: bounded_critic_loop
    version: '0.1.0'
  - name: evaluation-fan-out
    path: /starters/evaluation-fan-out/0.1.0.md
    pattern_paths:
      - /patterns/fan_out.md
    patterns:
      - fan_out
    provenance: synthetic
    research_record: null
    status: unvalidated
    task_classes:
      - evaluation.rubric_judgment
    topology: custom
    topology_id: parallel_attempts_with_selector
    version: '0.1.0'
  - name: operations-specialist-router
    path: /starters/operations-specialist-router/0.1.0.md
    pattern_paths:
      - /patterns/adaptive_routing.md
    patterns:
      - adaptive_routing
    provenance: synthetic
    research_record: null
    status: unvalidated
    task_classes:
      - operations.tool_workflow
    topology: custom
    topology_id: specialist_router
    version: '0.1.0'
  - name: documents-successor-handoff
    path: /starters/documents-successor-handoff/0.1.0.md
    pattern_paths:
      - /patterns/successor_handoff.md
    patterns:
      - successor_handoff
    provenance: synthetic
    research_record: null
    status: unvalidated
    task_classes:
      - documents.long_document_review
    topology: custom
    topology_id: context_successor_handoff
    version: '0.1.0'
vocabulary:
  candidates:
    - id: board_coordinated_collective
      research_record: /research/openai-hugging-face-agent-coordination.md
      status: proposed
      version: '0.1.0'
      vocabulary_refs:
        - id: board_coordinated_collective
          namespace: topologyindex.com.research
          version: '0.1.0'
  pattern_index: /patterns/index.md
  topology_labels:
    - single
    - reviewer
    - adaptive_review
    - custom
---

# Starter formations

Schema-valid `FORMATION.md` documents to copy, adapt and register as your own private
candidate with `POST /v1/tenants/{tenant_id}/formations`. They are starting points, not
recommendations. None has been run or measured by this service, none carries evidence, none
is signed, and none is part of the public catalog at `/formations/index.md` or a candidate in
any recommendation. Each document labels its own provenance and status under the
`topologyindex.com.catalog` extension, which is descriptive and never changes execution.

- `synthetic`: written by Topology Index as a starting point.
- `reconstructed`: derived by Topology Index from a cited research record; not a
  configuration the source published or ran.
- `unvalidated`: nobody has run it here. Its document says whether this deployment can
  execute it.
- `proposed`: a vocabulary candidate that this deployment cannot execute.

## Starters

- [single-agent-baseline](/starters/single-agent-baseline/0.1.0.md): One implementing role works a bug fix alone against public checks.
  Provenance `synthetic`, status `unvalidated`, topology `single`.
  Patterns: `single_agent`
  Task classes: `coding.bugfix`
- [bounded-adaptive-review](/starters/bounded-adaptive-review/0.1.0.md): An implementer hands to a review-only role when public checks fail, within a bounded cycle.
  Provenance `synthetic`, status `unvalidated`, topology `adaptive_review`.
  Patterns: `implement_review`
  Task classes: `coding.bugfix`
- [board-coordinated-collective](/starters/board-coordinated-collective/0.1.0.md): A coordinator assigns lanes on a shared board, with mailboxes, signed control messages and a successor hand-off.
  Provenance `reconstructed`, status `proposed`, topology `custom`.
  Patterns: `blackboard`, `lane_swarm`, `supervisor`, `hierarchical_delegation`, `mailbox_network`, `successor_handoff`, `signed_coordination`
  Task classes: `operations.shared_project`
  Research record: [/research/openai-hugging-face-agent-coordination.md](/research/openai-hugging-face-agent-coordination.md)
- [research-split-and-combine](/starters/research-split-and-combine/0.1.0.md): A splitter divides a broad research question into independent parts, researchers work the parts at the same time, and a combiner writes one sourced answer.
  Provenance `synthetic`, status `unvalidated`, topology `custom`.
  Patterns: `map_reduce`
  Task classes: `research.broad_question`
- [research-supervised-investigation](/starters/research-supervised-investigation/0.1.0.md): A lead holds the question and the running findings, and sends a researcher after one lead at a time until the answer is supported.
  Provenance `synthetic`, status `unvalidated`, topology `custom`.
  Patterns: `supervisor`
  Task classes: `research.open_investigation`
- [security-planned-audit](/starters/security-planned-audit/0.1.0.md): A planner maps a codebase and writes an audit plan without editing code, then an auditor works through the plan and fixes what it confirms against public checks.
  Provenance `synthetic`, status `unvalidated`, topology `custom`.
  Patterns: `planner_worker`
  Task classes: `security.code_audit`
- [reasoning-critic-loop](/starters/reasoning-critic-loop/0.1.0.md): An author and a critic pass a proof or derivation back and forth until the bounded review cycle produces a checked draft.
  Provenance `synthetic`, status `unvalidated`, topology `custom`.
  Patterns: `critic_loop`
  Task classes: `reasoning.proof_review`
- [evaluation-fan-out](/starters/evaluation-fan-out/0.1.0.md): Independent attempts answer a difficult evaluation question, and a selector applies the declared rubric to choose one result.
  Provenance `synthetic`, status `unvalidated`, topology `custom`.
  Patterns: `fan_out`
  Task classes: `evaluation.rubric_judgment`
- [operations-specialist-router](/starters/operations-specialist-router/0.1.0.md): A router classifies each incoming operation and hands it to the specialist with the matching tool or procedure.
  Provenance `synthetic`, status `unvalidated`, topology `custom`.
  Patterns: `adaptive_routing`
  Task classes: `operations.tool_workflow`
- [documents-successor-handoff](/starters/documents-successor-handoff/0.1.0.md): A predecessor reads and organizes a long document set, then a successor continues from a structured handover dossier.
  Provenance `synthetic`, status `unvalidated`, topology `custom`.
  Patterns: `successor_handoff`
  Task classes: `documents.long_document_review`

## Topology vocabulary

Topology labels: `single`, `reviewer`, `adaptive_review`, `custom`. A `custom`
topology names its arrangement with `topology_id`, `topology_version` and `vocabulary_refs`
in `formation.policy/v0.2`. The closed pattern vocabulary, and which patterns this deployment
can execute, is at [/patterns/index.md](/patterns/index.md); research-derived vocabulary candidates are at
[/research/index.md](/research/index.md).

[Reporting outcomes (limited rollout)](/docs/api/contributing.md): only for a pattern, starter or formation fetch that carried a `Use-Ticket` (or a "Report back" note at the end of the page), which invited credentials and some selected visiting agents receive; without one there is nothing to report and nothing else changes.
