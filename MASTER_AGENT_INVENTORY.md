# BidDeed.AI Master Agent Inventory

> **Total Agents: 138** | **Optimized & Passing (85%+): 40** | **Needs Optimization: 98**
> Last updated: March 11, 2026
> Repo: [breverdbidder/agency-agents](https://github.com/breverdbidder/agency-agents)

---

## Summary

| Category | Count | Status |
|----------|-------|--------|
| 🟢 **Customized & Benchmarked (85%+)** | 16 | Optimized for BidDeed/ZoneWise, QA-passed, production-ready |
| 🟢 **Production Deployed** | 24 | Running in Claude Code sessions across 3 repos |
| 🟡 **Original Upstream (Not Yet Optimized)** | 98 | Generic — need BidDeed/ZoneWise customization |
| **GRAND TOTAL** | **138** | |

---

## 🟢 TIER 1 — Customized & Benchmarked (85%+ Safeguard) — 16 Agents

> Location: `customized/`
> Customized by Claude Code on Everest Dispatch, March 10, 2026
> QA: 2 remediation rounds, all passed 85%+ benchmark safeguard
> Cost: ~$50 Claude Code session

### CRITICAL Priority (6 agents)

| # | Agent File | Maps From | BidDeed/ZoneWise Role | Status |
|---|-----------|-----------|----------------------|--------|
| 1 | `biddeed-pipeline-orchestrator.md` | agents-orchestrator | LangGraph 12-stage pipeline coordinator | ✅ 85%+ |
| 2 | `biddeed-smart-router-governor.md` | autonomous-optimization-architect | Multi-tier LLM routing with $100/mo guard | ✅ 85%+ |
| 3 | `biddeed-ml-score-agent.md` | ai-engineer | XGBoost TPP model, max bid, Render FastAPI | ✅ 85%+ |
| 4 | `biddeed-supabase-architect.md` | backend-architect | 245K rows, 9 RLS, Edge Functions, PostgREST | ✅ 85%+ |
| 5 | `biddeed-data-pipeline-agent.md` | data-engineer | Nightly ETL 46 counties, Bronze→Silver→Gold | ✅ 85%+ |
| 6 | `biddeed-security-auditor.md` | security-engineer | ESF auditor, RLS verification, Fair Housing | ✅ 85%+ |

### HIGH Priority (10 agents)

| # | Agent File | Maps From | BidDeed/ZoneWise Role | Status |
|---|-----------|-----------|----------------------|--------|
| 7 | `biddeed-frontend-ui-agent.md` | frontend-developer | Split-screen UI, navy/orange brand, Mapbox | ✅ 85%+ |
| 8 | `biddeed-devops-agent.md` | devops-automator | GitHub Actions nightly 11PM, Cloudflare, Render | ✅ 85%+ |
| 9 | `biddeed-rapid-prototyper-agent.md` | rapid-prototyper | 3-day sprint, ADHD guardrails, real data testing | ✅ 85%+ |
| 10 | `biddeed-sprint-prioritizer-agent.md` | sprint-prioritizer | TODO.md protocol, RICE scoring, scope creep block | ✅ 85%+ |
| 11 | `biddeed-growth-agent.md` | growth-hacker | Freemium funnel, K-factor 1.2, REI viral loop | ✅ 85%+ |
| 12 | `biddeed-content-agent.md` | content-creator | 46 county SEO guides, Mon-Thu editorial calendar | ✅ 85%+ |
| 13 | `biddeed-reddit-agent.md` | reddit-community-builder | r/realestateinvesting authority, 90/10 rule, AMA | ✅ 85%+ |
| 14 | `biddeed-api-tester-agent.md` | api-tester | Pre-flight health, RLS contract tests, degradation | ✅ 85%+ |
| 15 | `biddeed-agent-identity-agent.md` | agentic-identity-trust | Agent roster, delegation chain, SHA-256 audit log | ✅ 85%+ |
| 16 | `biddeed-analytics-agent.md` | analytics-reporter | 4 dashboards, 5 KPIs, Friday 2PM auto-summary | ✅ 85%+ |

---

## 🟢 TIER 2 — Production Deployed (Running in Claude Code) — 24 Agents

> These agents are actively running in Claude Code sessions across 3 repos.
> Not yet benchmarked against the 85% safeguard — they work but haven't been QA-audited.

### BidDeed.AI Scraper Agents (8) — `production-agents/biddeed-scraper/`
> Source: `breverdbidder/brevard-bidder-scraper/.claude/agents/`

| # | Agent | Purpose | Autonomous | Status |
|---|-------|---------|-----------|--------|
| 17 | `beca-scraper.md` | Courthouse PDF scraping, 12 regex, anti-detection | ✅ bypassPermissions | 🟡 Needs benchmark |
| 18 | `code-reviewer.md` | PR security + quality review, ruff/mypy/eslint | ❌ askUser | 🟡 Needs benchmark |
| 19 | `foreclosure-analyst.md` | Lien priority, max bid, FL law interpretation | ✅ autonomous | 🟡 Needs benchmark |
| 20 | `lien-analyst.md` | HOA detection, DO_NOT_BID, AcclaimWeb | ✅ autonomous | 🟡 Needs benchmark |
| 21 | `lien-discovery.md` | Senior mortgage search, auto-trigger on HOA | ✅ bypassPermissions | 🟡 Needs benchmark |
| 22 | `ml-scorer.md` | XGBoost prediction, bid/judgment ratio | ✅ autonomous | 🟡 Needs benchmark |
| 23 | `ml-trainer.md` | Model training, evaluation, auto-deploy | ✅ bypassPermissions | 🟡 Needs benchmark |
| 24 | `report-generator.md` | Branded DOCX with BCPAO photos + ML scores | ✅ bypassPermissions | 🟡 Needs benchmark |

### Life OS Agents (7) — `production-agents/life-os/`
> Source: `breverdbidder/life-os/.claude/agents/`

| # | Agent | Purpose | Autonomous | Status |
|---|-------|---------|-----------|--------|
| 25 | `task-tracker.md` | ADHD abandonment detection + interventions | ✅ bypassPermissions | 🟡 Needs benchmark |
| 26 | `michael-d1.md` | D1 recruiting, performance, nutrition tracking | ✅ bypassPermissions | 🟡 Needs benchmark |
| 27 | `learning-capture.md` | Auto-extract insights from content | ✅ bypassPermissions | 🟡 Needs benchmark |
| 28 | `swim-analyst.md` | SwimCloud rivals, meet analysis | ❌ default | 🟡 Needs benchmark |
| 29 | `nutrition-tracker.md` | Kosher-keto protocol tracking | ❌ default | 🟡 Needs benchmark |
| 30 | `education-tracker.md` | D1 academic eligibility, GPA, SAT | ❌ default | 🟡 Needs benchmark |
| 31 | `health-monitor.md` | Sleep, energy, focus, ADHD meds | ❌ default | 🟡 Needs benchmark |

### ZoneWise Agent Prompts (9) — `production-agents/zonewise-agents/`
> Source: `breverdbidder/zonewise-agents/agents/prompts/`

| # | Agent | Purpose | Status |
|---|-------|---------|--------|
| 32 | `master_system.md` | Foundation prompt injected into ALL agents | 🟡 Needs benchmark |
| 33 | `action_nlp_chatbot.md` | Split-screen left panel NLP interface | 🟡 Needs benchmark |
| 34 | `action_onboarding.md` | Zero-friction first visit, value before signup | 🟡 Needs benchmark |
| 35 | `action_bid_decision.md` | Full BID analysis pipeline (foreclosure + tax deed) | 🟡 Needs benchmark |
| 36 | `investment_profile_learning.md` | Behavioral signal extraction per session | 🟡 Needs benchmark |
| 37 | `investment_pipeline_manager.md` | Deal pipeline tracking across sale types | 🟡 Needs benchmark |
| 38 | `investment_match_scorer.md` | Personalized property/cert match scoring | 🟡 Needs benchmark |
| 39 | `orchestrator_nightly_pipeline.md` | LangGraph 11PM nightly coordination | 🟡 Needs benchmark |
| 40 | `reward_performance_scorecard.md` | Quantified value delivery scorecard | 🟡 Needs benchmark |

---

## 🟡 TIER 3 — Original Upstream (Needs Customization) — 98 Agents

> These are the unmodified upstream agents from msitarzewski/agency-agents.
> They work for generic software development but need BidDeed/ZoneWise domain injection.
> **Optimization priority**: Run through autoresearch loop to customize for our stack.

### Engineering (11 agents) — 6 already customized in Tier 1

| Agent | Customized? | Optimization Priority |
|-------|------------|----------------------|
| Agents Orchestrator | ✅ → biddeed-pipeline-orchestrator | Done |
| Autonomous Optimization Architect | ✅ → biddeed-smart-router-governor | Done |
| AI Engineer | ✅ → biddeed-ml-score-agent | Done |
| Backend Architect | ✅ → biddeed-supabase-architect | Done |
| Data Engineer | ✅ → biddeed-data-pipeline-agent | Done |
| Security Engineer | ✅ → biddeed-security-auditor | Done |
| Frontend Developer | ✅ → biddeed-frontend-ui-agent | Done |
| DevOps Automator | ✅ → biddeed-devops-agent | Done |
| Rapid Prototyper | ✅ → biddeed-rapid-prototyper-agent | Done |
| **Senior Developer** | ❌ | HIGH — core code quality agent |
| **Technical Writer** | ❌ | MEDIUM — API docs generation |
| **Mobile App Builder** | ❌ | LOW — no mobile app planned |
| **Embedded Firmware Engineer** | ❌ | SKIP — not relevant |
| **Incident Response Commander** | ❌ | MEDIUM — useful for pipeline failures |
| **Solidity Smart Contract Engineer** | ❌ | SKIP — not relevant |
| **Threat Detection Engineer** | ❌ | LOW — ESF covers this |
| **WeChat Mini Program Developer** | ❌ | SKIP — not relevant |

### Design (8 agents) — 0 customized

| Agent | Optimization Priority |
|-------|----------------------|
| **UI Designer** | HIGH — split-screen component design |
| **UX Architect** | HIGH — investor workflow optimization |
| **Brand Guardian** | MEDIUM — enforce navy/orange brand |
| UX Researcher | LOW |
| Image Prompt Engineer | LOW |
| Visual Storyteller | LOW |
| Inclusive Visuals Specialist | LOW |
| Whimsy Injector | SKIP |

### Marketing (11 agents) — 3 already customized

| Agent | Customized? | Optimization Priority |
|-------|------------|----------------------|
| Growth Hacker | ✅ → biddeed-growth-agent | Done |
| Content Creator | ✅ → biddeed-content-agent | Done |
| Reddit Community Builder | ✅ → biddeed-reddit-agent | Done |
| **SEO Specialist** | ❌ | HIGH — ZoneWise organic growth |
| **Twitter Engager** | ❌ | MEDIUM — @BidDeedAI presence |
| **Social Media Strategist** | ❌ | MEDIUM — multi-platform coordination |
| App Store Optimizer | ❌ | SKIP — no app |
| Instagram Curator | ❌ | LOW |
| TikTok Strategist | ❌ | LOW |
| Baidu/Bilibili/Kuaishou/WeChat/Xiaohongshu/Zhihu | ❌ | SKIP — China market not relevant |

### Paid Media (7 agents) — 0 customized

| Agent | Optimization Priority |
|-------|----------------------|
| **PPC Campaign Strategist** | MEDIUM — future Google Ads |
| **Paid Social Strategist** | MEDIUM — future Facebook/LinkedIn ads |
| Ad Creative Strategist | LOW |
| Paid Media Auditor | LOW |
| Programmatic & Display Buyer | LOW |
| Search Query Analyst | LOW |
| Tracking & Measurement Specialist | LOW |

### Product (4 agents) — 1 already customized

| Agent | Customized? | Optimization Priority |
|-------|------------|----------------------|
| Sprint Prioritizer | ✅ → biddeed-sprint-prioritizer | Done |
| **Feedback Synthesizer** | ❌ | HIGH — user feedback → features |
| **Behavioral Nudge Engine** | ❌ | MEDIUM — freemium conversion |
| **Trend Researcher** | ❌ | MEDIUM — market intelligence |

### Project Management (5 agents) — 0 customized

| Agent | Optimization Priority |
|-------|----------------------|
| **Experiment Tracker** | HIGH — autoresearch loop tracking |
| **Project Shepherd** | MEDIUM — multi-project coordination |
| Senior Project Manager | LOW |
| Studio Operations | SKIP |
| Studio Producer | SKIP |

### Specialized (9 agents) — 2 already customized

| Agent | Customized? | Optimization Priority |
|-------|------------|----------------------|
| Agents Orchestrator | ✅ (Tier 1) | Done |
| Agentic Identity & Trust | ✅ → biddeed-agent-identity-agent | Done |
| Data Analytics Reporter | ✅ → biddeed-analytics-agent | Done |
| **Data Consolidation Agent** | ❌ | HIGH — multi-source data merge |
| **Compliance Auditor** | ❌ | HIGH — FL foreclosure law |
| **Developer Advocate** | ❌ | MEDIUM — future API docs |
| LSP/Index Engineer | ❌ | LOW |
| Report Distribution Agent | ❌ | LOW |
| Sales Data Extraction Agent | ❌ | LOW |
| Model QA Specialist | ❌ | MEDIUM — ML model validation |
| Cultural Intelligence Strategist | ❌ | SKIP |
| ZK Steward | ❌ | SKIP |
| Blockchain Security Auditor | ❌ | SKIP |
| Accounts Payable Agent | ❌ | SKIP |
| Identity Graph Operator | ❌ | LOW |

### Support (6 agents) — 1 already customized

| Agent | Customized? | Optimization Priority |
|-------|------------|----------------------|
| Analytics Reporter | ✅ → biddeed-analytics-agent | Done |
| **Finance Tracker** | ❌ | HIGH — $100/mo budget tracking |
| **Legal Compliance Checker** | ❌ | HIGH — FL foreclosure statutes |
| **Infrastructure Maintainer** | ❌ | MEDIUM — Supabase/Render health |
| Executive Summary Generator | ❌ | MEDIUM |
| Support Responder | ❌ | LOW |

### Testing (8 agents) — 1 already customized

| Agent | Customized? | Optimization Priority |
|-------|------------|----------------------|
| API Tester | ✅ → biddeed-api-tester-agent | Done |
| **Reality Checker** | ❌ | HIGH — auction data validation |
| **Workflow Optimizer** | ❌ | HIGH — pipeline efficiency |
| **Performance Benchmarker** | ❌ | MEDIUM — latency tracking |
| Evidence Collector | ❌ | MEDIUM |
| Test Results Analyzer | ❌ | MEDIUM |
| Tool Evaluator | ❌ | LOW |
| Accessibility Auditor | ❌ | LOW |

### Spatial Computing (6 agents) — 0 customized
All SKIP — not relevant to BidDeed/ZoneWise.

### Game Development (5 agents) — 0 customized
All SKIP — not relevant to BidDeed/ZoneWise.

---

## Optimization Roadmap

### Phase 1: Benchmark Production Agents (This Week)
Run 85% safeguard benchmark on the 24 production agents (Tier 2).
Expected: Most will pass — they're already in production. Fix any that don't.

### Phase 2: Autoresearch Loop on HIGH Priority (Next 2 Weeks)
Use Karpathy's autoresearch pattern on the 15 HIGH-priority upstream agents:
Senior Developer, UI Designer, UX Architect, SEO Specialist, Feedback Synthesizer,
Experiment Tracker, Data Consolidation, Compliance Auditor, Finance Tracker,
Legal Compliance Checker, Reality Checker, Workflow Optimizer, Brand Guardian,
Twitter Engager, Social Media Strategist.

### Phase 3: MEDIUM Priority (Month 2)
Customize remaining MEDIUM agents through autoresearch loop.

### Phase 4: Ongoing Upstream Sync
Pull upstream improvements from msitarzewski/agency-agents.
Re-benchmark customized agents after each upstream sync.

---

## Directory Structure

```
breverdbidder/agency-agents/
├── customized/              # 16 BidDeed-optimized agents (85%+ benchmarked) ✅
├── production-agents/
│   ├── biddeed-scraper/     # 8 agents from brevard-bidder-scraper 🟡
│   ├── life-os/             # 7 agents from life-os 🟡
│   └── zonewise-agents/     # 9 prompts from zonewise-agents 🟡
├── engineering/             # 11 upstream originals (6 customized)
├── design/                  # 8 upstream originals
├── marketing/               # 11 upstream originals (3 customized)
├── paid-media/              # 7 upstream originals
├── product/                 # 4 upstream originals (1 customized)
├── project-management/      # 5 upstream originals
├── specialized/             # 9+ upstream originals (2 customized)
├── support/                 # 6 upstream originals (1 customized)
├── testing/                 # 8 upstream originals (1 customized)
├── spatial-computing/       # 6 upstream originals (SKIP)
├── game-development/        # 5 upstream originals (SKIP)
└── MASTER_AGENT_INVENTORY.md  # ← THIS FILE
```
