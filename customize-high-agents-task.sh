#!/bin/bash
cat << 'TASK'
# Task: Customize 10 HIGH-Priority AI Agents for BidDeed.AI & ZoneWise.AI

Read CLAUDE.md first for full context. Then execute each agent customization below.
Save all outputs to customized/ directory. Git commit + push after each agent.

---

## Agent 7: Frontend Developer → Split-Screen UI Agent

**Source:** `engineering/engineering-frontend-developer.md`
**Output:** `customized/biddeed-frontend-ui-agent.md`

**Customization:**

Replace generic React examples with BidDeed.AI split-screen architecture:

```
LAYOUT: Split-screen (inspired by Claude AI / Manus AI)
  LEFT PANEL (40%):  NLP chatbot interface
    - Natural language auction queries
    - Conversational property analysis
    - Command bar for quick actions
  RIGHT PANEL (60%): Artifacts / Reports
    - Property detail cards with BCPAO photos
    - ML score visualizations (gauge charts)
    - One-page auction reports (inline DOCX preview)
    - County heatmaps (Mapbox integration)
```

**House brand (MANDATORY):**
```
Primary:    Navy #1E3A5F
Accent/CTA: Orange #F59E0B
Font:       Inter
Background: #020617 (slate-950)
Source:     globals.css + BRAND_COLORS.md
```

**Component library:**
```
- AuctionCard: case_number, plaintiff, judgment, market_value, ML score badge, decision (BID/REVIEW/SKIP)
- PropertyDetail: address, BCPAO photo, parcel map, lien summary, max bid calculation
- MLScoreGauge: 0-100 probability display with confidence interval
- CountyHeatmap: Mapbox choropleth by auction density or success rate
- DecisionBadge: BID (green), REVIEW (orange), SKIP (red) with Shabbat orange for Friday properties
- ChatMessage: user/assistant bubbles with auction data inline
```

**Stack:** Next.js 14+ App Router, Tailwind CSS, Supabase real-time subscriptions, Mapbox GL JS (token: pk.eyJ1..everest18)
**Performance:** Core Web Vitals targets: LCP < 2.5s, FID < 100ms, CLS < 0.1

After: `git add . && git commit -m "[agent-customize] Frontend Developer → Split-Screen UI Agent" && git push`

---

## Agent 8: DevOps Automator → GitHub Actions & Deploy Agent

**Source:** `engineering/engineering-devops-automator.md`
**Output:** `customized/biddeed-devops-agent.md`

**Customization:**

Replace Kubernetes/Docker examples with our exact stack:

```
CI/CD PIPELINE:
  GitHub Actions → Cloudflare Pages (frontend)
  GitHub Actions → Render (backend services)
  GitHub Actions → Modal.com (parallel scraping, ZoneWise)
  GitHub Actions → Supabase migrations

NIGHTLY SCRAPE PIPELINE (11PM EST / 4AM UTC):
  1. Pre-flight health check all external sources
  2. Scrape 46 FL counties (parallel batches of 10)
  3. Parse + validate + normalize
  4. Upsert to Supabase multi_county_auctions
  5. Run ML scoring batch
  6. Update daily_metrics
  7. Telegram alert on completion or failure

DEPLOYMENT STRATEGY:
  - Canary: deploy scraper update to 1 county → validate → roll out to 46
  - Preview: Cloudflare Pages preview deployments per PR
  - Rollback: git revert + re-deploy (< 5 min)
```

**Secret management:**
```
GitHub Secrets (per repo):
  GH_PAT, ANTHROPIC_API_KEY, SUPABASE_URL, SUPABASE_SERVICE_KEY,
  FIRECRAWL_API_KEY, GEMINI_API_KEY, MAPBOX_TOKEN, RENDER_API_KEY,
  TELEGRAM_BOT_TOKEN, TELEGRAM_CHAT_ID
  
Rotation policy: PATs every 90 days, API keys on compromise only
```

**Monitoring:** Telegram bot alerts (@AgentRemote_bot), Supabase security_events table, GitHub Actions run history
**Cost optimization:** GitHub Actions free tier (2000 min/mo), Cloudflare Pages free, Render free tier where possible

After: `git add . && git commit -m "[agent-customize] DevOps Automator → GitHub Actions & Deploy Agent" && git push`

---

## Agent 9: Rapid Prototyper → MVP Feature Sprint Agent

**Source:** `engineering/engineering-rapid-prototyper.md`
**Output:** `customized/biddeed-rapid-prototyper-agent.md`

**Customization:**

Replace generic MVP patterns with our stack-specific sprint methodology:

```
3-DAY SPRINT TEMPLATE:
  Day 1: Hypothesis + Supabase schema + API stub
  Day 2: Frontend component + Claude API integration
  Day 3: Test with real auction data + ship to preview

STACK (always use these):
  Backend:  Supabase (tables + RLS + Edge Functions)
  Frontend: Next.js + Tailwind + house brand
  AI:       Claude API via LiteLLM Smart Router
  Deploy:   Cloudflare Pages (preview URLs per branch)
  Data:     Real auction data from multi_county_auctions (never mock data)
```

**Hypothesis template (MANDATORY before building):**
```
IF [change/feature]
THEN [metric] will [direction] by [amount]
BECAUSE [reasoning based on auction data patterns]
VALIDATE BY [specific test with real data]
KILL CRITERIA: if metric doesn't move in [timeframe], abandon
```

**ADHD guardrails:**
```
- Max 1 feature spike at a time
- Time-box to 2-hour blocks with forced breaks
- Write hypothesis BEFORE opening code editor
- Ship to preview URL before polish
- "Good enough to test" beats "perfect but unshipped"
```

**Feature spike examples:**
```
1. "County comparison dashboard" — 3-day spike, compare auction success rates across counties
2. "Smart alert system" — notify when properties matching user criteria hit the docket
3. "Lien waterfall visualization" — interactive chart showing lien priority stack per property
```

After: `git add . && git commit -m "[agent-customize] Rapid Prototyper → MVP Feature Sprint Agent" && git push`

---

## Agent 10: Sprint Prioritizer → TODO.md & Roadmap Agent

**Source:** `product/product-sprint-prioritizer.md`
**Output:** `customized/biddeed-sprint-prioritizer-agent.md`

**Customization:**

Wire to our TODO.md Protocol:

```
TODO.md WORKFLOW (MANDATORY):
  1. Load todo.md from GitHub repo
  2. Find current unchecked task [ ]
  3. Execute + verify
  4. Mark [x] and push
  5. Never skip steps

RICE SCORING (adapted for solo founder):
  Reach:  How many auction analyses does this improve? (1-10)
  Impact: Revenue impact — extra deals or avoided losses (1-10)
  Confidence: Do we have data to support this? (1-10)
  Effort: Claude Code sessions needed (inverse: 10=easy, 1=hard)
  Score = (R × I × C) / E
```

**Sprint structure:**
```
WEEKLY SPRINT (Sunday evening → Friday before Shabbat):
  - Max 3 items per sprint (ADHD guardrail)
  - Each item time-boxed to 2-hour blocks
  - Friday 2PM EST: sprint review (automated from Supabase activity logs)
  - No new items mid-sprint unless P0 blocker

DOMAINS (tag every item):
  BD = BidDeed.AI feature/fix
  ZW = ZoneWise.AI feature/fix
  OPS = Infrastructure/DevOps
  SEC = Security
  DOC = Documentation
```

**Scope creep prevention:**
```
BEFORE adding any new work:
  1. RICE score it
  2. Compare to current sprint items
  3. If score < lowest current item → backlog
  4. If score > highest current item → swap (with explicit acknowledgment of what's deferred)
  5. Log the decision to Supabase insights table
```

**Cross-product dependencies:**
```
BidDeed depends on ZoneWise: zoning data enrichment for property analysis
ZoneWise depends on BidDeed: multi_county_auctions schema for auction context
Shared: Supabase infrastructure, GitHub Actions, Cloudflare Pages
```

After: `git add . && git commit -m "[agent-customize] Sprint Prioritizer → TODO.md & Roadmap Agent" && git push`

---

## Agent 11: Growth Hacker → Launch & Freemium Conversion Agent

**Source:** `marketing/marketing-growth-hacker.md`
**Output:** `customized/biddeed-growth-agent.md`

**Customization:**

Replace B2C viral patterns with B2B/prosumer real estate investor growth:

```
FREEMIUM FUNNEL:
  Landing page → Free signup → First auction analysis → "Wow" moment → Pro upgrade → Referral
  
  FREE TIER (auctions_free view, 240K rows):
    - Basic auction calendar (county, date, address, judgment)
    - Limited to 10 property lookups/day
    - No ML scores, no lien analysis, no max bid calculation
    
  PRO TIER (auctions_pro view, 252K rows):
    - Full ML predictions + confidence intervals
    - Lien priority analysis
    - Max bid calculator
    - Unlimited lookups
    - Historical auction outcomes
    - County comparison analytics

NORTH STAR METRIC CANDIDATES:
  Option A: "Properties analyzed per week" (engagement)
  Option B: "Pro upgrades per month" (revenue)
  Option C: "Deals closed using BidDeed data" (outcome)
  → Start with Option A, graduate to C when measurable
```

**Viral loop for real estate investors:**
```
1. User finds profitable deal using BidDeed → wins auction
2. Shares success at local REI meetup / BiggerPockets / Reddit
3. "How did you find that deal?" → "BidDeed.AI"
4. New user signs up with referral link
5. Both get 1 week Pro trial
6. K-factor target: 1.2 (each user brings 1.2 new users)
```

**Growth experiments (10/month target):**
```
Week 1-2: Onboarding flow A/B tests (time to first analysis < 60 seconds)
Week 3-4: Email drip sequences (auction alerts → Pro features → upgrade CTA)
Monthly: Pricing experiments ($29/mo vs $49/mo vs $99/mo for Pro)
Ongoing: Referral program mechanics (credit vs free months vs feature unlock)
```

After: `git add . && git commit -m "[agent-customize] Growth Hacker → Launch & Freemium Conversion Agent" && git push`

---

## Agent 12: Content Creator → SEO & Authority Content Agent

**Source:** `marketing/marketing-content-creator.md`
**Output:** `customized/biddeed-content-agent.md`

**Customization:**

```
CONTENT PILLARS:
  1. FORECLOSURE EDUCATION — "How to analyze foreclosure auctions" (beginner → expert)
  2. FLORIDA MARKET INTEL — County-specific auction trends, data-driven insights
  3. AI-POWERED RE INVESTING — How AI changes foreclosure investing
  4. COUNTY GUIDES — "Complete Guide to [County] Foreclosure Auctions" × 46

SEO CONTENT MACHINE (46 counties = 46 landing pages):
  Template: "Foreclosure Auctions in [County], Florida: Complete 2026 Guide"
  Each page includes:
    - Auction schedule and location (in-person vs online)
    - Average judgment amounts (from our data)
    - Third-party purchase rates (from ML model)
    - Top plaintiffs (banks, HOAs)
    - Property type breakdown
    - Link to BidDeed.AI for real-time analysis

EDITORIAL CALENDAR:
  Monday:    Blog post (pillar content, 1500+ words)
  Tuesday:   Twitter thread (repurposed from blog)
  Wednesday: Reddit value post (r/realestateinvesting)
  Thursday:  Email newsletter (weekly auction highlights)
  Friday:    No publishing (Shabbat prep after 2PM EST)
  Saturday:  No publishing (Shabbat)
  Sunday:    Content planning for next week

CASE STUDY TEMPLATE:
  "How BidDeed.AI Identified a $[X] Opportunity in [County]"
  Structure: Problem → Analysis → ML Prediction → Outcome → ROI
  Data source: historical_auctions where po_sold_amount > 0 AND third_party = true
```

After: `git add . && git commit -m "[agent-customize] Content Creator → SEO & Authority Content Agent" && git push`

---

## Agent 13: Reddit Community Builder → r/realestateinvesting Authority Agent

**Source:** `marketing/marketing-reddit-community-builder.md`
**Output:** `customized/biddeed-reddit-agent.md`

**Customization:**

```
TARGET SUBREDDITS:
  PRIMARY (daily engagement):
    r/realestateinvesting (900K+) — bulk of our audience
    r/realestate (1.5M+) — broader RE community
    
  SECONDARY (2-3x/week):
    r/foreclosure — directly relevant
    r/proptech — AI + real estate community
    r/RealEstateInvesting — alternative sub
    
  LOCAL (weekly):
    r/florida — state-specific discussions
    r/321 — Brevard area code community
    r/SpaceCoast — local Brevard/Melbourne

ARIEL'S AUTHENTIC EXPERTISE (not marketing — real value):
  - 10+ years foreclosure auction investing in Brevard County
  - FL licensed broker AND general contractor
  - Personally analyzed 1,000+ auction properties
  - Built AI system processing 245K+ auction records
  - Can answer: lien priority, HOA foreclosures, tax certificates, max bid strategy

90/10 ENGAGEMENT RULES:
  90% value: Answer questions, share market insights, explain lien hierarchies
  10% mention: "I built a tool that helps with this" → link to BidDeed.AI
  NEVER: Direct promotional posts, spam, or misleading claims

AMA STRATEGY:
  Title: "I've been investing in FL foreclosure auctions for 10+ years and built an AI
         to analyze 245,000+ auction records. AMA about foreclosure investing."
  Target: r/realestateinvesting
  Prep: 20 pre-written answers for common questions
  Timing: Tuesday 10AM EST (peak Reddit engagement)

CONTENT TYPES:
  1. "Here's what I learned from [X] foreclosure auctions" (data-driven insights)
  2. "Common mistakes at foreclosure auctions" (educational)
  3. "How lien priority actually works" (technical expertise)
  4. "Monthly FL foreclosure market update" (original data from our pipeline)
```

After: `git add . && git commit -m "[agent-customize] Reddit Community Builder → r/realestateinvesting Authority Agent" && git push`

---

## Agent 14: API Tester → Scraper & API Validation Agent

**Source:** `testing/testing-api-tester.md`
**Output:** `customized/biddeed-api-tester-agent.md`

**Customization:**

```
EXTERNAL DATA SOURCES TO TEST:
  1. RealForeclose (brevard.realforeclose.com)
     - Health: GET auction calendar page returns 200
     - Schema: auction entries have case_number, plaintiff, judgment_amount
     - Rate limit: max 1 request/3 seconds
     
  2. BCPAO (gis.brevardfl.gov)
     - Health: parcel API returns valid JSON
     - Schema: account number → owner, address, market_value, photo URL
     - Rate limit: max 1 request/2 seconds
     
  3. AcclaimWeb (vaclmweb1.brevardclerk.us)
     - Health: party name search returns results
     - Schema: document type, recording date, book/page
     - Auth: requires session cookie
     
  4. RealTDM (tax certificates)
     - Health: search endpoint returns 200
     - Schema: cert_number, face_value, status
     
  5. Firecrawl API ($83/mo)
     - Health: POST /v0/scrape returns 200
     - Schema: markdown output non-empty
     - Cost: track credits consumed per call
     
  6. Supabase (mocerqjnksmhcjzxrewo.supabase.co)
     - Health: /rest/v1/ returns 200
     - RLS: free user cannot access auctions_pro view
     - RLS: pro user CAN access auctions_pro view
     - Edge Functions: respond within 500ms

GRACEFUL DEGRADATION TESTS:
  Scenario 1: BCPAO is down → pipeline continues without photos, flags properties
  Scenario 2: RealForeclose returns 403 → switch to cached data, alert via Telegram
  Scenario 3: Firecrawl quota exceeded → fall to Tier 2 (Gemini), alert
  Scenario 4: Supabase rate limited → exponential backoff, max 3 retries
  
  RULE: Pipeline NEVER crashes entirely. Partial data > no data.

PRE-SCRAPE VALIDATION (runs before nightly pipeline):
  GitHub Actions step 0:
    - Ping all 5 external sources
    - If ≥3 healthy → proceed
    - If <3 healthy → skip nightly run, alert, log to security_events

CONTRACT TESTS:
  - multi_county_auctions INSERT must have: county, case_number, plaintiff, judgment_amount
  - user_tiers SELECT with anon key must return 0 rows
  - auctions_free SELECT must exclude: ml_score, lien_details, max_bid columns
  - auctions_pro SELECT must include: all columns
```

After: `git add . && git commit -m "[agent-customize] API Tester → Scraper & API Validation Agent" && git push`

---

## Agent 15: Agentic Identity & Trust → Multi-Agent Auth & Audit Agent

**Source:** `specialized/agentic-identity-trust.md`
**Output:** `customized/biddeed-agent-identity-agent.md`

**Customization:**

```
AGENT ROSTER & AUTHORITY LEVELS:
  ┌──────────────────────┬────────────────────┬─────────────────────────────┐
  │ Agent                │ Authority          │ Scope                       │
  ├──────────────────────┼────────────────────┼─────────────────────────────┤
  │ Ariel (human)        │ FULL               │ All decisions, all data     │
  │ Claude AI (Sonnet)   │ DESIGN             │ Architecture, specs, review │
  │ Claude Code          │ EXECUTE            │ Code, deploy, git push      │
  │ Traycer              │ REVIEW             │ QA, issue creation          │
  │ Greptile             │ READ               │ Code indexing only          │
  │ LangGraph            │ ORCHESTRATE        │ Pipeline stage transitions  │
  │ Scraper Agent        │ COLLECT            │ External source access only │
  │ ML Agent             │ PREDICT            │ Model inference only        │
  │ Report Agent         │ GENERATE           │ DOCX/PDF creation only      │
  └──────────────────────┴────────────────────┴─────────────────────────────┘

DELEGATION CHAINS:
  Ariel → Claude AI: "Design the new feature" (DESIGN authority)
  Claude AI → Claude Code: "Implement this spec" (EXECUTE authority)
  Claude Code → Traycer: "Review this PR" (REVIEW authority)
  LangGraph → Scraper Agent → ML Agent → Report Agent: pipeline chain

AUDIT TRAIL (Supabase audit_log table):
  Every consequential action logged:
  {
    id, timestamp, agent_name, action_type,
    resource (table/repo/file), input_hash, output_hash,
    authority_used, delegation_chain, success (boolean)
  }
  
  APPEND-ONLY: no updates or deletes on audit_log
  TAMPER DETECTION: SHA-256 hash chain linking consecutive entries

CREDENTIAL MANAGEMENT:
  GitHub PAT (ghp_ij7L...): Claude Code EXECUTE scope only
  Supabase service role: Pipeline agents only (never client-side)
  Mapbox token: Frontend agent only (URL-restrict to *.biddeed.ai)
  Firecrawl key: Scraper Agent only
  
  ROTATION: PATs every 90 days, alert at 75 days
  REVOCATION: instant via GitHub API if compromise detected

EVIDENCE CHAIN FOR RECOMMENDATIONS:
  Every BID/REVIEW/SKIP recommendation traces:
  1. Which Scraper Agent collected the data (source URLs, timestamps)
  2. Which data sources were used vs unavailable
  3. Which ML model version scored it (xgboost-tpp-YYYY-MM-DD)
  4. What the raw score was + confidence interval
  5. Which formula calculated max bid
  6. Which decision rule was applied (≥75% BID, 60-74% REVIEW, <60% SKIP)
  → Stored in decision_log table, linked to audit_log
```

After: `git add . && git commit -m "[agent-customize] Agentic Identity & Trust → Multi-Agent Auth & Audit Agent" && git push`

---

## Agent 16: Data Analytics Reporter → Auction Analytics Dashboard Agent

**Source:** `support/support-analytics-reporter.md`
**Output:** `customized/biddeed-analytics-agent.md`

**Customization:**

```
CORE DASHBOARDS:
  1. AUCTION PERFORMANCE (daily refresh):
     - Total properties by county (bar chart, 46 counties)
     - BID/REVIEW/SKIP distribution (pie chart)
     - Average judgment amount trend (line chart, 90 days)
     - Third-party purchase rate by county (heatmap)
     
  2. ML MODEL HEALTH (weekly):
     - Prediction accuracy (AUC-ROC over time)
     - Calibration plot (predicted vs actual probabilities)
     - Feature importance drift
     - Alert: AUC < 0.60 triggers retrain
     
  3. PIPELINE OPERATIONS (real-time):
     - Scraper success rate by source (RealForeclose, BCPAO, etc.)
     - Records processed per nightly run
     - API costs (daily burn rate vs $100/mo budget)
     - Data freshness by county (hours since last update)
     
  4. FINANCIAL (monthly):
     - API spend breakdown (LiteLLM, Firecrawl, Render, etc.)
     - Cost per property analyzed
     - Projected monthly burn
     - ROI tracking: deals found via BidDeed recommendations

KPIs (5 that matter):
  1. Properties analyzed / day (target: 500+)
  2. Third-party prediction accuracy (target: AUC ≥ 0.70)
  3. Scraper uptime % (target: 99%+)
  4. API cost per property (target: < $0.02)
  5. Time from docket to analysis (target: < 4 hours)

DATA SOURCES:
  - Supabase: multi_county_auctions, daily_metrics, historical_auctions
  - GitHub Actions: workflow run history (success/failure rates)
  - LiteLLM: token usage and cost logs

WEEKLY EXECUTIVE SUMMARY (auto-generated Friday 2PM EST):
  - Properties analyzed this week
  - Top deals identified (highest bid/judgment spread)
  - ML model performance
  - Pipeline health
  - API cost status
  - Formatted for Ariel's 20-min review window
```

After: `git add . && git commit -m "[agent-customize] Data Analytics Reporter → Auction Analytics Dashboard Agent" && git push`

---

## Final Step: Update customized/README.md

Add all 10 new agents to the existing README.md index under a "## HIGH Priority Agents" section.
Keep the existing CRITICAL section intact. Add links to each new file.

Then: `git add . && git commit -m "[agent-customize] Add 10 HIGH-priority agents to index" && git push`

TASK
