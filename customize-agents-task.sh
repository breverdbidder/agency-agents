#!/bin/bash
# =============================================================================
# AGENCY-AGENTS CUSTOMIZATION TASK
# Run this in Claude Code: paste the entire TASK section as your prompt
# Or run via: claude --print "$(cat customize-agents-task.sh)"
# =============================================================================

cat << 'TASK'
# Task: Customize 6 CRITICAL AI Agents for BidDeed.AI & ZoneWise.AI

## Setup (do first)
```bash
git clone https://github.com/breverdbidder/agency-agents.git
cd agency-agents
git remote set-url origin https://$GITHUB_PAT@github.com/breverdbidder/agency-agents.git
mkdir -p customized
```

Read CLAUDE.md first (I'll create it), then proceed with each agent below.

---

## Agent 1: Agents Orchestrator → LangGraph Pipeline Coordinator

**Source:** `specialized/agents-orchestrator.md`
**Output:** `customized/biddeed-pipeline-orchestrator.md`

**Customization instructions:**

Replace the generic PM→ArchitectUX→Dev→QA pipeline with BidDeed's 12-stage pipeline:

```
Stage 1: DISCOVERY — Query RealForeclose for upcoming auction calendar
Stage 2: SCRAPING — Firecrawl/httpx scrape property details from BCPAO, AcclaimWeb
Stage 3: TITLE SEARCH — AcclaimWeb party name search for liens/mortgages
Stage 4: LIEN PRIORITY — Analyze lien hierarchy (HOA foreclosure → senior mortgage survives)
Stage 5: TAX CERTIFICATES — RealTDM search for outstanding tax certs
Stage 6: DEMOGRAPHICS — Census API for neighborhood income, vacancy, trends
Stage 7: ML SCORE — XGBoost third-party purchase probability prediction
Stage 8: MAX BID — Calculate: (ARV×70%)-Repairs-$10K-MIN($25K,15%ARV)
Stage 9: DECISION LOG — Bid/Jdg ratio: ≥75%=BID, 60-74%=REVIEW, <60%=SKIP
Stage 10: REPORT — Generate one-page DOCX with BCPAO photos + ML predictions
Stage 11: DISPOSITION — Track auction outcome (won/lost/cancelled)
Stage 12: ARCHIVE — Store to Supabase multi_county_auctions + historical_auctions
```

**Quality gates per stage:**
- Stage 2: Scrape must return valid HTML with property address parsed
- Stage 4: Lien priority must identify plaintiff type (bank/HOA/tax/condo)
- Stage 7: ML score must be 0.0-1.0 with confidence interval
- Stage 8: Max bid must be positive and less than judgment amount
- Stage 9: Decision must be exactly BID, REVIEW, or SKIP

**Also add ZoneWise waterfall:**
```
Tier 1: Firecrawl ($83/mo) → raw markdown
Tier 2: Gemini Flash (FREE) → structured JSON
Tier 3: Claude Sonnet (FREE/Max) → complex zoning analysis
Tier 4: Manual flag for human review
```

**State persistence:** Supabase `claude_context_checkpoints` table
**Retry logic:** Max 3 attempts per stage, then log to `insights` table and escalate
**Circuit breaker:** If any external source (BCPAO, RealForeclose) returns 3 consecutive errors, skip source and alert

After customization: `git add . && git commit -m "[agent-customize] Agents Orchestrator → LangGraph Pipeline Coordinator" && git push`

---

## Agent 2: Autonomous Optimization Architect → Smart Router Governor

**Source:** `engineering/engineering-autonomous-optimization-architect.md`  
**Output:** `customized/biddeed-smart-router-governor.md`

**Customization instructions:**

Map the multi-provider router to our exact tiers:

```
TIER: FREE (40-55% of requests)
  Provider: Claude Sonnet 4.5 (Max plan, unlimited)
  Use for: Simple property lookups, report formatting
  
TIER: ULTRA_CHEAP ($0.28/1M in, $0.42/1M out)
  Provider: DeepSeek V3.2
  Use for: Bulk text extraction, data normalization
  
TIER: STANDARD
  Provider: Gemini 2.5 Flash (FREE tier)  
  Use for: Structured JSON extraction from zoning docs
  
TIER: PREMIUM
  Provider: Claude Sonnet 4.5 (API, paid)
  Use for: Complex lien priority analysis, legal document interpretation
  
TIER: EMERGENCY
  Provider: Cached response from Supabase
  Use for: Fallback when all providers are down
```

**LLM-as-a-Judge evaluation criteria for foreclosure domain:**
```
Scoring (100 points):
- JSON format compliance: 20 points
- Required fields present (address, judgment, plaintiff): 20 points  
- Numerical accuracy (amounts within 1% of source): 25 points
- Lien priority correctness: 25 points
- Latency penalty: -5 per 100ms over 500ms threshold
- Hallucination penalty: -50 for any fabricated data
```

**Shadow testing pattern:**
- Route 5% of Lien Priority Analysis requests to DeepSeek V3.2 in shadow mode
- Grade both Sonnet and DeepSeek outputs using LLM-as-a-Judge
- If DeepSeek achieves ≥95% of Sonnet's score for 100+ samples, auto-promote to primary
- Log all shadow test results to Supabase `daily_metrics` table

**Circuit breakers:**
- Max cost per pipeline run: $0.05
- Max retries per provider: 3
- Trip on: 5 consecutive 429/500 errors
- Fallback chain: Sonnet → Flash → DeepSeek → Cached → HALT
- Alert on: >$10/day spend (log to `security_events`)

**Financial guardrails:**
- Monthly API budget: $100 max beyond Max subscription
- Per-property analysis cost target: <$0.02
- Daily cost dashboard in Supabase `daily_metrics`

After: `git add . && git commit -m "[agent-customize] Autonomous Optimization Architect → Smart Router Governor" && git push`

---

## Agent 3: AI Engineer → ML Score & Prediction Agent

**Source:** `engineering/engineering-ai-engineer.md`
**Output:** `customized/biddeed-ml-score-agent.md`

**Customization instructions:**

Replace generic ML with our specific models:

**Primary model: XGBoost Third-Party Purchase Probability**
```
Training data: historical_auctions table (Supabase)
  - 245K+ records across 46 FL counties
  
Features:
  - judgment_amount (float)
  - market_value (float, from BCPAO)  
  - bid_judgment_ratio (calculated)
  - plaintiff_type (categorical: bank/hoa/tax/condo/government)
  - county (categorical: 46 values)
  - property_type (categorical: SFR/condo/townhouse/vacant)
  - days_on_docket (int)
  - prior_postponements (int)
  
Target: third_party_purchased (boolean)
Metric: AUC-ROC, target ≥ 0.70
```

**Secondary model: Sale Price Predictor**
```
Target: po_sold_amount (float, 67% fill rate)
Features: same as above + neighborhood demographics
Metric: MAE < $15K
```

**Inference patterns:**
- Real-time: Auction-day decisions via API (<500ms)
- Batch: Nightly processing of new docket entries
- Streaming: Not needed currently

**Model serving:**
- Deployed on Render as FastAPI service
- Model artifacts stored in GitHub releases
- Version tagged with date: `xgboost-tpp-2026-03-10`

**Drift detection:**
- Weekly comparison of prediction distribution vs actuals
- Alert if AUC drops below 0.60
- Auto-retrain trigger on monthly cadence

After: `git add . && git commit -m "[agent-customize] AI Engineer → ML Score & Prediction Agent" && git push`

---

## Agent 4: Backend Architect → Supabase Schema & API Agent

**Source:** `engineering/engineering-backend-architect.md`
**Output:** `customized/biddeed-supabase-architect.md`

**Customization instructions:**

Replace generic database examples with our Supabase schema:

**Core tables:**
```sql
-- Primary auction data (245K+ rows, 46 counties)
multi_county_auctions (
  id, county, case_number, plaintiff, defendant,
  judgment_amount, market_value, property_address,
  auction_date, status, po_sold_amount,
  created_at, updated_at
)

-- User access control (ESF)
user_tiers (id, user_id, tier, quota_remaining, created_at)
  -- Tiers: free, pro, enterprise

-- Security audit trail
security_events (id, event_type, user_id, details, created_at)
audit_log (id, action, actor, resource, details, created_at)

-- Analytics
daily_metrics (id, date, county, properties_analyzed, 
  bids_recommended, api_cost, created_at)
  
-- Views
auctions_free (240K rows — limited columns)
auctions_pro (252K rows — full columns + ML scores)
```

**RLS policies (9 total):**
- Free users: access auctions_free view only
- Pro users: access auctions_pro view + historical data
- Service role: full access (for pipeline)

**API patterns:**
- Supabase Edge Functions for custom logic
- PostgREST auto-generated REST API
- Real-time subscriptions for live auction updates
- Row-level security enforced on every query

**Performance targets:**
- Query latency: <200ms p95 for filtered auction lookups
- Index strategy: composite on (county, auction_date, status)
- Connection pooling via Supavisor

**Known data issues to address:**
- miami-dade (21 rows hyphen) vs miami_dade (19,498 rows underscore) — needs dedup
- po_sold_amount has 67% fill rate — handle nulls gracefully
- 643 active/upcoming auctions at any time

After: `git add . && git commit -m "[agent-customize] Backend Architect → Supabase Schema & API Agent" && git push`

---

## Agent 5: Data Engineer → Scraper Pipeline & ETL Agent

**Source:** `engineering/engineering-data-engineer.md`
**Output:** `customized/biddeed-data-pipeline-agent.md`

**Customization instructions:**

Map Medallion Architecture to our pipeline:

**Bronze (Raw):**
```
Sources:
  - RealForeclose (brevard.realforeclose.com) → auction calendar HTML
  - BCPAO (gis.brevardfl.gov) → property details, photos, parcel data
  - AcclaimWeb (vaclmweb1.brevardclerk.us) → liens, mortgages, party search
  - RealTDM → tax certificates
  - Census API → demographic data
  - Firecrawl ($83/mo) → ZoneWise raw markdown from county websites

Storage: Raw HTML/JSON in staging tables or temp files
Frequency: Nightly at 11PM EST via GitHub Actions
Anti-detection: Rotate user agents, respect rate limits, 2-5s delays
```

**Silver (Structured):**
```
Transforms:
  - HTML → structured JSON via regex patterns (12 patterns for BECA scraper)
  - Address normalization (standardize FL addresses)
  - Plaintiff classification (bank/HOA/tax/condo/government)
  - Amount parsing (judgment, market value, tax amounts)
  - Date normalization (auction dates, filing dates)
  - County name normalization (fix miami-dade → miami_dade)
  
Validation:
  - Required fields: case_number, plaintiff, judgment_amount, property_address
  - Type checks: amounts > 0, dates valid, county in valid list
  - Dedup: unique on (county, case_number)
```

**Gold (Analysis-Ready):**
```
Enrichment:
  - ML scores (XGBoost third-party probability)
  - Max bid calculation
  - Decision recommendation (BID/REVIEW/SKIP)
  - Neighborhood demographics (median income, vacancy rate)
  - BCPAO photo URLs
  
Destination: Supabase multi_county_auctions table
  - Upsert on (county, case_number)
  - Trigger daily_metrics update
```

**Pipeline orchestration:**
```yaml
# GitHub Actions nightly pipeline
schedule: "0 4 * * *"  # 11PM EST = 4AM UTC
steps:
  1. Pre-flight: health check all external sources
  2. Bronze: scrape all 46 counties (parallel where possible)
  3. Silver: parse + validate + normalize
  4. Gold: enrich with ML + calculations
  5. Load: upsert to Supabase
  6. Verify: count check, freshness check
  7. Alert: Slack/email if any county failed
```

**Idempotency:** Upsert on natural key (county + case_number). Safe to rerun.
**Monitoring:** Log row counts per county per stage. Alert if any county drops >50% vs prior day.

After: `git add . && git commit -m "[agent-customize] Data Engineer → Scraper Pipeline & ETL Agent" && git push`

---

## Agent 6: Security Engineer → ESF Security Auditor

**Source:** `engineering/engineering-security-engineer.md`
**Output:** `customized/biddeed-security-auditor.md`

**Customization instructions:**

Focus on our specific threat model:

**Asset inventory:**
```
HIGH VALUE:
  - Auction data (245K+ records, competitive advantage)
  - ML model weights (IP)
  - User payment data (future, when Pro tier launches)
  - API keys (GitHub PAT, Supabase service role, Mapbox, Firecrawl)

MEDIUM VALUE:
  - User preferences and saved searches
  - Historical analytics data
  
LOW VALUE:
  - Public auction calendar data (available on court websites)
```

**Threat model (STRIDE):**
```
Spoofing:
  - Attacker impersonates Pro user to access premium data
  - Mitigation: Supabase Auth + RLS policies on user_tiers

Tampering:
  - Attacker modifies auction recommendations in transit
  - Mitigation: HTTPS everywhere, Supabase RLS prevents direct writes

Repudiation:
  - Disputed recommendation ("BidDeed told me to bid")
  - Mitigation: audit_log table, append-only, timestamped

Information Disclosure:
  - API keys leaked in client-side code
  - Mitigation: All keys server-side only, Cloudflare environment vars
  - KNOWN RISK: PAT1 (see GitHub Secrets) has no expiry — MUST add rotation schedule

Denial of Service:
  - Scraper overloads external sources → IP ban
  - Mitigation: Rate limiting, user agent rotation, 2-5s delays

Elevation of Privilege:
  - Free user accesses Pro-only views
  - Mitigation: 9 RLS policies, verified in ESF deployment
```

**Current security posture (ESF deployed Mar 9 2026):**
```
✅ Supabase RLS: 9 policies active
✅ User tiers: free/pro/enterprise separation
✅ Security events logging
✅ Audit log table
✅ Daily quota enforcement
✅ Mapbox token (not URL-restricted — FLAG)
⚠️ PAT1 has no expiry — needs rotation policy
⚠️ Service role key used in GitHub Actions — consider scoped keys
```

**Security rules specific to financial recommendations:**
```
- NEVER expose ML model confidence as "certainty" to users
- ALWAYS include disclaimer: "Not financial advice"
- NEVER show raw lien data that could identify individuals (Fair Housing)
- ALWAYS log which data sources informed each recommendation
- Implement rate limiting: max 100 property analyses per user per day
```

**Secrets management audit checklist:**
```
[ ] GitHub PAT: rotation schedule (every 90 days)
[ ] Supabase service role: stored only in GitHub Secrets
[ ] Mapbox token: add URL restriction
[ ] Firecrawl API key: stored in GitHub Secrets
[ ] Greptile API key: verify no public exposure
[ ] All .env files in .gitignore
[ ] No secrets in CLAUDE.md or README files
```

After: `git add . && git commit -m "[agent-customize] Security Engineer → ESF Security Auditor" && git push`

---

## Final Step: Create index

Create `customized/README.md` with:
- List of all 6 customized agents with links
- Brief description of each mapping
- Note that all 55 remaining agents are available in their original directories unchanged
- Link back to upstream: msitarzewski/agency-agents

Then: `git add . && git commit -m "[agent-customize] Add customized agents index" && git push`

---

## Verification
After all commits, verify:
```bash
ls customized/
# Should show 7 files: 6 agents + README.md

git log --oneline -7
# Should show 7 commits with [agent-customize] prefix

# Verify push
git remote -v
git status
```

TASK
