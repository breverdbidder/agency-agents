# REMEDIATION TASK — QA Gate Score: 74.3/100 (Need 95+)

Read CLAUDE.md first for project context. Then fix ALL issues below across customized/ directory.

## SECURITY FIXES (scored 59/100)

### FIX 1: Remove hardcoded credentials
Search every file in customized/ for any hardcoded keys, tokens, URLs with credentials, connection strings.
Replace with environment variable references: $SUPABASE_SERVICE_KEY, $GITHUB_PAT, $MAPBOX_TOKEN, $ANTHROPIC_API_KEY.
Never include actual credential values — only variable names like process.env.SUPABASE_SERVICE_KEY.

### FIX 2: Add input validation to all agent functions
Every agent that defines functions, SQL, or API endpoints must include input validation.
Add parameter type checking, range validation, sanitization.
Example: agent_action parameters must validate agent_name is in approved roster, action_type is in allowed enum.

### FIX 3: Delegation chain security (biddeed-agent-identity-agent.md)
Add rules preventing privilege escalation:
- Agents cannot grant themselves higher authority
- Delegation depth limited to 3 levels max
- Every delegation logged to audit_log with delegator and delegatee
- Only Ariel (human) can grant FULL or DESIGN authority

### FIX 4: Add rate limiting patterns
Every agent that writes to Supabase must reference rate limiting:
- audit_log: max 100 inserts/minute per agent
- security_events: max 50 inserts/minute
- daily_metrics: max 1 upsert per county per run
- Circuit breaker: if rate exceeded, queue writes and batch-flush

### FIX 5: Add encryption references
For financial data (judgment_amount, market_value, po_sold_amount, max_bid):
- Reference column-level encryption at rest via Supabase
- HTTPS-only for all API calls
- Note: "Financial amounts encrypted at-rest via Supabase TDE"

### FIX 6: Strengthen audit trail with pgcrypto
Ensure every agent references audit_log with:
- SHA-256 hash chain: each entry includes hash of previous entry
- Use pgcrypto: CREATE EXTENSION IF NOT EXISTS pgcrypto;
- Hash formula: digest(prev_hash || action || timestamp::text, 'sha256')

## CODE QUALITY FIXES (scored 85/100)

### FIX 7: Complete truncated agents
These 3 agents were cut off. Read the FULL original source and rewrite complete customized versions:
- customized/biddeed-api-tester-agent.md: Read testing/testing-api-tester.md (303 lines), rewrite with ALL sections
- customized/biddeed-analytics-agent.md: Read support/support-analytics-reporter.md (362 lines), add missing functions
- customized/biddeed-agent-identity-agent.md: Read specialized/agentic-identity-trust.md (367 lines), complete the cut-off function

### FIX 8: Standardize agent structure
Every agent MUST have these sections in order:
1. BidDeed.AI / ZoneWise.AI Context
2. Identity
3. Mission
4. Domain-Specific Rules
5. Critical Rules
6. Deliverables
7. Workflow
8. Success Metrics
9. Integration Points

Audit ALL 16 agents. Add missing sections to any that lack them.

### FIX 9: Add error handling and connection pooling
- biddeed-agent-identity-agent.md: add CREATE EXTENSION IF NOT EXISTS pgcrypto;
- biddeed-analytics-agent.md: add try/except blocks, connection pooling notes
- biddeed-supabase-architect.md: reference Supavisor connection pooling limits

## DOCUMENTATION FIXES (scored 84/100)

### FIX 10: Add cross-references between agents
Each agent must have an Integration Points section referencing 2+ other agents:
- Pipeline Orchestrator → all agents (orchestrates them)
- Smart Router → ML Score, Pipeline Orchestrator
- ML Score → Data Pipeline, Supabase Architect
- Supabase Architect → Security Auditor, API Tester
- Data Pipeline → API Tester, Pipeline Orchestrator
- Security Auditor → Agent Identity, all agents
- Frontend UI → Supabase Architect, Analytics
- DevOps → Pipeline Orchestrator, API Tester
- Rapid Prototyper → Frontend UI, Supabase Architect
- Sprint Prioritizer → all agents
- Growth Hacker → Analytics, Content Creator
- Content Creator → Analytics, Reddit
- Reddit → Content Creator, Growth Hacker
- API Tester → Data Pipeline, Security Auditor
- Agent Identity → Security Auditor, Pipeline Orchestrator
- Analytics → ML Score, Supabase Architect

### FIX 11: Standardize formatting
- All numbered lists: consistent 1. 2. 3. format
- All code blocks: specify language (```sql, ```python, ```yaml, ```bash)
- All tables: consistent markdown format
- Headers: ## for sections, ### for subsections

### FIX 12: Add self-contained context to each agent
Each agent must include enough context for standalone Claude Code use:
- Supabase project ref: mocerqjnksmhcjzxrewo (no keys, just reference)
- GitHub org: breverdbidder
- Brand: Navy #1E3A5F, Orange #F59E0B, Inter font, bg #020617
- Pipeline: 12 stages (Discovery→Scraping→Title→Lien→Tax→Demographics→ML→MaxBid→Decision→Report→Disposition→Archive)
- Data scale: 245K+ auction records, 46 FL counties

## EXECUTION

Apply ALL 12 fixes across ALL files in customized/. Then:

```bash
git add customized/
git commit -m "[agent-remediate] QA fixes: security hardening, complete truncated agents, standardize structure, cross-references"
git push
```

ONE commit with all fixes. Do NOT ask questions — execute autonomously.
