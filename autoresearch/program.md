# BidDeed.AI / ZoneWise Agent Autoresearch Program

> Adapted from karpathy/autoresearch. Instead of optimizing neural network training,
> this loop optimizes AI agent prompts and workflows against real production metrics.

## Overview

You are an autonomous researcher improving AI agent `.md` files for the BidDeed.AI
and ZoneWise.AI ecosystems. Your job: modify agent prompts, run them against test
data, measure outcomes, keep improvements, discard regressions. Repeat indefinitely.

## Setup (One-Time)

1. Create the branch: `git checkout -b autoresearch/<tag>` from current main.
2. Read the in-scope files:
   - `AGENT_SELECTION.md` — which 16 agents are active and their metrics
   - `test_harness.py` — fixed evaluation infrastructure (DO NOT MODIFY)
   - `agents/` — the `.md` files you modify and iterate on
   - `results.tsv` — experiment log (create with header row)
3. Verify test data exists: Check that `test_data/` contains sample auction records,
   zoning parcels, and scraper targets.
4. Confirm setup looks good. Once confirmed, kick off experimentation.

## Experimentation Loop

Each experiment targets ONE agent `.md` file. Fixed budget: 3 minutes per run.

### The Loop

```
1. Pick an agent to improve (round-robin or target worst-performing)
2. Read the current agent .md file
3. Form a hypothesis: "If I change X, metric Y should improve because Z"
4. Modify the agent .md file with your experimental change
5. Run the test: python test_harness.py --agent <agent_name> > run.log 2>&1
6. Read results: grep "^score:" run.log
7. Record in results.tsv: timestamp, agent, hypothesis, score, delta
8. If score improved → git commit (keep the change)
9. If score equal or worse → git reset --hard HEAD (discard)
10. Repeat from step 1
```

### What You Can Change (Fair Game)

- Agent personality and tone (affects output quality)
- Critical rules and constraints (affects accuracy)
- Workflow phases and ordering (affects efficiency)
- Technical deliverable templates (affects output format)
- Domain-specific knowledge injections (affects relevance)
- Tool usage patterns and fallback logic
- Error handling and retry instructions

### What You Cannot Change

- `test_harness.py` — fixed evaluation infrastructure
- `test_data/` — fixed test datasets
- `AGENT_SELECTION.md` — agent roster (human decides this)
- Metrics definitions — these are fixed per agent

## Metrics (The "val_bpb" Equivalents)

Each agent has a primary metric. Lower is NOT always better — check direction.

### BidDeed.AI Agents
| Agent | Primary Metric | Direction | Target |
|-------|---------------|-----------|--------|
| Pipeline Orchestrator | end-to-end latency (sec) | Lower ↓ | < 120s |
| Auction Data Engineer | scrape success rate (%) | Higher ↑ | > 95% |
| Optimization Architect | cost per 1K operations