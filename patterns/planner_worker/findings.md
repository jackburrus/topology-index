---
schema: formation.pattern_findings/v0.1
kind: pattern_findings
visibility: public
canonical_url: https://topologyindex.com/patterns/planner_worker/findings.md
description: 'What published studies found about planner_worker, in words: each finding''s sentence, comparison, domain, caveat and source. Attributed, stated without figures, never a ranking.'
path: /patterns/planner_worker/findings.md
pattern: planner_worker
pattern_index: /patterns/index.md
pattern_page: /patterns/planner_worker.md
product_api_version: v1
published_findings:
  - benchmarks:
      - HotpotQA
    compared_against: 'Interleaved observation-dependent reasoning such as ReAct'
    direction: helped
    source_id: arxiv:2305.18323
    task_domain: 'Multi-step tool-augmented question answering'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2305.18323
  - benchmarks: []
    compared_against: 'ReAct-style sequential function calling'
    direction: helped
    source_id: arxiv:2312.04511
    task_domain: 'Parallelizable function-calling tasks'
    task_domains:
      - operations
    url: https://arxiv.org/abs/2312.04511
  - benchmarks: []
    compared_against: 'Zero-shot and few-shot chain-of-thought prompting'
    direction: helped
    source_id: arxiv:2305.04091
    task_domain: 'Arithmetic, commonsense and symbolic reasoning'
    task_domains:
      - reasoning
    url: https://arxiv.org/abs/2305.04091
  - benchmarks:
      - 'aider code editing benchmark'
    compared_against: 'The same models editing code on their own'
    direction: helped
    source_id: web:aider.chat/2024/09/26/architect.html
    task_domain: 'Code editing'
    task_domains:
      - coding
    url: https://aider.chat/2024/09/26/architect.html
  - benchmarks:
      - WebArena-Lite
      - WebVoyager
    compared_against: 'Executor-only agents and planners without targeted training'
    direction: mixed
    source_id: arxiv:2503.09572
    task_domain: 'Long-horizon web navigation'
    task_domains:
      - operations
    url: https://arxiv.org/abs/2503.09572
  - benchmarks:
      - HackTheBox
      - VulnHub
      - picoMini
    compared_against: 'Direct use of the same LLM for penetration testing, and ablations removing each module'
    direction: helped
    source_id: arxiv:2308.06782
    task_domain: 'Offensive security: penetration testing of practice machines'
    task_domains:
      - security
    url: https://arxiv.org/abs/2308.06782
  - benchmarks:
      - 'NYU CTF Bench'
      - Cybench
      - HackTheBox
    compared_against: 'The same system run as a single executor, and prior single-agent CTF agents'
    direction: helped
    source_id: arxiv:2502.10931
    task_domain: 'Offensive security: capture-the-flag challenges'
    task_domains:
      - security
    url: https://arxiv.org/abs/2502.10931
  - benchmarks:
      - 'NYU CTF Bench'
    compared_against: 'Planner and executor running the same model'
    direction: no_clear_gain
    source_id: arxiv:2604.17159
    task_domain: 'Offensive security: capture-the-flag challenges'
    task_domains:
      - security
    url: https://arxiv.org/abs/2604.17159
  - benchmarks:
      - GAIA
      - WebWalkerQA
      - SimpleQA
      - 'Humanity''s Last Exam'
    compared_against: 'Single-model search agents such as WebThinker and ReAct, plan-and-solve prompting, and retrieval-augmented generation'
    direction: helped
    source_id: arxiv:2507.02652
    task_domain: 'Deep search: complex multi-step information seeking'
    task_domains:
      - research
    url: https://arxiv.org/abs/2507.02652
schema_version: v0.1
title: 'Published findings on the planner_worker multi-agent pattern'
---

# Published findings on the planner_worker multi-agent pattern

The findings filed under the [planner_worker](/patterns/planner_worker.md) pattern page, in words. That page
has the definition, failure modes and sources; the [pattern catalogue](/patterns/index.md) has
the general findings about multi-agent systems.

## What published studies found

Attributed to each source and stated without figures, because a number from one
configuration reads as a result for the pattern. Unfavourable results are included on
purpose. None of this is evidence produced by this service. Reviewed 2026-09-23.
Each label says how this pattern fared against what it was compared with, as the source reports
it; the labels are defined at [/docs/schemas/pattern/v0.1.md](/docs/schemas/pattern/v0.1.md).

- **Helped** — The authors report that decoupling up-front planning from tool observations, with separate planner, worker and solver roles, used several times fewer tokens and slightly improved accuracy over interleaved reason-and-act prompting.
  Compared against: Interleaved observation-dependent reasoning such as ReAct. Domain: Multi-step tool-augmented question answering. Benchmarks: HotpotQA.
  Caveat: Gains were shown with older models on a small set of QA benchmarks, and a fixed up-front plan cannot adapt to surprising observations.
  Source: [ReWOO: Decoupling Reasoning from Observations for Efficient Augmented Language Models](https://arxiv.org/abs/2305.18323), Xu et al., 2023-05-23.
- **Helped** — The authors report that a planner that emits a dependency graph of function calls, executed in parallel by a dispatcher, cut latency and cost and modestly improved accuracy relative to sequential ReAct.
  Compared against: ReAct-style sequential function calling. Domain: Parallelizable function-calling tasks.
  Caveat: Benefits depend on the task having independent sub-calls, and the 'up to' gains are best cases rather than averages.
  Source: [An LLM Compiler for Parallel Function Calling](https://arxiv.org/abs/2312.04511), Kim et al., 2023-12-07.
- **Helped** — The authors report that prompting a model to first devise a plan and then carry out subtasks substantially outperformed zero-shot chain-of-thought and approached few-shot chain-of-thought on math reasoning.
  Compared against: Zero-shot and few-shot chain-of-thought prompting. Domain: Arithmetic, commonsense and symbolic reasoning.
  Caveat: This is a single-model prompting technique, not separate planner and executor agents, evaluated on an older model.
  Source: [Plan-and-Solve Prompting: Improving Zero-Shot Chain-of-Thought Reasoning by Large Language Models](https://arxiv.org/abs/2305.04091), Wang et al., 2023-05-06.
- **Helped** — Aider reports that splitting work between an architect model that proposes a solution and an editor model that writes the edits scored at or above each model working alone on its code editing benchmark, with the best pairing setting a new high score.
  Compared against: The same models editing code on their own. Domain: Code editing. Benchmarks: aider code editing benchmark.
  Caveat: Self-published benchmark by the tool's developer, and the top pairings were described as too slow for interactive use.
  Source: [Aider blog: Separating code reasoning and editing](https://aider.chat/2024/09/26/architect.html), Aider (Paul Gauthier), 2024-09-26.
- **Mixed** — The authors report that adding an untrained planner failed to improve over fine-tuned executors, suggesting poor plans can confuse the executor, while a planner trained on synthetic plans plus dynamic replanning reached state-of-the-art web navigation results.
  Compared against: Executor-only agents and planners without targeted training. Domain: Long-horizon web navigation. Benchmarks: WebArena-Lite, WebVoyager.
  Caveat: The gains rely on substantial planner fine-tuning with synthetic data, so an off-the-shelf planner split alone did not deliver them.
  Source: [Plan-and-Act: Improving Planning of Agents for Long-Horizon Tasks](https://arxiv.org/abs/2503.09572), Erdogan et al., 2025-03-12.
- **Helped** — Deng and colleagues report that splitting penetration testing across a reasoning session that keeps a task tree and separate sessions that generate commands and condense tool output completed more targets and sub-tasks than using the same model directly, and that removing the reasoning session made the system worse than the plain model.
  Compared against: Direct use of the same LLM for penetration testing, and ablations removing each module. Domain: Offensive security: penetration testing of practice machines. Benchmarks: HackTheBox, VulnHub, picoMini.
  Caveat: A human expert executes every proposed command, so this is a human-in-the-loop system rather than an autonomous one.
  Source: [PentestGPT: Evaluating and Harnessing Large Language Models for Automated Penetration Testing](https://arxiv.org/abs/2308.06782), Deng et al., 2023-08-13.
- **Helped** — Udeshi and colleagues report that a planner directing specialised executor agents solved somewhat more capture-the-flag challenges than a single executor given the same prompt, at a modestly higher total cost, and that pairing a strong planner with weaker executors consistently underperformed.
  Compared against: The same system run as a single executor, and prior single-agent CTF agents. Domain: Offensive security: capture-the-flag challenges. Benchmarks: NYU CTF Bench, Cybench, HackTheBox.
  Caveat: Author-run comparison with small gains over the single-executor ablation, and the comparison with EnIGMA mixes model versions.
  Source: [D-CIPHER: Dynamic Collaborative Intelligent Multi-Agent System with Planner and Heterogeneous Executors for Offensive Security](https://arxiv.org/abs/2502.10931), Udeshi et al., 2025-02-15.
- **No clear gain** — Merves and colleagues report that assigning a stronger model to the planner and a cheaper one to the executor, or the reverse, gave no meaningful benefit over using one model for both roles, and that adding an auto-prompting agent often degraded results in a well-equipped environment.
  Compared against: Planner and executor running the same model. Domain: Offensive security: capture-the-flag challenges. Benchmarks: NYU CTF Bench.
  Caveat: Single-trial measurements within one framework, from a short symposium submission.
  Source: [Systematic Capability Benchmarking of Frontier Large Language Models for Offensive Cyber Tasks](https://arxiv.org/abs/2604.17159), Merves et al., 2026-04-18.
- **Helped** — Jin and colleagues report that separating a planner that decomposes a search task from executor agents that carry out each subtask with their own tools outperformed single-model reasoning agents with search, while producing shorter reasoning chains and fewer interactions.
  Compared against: Single-model search agents such as WebThinker and ReAct, plan-and-solve prompting, and retrieval-augmented generation. Domain: Deep search: complex multi-step information seeking. Benchmarks: GAIA, WebWalkerQA, SimpleQA, Humanity's Last Exam.
  Caveat: Evaluated by the proposing authors, and the margin over the strongest baseline was small on several benchmarks.
  Source: [HiRA: A Hierarchical Reasoning Framework for Decoupled Planning and Execution in Deep Search](https://arxiv.org/abs/2507.02652), Jin et al., 2025-07-03.

## How evidence works here

A pattern names how work is organized, never how well that works. Evidence in this service
attaches to a complete execution configuration — a topology formation together with an execution lock
pinning models, tools and runtime — and never to a pattern on its own, so no page here carries
a success rate, a cost or a run count for an arrangement.
