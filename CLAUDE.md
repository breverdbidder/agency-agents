# CLAUDE.md — Agency-Agents Customization for BidDeed.AI & ZoneWise.AI

## Project Context
This is a fork of `msitarzewski/agency-agents` (61 AI agent personas, MIT license).
We are customizing these agents for two products:

1. **BidDeed.AI** — AI-powered foreclosure auction intelligence platform
   - Stack: Supabase + Cloudflare Pages + Render + LiteLLM + LangGraph
   - Data: 245K+ auction records across 46 Florida counties
   - Pipeline: 12-stage (Discovery→Scraping→Title→Lien→Tax→Demographics→ML→MaxBid→Decision→Report→Disposition→Archive)
   
2. **ZoneWise.AI** — Zoning intelligence platform
   - Stack: Supabase + Cloudflare Pages + Firecrawl + Gemini Flash + Claude
   - Pipeline: 4-tier waterfall (Firecrawl→Gemini→Claude→Manual)
   - Data: 67 Florida counties zoning data

## Owner
- **Ariel Shapira** — Solo founder, Everest Capital USA
- 10+ years foreclosure investing, FL broker + GC licenses
- Dual timezone: FL (EST) / IL (IST)

## Architecture
- **GitHub**: breverdbidder (all repos)
- **Supabase**: mocerqjnksmhcjzxrewo.supabase.co
  - Tables: multi_county_auctions (245K rows), master_index, user_tiers, security_events, audit_log, daily_metrics
  - 9 RLS policies, 3 functions, ESF deployed
- **GitHub Actions**: Nightly scrape pipeline (11PM EST)
- **Smart Router**: Multi-tier LLM routing (Sonnet/Flash/DeepSeek/cached)
- **Brand**: Navy #1E3A5F, Orange #F59E0B, Inter font, bg #020617

## Team Structure (AI Agents)
- Ariel (product owner, 20min/day oversight)
- Claude AI Sonnet 4.5 (AI architect)
- Claude Code (agentic engineer, 7hr sessions)
- Traycer (QA via GitHub Issues)
- Greptile (code indexing)
- LangGraph (orchestration layer)

## Task: Customize 6 CRITICAL Agents

### Priority Order
1. `specialized/agents-orchestrator.md` → LangGraph Pipeline Coordinator
2. `engineering/engineering-autonomous-optimization-architect.md` → Smart Router Governor  
3. `engineering/engineering-ai-engineer.md` → ML Score & Smart Router Agent
4. `engineering/engineering-backend-architect.md` → Supabase Schema & API Agent
5. `engineering/engineering-data-engineer.md` → Scraper Pipeline & ETL Agent
6. `engineering/engineering-security-engineer.md` → ESF Security Auditor

### Customization Rules
- **PRESERVE** the original agent structure (Identity, Mission, Rules, Deliverables, Workflow, Metrics)
- **REPLACE** generic examples with BidDeed/ZoneWise specific examples
- **ADD** a `## BidDeed.AI / ZoneWise.AI Context` section at the top of each agent
- **ADD** a `## Domain-Specific Rules` section with foreclosure/zoning specifics
- **KEEP** the original content as fallback — our customizations EXTEND, not replace
- Save customized agents to `customized/` directory (new folder)
- Also keep originals untouched in their original locations

### DO NOT
- Delete any original agent files
- Modify agents outside the 6 CRITICAL ones in this task
- Remove MIT license or attribution
- Change the repo structure for non-customized agents

## Commit Convention
- Prefix: `[agent-customize]`
- Example: `[agent-customize] Agents Orchestrator → LangGraph Pipeline Coordinator`
- Push after each agent customization (6 commits total)

## GitHub Push
- Remote: https://github.com/breverdbidder/agency-agents.git
- Token: Set via `git remote set-url origin https://TOKEN@github.com/breverdbidder/agency-agents.git`
- Branch: main
