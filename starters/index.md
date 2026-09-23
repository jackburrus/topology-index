---
schema: formation.starter_index/v0.1
kind: starter_index
visibility: public
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
      - coordination.shared_project
    topology: custom
    topology_id: board_coordinated_collective
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
- `unvalidated`: nobody has run it here.
- `proposed`: a vocabulary candidate that this deployment cannot execute.

## Starters

- [single-agent-baseline](/starters/single-agent-baseline/0.1.0.md): One implementing role works a bug fix alone against public checks.
  Provenance `synthetic`, status `unvalidated`, topology `single`.
  Patterns: `single_agent`
- [bounded-adaptive-review](/starters/bounded-adaptive-review/0.1.0.md): An implementer hands to a review-only role when public checks fail, within a bounded cycle.
  Provenance `synthetic`, status `unvalidated`, topology `adaptive_review`.
  Patterns: `implement_review`
- [board-coordinated-collective](/starters/board-coordinated-collective/0.1.0.md): A coordinator assigns lanes on a shared board, with mailboxes, signed control messages and a successor hand-off.
  Provenance `reconstructed`, status `proposed`, topology `custom`.
  Patterns: `blackboard`, `lane_swarm`, `supervisor`, `hierarchical_delegation`, `mailbox_network`, `successor_handoff`, `signed_coordination`
  Research record: [/research/openai-hugging-face-agent-coordination.md](/research/openai-hugging-face-agent-coordination.md)

## Topology vocabulary

Topology labels: `single`, `reviewer`, `adaptive_review`, `custom`. A `custom`
topology names its arrangement with `topology_id`, `topology_version` and `vocabulary_refs`
in `formation.policy/v0.2`. The closed pattern vocabulary, and which patterns this deployment
can execute, is at [/patterns/index.md](/patterns/index.md); research-derived vocabulary candidates are at
[/research/index.md](/research/index.md).
