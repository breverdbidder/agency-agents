# BidDeed.AI & ZoneWise.AI — Customized Agent Library

> **Source upstream**: [msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents) (MIT License)
> **Customized for**: Ariel Shapira / Everest Capital USA
> **Products**: BidDeed.AI (foreclosure auction intelligence) + ZoneWise.AI (zoning intelligence)
> **Last updated**: March 10, 2026

---

## About These Customizations

This directory contains **16 customized agents** (6 CRITICAL + 10 HIGH priority) from the upstream `agency-agents` library (61 agents total) for BidDeed.AI and ZoneWise.AI. Each customized agent:

- **Extends** the original — never replaces. Original capabilities remain as fallback.
- Adds a `## BidDeed.AI / ZoneWise.AI Context` section with platform-specific instructions
- Adds `## 🔴 Domain-Specific Rules` with foreclosure/zoning business logic
- Replaces generic code examples with BidDeed/ZoneWise-specific implementations
- References actual Supabase tables, Render endpoints, and GitHub Actions pipelines

**The 45 remaining agents are unchanged** in their original directories (`engineering/`, `specialized/`, `marketing/`, etc.) and available for general use.

---

## Customized Agents (6 CRITICAL + 10 HIGH = 16 Total)

| # | File | Maps From | Role in BidDeed/ZoneWise |
|---|------|-----------|--------------------------|
| 1 | [biddeed-pipeline-orchestrator.md](./biddeed-pipeline-orchestrator.md) | `specialized/agents-orchestrator.md` | LangGraph coordinator for 12-stage auction pipeline + ZoneWise 4-tier waterfall |
| 2 | [biddeed-smart-router-governor.md](./biddeed-smart-router-governor.md) | `engineering/engineering-autonomous-optimization-architect.md` | Multi-tier LLM routing (Sonnet/Flash/DeepSeek/cached) with financial guardrails |
| 3 | [biddeed-ml-score-agent.md](./biddeed-ml-score-agent.md) | `engineering/engineering-ai-engineer.md` | XGBoost TPP model, max bid calculation, Render FastAPI inference |
| 4 | [biddeed-supabase-architect.md](./biddeed-supabase-architect.md) | `engineering/engineering-backend-architect.md` | Supabase schema (245K rows), 9 RLS policies, Edge Functions, PostgREST API |
| 5 | [biddeed-data-pipeline-agent.md](./biddeed-data-pipeline-agent.md) | `engineering/engineering-data-engineer.md` | Nightly ETL scraping 46 FL counties (Bronze→Silver→Gold + Supabase upsert) |
| 6 | [biddeed-security-auditor.md](./biddeed-security-auditor.md) | `engineering/engineering-security-engineer.md` | ESF security auditor — RLS verification, secrets rotation, Fair Housing compliance |

---

## Agent Descriptions

### 1. BidDeed Pipeline Orchestrator
**File**: `biddeed-pipeline-orchestrator.md`
**Original**: `specialized/agents-orchestrator.md`

Coordinates BidDeed's **12-stage foreclosure auction analysis pipeline** using LangGraph:
- Stage 1–6: Discovery → Scraping → Title → Lien → Tax → Demographics (Bronze layer)
- Stage 7–9: ML Score → Max Bid → Decision (BID/REVIEW/SKIP)
- Stage 10–12: Report → Disposition → Archive

Also orchestrates ZoneWise's 4-tier waterfall (Firecrawl → Gemini → Claude → Manual).

State persisted in Supabase `claude_context_checkpoints`. Circuit breaker on external source failures. Designed for Ariel's 20-minute/day oversight budget.

---

### 2. BidDeed Smart Router Governor
**File**: `biddeed-smart-router-governor.md`
**Original**: `engineering/engineering-autonomous-optimization-architect.md`

Governs the **multi-tier LLM routing layer**:
- FREE: Claude Sonnet 4.5 Max (unlimited, report formatting, simple lookups)
- ULTRA_CHEAP: DeepSeek V3.2 ($0.0003/property, bulk text extraction)
- STANDARD: Gemini 2.5 Flash FREE (ZoneWise JSON extraction)
- PREMIUM: Claude Sonnet 4.5 API (lien priority analysis — never cuts corners here)
- EMERGENCY: Supabase cached responses

Enforces $0.02/property cost target, $100/month API budget, shadow-tests DeepSeek against Sonnet for lien analysis. Auto-promotion requires manual approval for financial tasks.

---

### 3. BidDeed ML Score & Prediction Agent
**File**: `biddeed-ml-score-agent.md`
**Original**: `engineering/engineering-ai-engineer.md`

Owns **XGBoost foreclosure ML models** served via Render FastAPI:
- **Primary**: Third-Party Purchase Probability (TPP) — AUC-ROC ≥ 0.70 required
- **Secondary**: Sale Price Predictor — MAE < $15K required
- Features: judgment_amount, market_value, plaintiff_type, county, property_type, days_on_docket, prior_postponements
- Decision logic: bid_judgment_ratio ≥75%=BID, 60–74%=REVIEW, <60%=SKIP
- Monthly retraining, weekly drift detection, <500ms inference SLA

---

### 4. BidDeed Supabase Schema & API Agent
**File**: `biddeed-supabase-architect.md`
**Original**: `engineering/engineering-backend-architect.md`

Owns the **Supabase database layer** at mocerqjnksmhcjzxrewo.supabase.co:
- `multi_county_auctions` — 245K+ rows, 46 FL counties, primary auction data
- `user_tiers` — free/pro/enterprise access control
- `security_events`, `audit_log` — compliance and monitoring
- `daily_metrics` — pipeline analytics and cost tracking
- 9 RLS policies, auctions_free/auctions_pro views, 3 Edge Functions
- Addresses: miami-dade naming fix, po_sold_amount 67% null handling, <200ms p95 query target

---

### 5. BidDeed Scraper Pipeline & ETL Agent
**File**: `biddeed-data-pipeline-agent.md`
**Original**: `engineering/engineering-data-engineer.md`

Builds and operates the **nightly ETL pipeline** (11PM EST via GitHub Actions):
- **Bronze**: Raw HTML from RealForeclose, BCPAO, AcclaimWeb, RealTDM, Census API
- **Silver**: 12 regex patterns for parsing, plaintiff classification (bank/HOA/tax/condo), county normalization, validation
- **Gold**: Max bid calculation, ML scoring, BID/REVIEW/SKIP decisions, Supabase upsert
- Anti-detection: rotating user agents, 2–5s delays, IP rotation
- Alert on: any county drops >50% records vs prior day
- Also manages ZoneWise Firecrawl ingestion for 67 FL counties

---

### 6. BidDeed ESF Security Auditor
**File**: `biddeed-security-auditor.md`
**Original**: `engineering/engineering-security-engineer.md`

Enforces the **Everest Security Framework (ESF)** for BidDeed/ZoneWise:
- Full STRIDE threat model with BidDeed-specific mitigations
- 9 RLS policy verification (CI/CD script included)
- Secrets rotation schedule (PAT1 critical open item)
- Fair Housing compliance: no discriminatory data in recommendations
- Financial disclaimer enforcement: ML confidence ≠ investment certainty
- Known open items: PAT1 no expiry (CRITICAL), Mapbox not URL-restricted (HIGH), Render ML API auth (MEDIUM)

---

---

## HIGH Priority Agents (10 New)

| # | File | Maps From | Role in BidDeed/ZoneWise |
|---|------|-----------|--------------------------|
| 7 | [biddeed-frontend-ui-agent.md](./biddeed-frontend-ui-agent.md) | `engineering/engineering-frontend-developer.md` | Split-screen UI (NLP chat left, auction artifacts right) — house brand enforced, Mapbox heatmaps, ML score gauges |
| 8 | [biddeed-devops-agent.md](./biddeed-devops-agent.md) | `engineering/engineering-devops-automator.md` | GitHub Actions nightly scrape pipeline (11PM EST), Cloudflare Pages, Render, Modal.com, Telegram alerts |
| 9 | [biddeed-rapid-prototyper-agent.md](./biddeed-rapid-prototyper-agent.md) | `engineering/engineering-rapid-prototyper.md` | 3-day sprint methodology — hypothesis-first, real auction data, ADHD guardrails, Cloudflare preview URLs |
| 10 | [biddeed-sprint-prioritizer-agent.md](./biddeed-sprint-prioritizer-agent.md) | `product/product-sprint-prioritizer.md` | TODO.md protocol, RICE scoring for solo founder, Sunday→Friday sprint, scope creep prevention |
| 11 | [biddeed-growth-agent.md](./biddeed-growth-agent.md) | `marketing/marketing-growth-hacker.md` | Freemium funnel (auctions_free → Pro upgrade), K-factor 1.2, REI investor viral loop, experiment calendar |
| 12 | [biddeed-content-agent.md](./biddeed-content-agent.md) | `marketing/marketing-content-creator.md` | 46 county SEO guides, foreclosure education pillars, Mon-Thu editorial calendar, data-driven case studies |
| 13 | [biddeed-reddit-agent.md](./biddeed-reddit-agent.md) | `marketing/marketing-reddit-community-builder.md` | Ariel's expert presence on r/realestateinvesting — 90/10 rule, AMA strategy, community insight pipeline |
| 14 | [biddeed-api-tester-agent.md](./biddeed-api-tester-agent.md) | `testing/testing-api-tester.md` | Pre-flight health checks, RLS contract tests, graceful degradation (partial data > no data), county drop alerts |
| 15 | [biddeed-agent-identity-agent.md](./biddeed-agent-identity-agent.md) | `specialized/agentic-identity-trust.md` | Agent roster with authority levels, delegation chain verification, append-only audit_log (SHA-256 hash chain) |
| 16 | [biddeed-analytics-agent.md](./biddeed-analytics-agent.md) | `support/support-analytics-reporter.md` | 4 dashboards, 5 KPIs, Friday 2PM auto-summary for Ariel's 20-min review, ML health monitoring |

### HIGH Priority Agent Descriptions

#### 7. BidDeed Split-Screen UI Agent
**File**: `biddeed-frontend-ui-agent.md`
**Original**: `engineering/engineering-frontend-developer.md`

Builds BidDeed's **split-screen auction intelligence interface** (Claude AI / Manus AI inspired):
- LEFT (40%): NLP chatbot — natural language auction queries, conversational property analysis
- RIGHT (60%): Artifacts — property cards with BCPAO photos, ML score gauges (0-100 with ±CI), county heatmaps (Mapbox), DOCX report previews

House brand enforced: Navy #1E3A5F, Orange #F59E0B, Inter, #020617 background. Shabbat orange for Friday properties. Free-tier columns blurred with Pro upgrade CTA. Core Web Vitals: LCP < 2.5s, FID < 100ms, CLS < 0.1.

---

#### 8. BidDeed GitHub Actions & Deploy Agent
**File**: `biddeed-devops-agent.md`
**Original**: `engineering/engineering-devops-automator.md`

Owns **CI/CD and nightly scrape pipeline** (no Kubernetes):
- GitHub Actions nightly at 11PM EST (4AM UTC): preflight → 46 counties in 5 parallel batches → ML scoring → Supabase upsert → Telegram alert
- Cloudflare Pages (frontend, preview URLs per PR), Render (ML/backend), Modal.com (ZoneWise parallel scraping)
- Canary: deploy scraper to Brevard first → validate record count → roll to all 46
- Secret rotation: PATs every 90 days; Telegram alerts on any failure

---

#### 9. BidDeed MVP Feature Sprint Agent
**File**: `biddeed-rapid-prototyper-agent.md`
**Original**: `engineering/engineering-rapid-prototyper.md`

3-day sprint methodology for BidDeed features:
- Day 1: hypothesis → Supabase schema + Edge Function stub
- Day 2: Next.js component + Claude API via LiteLLM
- Day 3: test with real `multi_county_auctions` data → ship preview URL
- ADHD guardrails: max 1 spike at a time, 2-hour blocks, kill criteria defined before build
- Feature spike examples: county comparison, smart alerts, lien waterfall visualization

---

#### 10. BidDeed TODO.md & Roadmap Agent
**File**: `biddeed-sprint-prioritizer-agent.md`
**Original**: `product/product-sprint-prioritizer.md`

Solo founder sprint management:
- TODO.md as single source of truth (GitHub repo)
- Max 3 sprint items (ADHD guardrail)
- RICE scoring adapted for foreclosure SaaS (Reach/Impact/Confidence/Effort)
- Sunday evening planning → Friday 2PM EST cutoff
- Scope creep prevention: RICE score every new item; score < current sprint = backlog
- Auto-summary from Supabase activity logs for Ariel's 20-min review

---

#### 11. BidDeed Launch & Freemium Conversion Agent
**File**: `biddeed-growth-agent.md`
**Original**: `marketing/marketing-growth-hacker.md`

B2B/prosumer real estate investor growth (not B2C viral):
- Freemium funnel: `auctions_free` (240K rows, basic data) → Pro upgrade ($49/mo hypothesis)
- K-factor target: 1.2 via REI meetup word-of-mouth + BiggerPockets referrals
- "Wow" moment < 60 seconds: county → calendar → property → ML score tease
- 10+ growth experiments/month tracked in Supabase `growth_experiments` table
- North Star: properties analyzed/week → Pro upgrades/month → deals closed

---

#### 12. BidDeed SEO & Authority Content Agent
**File**: `biddeed-content-agent.md`
**Original**: `marketing/marketing-content-creator.md`

Content machine for 46-county SEO domination:
- 46 county guide pages: "Foreclosure Auctions in [County], Florida: Complete 2026 Guide"
- 4 content pillars: Foreclosure Education, FL Market Intel, AI-Powered Investing, County Guides
- Editorial calendar: Mon blog, Tue Twitter, Wed Reddit, Thu email; NO Friday after 2PM
- All stats from real `multi_county_auctions` queries — never fabricated
- Case study template: real historical_auctions data (po_sold_amount, third_party = true)

---

#### 13. BidDeed r/realestateinvesting Authority Agent
**File**: `biddeed-reddit-agent.md`
**Original**: `marketing/marketing-reddit-community-builder.md`

Ariel's authentic foreclosure expert presence on Reddit:
- Primary: r/realestateinvesting (900K+), r/realestate (1.5M+)
- Secondary: r/foreclosure, r/proptech; Local: r/321, r/SpaceCoast
- 90/10 rule: 90% genuine expertise (lien hierarchy, max bid formulas, courthouse procedure)
- AMA strategy: Tuesday 10AM EST on r/realestateinvesting with 20 pre-written answers
- Community insight → Supabase feature_ideas pipeline: high-upvote questions = feature gaps

---

#### 14. BidDeed Scraper & API Validation Agent
**File**: `biddeed-api-tester-agent.md`
**Original**: `testing/testing-api-tester.md`

Validates the full BidDeed data stack:
- Pre-flight: checks RealForeclose, BCPAO, AcclaimWeb, RealTDM, Supabase; ≥3 healthy = proceed
- RLS contract tests: free users cannot see ml_score/lien_details/max_bid (run every deploy)
- Graceful degradation: BCPAO down → photos null, pipeline continues; Firecrawl quota → Gemini fallback
- County drop alert: >50% record drop vs prior day → immediate Telegram
- Rate limit enforcement: 1 req/3s RealForeclose, 1 req/2s BCPAO — never exceed

---

#### 15. BidDeed Multi-Agent Auth & Audit Agent
**File**: `biddeed-agent-identity-agent.md`
**Original**: `specialized/agentic-identity-trust.md`

Identity and trust infrastructure for BidDeed's pipeline agents:
- Agent roster: Ariel (FULL) → Claude AI (DESIGN) → Claude Code (EXECUTE) → Traycer (REVIEW) → pipeline agents (COLLECT/PREDICT/GENERATE)
- audit_log: append-only, SHA-256 hash chain; any modification = detectable
- Decision evidence chain: every BID/REVIEW/SKIP traces to scraper → ML model → formula → rule
- Incomplete evidence → auto-downgrade BID to REVIEW
- Known open items: PAT1 no expiry (CRITICAL), Mapbox not URL-restricted (HIGH), Render ML no auth (MEDIUM)

---

#### 16. BidDeed Auction Analytics Dashboard Agent
**File**: `biddeed-analytics-agent.md`
**Original**: `support/support-analytics-reporter.md`

4 dashboards + 5 KPIs for solo founder oversight:
- Dashboard 1: Auction Performance (daily) — 46-county bar chart, BID/REVIEW/SKIP pie, judgment trends
- Dashboard 2: ML Model Health (weekly) — AUC-ROC, calibration plot, feature drift; alert if AUC < 0.60
- Dashboard 3: Pipeline Operations (real-time) — scraper uptime, API cost burn, county freshness
- Dashboard 4: Financial (monthly) — cost per property (target: <$0.02), ROI tracking
- Auto-summary: Friday 2PM EST → Telegram, formatted for Ariel's 20-min review

---

## All 61 Agents Available

The full upstream `agency-agents` library (61 agents) remains intact in the original directories:

```
engineering/         # 10 agents (AI, Backend, Security, Data, DevOps, etc.)
marketing/           # 8 agents (Growth, Content, Social, TikTok, etc.)
specialized/         # Various (Orchestrator, Analytics, Legal, etc.)
design/              # UX, UI, Brand agents
product/             # PM, Sprint, Feedback agents
testing/             # QA, Reality Checker, API Tester
support/             # Support Responder, Finance Tracker
```

All 45 non-customized agents are available with their original capabilities for general software development tasks.

---

## Customization Conventions

Each customized agent follows this structure:
1. YAML frontmatter (name, description, color)
2. `## BidDeed.AI / ZoneWise.AI Context` — platform-specific setup
3. `## 🔴 Domain-Specific Rules` — non-negotiable foreclosure/zoning rules
4. Original agent content (extended, not replaced)
5. `## 🔄 Original [Agent Name] Capabilities (Fallback)` — what remains from upstream

---

## License

Original agents: MIT License — [msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents)
Customizations: Proprietary — Ariel Shapira / Everest Capital USA
Attribution preserved per MIT License requirements.
