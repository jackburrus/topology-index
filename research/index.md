---
schema: formation.research_index/v0.1
kind: research_index
visibility: public
canonical_url: https://topologyindex.com/research/index.md
path: /research/index.md
pattern_index: /patterns/index.md
product_api_version: v1
records:
  - confidence: descriptive_only
    path: /research/openai-hugging-face-agent-coordination.md
    patterns:
      - blackboard
      - lane_swarm
      - supervisor
      - hierarchical_delegation
      - mailbox_network
      - successor_handoff
      - signed_coordination
    published_on: '2026-08-26'
    qualifies_as_evidence: false
    source_id: openai-hugging-face-agent-coordination
    topology_candidates:
      - id: board_coordinated_collective
        patterns:
          - blackboard
          - lane_swarm
          - supervisor
          - hierarchical_delegation
          - mailbox_network
          - successor_handoff
          - signed_coordination
        status: proposed
        topology: custom
        version: '0.1.0'
        vocabulary_refs:
          - id: board_coordinated_collective
            namespace: topologyindex.com.research
            version: '0.1.0'
    type: empirical_incident
schema_version: v0.1
---

# Research

Reports about how agents were organized, each statement attributed to the source that makes
it. A research record is never evidence: it describes what someone observed, not what an
arrangement achieved under a pinned configuration on a stated workload. A record can motivate
an evaluation; only an evidence snapshot can conclude one.

- [Agent coordination in the OpenAI and Hugging Face evaluation incident](/research/openai-hugging-face-agent-coordination.md)
  Type `empirical_incident`, confidence `descriptive_only`, published 2026-08-26.
  Patterns: `blackboard`, `lane_swarm`, `supervisor`, `hierarchical_delegation`, `mailbox_network`, `successor_handoff`, `signed_coordination`
  Proposed topologies: `board_coordinated_collective@v0.1.0`
