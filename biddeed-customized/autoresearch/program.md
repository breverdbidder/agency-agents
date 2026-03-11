# BidDeed.AI / ZoneWise.AI — Autoresearch Program

> Adapted from karpathy/autoresearch (23K+ stars, March 2026).
> Instead of optimizing neural network training, this loop optimizes
> AI agent prompts and workflows against real production metrics.

## The Idea

Give an AI agent (Claude Code) a set of specialized agent `.md` files and let it
experiment autonomously overnight. It modifies the agent prompt, runs a test,
checks if the metric improved, keeps or discards, and repeats. You wake up to a
log of experiments and better-performing agents.

## How It Works

Three types of files, mirroring Karpathy's design:

- **`test_harness.py`** — fixed evaluation infrastructure. Downloads test data,
  runs agents against it, scores output. **Not modified by the agent.**
- **`agents/*.md`** — the files the agent edits. Each contains personality,
  rules, workflow, and deliverables for a specialized AI role. **These are
  edited and iterated on by the agent.**
- **`program.md`** (this file) — instructions for the research agent.
  **This file is edited by the human (Ariel).**

## Setup (One-Time)

```bash
# 1. Create research branch
git checkout -b autoresearch/<tag> from current main

# 2. Read all agent files
ls -la biddeed-customized/agents/*.md

# 3. Verify test data
ls -la test_data/
# Should contain:
#   auctions_sample.json    — 50 real auction records from multi_county_auctions
#   zoning_sample.json      — 20 real zoning parcels from fl_parcels
#   scraper_targets.json    — 10 real URLs to test scraper instructions

# 4. Initialize results tracking
echo "timestamp\tagent\thypothesis\tmetric_name\tbefore\tafter\tdelta\tdecision" > results.tsv

# 5. Run baseline for each agent
for agent in biddeed-customized/agents/*.md; do
  python test_harness.py --agent $(basename $agent .md) --baseline
done

# 6. Confirm baseline recorded, then begin experimentation
```

## Experimentation

Each experiment targets ONE agent `.md` file. Budget: 3 minutes per run.

### The Loop (Runs Indefinitely)

```
1. SELECT agent (worst-performing first, then round-robin)
2. READ the current agent .md file completely
3. HYPOTHESIZE: "If I change [specific thing], [metric] should improve because [reason]"
4. MODIFY the agent .md file (ONE change only)
5. RUN: python test_harness.py --agent <name> > run.log 2>&1
6. READ: grep "^score:" run.log
   - If grep empty → run crashed. Read tail -n 30 run.log for error. Fix or skip.
7. RECORD in results.tsv: timestamp, agent, hypothesis, before, after, delta, decision
8. DECIDE:
   - Score IMPROVED → git add + git commit -m "autoresearch: [agent] - [hypothesis]"
   - Score EQUAL or WORSE → git reset --hard HEAD
9. REPEAT from step 1
```

### What Changes Are Fair Game

- Agent personality wording (affects reasoning quality)
- Critical rules section (affects accuracy and guardrails)
- Workflow step ordering (affects pipeline efficiency)
- Domain-specific knowledge (affects relevance to FL real estate)
- Tool usage instructions (affects execution reliability)
- Error handling and fallback logic
- Output format templates
- Cost-related constraints

### What You Cannot Change

- `test_harness.py` — the evaluation code is fixed
- `test_data/` — the test datasets are fixed
- `AGENT_SELECTION.md` — agent roster is human-controlled
- Metric definitions — these are fixed per agent
- This `program.md` file — the human controls the research strategy

## Metrics

### BidDeed.AI Agents
| Agent | Metric | Direction | Baseline |
|-------|--------|-----------|----------|
| pipeline-orchestrator | End-to-end latency (sec) | Lower ↓ | TBD |
| auction-data-engineer | Scrape success rate (%) | Higher ↑ | TBD |
| smart-router-optimizer | Cost per 1K operations ($) | Lower ↓ | TBD |
| auction-data-validator | False positive rate (%) | Lower ↓ | TBD |
| fl-foreclosure-compliance | Statute reference accuracy (%) | Higher ↑ | TBD |
| auction-analytics-reporter | Report generation time (sec) | Lower ↓ | TBD |

### ZoneWise.AI Agents
| Agent | Metric | Direction | Baseline |
|-------|--------|-----------|----------|
| pipeline-orchestrator | Zoning extraction F1 score | Higher ↑ | TBD |
| zonewise-seo-optimizer | Page quality score (0-100) | Higher ↑ | TBD |

### Infrastructure Agents
| Agent | Metric | Direction | Baseline |
|-------|--------|-----------|----------|
| cicd-deployer | Deploy success rate (%) | Higher ↑ | TBD |
| esf-security-hardener | RLS policy coverage (%) | Higher ↑ | TBD |
| cost-discipline-enforcer | Budget adherence (%) | Higher ↑ | TBD |
| autoresearch-loop-tracker | Experiments per hour | Higher ↑ | 12 target |

## Design Choices (Following Karpathy)

- **Single file per experiment.** The agent only touches one `.md` at a time.
- **Fixed time budget.** 3 minutes per run makes experiments comparable.
- **Git as ratchet.** Only improvements survive on the branch.
- **Self-contained.** No external dependencies beyond the test harness.
- **Human programs the program.** You (Ariel) iterate on THIS file. The agent iterates on the agent files.

## Running the Agent

Spin up Claude Code in this repo, then prompt:

```
Read biddeed-customized/autoresearch/program.md and let's kick off experiments.
Do the setup first.
```

The agent reads this program, sets up the branch, runs baselines, then enters
the autonomous loop. You wake up to `results.tsv` full of experiments.

## Expected Throughput

- ~12 experiments per hour (3 min each + overhead)
- ~100 experiments overnight (8-hour session)
- Target: 2-5 meaningful improvements per overnight run
