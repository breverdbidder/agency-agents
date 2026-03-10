# BidDeed.AI & ZoneWise.AI — Customized Agent Library

> **Source upstream**: [msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents) (MIT License)
> **Customized for**: Ariel Shapira / Everest Capital USA
> **Products**: BidDeed.AI (foreclosure auction intelligence) + ZoneWise.AI (zoning intelligence)
> **Last updated**: March 10, 2026

---

## About These Customizations

This directory contains **6 CRITICAL agents** customized from the upstream `agency-agents` library (61 agents total) for BidDeed.AI and ZoneWise.AI. Each customized agent:

- **Extends** the original — never replaces. Original capabilities remain as fallback.
- Adds a `## BidDeed.AI / ZoneWise.AI Context` section with platform-specific instructions
- Adds `## 🔴 Domain-Specific Rules` with foreclosure/zoning business logic
- Replaces generic code examples with BidDeed/ZoneWise-specific implementations
- References actual Supabase tables, Render endpoints, and GitHub Actions pipelines

**The 55 remaining agents are unchanged** in their original directories (`engineering/`, `specialized/`, `marketing/`, etc.) and available for general use.

---

## Customized Agents (6 Critical)

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

All 55 non-customized agents are available with their original capabilities for general software development tasks.

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
