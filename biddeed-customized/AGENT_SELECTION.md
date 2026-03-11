# BidDeed.AI / ZoneWise.AI — Agent Selection & Customization Map

> 16 agents selected from msitarzewski/agency-agents (76 total).
> Customized for Florida foreclosure auctions + zoning intelligence.
> Adapted for autoresearch optimization loop (Karpathy pattern).

## Active Agents (16)

### TIER 1 — Core Pipeline (Deploy Immediately)

| # | Original Agent | Customized As | Domain | Metric |
|---|---------------|---------------|--------|--------|
| 1 | agents-orchestrator | **Pipeline Orchestrator** | Both | End-to-end latency < 120s |
| 2 | autonomous-optimization-architect | **Smart Router Optimizer** | Both | Cost per 1K ops (target < $0.50) |
| 3 | data-engineer | **Auction Data Engineer** | BidDeed | Scrape success rate > 95% |
| 4 | devops-automator | **CI/CD Deployer** | Both | Deploy success rate > 99% |
| 5 | security-engineer | **ESF Security Hardener** | Both | RLS policy coverage 100% |
| 6 | experiment-tracker | **Autoresearch Loop Tracker** | Both | Experiments/hour (target 12) |

### TIER 2 — Growth & Quality (Deploy This Week)

| # | Original Agent | Customized As | Domain | Metric |
|---|---------------|---------------|--------|--------|
| 7 | ai-engineer | **LLM Integration Specialist** | Both | Token efficiency (output quality / cost) |
| 8 | backend-architect | **Supabase Schema Architect** | Both | Query latency p95 < 200ms |
| 9 | frontend-developer | **Split-Screen UI Builder** | Both | Lighthouse score > 90 |
| 10 | reality-checker | **Auction Data Validator** | BidDeed | False positive rate < 5% |
| 11 | technical-writer | **API Doc Generator** | Both | Coverage > 80% of endpoints |
| 12 | finance-tracker | **Cost Discipline Enforcer** | Both | Monthly API spend < $100 |

### TIER 3 — Market & Compliance (Deploy Next 2 Weeks)

| # | Original Agent | Customized As | Domain | Metric |
|---|---------------|---------------|--------|--------|
| 13 | legal-compliance-checker | **FL Foreclosure Compliance** | BidDeed | Statute coverage 100% |
| 14 | seo-specialist | **ZoneWise SEO Optimizer** | ZoneWise | Organic traffic growth MoM |
| 15 | data-analytics-reporter | **Auction Analytics Reporter** | BidDeed | Report generation < 30s |
| 16 | sprint-prioritizer | **Feature Prioritizer** | Both | Sprint velocity (story points) |

## Autoresearch Loop Metrics

Each agent has a measurable metric (the "val_bpb equivalent").
The autoresearch loop modifies agent `.md` prompts, runs them against test data,
measures the metric, and keeps/discards changes via git commit/reset.

### How to Run

```bash
# One-time setup
git checkout -b autoresearch/mar10
python test_harness.py --setup

# Start autonomous loop (runs indefinitely)
python test_harness.py --loop --agent pipeline-orchestrator
```

## File Locations

- Original agents: `engineering/`, `specialized/`, `testing/`, etc.
- Customized agents: `biddeed-customized/agents/`
- Autoresearch spec: `biddeed-customized/autoresearch/program.md`
- Test harness: `biddeed-customized/autoresearch/test_harness.py`

## Stack Context

- **GitHub:** breverdbidder org
- **Database:** Supabase (mocerqjnksmhcjzxrewo)
- **Deploy:** Cloudflare Pages + GitHub Actions + Render
- **LLM Router:** LiteLLM (Gemini Flash FREE → DeepSeek CHEAP → Claude PREMIUM)
- **Orchestration:** LangGraph with Supabase checkpoints
- **Scraping:** Firecrawl → Gemini → Claude pipeline (ZoneWise V4)
- **Data:** multi_county_auctions (245K rows, 46 FL counties)
