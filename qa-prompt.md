# QA Audit Task

Read ALL files in the customized/ directory. Score the agents on 3 dimensions, each 0-100.

## DIMENSION 1 - SECURITY (40% weight)
- secrets_exposure: Any hardcoded API keys, tokens, passwords? (100=none found)
- auth_patterns: RLS, user_tiers, least-privilege referenced? (100=excellent)
- threat_awareness: Input validation, rate limiting, circuit breakers? (100=comprehensive)
- audit_trail: Logging, audit_log, decision traceability? (100=full)
- data_privacy: Fair Housing, PII handling? (100=compliant)
- security_score = average of all 5

## DIMENSION 2 - CODE QUALITY (35% weight)
- structure: Standard agent format with Identity, Mission, Rules, Deliverables, Workflow, Metrics? (100=all present in every file)
- domain_specificity: BidDeed/ZoneWise specific examples not generic? (100=fully custom)
- actionability: Claude Code can use these to produce working code? (100=production-ready)
- consistency: Naming, brand, patterns consistent across agents? (100=consistent)
- completeness: No truncated files, no missing sections, no files ending mid-sentence? (100=complete)
- code_score = average of all 5

## DIMENSION 3 - DOCUMENTATION (25% weight)
- clarity: Clear, unambiguous writing? (100=crystal clear)
- examples: Copy-pasteable code blocks in most agents? (100=rich examples)
- formatting: Well-structured markdown with proper headers? (100=professional)
- cross_references: Agents reference each other? (100=fully linked)
- onboarding: Self-contained for new session? (100=standalone)
- doc_score = average of all 5

## COMPOSITE FORMULA
composite = (security_score * 0.40) + (code_score * 0.35) + (doc_score * 0.25)

## OUTPUT
After reviewing ALL files, create a file called /tmp/qa_results.json with EXACTLY this format:
```json
{
  "security_score": N,
  "code_score": N,
  "doc_score": N,
  "composite": N,
  "passed": true or false (true if composite >= 95.0),
  "security_issues": ["issue1", "issue2"],
  "code_gaps": ["gap1", "gap2"],
  "doc_improvements": ["item1", "item2"]
}
```

Be strict but fair. 95+ means excellent professional quality, not perfection.
